Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABD9C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:45:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.9162.1646300724990242914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h+Ure0HF;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id u20so7449001lff.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwUIvmx3VEYVwIV/fnj+iaIlAU4yC9RX9TTD0hwQ0Ck=;
        b=h+Ure0HFs7DGgtqYVNVzX53FQVZqZ/5xW0Ei8/QebPZQa/mhQIetaceZ/XXMmKoEFq
         4zzHzGEgGGYnGKTawUMZ50OdmBTNtWB2rmueTQDb/dDJAEolNoiL2EGLRIw/ZpoGcZBS
         jdSC5gRlPz2WmVvuEUJdl5M4az4miR0TDx0ntbp4prsDK5cMRllYOCg1XnT16sRXHge4
         /49F/U2l0h6vVMwLth8Q2pa67sQyWuhZciCu6Bt39emEVmWbAqOg40oFGfk2mtivdET4
         VQO02DgEp7akpO4tmsb7tS+C7F9hyrfaxyoCEut7HqiroCfHW+RTKrDnk1QdLXsLRcOx
         +vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwUIvmx3VEYVwIV/fnj+iaIlAU4yC9RX9TTD0hwQ0Ck=;
        b=Q5XqyQQUd70drjj2sLLpmbyYIBjUdTk7rami3LSA75XygiS0vzy1hzWRijoryFck00
         xuaeV+5BIqm5xzCEJIoGQN/3CsqvTwxpXqCPOL03cjxRBpbIGUDlQ0m5pWJj6bDI2D6N
         IufjBYJovfduoHHWKp+n9XyuHuK15vVIOQdjy3vkWV7aHkOqxBHHlnHRyjRGBIIpxK0S
         M+F+PUTaeQicqcO4yf9FleX0JVBTV3MX4WCq9MkPIRLSOiT6UfbZG4BPUyY3WvMte30J
         dAktloFcYppUeYEjXoIZv6ZqVwtC6B1S9Ny1DqkgfVmBaRssv7fez1uD6cR2md7M9RNH
         +cDg==
X-Gm-Message-State: AOAM530Was2Uv2k4FZ51DSbcCglGnLFlvIy5Sq4Gqzyp1ukMEaM7/B11
	Fs203P6wI9Ie+IiORiJs/kF0I1UHV3yExk8Rr/Y=
X-Google-Smtp-Source: 
 ABdhPJweEUDXZE0I4Uks+dQd4CCUom+kmidWwtSQLX2/aGwVB2ak+qUZsW+2UeVwEkgeApuVX8/QmT0wot8asemShGI=
X-Received: by 2002:a05:6512:2306:b0:443:3db8:d6c8 with SMTP id
 o6-20020a056512230600b004433db8d6c8mr21345439lfu.161.1646300722801; Thu, 03
 Mar 2022 01:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20220303093324.1663870-1-alex@linutronix.de>
 <20220303093324.1663870-3-alex@linutronix.de>
In-Reply-To: <20220303093324.1663870-3-alex@linutronix.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 3 Mar 2022 09:45:11 +0000
Message-ID: 
 <CANPvuRnmai3wQZY-P9PT0z=iYephBnYkwf1E=7qFAuD5vMqjxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] glslang/spirv: synchronize with the rest of
 vulkan items
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000c6b14d05d94d41cc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 09:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162641

--000000000000c6b14d05d94d41cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Is it possible to add a reference on the commit message for this change?

Jose

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quinta,
3/03/2022 =C3=A0(s) 09:33:

