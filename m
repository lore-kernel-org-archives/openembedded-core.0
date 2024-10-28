Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BF6D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 09:32:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.47730.1730107970933655898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 02:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0AEi1Ff;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea6cbc90b7so164018a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107970; x=1730712770; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSgI+UR8f1DLro0E4j/QSce3mi0M5wIaYjaBnmlXags=;
        b=K0AEi1FfEn9xXHyrqFaeE44952bh1uP2AGVpggz75KUaWYouIoDwSvuYx3pkaT4Nfi
         bQmorHb/SaJzCMvrwFwOuvb/a98dLfx3os429JtCsBfMdTESghAAM0Bwu6RusX3kccVt
         /6Wk6AgxFEKM6kdujfVDyLTbpWtfJg3+16ppg7VrPuoriCuSp3Mo1fn9/DJqt6BD9c9/
         Yrhfq/HoJzwE7Z56mIMKcxGpeMvQo8o4YTpi9aZ6miFaGU6U1uyJweSV1BBJVSCmycMk
         AT/p1GVE5S1gD32zkyyjQnF1dg5WhE1V8onJ67z5EY4FfmQ72leuISGOwXCrW2Q6W779
         6e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107970; x=1730712770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSgI+UR8f1DLro0E4j/QSce3mi0M5wIaYjaBnmlXags=;
        b=HEmHcmXaBHVMOftNmtIl/nfxoOwuA6xMkiI9Gv3aHTdJtxDZ5cwwo2HMszOkbFWjJz
         vTAMC0dBW/JEG50zNHtB/qOsmRYWuxaUn+SAyd3WqWFj5ucruySjiPboNfeGcPYbOkn5
         zL+c5CMoYVtA9ARvWfCG0ZIEOBqsERVFQwJfcRM9Td9BdhEFoL82t+Kma+VFDP4t7oIn
         Eghb2iE1a7LwG7PRPzk2S15NDd8aSvzWdCu0yKOiZaRGE98r8mhTAYSYsJv7/QiANeCh
         hYWV/C2FR5ZxBvqg78ElWF7teoSCC0wCMHkeXXqAsn2n+hiZX82oQdZZGhdL266Yllki
         So/g==
X-Gm-Message-State: AOJu0Ywt/jckG5jLw66rUYsx0AZxtg01CQ8jQAH0Rl2072fE353FlRrv
	jUIpWDJclptPwvtJn+NsUgL2tYudKQ/mj0dqFSwVPxqztrbK64bgz5dAMMqj9/gClhg+s3Zv+DU
	KovvFL1b7EExh7gSfPEUIQ+WVBRA=
X-Google-Smtp-Source: AGHT+IFk1aC9+ahf7lXmgj6LupQiZL/llLamEYV3VCZorWS4FvRs8Oi6qNeCiJX69AwKPtzKSLqX12PdB7F6fDJ0NlI=
X-Received: by 2002:a05:6a00:3a22:b0:71e:5400:1b35 with SMTP id
 d2e1a72fcca58-72063057611mr4596448b3a.5.1730107970180; Mon, 28 Oct 2024
 02:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <18016AF4CE22D710.23694@lists.openembedded.org>
In-Reply-To: <18016AF4CE22D710.23694@lists.openembedded.org>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Mon, 28 Oct 2024 09:32:39 +0000
Message-ID: <CAFt4JuG+9-W5LKJehL_wftAbG+-OQiqmbcgx46a_wJb0g8-zBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagedata.py : Fix RDEPENDS Version issue
 with AUTOINC
To: sreejith.ravi087@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc6408062586269c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 09:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206438

--000000000000fc6408062586269c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

New patch has been created on
https://patchwork.yoctoproject.org/project/oe-core/patch/20241025052240.330=
7-1-sreejith.ravi087@gmail.com/
This will update AUTOINC in the pkgdata instead of do_package_write_ipk.
Please review and let me know your comments.

Cheers
Sreejith

On Thu, Oct 24, 2024 at 3:48=E2=80=AFPM Sreejith Ravi via lists.openembedde=
d.org
<sreejith.ravi087=3Dgmail.com@lists.openembedded.org> wrote:

