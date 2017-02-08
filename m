Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6865271A0F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 12:21:09 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id 11so119965751qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 04:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PIDQlH+w1T+FQAtP0krykadeVzuLfOYtbaWAJnH3aLU=;
	b=VYWFSpGdOHUST0EYRRVBD+3tRR61DT5WA/8dcA3nyU0VR4/HltMSZhxsaZiyoZGP5a
	QaBAB1urRMjORYP+ZHAK1CF8yxgSNXSBbXWwVbpIOVtfQaqeJzjhx4C2P9GKXporAsZv
	AOnj9UQyyrW6fOIwySVXE5rPM8pONaHPhKx9nENmmjT4AgzAqt9DJPT3rN24p4k5Mkt8
	5HPbK4Wy4bTeStemqMp46u4T7TUgWdFx4aVLJf1kn3+NUI5wkUWh8+KsrmvzNrQG1kar
	AKbKTi5HI9/D57T7OsjfK5Ngn9878xzHBkdXRg7bmXi2ta/E3roHcrYRaW/rKJsjowJL
	SwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PIDQlH+w1T+FQAtP0krykadeVzuLfOYtbaWAJnH3aLU=;
	b=b/X3hrd9Pf3MhuPcwJvEra8cr+RRDhQdPpWEluM4r3Jn5LO5YIeogwHr1jOEcbSnYW
	ThFb86JWoxu9sUD92sgjYRWBP5b97+mN+29Lc+KnpYmGupe3OzdigG1VUizsVxaFN+XZ
	8qBa0VAVl1Ex2S70NPwIR7isSFIa4jbvC1RKC6grEm2xy0qNsY1gQT8GrTrM9HErNGY7
	ykJ0OmllhiSuWGn5jP2gDD4hcx4o2Qe5CijrjhTA4AnVyH8/CWbn0TpkXV5cAgRJUdVX
	oGBSueFFXDti8LqBXy6aw2p2YM7Bs193BJ9wBtEMIMz1CpKSDtiHFzu6jrZzLf/KPqYg
	hF1A==
X-Gm-Message-State: AMke39n1oUyF7cnDsiqA7GdJEMVCygDaf0qyrBrSWCSe8hi/DKzj2bTWRVAmsuBqn+dKNnHbyiMipy7aLvNMWQdz
X-Received: by 10.55.183.133 with SMTP id h127mr21195951qkf.121.1486556469986; 
	Wed, 08 Feb 2017 04:21:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 8 Feb 2017 04:20:49 -0800 (PST)
In-Reply-To: <924e2b236ebe29d99cf635ff079ba234693f5cc2.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
	<924e2b236ebe29d99cf635ff079ba234693f5cc2.1486523726.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Feb 2017 12:20:49 +0000
Message-ID: <CAJTo0LYzb9LSgTraY=Jg-wOe7fcEHdqUZdbFHt32LCyzVSQgDw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/13] gpgme: 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 08 Feb 2017 12:21:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c060056552107054803e66a

--94eb2c060056552107054803e66a
Content-Type: text/plain; charset=UTF-8

On 8 February 2017 at 03:17, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> - Drop gpgme.pc, it is duplicated with pkgconfig.patch
>
> - Rebase pkgconfig.patch to 1.8.0
>
> - Split cmake config to ${PN}-dev
>
> - Update LIC_FILES_CHKSUM, because copytright year changed.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>

I think we need to split out the C++ bindings to a separate library package:

packages/corei7-64-poky-linux/gpgme/gpgme: RDEPENDS: added "libstdc++ (['>=
6.3.0']) libgcc (['>= 6.3.0'])"
packages/corei7-64-poky-linux/gpgme/gpgme: FILELIST: removed
"/usr/lib/libgpgme.so.11.14.0", added "/usr/lib/libgpgme.so.11.17.0
/usr/lib/libgpgmepp.so.6 /usr/lib/libgpgmepp.so.6.3.0"

Maybe add a ${PN}-cpp package for the library?

Ross

--94eb2c060056552107054803e66a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2017 at 03:17, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2cj" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15a1bb9e34def075">- Drop <span class=3D"gmail-il=
">gpgme</span>.pc, it is duplicated with pkgconfig.patch<br>
<br>
- Rebase pkgconfig.patch to 1.8.0<br>
<br>
- Split cmake config to ${PN}-dev<br>
<br>
- Update LIC_FILES_CHKSUM, because copytright year changed.<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;</div></blockquote></div><br>I think we need=
 to split out the C++ bindings to a separate library package:</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">packages/corei7-64-=
poky-linux/gpgme/gpgme: RDEPENDS: added &quot;libstdc++ ([&#39;&gt;=3D 6.3.=
0&#39;]) libgcc ([&#39;&gt;=3D 6.3.0&#39;])&quot;<br></div><div class=3D"gm=
ail_extra">packages/corei7-64-poky-linux/gpgme/gpgme: FILELIST: removed &qu=
ot;/usr/lib/libgpgme.so.11.14.0&quot;, added &quot;/usr/lib/libgpgme.so.11.=
17.0 /usr/lib/libgpgmepp.so.6 /usr/lib/libgpgmepp.so.6.3.0&quot;<br></div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Maybe add a =
${PN}-cpp package for the library?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div><div class=3D"gmail_extra"><br></div=
></div>

--94eb2c060056552107054803e66a--
