Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE21C4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 09:03:12 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.4311.1667638984293266362
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 02:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QSrJAcEJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id b2so10393539lfp.6
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 02:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Clhir7kNVTCEZLnxP+aR+JMmHItGcCZfmvV/D2tumc=;
        b=QSrJAcEJa5/TIWsoDYoL8wPHiK1fDottCIzuKOsyCWM8ucSqbjcv+YQu5ttEJqCBJh
         UPzaJMqgttqruUmH0H2a1KoLMuRX9rtzauSjVyCX1O/No0qgP73nVYk/+5W64mCWCkuw
         EZlbGolVSk1eeIRWu55rujyIvfBqM4PnC/L7+j5wFWEAb4KL6Pc5ws3Zyw90RTNzVSvA
         fgDSsVNEFtQo5ofyuA4WcPiCJgDXuNU+IO44Q/J2L3ZCnHlK1JppHvZ0WeVT9j2eL4Nq
         J77CCHixciEjNH4cWameTHmQ2HXDTSLb5OP5Mlqy9jKqGXkZhb5cGlNv61VFA7p8WIZs
         wReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Clhir7kNVTCEZLnxP+aR+JMmHItGcCZfmvV/D2tumc=;
        b=bd3Vi5fDJ1Cm8FN4tfgxQAIAxIcfysBCXADDrqXSbBSpMcn2aHPh90TAtAbvOvWP6X
         k5J6Bz0S2GbksCe365bvFBANzk1rKNToFgUYye1soK0r4v2GBAUPO4jE7/Ml46IqgX/H
         QEqnwtWupL2Nj5SwnSuVNkQls4cWiRmQrLySy61pKJB+PNIVIOBR8p4t4Pap4uUp+33B
         9463tR4zsTb1e7Y9A56XY8Q7Z49xJgn29Md/kmRH4pEP/nmWBmrlr9JANAAnVJ5a+WoU
         qEJswMXkP5/h7C5aa9x8newoivpGpN1OCdnNPiraAv6x0UFsXFJKqzGq/ThnQ6VREjdE
         ge6g==
X-Gm-Message-State: ACrzQf2zOgo5Dx+noXSR+HlDc+FwlRJ+PiJkSGD+9dK69Lb9DX0bwjAP
	aD8AfitmQbOOM5bAICd1gjGV9rBBAqqeaoQv9sQ=
X-Google-Smtp-Source: AMsMyM74/0wRDV9K9/eOsJvBNRrCFnYYuCLYpQ2c4gysuscT6PKb2jL9wQoGuR2JgyLoYzW2vdYsJ9vn83PA9UIrcEA=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr15953999lfb.393.1667638982221; Sat, 05
 Nov 2022 02:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221105084242.666-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221105084242.666-1-cp0613@linux.alibaba.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 5 Nov 2022 10:02:51 +0100
Message-ID: <CANNYZj_j+_yUvihYHYJomTKhpzJdMZkDydLxuKqMV3J0A4LGhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] add python3-brotli_1.0.9 in meta/recipes-devtools/python
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000026262405ecb5759a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 09:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172737

--00000000000026262405ecb5759a
Content-Type: text/plain; charset="UTF-8"

This should go to meta-python in meta-openembedded. Why core?


Alex

On Sat 5. Nov 2022 at 9.43, cp0613 <cp0613@linux.alibaba.com> wrote:

> From: cp0613 <cp0613@linux.alibaba.com>
>
> Signed-off-by: cp0613 <cp0613@linux.alibaba.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../python/python3-brotli_1.0.9.bb            | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-brotli_1.0.9.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 57319cd8f5..ac708239b4 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -593,6 +593,7 @@ RECIPE_MAINTAINER:pn-python3-atomicwrites = "Tim
> Orling <tim.orling@konsulko.com
>  RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <tim.orling@konsulko.com
> >"
>  RECIPE_MAINTAINER:pn-python3-babel = "Tim Orling <tim.orling@konsulko.com
> >"
>  RECIPE_MAINTAINER:pn-python3-bcrypt = "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-brotli = "Chen Pei <cp0613@linux.alibaba.com
> >"
>  RECIPE_MAINTAINER:pn-python3-certifi = "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com
> >"
>  RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <
> tim.orling@konsulko.com>"
> diff --git a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
> b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
> new file mode 100644
> index 0000000000..cd0dff9c4b
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Brotli compression format"
> +HOMEPAGE = "https://pypi.org/project/Brotli/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
> +
> +PYPI_PACKAGE = "Brotli"
> +PYPI_PACKAGE_EXT = "zip"
> +
> +SRC_URI[sha256sum] =
> "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} = "\
> +  ${PYTHON_PN}-cffi \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172736):
> https://lists.openembedded.org/g/openembedded-core/message/172736
> Mute This Topic: https://lists.openembedded.org/mt/94823104/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000026262405ecb5759a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This should go to meta-python in meta-openembedded. Why c=
ore?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sat 5. Nov 2022 at 9.43, cp0613 &lt;<a href=3D"mailto=
:cp0613@linux.alibaba.com">cp0613@linux.alibaba.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">From: cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.c=
om" target=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
<br>
Signed-off-by: cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" targe=
t=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0.../python/<a href=3D"http://python3-brotli_1.0.9.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-brotli_1.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
=C2=A02 files changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1=
.0.9.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 57319cd8f5..ac708239b4 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -593,6 +593,7 @@ RECIPE_MAINTAINER:pn-python3-atomicwrites =3D &quot;Tim=
 Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">ti=
m.orling@konsulko.com</a><br>
=C2=A0RECIPE_MAINTAINER:pn-python3-attrs =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-babel =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-bcrypt =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-brotli =3D &quot;Chen Pei &lt;<a href=3D"mail=
to:cp0613@linux.alibaba.com" target=3D"_blank">cp0613@linux.alibaba.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-certifi =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-cffi =3D &quot;Tim Orling &lt;<a href=3D=
"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-chardet =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-brotli_=
1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-brotli_1.0.9.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</a><br>
new file mode 100644<br>
index 0000000000..cd0dff9c4b<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-brotli_1.0.9.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;Brotli compression format&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/Brotli/" rel=3D"nor=
eferrer" target=3D"_blank">https://pypi.org/project/Brotli/</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D941ee9cd1609382f946352712a=
319b4b&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;Brotli&quot;<br>
+PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;4d1b810aa0ed773f81dceda2cc7b403d01057458730e3=
09856356d4ef4188438&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN} =3D &quot;\<br>
+=C2=A0 ${PYTHON_PN}-cffi \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172736): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172736" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172736</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94823104/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94823104/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000026262405ecb5759a--