> Currently, RDEPENDS for -staticdev and -dev is set using EXTENDPKGV
> in meta/conf/bitbake.conf:
> ----------------------------------
> EXTENDPKGV ?=3D "${EXTENDPKGEVER}${PKGV}-${PKGR}"
> DEV_PKG_DEPENDENCY =3D "${PN} (=3D ${EXTENDPKGV})"
> RDEPENDS:${PN}-staticdev =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> ----------------------------------
>
> During the do_package task, AUTOINC is replaced in PKGV
> (via package_setup_pkgv), which is used for creating the package name.
> However, Yocto sets RDEPENDS with PKGV during the recipe parsing stage,
> resulting in the RDEPENDS field in the IPK control data containing AUTOIN=
C.
>
> As the IPK name is generated with the updated PKGV, but the version in
> RDEPENDS still uses AUTOINC, this mismatch leads to installation failures=
.
>
> Example: libnsl
> install libnsl-staticdev throws the error,  nothing provides
> libnsl-dev =3D 1.2.0+gitAUTOINC+4a062cf418-r0
> ----------------------------------
> IPKs available:
> libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
>
> control data: libnsl-staticdev
> Package: libnsl-staticdev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl-dev (=3D 1.2.0+gitAUTOINC+4a062cf418-r0)
> Provides: libnsl2-staticdev
> Source: libnsl2_git.bb
>
> control data: libnsl-dev
> Package: libnsl-dev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl2 (=3D 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev
> Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
> Provides: libnsl2-dev
> Source: libnsl2_git.bb
> ----------------------------------
>
> This patch fixes the RDEPENDS versions set using EXTENDPKGV in the -dev a=
nd
> -staticdev packages. It replaces AUTOINC before generating the package
> control data.
>
> Updated control data:
> ----------------------------------
> Package: libnsl-dev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl2 (=3D 1.2.0+git0+4a062cf418-r0), libtirpc-dev
> Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
> Provides: libnsl2-dev
> Source: libnsl2_git.bb
>
> Package: libnsl-staticdev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl-dev (=3D 1.2.0+git0+4a062cf418-r0)
> Provides: libnsl2-staticdev
> Source: libnsl2_git.bb
> ----------------------------------
>
> Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
> ---
>  meta/classes-global/package.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> index 6cd8c0140f..066a7ff835 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -325,6 +325,15 @@ python package_setup_pkgv() {
>      # Adjust pkgv as necessary...
>      if 'AUTOINC' in pkgv:
>          d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}")=
)
> +
> +    # Adjust dependencies that are statically set with EXTENDPKGV
> +    vars =3D
> ["RDEPENDS","RPROVIDES","RRECOMMENDS","RSUGGESTS","RREPLACES","RCONFLICTS=
"]
> +    packages =3D d.getVar('PACKAGES').split()
> +    for var in vars:
> +        for pkg in packages:
> +            val =3D d.getVar("%s_%s"%(var,pkg))
> +            if val and 'AUTOINC' in val:
> +                d.setVar("%s_%s"%(var,pkg), val.replace("AUTOINC",
> "${PRSERV_PV_AUTOINC}"))
>  }
>
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206299):
> https://lists.openembedded.org/g/openembedded-core/message/206299
> Mute This Topic: https://lists.openembedded.org/mt/109187668/8634312
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sreejith.ravi087@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fc6408062586269c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Richard,<div><br></div><div>New patch =
has been created=C2=A0on=C2=A0<a href=3D"https://patchwork.yoctoproject.org=
/project/oe-core/patch/20241025052240.3307-1-sreejith.ravi087@gmail.com/">h=
ttps://patchwork.yoctoproject.org/project/oe-core/patch/20241025052240.3307=
-1-sreejith.ravi087@gmail.com/</a> This will update AUTOINC in the pkgdata =
instead=C2=A0of do_package_write_ipk. Please review and let me know=C2=A0yo=
ur comments.</div><div><br></div><div>Cheers</div><div>Sreejith</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Oct 24, 2024 at 3:48=E2=80=AFPM Sreejith Ravi via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;sreejith.ravi087=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Currently, RDEPENDS for -staticdev and -dev is set using EXTENDPKGV<br>
in meta/conf/bitbake.conf:<br>
----------------------------------<br>
EXTENDPKGV ?=3D &quot;${EXTENDPKGEVER}${PKGV}-${PKGR}&quot;<br>
DEV_PKG_DEPENDENCY =3D &quot;${PN} (=3D ${EXTENDPKGV})&quot;<br>
RDEPENDS:${PN}-staticdev =3D &quot;${PN}-dev (=3D ${EXTENDPKGV})&quot;<br>
----------------------------------<br>
<br>
During the do_package task, AUTOINC is replaced in PKGV<br>
(via package_setup_pkgv), which is used for creating the package name.<br>
However, Yocto sets RDEPENDS with PKGV during the recipe parsing stage,<br>
resulting in the RDEPENDS field in the IPK control data containing AUTOINC.=
<br>
<br>
As the IPK name is generated with the updated PKGV, but the version in<br>
RDEPENDS still uses AUTOINC, this mismatch leads to installation failures.<=
br>
<br>
Example: libnsl<br>
install libnsl-staticdev throws the error,=C2=A0 nothing provides<br>
libnsl-dev =3D 1.2.0+gitAUTOINC+4a062cf418-r0<br>
----------------------------------<br>
IPKs available:<br>
libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
<br>
control data: libnsl-staticdev<br>
Package: libnsl-staticdev<br>
Version: 1.2.0+git0+4a062cf418-r0<br>
----<br>
----<br>
Depends: libnsl-dev (=3D 1.2.0+gitAUTOINC+4a062cf418-r0)<br>
Provides: libnsl2-staticdev<br>
Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libnsl2_git.bb</a><br>
<br>
control data: libnsl-dev<br>
Package: libnsl-dev<br>
Version: 1.2.0+git0+4a062cf418-r0<br>
----<br>
----<br>
Depends: libnsl2 (=3D 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev<br>
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev<br>
Provides: libnsl2-dev<br>
Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libnsl2_git.bb</a><br>
----------------------------------<br>
<br>
This patch fixes the RDEPENDS versions set using EXTENDPKGV in the -dev and=
<br>
-staticdev packages. It replaces AUTOINC before generating the package cont=
rol data.<br>
<br>
Updated control data:<br>
----------------------------------<br>
Package: libnsl-dev<br>
Version: 1.2.0+git0+4a062cf418-r0<br>
----<br>
----<br>
Depends: libnsl2 (=3D 1.2.0+git0+4a062cf418-r0), libtirpc-dev<br>
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev<br>
Provides: libnsl2-dev<br>
Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libnsl2_git.bb</a><br>
<br>
Package: libnsl-staticdev<br>
Version: 1.2.0+git0+4a062cf418-r0<br>
----<br>
----<br>
Depends: libnsl-dev (=3D 1.2.0+git0+4a062cf418-r0)<br>
Provides: libnsl2-staticdev<br>
Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libnsl2_git.bb</a><br>
----------------------------------<br>
<br>
Signed-off-by: Sreejith Ravi &lt;<a href=3D"mailto:sreejith.ravi087@gmail.c=
om" target=3D"_blank">sreejith.ravi087@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/package.bbclass | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass<br>
index 6cd8c0140f..066a7ff835 100644<br>
--- a/meta/classes-global/package.bbclass<br>
+++ b/meta/classes-global/package.bbclass<br>
@@ -325,6 +325,15 @@ python package_setup_pkgv() {<br>
=C2=A0 =C2=A0 =C2=A0# Adjust pkgv as necessary...<br>
=C2=A0 =C2=A0 =C2=A0if &#39;AUTOINC&#39; in pkgv:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;PKGV&quot;, pkgv.replace(&=
quot;AUTOINC&quot;, &quot;${PRSERV_PV_AUTOINC}&quot;))<br>
+<br>
+=C2=A0 =C2=A0 # Adjust dependencies that are statically set with EXTENDPKG=
V<br>
+=C2=A0 =C2=A0 vars =3D [&quot;RDEPENDS&quot;,&quot;RPROVIDES&quot;,&quot;R=
RECOMMENDS&quot;,&quot;RSUGGESTS&quot;,&quot;RREPLACES&quot;,&quot;RCONFLIC=
TS&quot;]<br>
+=C2=A0 =C2=A0 packages =3D d.getVar(&#39;PACKAGES&#39;).split()<br>
+=C2=A0 =C2=A0 for var in vars:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in packages:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D d.getVar(&quot;%s_%s&quo=
t;%(var,pkg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if val and &#39;AUTOINC&#39; in =
val:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;%s_=
%s&quot;%(var,pkg), val.replace(&quot;AUTOINC&quot;, &quot;${PRSERV_PV_AUTO=
INC}&quot;))<br>
=C2=A0}<br>
<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206299): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206299" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206299</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109187668/863=
4312" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109187668/8634312</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:sreejith.ravi087@gmail.com=
" target=3D"_blank">sreejith.ravi087@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fc6408062586269c--

