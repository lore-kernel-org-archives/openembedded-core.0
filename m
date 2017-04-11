Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id B197560557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 15:33:37 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id o83so161395oik.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a3SioKm6E7OXU8f42xqzWR5jcDqflB2E7ozH/BAkcM8=;
	b=e0jXoVP9Bo2jGn6FwBDsc1AtkUBlJyFEzB89WR3CCHNMgo6f9RzRDarApJZfmh+aF7
	CPk8hRo6zwKhGWyTO7y95vMoKoIY1r+RsWAijC+XbxJc8S0CQOUDwdrtBoQan0Dx/OT1
	q5M387XrR4KVmNaGxC1Z3v4Ru8o+RgF00M7jfltqwg8E320wFajK+wMlq10vDZoRyuc5
	fDPyH3ivaN8qnOV3l6lFf3T6Fl0JZgfPSxeiPq3d4yYyh2uzeW/aoRXgv+t9pcSQCqJY
	8Eq9tNzTHcBxEx3ZR3hs2Y/1MVBNqSIkg5Kg7Fmdsp+Ol2/1pqUmJhkKK/N5a0/JMenY
	fFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a3SioKm6E7OXU8f42xqzWR5jcDqflB2E7ozH/BAkcM8=;
	b=pfm6dQCIqd09/yuMhDRavsfVEiKKNIcTMWYXV0sWmVo97xt+ejXNzIIIsPHIi1j3DV
	Ke4XQyXE7wEtDU/z0FmPB3RhAa1epO16kQ8GBElvKMgW7o7oI7hUTaKgwx4s8E6zlDwQ
	W39wAg6vCT08mI56asgXLv2Xio5wwVfBWOG4MvQb5/vWynbtbNbnb+y1zG1M/Cx9OXFG
	uskjgkMNTFBoqxh0ZwcWitzj1vVpBirdfIQBjtTtgblyTTyf5qbWPrgHmDkqx7WjFuy8
	RLylIcreCYDypRGTHcHLbhcIonjXonRxIPeVLnUF1z/EbnEs7aKE5xMbHwgGNCASr+6u
	S7IA==
X-Gm-Message-State: AN3rC/5rthPnWrmowmDVLkckB/QHJ7EiyBLArSw/pNIhf9vMimTG0l47/UuxCIisnNjmYsV3g0hVn9T0PFHx+g==
X-Received: by 10.157.68.193 with SMTP id p1mr2265751otg.15.1491924818218;
	Tue, 11 Apr 2017 08:33:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.197 with HTTP; Tue, 11 Apr 2017 08:33:17 -0700 (PDT)
In-Reply-To: <1491907672-363-1-git-send-email-maxin.john@intel.com>
References: <1491907672-363-1-git-send-email-maxin.john@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 11 Apr 2017 08:33:17 -0700
Message-ID: <CABcZANmVM5a+ZGZOxKh3Wmi2a=zFBXyNuH315v90gWAi+bVsDg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ed: update SRC_URI to yoctoproject mirror
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
X-List-Received-Date: Tue, 11 Apr 2017 15:33:37 -0000
Content-Type: multipart/alternative; boundary=f403043c4be4d258ff054ce5d06a

--f403043c4be4d258ff054ce5d06a
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 11, 2017 at 3:47 AM, Maxin B. John <maxin.john@intel.com> wrote:

> Upstream has removed the 1.14.1 release from ftp.gnu.org and
> moved to the latest 1.14.2. Since we don't want to upgrade at
> this point of time, temporarily move the SRC_URI to yoctoproject
> mirror.
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-extended/ed/ed_1.14.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb
> b/meta/recipes-extended/ed/ed_1.14.1.bb
> index 5d89a87..7e6bde4 100644
> --- a/meta/recipes-extended/ed/ed_1.14.1.bb
> +++ b/meta/recipes-extended/ed/ed_1.14.1.bb
> @@ -11,7 +11,9 @@ SECTION = "base"
>  # LSB states that ed should be in /bin/
>  bindir = "${base_bindir}"
>
> -SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
> +# Upstream regularly removes previous releases from
> https://ftp.gnu.org/gnu/ed/
> +SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.lz"
>

Just as a point of clarification, they only seem to remove previous point
releases. 1.0 through 1.13 still reside there.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--f403043c4be4d258ff054ce5d06a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 11, 2017 at 3:47 AM, Maxin B. John <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1wa" clas=
s=3D"a3s aXjCH m15b5ca0cb0edc75d">Upstream has removed the 1.14.1 release f=
rom <a href=3D"http://ftp.gnu.org" rel=3D"noreferrer" target=3D"_blank">ftp=
.gnu.org</a> and<br>
moved to the latest 1.14.2. Since we don&#39;t want to upgrade at<br>
this point of time, temporarily move the SRC_URI to yoctoproject<br>
mirror.<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/ed/<a href=3D"http://ed_1.14.1.bb" rel=3D"noref=
errer" target=3D"_blank">ed_1.<wbr>14.1.bb</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/ed/<a href=3D"http://ed_1.14.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ed_<wbr>1.14.1.bb</a> b/meta/recipes-exte=
nded/ed/<a href=3D"http://ed_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank=
">ed_<wbr>1.14.1.bb</a><br>
index 5d89a87..7e6bde4 100644<br>
--- a/meta/recipes-extended/ed/<a href=3D"http://ed_1.14.1.bb" rel=3D"noref=
errer" target=3D"_blank">ed_<wbr>1.14.1.bb</a><br>
+++ b/meta/recipes-extended/ed/<a href=3D"http://ed_1.14.1.bb" rel=3D"noref=
errer" target=3D"_blank">ed_<wbr>1.14.1.bb</a><br>
@@ -11,7 +11,9 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0# LSB states that ed should be in /bin/<br>
=C2=A0bindir =3D &quot;${base_bindir}&quot;<br>
<br>
-SRC_URI =3D &quot;${GNU_MIRROR}/ed/ed-${PV}.<wbr>tar.lz&quot;<br>
+# Upstream regularly removes previous releases from <a href=3D"https://ftp=
.gnu.org/gnu/ed/" rel=3D"noreferrer" target=3D"_blank">https://ftp.gnu.org/=
gnu/ed/</a><br>
+SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.org/mirror/sour=
ces/${BP}.tar.lz" rel=3D"noreferrer" target=3D"_blank">http://downloads.<wb=
r>yoctoproject.org/mirror/<wbr>sources/${BP}.tar.lz</a>&quot;</div></blockq=
uote></div><br>Just as a point of clarification, they only seem to remove p=
revious point releases. 1.0 through 1.13 still reside there.<br>-- <br><div=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, M=
entor Graphics</div></div></div></div>
</div></div>

--f403043c4be4d258ff054ce5d06a--
