Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAAF706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 15:00:53 +0000 (UTC)
Received: by yhoc41 with SMTP id c41so10526248yho.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 07:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VONMwamkB+gZzbZpA19YNH6aCog+0woDHmr1fCjaNxc=;
	b=qVB/b3ew74PWQeCu8/l7sPbz3FNSdEBrVWLx9q8TipYerCej6KZ+TZGlq6SUAlSrgf
	yyaDkL8X2ISmod/Q2U1C5xsk1jRRJ9VjTyjXXMjmQmFI8nKP+bG9l9i7ZqcSvqeDts35
	Ml/XtOnDXCTEkbMfYFON1WWHc6Sm55IarQdRvPGc3DoDi/Gs3Akxd/SHaaE7PUfaxYbD
	G0LRhowV/DbwCeREY+6KaiFGNjWEtQiXzVecXZDoIq1g6ACe8uxCV4j0LKJH/xNPsDss
	qQVJUPqm7uNTDYkmZ4OjZp2KEMY11+mfYowlqsoL6Oen+s5oaYJyRQozvZ4w1xtRhICN
	SE3A==
X-Received: by 10.236.221.228 with SMTP id r94mr2213587yhp.127.1424703654996; 
	Mon, 23 Feb 2015 07:00:54 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.120.4 with HTTP; Mon, 23 Feb 2015 07:00:34 -0800 (PST)
In-Reply-To: <88edecf9cc4e46b4fd3dd7e95fb2de450625364a.1424405852.git.raj.khem@gmail.com>
References: <cover.1424405852.git.raj.khem@gmail.com>
	<e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
	<88edecf9cc4e46b4fd3dd7e95fb2de450625364a.1424405852.git.raj.khem@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 23 Feb 2015 08:00:34 -0700
X-Google-Sender-Auth: OYaga6YvwoqDdo_7FjRPZTcVzFU
Message-ID: <CABcZANmEy-2kZwNQbXYCJw_vFFU9N_bOpSeUJh86=rUayDf3PA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] glibc: Dont offer to be parsed for non-glibc TCLIBC selection
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
X-List-Received-Date: Mon, 23 Feb 2015 15:00:54 -0000
Content-Type: multipart/alternative; boundary=001a11c2cc424431a4050fc2aba3

--001a11c2cc424431a4050fc2aba3
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 19, 2015 at 9:24 PM, Khem Raj <raj.khem@gmail.com> wrote:

> +    notglibc = (re.match('.*uclibc
> , d.getVar('TARGET_OS', True)) != None) and (re.match('.*musl,
> d.getVar('TARGET_OS', True)) != None)
> +    if notglibc:


Pretty sure this is a condition that will never be satisfied. This will
only succeed if TARGET_OS is both musl and uclibc. Could we skip on TCLIBC
!= glibc, to be both future proof and fix the logic?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c2cc424431a4050fc2aba3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Feb 19, 2015 at 9:24 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2e3" class=3D"a3s"=
 style=3D"overflow:hidden">+=C2=A0 =C2=A0 notglibc =3D (re.match(&#39;.*ucl=
ibc</div>, d.getVar(&#39;TARGET_OS&#39;, True)) !=3D None) and (re.match(&#=
39;.*musl, d.getVar(&#39;TARGET_OS&#39;, True)) !=3D None)<br>
+=C2=A0 =C2=A0 if notglibc:</blockquote></div><br>Pretty sure this is a con=
dition that will never be satisfied. This will only succeed if TARGET_OS is=
 both musl and uclibc. Could we skip on TCLIBC !=3D glibc, to be both futur=
e proof and fix the logic?<br>-- <br><div class=3D"gmail_signature">Christo=
pher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Gra=
phics</div>
</div></div>

--001a11c2cc424431a4050fc2aba3--