> These components are now versioned in sync with vulkan releases.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../glslang/{glslang_11.8.0.bb =3D> glslang_1.3.204.0.bb}    | 5 +++--
>  .../{spirv-headers_1.5.4.bb =3D> spirv-headers_1.3.204.0.bb} | 4 ++--
>  .../{spirv-tools_2022.1.bb =3D> spirv-tools_1.3.204.0.bb}    | 7 ++++---
>  3 files changed, 9 insertions(+), 7 deletions(-)
>  rename meta/recipes-graphics/glslang/{glslang_11.8.0.bb =3D>
> glslang_1.3.204.0.bb} (90%)
>  rename meta/recipes-graphics/spir/{spirv-headers_1.5.4.bb =3D>
> spirv-headers_1.3.204.0.bb} (88%)
>  rename meta/recipes-graphics/spir/{spirv-tools_2022.1.bb =3D>
> spirv-tools_1.3.204.0.bb} (89%)
>
> diff --git a/meta/recipes-graphics/glslang/glslang_11.8.0.bb
> b/meta/recipes-graphics/glslang/glslang_1.3.204.0.bb
> similarity index 90%
> rename from meta/recipes-graphics/glslang/glslang_11.8.0.bb
> rename to meta/recipes-graphics/glslang/glslang_1.3.204.0.bb
> index a77d8bdf88..2af406212f 100644
> --- a/meta/recipes-graphics/glslang/glslang_11.8.0.bb
> +++ b/meta/recipes-graphics/glslang/glslang_1.3.204.0.bb
> @@ -8,10 +8,11 @@ HOMEPAGE =3D "
> https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 &
> GPL-3-with-bison-exception"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D2a2b5acd7bc4844964cfda45fe807dc3"
>
> -SRCREV =3D "c34bb3b6c55f6ab084124ad964be95a699700d34"
> +SRCREV =3D "2742e959347ae2fac58acd0d022c92a0ff1f24bf"
>  SRC_URI =3D "git://
> github.com/KhronosGroup/glslang.git;protocol=3Dhttps;branch=3Dmaster \
>             file://0001-generate-glslang-pkg-config.patch"
> -UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
> +PE =3D "1"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake python3native
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
> b/meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb
> similarity index 88%
> rename from meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
> rename to meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb
> index 3144b1eb42..72416b441f 100644
> --- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
> +++ b/meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb
> @@ -9,9 +9,9 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc938b85bceb8fb26c1a807f28a52ae2d"
>
>  SRCREV =3D "b42ba6d92faf6b4938e6f22ddd186dbdacc98d78"
>  SRC_URI =3D "git://
> github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttps;branch=3Dmaster"
> -UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
> +PE =3D "1"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
>  S =3D "${WORKDIR}/git"
> -PV .=3D "+git${SRCPV}"
>
>  inherit cmake
>
> diff --git a/meta/recipes-graphics/spir/spirv-tools_2022.1.bb
> b/meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb
> similarity index 89%
> rename from meta/recipes-graphics/spir/spirv-tools_2022.1.bb
> rename to meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb
> index 24142a4fe0..dc78073717 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_2022.1.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb
> @@ -7,9 +7,10 @@ SECTION =3D "graphics"
>  LICENSE  =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRCREV =3D "b1877de5cd776117050bd42f08d04b52bce16099"
> -SRC_URI =3D "git://
> github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmaster;protocol=3Dhttps"
> -UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
> +SRCREV =3D "45dd184c790d6bfc78a5a74a10c37e888b1823fa"
> +SRC_URI =3D "git://
> github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dstable;protocol=3Dhttps"
> +PE =3D "1"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake python3native
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162640):
> https://lists.openembedded.org/g/openembedded-core/message/162640
> Mute This Topic: https://lists.openembedded.org/mt/89522063/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c6b14d05d94d41cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexander,</div><div><br></div>Is it possible to a=
dd a reference on the commit message for this change?<div><br></div><div>Jo=
se<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.k=
anavin@gmail.com</a>&gt; escreveu no dia quinta, 3/03/2022 =C3=A0(s) 09:33:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">These component=
s are now versioned in sync with vulkan releases.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0.../glslang/{<a href=3D"http://glslang_11.8.0.bb" rel=3D"noreferrer" =
target=3D"_blank">glslang_11.8.0.bb</a> =3D&gt; <a href=3D"http://glslang_1=
.3.204.0.bb" rel=3D"noreferrer" target=3D"_blank">glslang_1.3.204.0.bb</a>}=
=C2=A0 =C2=A0 | 5 +++--<br>
=C2=A0.../{<a href=3D"http://spirv-headers_1.5.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">spirv-headers_1.5.4.bb</a> =3D&gt; <a href=3D"http://spirv-h=
eaders_1.3.204.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3=
.204.0.bb</a>} | 4 ++--<br>
=C2=A0.../{<a href=3D"http://spirv-tools_2022.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">spirv-tools_2022.1.bb</a> =3D&gt; <a href=3D"http://spirv-too=
ls_1.3.204.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.204.0=
.bb</a>}=C2=A0 =C2=A0 | 7 ++++---<br>
=C2=A03 files changed, 9 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/glslang/{<a href=3D"http://glslang_11.8.=
0.bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.8.0.bb</a> =3D&gt; <a=
 href=3D"http://glslang_1.3.204.0.bb" rel=3D"noreferrer" target=3D"_blank">=
glslang_1.3.204.0.bb</a>} (90%)<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-headers_1.=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a> =3D=
&gt; <a href=3D"http://spirv-headers_1.3.204.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">spirv-headers_1.3.204.0.bb</a>} (88%)<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-tools_2022=
.1.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_2022.1.bb</a> =3D&g=
t; <a href=3D"http://spirv-tools_1.3.204.0.bb" rel=3D"noreferrer" target=3D=
"_blank">spirv-tools_1.3.204.0.bb</a>} (89%)<br>
<br>
diff --git a/meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.8.0=
.bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.8.0.bb</a> b/meta/reci=
pes-graphics/glslang/<a href=3D"http://glslang_1.3.204.0.bb" rel=3D"norefer=
rer" target=3D"_blank">glslang_1.3.204.0.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.8.0.=
bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.8.0.bb</a><br>
rename to meta/recipes-graphics/glslang/<a href=3D"http://glslang_1.3.204.0=
.bb" rel=3D"noreferrer" target=3D"_blank">glslang_1.3.204.0.bb</a><br>
index a77d8bdf88..2af406212f 100644<br>
--- a/meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.8.0.bb" re=
l=3D"noreferrer" target=3D"_blank">glslang_11.8.0.bb</a><br>
+++ b/meta/recipes-graphics/glslang/<a href=3D"http://glslang_1.3.204.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">glslang_1.3.204.0.bb</a><br>
@@ -8,10 +8,11 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.khronos.org/ope=
ngles/sdk/tools/Reference-Compiler" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.khronos.org/opengles/sdk/tools/Reference-Compiler</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause &amp; MIT &amp; Apa=
che-2.0 &amp; GPL-3-with-bison-exception&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D2a2b5acd7bc484496=
4cfda45fe807dc3&quot;<br>
<br>
-SRCREV =3D &quot;c34bb3b6c55f6ab084124ad964be95a699700d34&quot;<br>
+SRCREV =3D &quot;2742e959347ae2fac58acd0d022c92a0ff1f24bf&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/gls=
lang.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/KhronosGroup/glslang.git;protocol=3Dhttps;branch=3Dmaster</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-generate-glslang-pkg-=
config.patch&quot;<br>
-UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;\d+(\.\d+)+)$&quot;<b=
r>
+PE =3D &quot;1&quot;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;sdk-(?P&lt;pver&gt;\d+(\.\d+)+)&quot;=
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake python3native<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5=
.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a> b/me=
ta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.204.0.bb" rel=
=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.204.0.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.=
4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a><br>
rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.20=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.204.0.bb</a>=
<br>
index 3144b1eb42..72416b441f 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.4.bb" =
rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.204.0.=
bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.204.0.bb</a><br>
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc938b85bceb=
8fb26c1a807f28a52ae2d&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;b42ba6d92faf6b4938e6f22ddd186dbdacc98d78&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPI=
RV-Headers;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_=
blank">github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttps;branch=3Dmast=
er</a>&quot;<br>
-UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;\d+(\.\d+)+)$&quot;<b=
r>
+PE =3D &quot;1&quot;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;sdk-(?P&lt;pver&gt;\d+(\.\d+)+)&quot;=
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-PV .=3D &quot;+git${SRCPV}&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_2022.=
1.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_2022.1.bb</a> b/meta=
/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.204.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">spirv-tools_1.3.204.0.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_2022.1=
.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_2022.1.bb</a><br>
rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.204.=
0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.204.0.bb</a><br>
index 24142a4fe0..dc78073717 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_2022.1.bb" r=
el=3D"noreferrer" target=3D"_blank">spirv-tools_2022.1.bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.204.0.bb=
" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.204.0.bb</a><br>
@@ -7,9 +7,10 @@ SECTION =3D &quot;graphics&quot;<br>
=C2=A0LICENSE=C2=A0 =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
<br>
-SRCREV =3D &quot;b1877de5cd776117050bd42f08d04b52bce16099&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPIRV-To=
ols.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmaster;protocol=3Dhttp=
s</a>&quot;<br>
-UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^v(?P&lt;pver&gt;\d+(\.\d+)+)$&quot;<=
br>
+SRCREV =3D &quot;45dd184c790d6bfc78a5a74a10c37e888b1823fa&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPIRV-To=
ols.git;branch=3Dstable;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dstable;protocol=3Dhttp=
s</a>&quot;<br>
+PE =3D &quot;1&quot;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;sdk-(?P&lt;pver&gt;\d+(\.\d+)+)&quot;=
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake python3native<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162640): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162640" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162640</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89522063/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89522063/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div></div></div>

--000000000000c6b14d05d94d41cc--

