Return-Path: <kiran.happy@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 01D5A71C27
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 18:49:21 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id v23so86646917qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 10:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ExgPLdM/gTqy4Ewvabunk+NyqBdqOV1eW0lzM4FfRBM=;
	b=SIBBOeDlMfPHy/WUYa59lGQ9Rzk6IvZjoEsLEeKQYM2kALXcFSL0AthjWtBHPbyJGX
	TYGNb71oUu8VMpMiN+LA/tzbR8zETU0jHKWHNFBkj/Bezhc2JViBwimeoFacX3TP/czd
	SxckUn5XV3uAyanliiiE6DCvlEtpmBm8BxuXN8dEVoAdDD0/TxZ61rRHm+T4u+wsHg/O
	qzcwif1zVpnUhV5rKIVlNvZpylwtq+I8R4tET/5fFknBBndqTd/9Yk+RlQV5wPQFoKHd
	fDvs3l6BUNr060J8o/J99Z7DGb0GGd0xA/6aLaYOT86G+CRkEv8z7IxLctViuzgIHz5V
	PZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ExgPLdM/gTqy4Ewvabunk+NyqBdqOV1eW0lzM4FfRBM=;
	b=rF7AmM/LQVf6au24mMGsmODymcA/gcWVJczFyyozGvnXPkz3hvaJXIDHr/I++RoFHw
	8ysWqaslZSeAYvS/+VUGfigXcaRYJANJ12jUG/BWhx/854LnRqkWIpC7GZ1pNifdbpuX
	xt2bgbIMt77TrPqfG8IqAoFoxSfwboiqH3RGkwaN698t5KA1GG+qlyvhJqwOfrqzmTid
	QyxiYChLctCtReiS0TonlE0/bQtpuy2nPrFv4NzsPn3PmWFK8fyEEQ7UhI7iy18VblWP
	YPJiXvdbXTluo3zFLhlENyA9qQoXAYPywzeOB4dtSf9RolMOQqgh6/v3530Na3fJq0et
	JXXQ==
X-Gm-Message-State: AIkVDXJ02E9T3gGnJCTN11pPdgeHLcCadwip1LXDgMsQia1HttXxwWXVGxk46PmjML0AE8XsqlP7G+gOJVgAEQ==
X-Received: by 10.200.45.57 with SMTP id n54mr77321101qta.52.1483728561819;
	Fri, 06 Jan 2017 10:49:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.204.2 with HTTP; Fri, 6 Jan 2017 10:49:01 -0800 (PST)
From: Kiran Pradeep <kiran.happy@gmail.com>
Date: Sat, 7 Jan 2017 00:19:01 +0530
Message-ID: <CAB2FcVAqq6UeLXu-=9fR+pO2MYSamLXmUSSbSO6==9dMf9BKMw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: enabling gccgo( not gc )
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2017 18:49:22 -0000
Content-Type: multipart/alternative; boundary=001a1142aca4dedf5b0545717932

--001a1142aca4dedf5b0545717932
Content-Type: text/plain; charset=UTF-8

Hi,

I uses recipes for gcc 4.9.1 and need to enable support for gccgo compiler.
To layers/oe-core/meta/recipes-devtools/gcc/gcc-configure-common.inc, I
added
LANGUAGES ?= "c,go,c++${FORTRAN}${JAVA}"

That helps me build the gccgo compiler. The resulting toolchain contains
cross compilers for c and c++. But gccgo is *not* shipped as part of
resulting toolchain.  I also get a warning as below

WARNING: QA Issue: gcc: Files/directories were installed but not shipped
/usr/lib/gcc/gcc/i586-unknown-linux/4.9.1/go1 [installed-vs-shipped]

There is a patch for enabling gccgo in
http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078606.html.
But that is mentioned not to support gcc 4.8 and got ignored for reasons
unknown. How to enable cross compiled gccgo( *not* gc compiler ) in
toolchain ?

Thanks,
Kiran.

--001a1142aca4dedf5b0545717932
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I uses recipes for gcc 4.9.1 and need to enable=
 support for gccgo compiler. To layers/oe-core/meta/recipes-devtools/gcc/gc=
c-configure-common.inc, I added<br>LANGUAGES ?=3D &quot;c,go,c++${FORTRAN}$=
{JAVA}&quot; <br><br>That helps me build the gccgo compiler. The resulting =
toolchain contains cross compilers for c and c++. But gccgo is *not* shippe=
d as part of resulting toolchain.=C2=A0 I also get a warning as below<br><b=
r>WARNING: QA Issue: gcc: Files/directories were installed but not shipped<=
br>/usr/lib/gcc/gcc/i586-unknown-linux/4.9.1/go1 [installed-vs-shipped]<br>=
<br>There is a patch for enabling gccgo in <a href=3D"http://lists.openembe=
dded.org/pipermail/openembedded-core/2013-May/078606.html">http://lists.ope=
nembedded.org/pipermail/openembedded-core/2013-May/078606.html</a>. But tha=
t is mentioned not to support gcc 4.8 and got ignored for reasons unknown. =
How to enable cross compiled gccgo( *not* gc compiler ) in toolchain ?<br><=
br>Thanks,<br>Kiran.<br></div>

--001a1142aca4dedf5b0545717932--
