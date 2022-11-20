Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5CCC433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 23:17:53 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.25692.1668986263279950098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 15:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QcctYPa3;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-142612a5454so11332354fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 15:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RXA0t9B1p+YsQn5q8YWWd7/0+ZFu7F7rVbvmC0LUJ6w=;
        b=QcctYPa3lBWyY4W52N/Go9dnq3LIhW7HunzYI2dDJnzh1qCeECZ6WJgxSLU1oAA1j7
         iBYu1c1+PoaqMRSng8zweEblr3S47E1ucqE8LN8jkTyjfp+8l3wQf8axPxruhXtC4gJP
         Hd6dDJNxQwIRbzoHIB4mfEN75pe3VoAwWCn+O27CisR1SXQtRwigfCI6GSLCKMJ4k49Z
         WMxseGOjtgyQjNKhHOtzWF/4Hx3Bc37A8tUwtzYRsKWRMI3RWnrUEwj9xkQXXqc0ziRn
         WaYYILulJQTvVKT/qv0xIsmIkGccgv47LaxrJxvWABZUBv0P8p7+X4bbjaEw2lmHxoY1
         v+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXA0t9B1p+YsQn5q8YWWd7/0+ZFu7F7rVbvmC0LUJ6w=;
        b=TvLBB0oFknrm+QoBzMo+UcLPXMnkoZHLuEvro0BmRWeePmBPbc4ka2sQdR+ggqx6hr
         5j3X/GJA7AxqliVrA+L98JW4RTHT25OGmrQMKDEM1NP5j59Gcxyo1dqHwH+v05lARBwa
         gvFQdc9y18tJdqK3PzEmuWQLOOlaKopoLNvUDGhLq61VkPpqdKO1wY6n163Y1ju4pPBR
         B3HZB2e1ycPmibU/VknK3UINvi3hlW2JEY+7zkpw2mCyS84l+OUVO5dhQ04p/ysD+TPC
         KkjjD/wPSV67d5jya74g9k+t+eg2Bzfs035Kc22KwnGLBiDT6CLmKoWLHPEtbVTtzmfj
         Vnnw==
X-Gm-Message-State: ANoB5plVAjfMHpTUWan+Qbmak2u9/OMaCBaNBg5omgWP/5Y9Efv9w6s+
	z2n9YSy9MKhixKn/E4wqgS7t55o2y72ZLYURuhE=
X-Google-Smtp-Source: AA0mqf4Q15YZ7vo1zaP8fsEBczz4M5vqlLRnoqOYKj4fs0Pp4AFTpL7p+1Cgsq1f47+hRc9wuO29CSXS/APOsqruoUI=
X-Received: by 2002:a05:6870:1784:b0:13b:1e05:a73d with SMTP id
 r4-20020a056870178400b0013b1e05a73dmr11711276oae.55.1668986262275; Sun, 20
 Nov 2022 15:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de>
In-Reply-To: <20221120175237.194899-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Nov 2022 15:17:31 -0800
Message-ID: <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004c4a1c05edef2586"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 23:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173642

--0000000000004c4a1c05edef2586
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 20, 2022 at 9:52 AM Markus Volk <f_l_k@t-online.de> wrote:

> Currently /usr/bin/python is provided by the python2 package. If python2
> is not installed, the built image lacks a provider for it.
> This results in failed scripts when using '/usr/bin/python' shebang.
>
> This patch adds a /usr/bin/python symlink for python3 to fix this issue.
> For images containing python2 and python3, the do_rootfs task will fail
> because now both of them provide the same file.
> To allow this corner case, a DISTRO_FEATURE 'python2' has been introduced
> which,
> if set, will prevent python3 from creating the symlink.
>
> The link is created with relative path because using an absolute path
> would fail
> for native and nativesdk.


What happens if and when python4 comes ?
This might get us into same mess we had migrating python2 to 3


>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
>  meta/recipes-devtools/python/python3_3.11.0.bb             | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 64203cf0fc..7b6f509a45 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -203,6 +203,7 @@
>          "files": [
>              "${bindir}/python${PYTHON_MAJMIN}",
>              "${bindir}/python${PYTHON_MAJMIN}.real",
> +            "${bindir}/python",
>              "${bindir}/python3",
>              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb
> b/meta/recipes-devtools/python/python3_3.11.0.bb
> index 92a1f69320..18b631f79d 100644
> --- a/meta/recipes-devtools/python/python3_3.11.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.0.bb
> @@ -144,6 +144,7 @@ do_install:prepend() {
>
>  do_install:append:class-target() {
>          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf
> ./python3 ${D}${bindir}/python', d)}
>  }
>
>  do_install:append:class-native() {
> @@ -156,6 +157,7 @@ do_install:append:class-native() {
>          # (these often end up too long for the #! parser in the kernel as
> the
>          # buffer is 128 bytes long).
>          ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf
> ./python3-native/python3 ${D}${bindir}/nativepython', d)}
>
>          # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000
> of them
>          # and the overhead in each recipe-sysroot-native isn't worth it,
> particularly
> @@ -213,6 +215,7 @@ do_install:append() {
>  }
>
>  do_install:append:class-nativesdk () {
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf
> ./python3 ${D}${bindir}/python', d)}
>      # Make sure we use /usr/bin/env python
>      for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
>           sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> @@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk = "
> ${MLPREFIX}openssl ${MLPREFIX
>
>  # For historical reasons PN is empty and provided by python3-modules
>  FILES:${PN} = ""
> +RPROVIDES:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'python2', '',
> '${bindir}/python', d)}"
>  RPROVIDES:${PN}-modules = "${PN}"
>
>  FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173637):
> https://lists.openembedded.org/g/openembedded-core/message/173637
> Mute This Topic: https://lists.openembedded.org/mt/95156228/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004c4a1c05edef2586
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Nov 20, 2022 at 9:52 AM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Currently /usr/bin/python is provided by the python=
2 package. If python2<br>
is not installed, the built image lacks a provider for it.<br>
This results in failed scripts when using &#39;/usr/bin/python&#39; shebang=
.<br>
<br>
This patch adds a /usr/bin/python symlink for python3 to fix this issue.<br=
>
For images containing python2 and python3, the do_rootfs task will fail<br>
because now both of them provide the same file.<br>
To allow this corner case, a DISTRO_FEATURE &#39;python2&#39; has been intr=
oduced which,<br>
if set, will prevent python3 from creating the symlink.<br>
<br>
The link is created with relative path because using an absolute path would=
 fail<br>
for native and nativesdk.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">What happens if and when python4 comes ?</div><div dir=3D"auto">T=
his might get us into same mess we had migrating python2 to 3</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/python3/python3-manifest.json | 1 +<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json<br>
index 64203cf0fc..7b6f509a45 100644<br>
--- a/meta/recipes-devtools/python/python3/python3-manifest.json<br>
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
@@ -203,6 +203,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${bindir}/python${PYT=
HON_MAJMIN}&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${bindir}/python${PYT=
HON_MAJMIN}.real&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python&quot;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${bindir}/python3&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${includedir}/python$=
{PYTHON_MAJMIN}/pyconfig*.h&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/UserDict.py&quot;,<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.11.0.bb</a><br>
index 92a1f69320..18b631f79d 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a><br>
@@ -144,6 +144,7 @@ do_install:prepend() {<br>
<br>
=C2=A0do_install:append:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header python${PYTHON_MAJMIN}=
/pyconfig.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;python2&#39;, &#39;&#39;, &#39;ln -sf ./python3 ${D}${bindir}/python=
&#39;, d)}<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append:class-native() {<br>
@@ -156,6 +157,7 @@ do_install:append:class-native() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# (these often end up too long for the #!=
 parser in the kernel as the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# buffer is 128 bytes long).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s python3-native/python3 ${D}${bindir=
}/nativepython3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;python2&#39;, &#39;&#39;, &#39;ln -sf ./python3-native/python3 ${D}$=
{bindir}/nativepython&#39;, d)}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the opt-1.pyc and opt-2.pyc file=
s. There are over 3,000 of them<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# and the overhead in each recipe-sysroot=
-native isn&#39;t worth it, particularly<br>
@@ -213,6 +215,7 @@ do_install:append() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append:class-nativesdk () {<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;python2=
&#39;, &#39;&#39;, &#39;ln -sf ./python3 ${D}${bindir}/python&#39;, d)}<br>
=C2=A0 =C2=A0 =C2=A0# Make sure we use /usr/bin/env python<br>
=C2=A0 =C2=A0 =C2=A0for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bin=
dir}`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s|^#!.*|#!/usr/bin/env p=
ython3|&#39; $PYTHSCRIPT<br>
@@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk =3D &quo=
t; ${MLPREFIX}openssl ${MLPREFIX<br>
<br>
=C2=A0# For historical reasons PN is empty and provided by python3-modules<=
br>
=C2=A0FILES:${PN} =3D &quot;&quot;<br>
+RPROVIDES:${PN} =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;python2&#39;, &#39;&#39;, &#39;${bindir}/python&#39;, d)}&quot;<br>
=C2=A0RPROVIDES:${PN}-modules =3D &quot;${PN}&quot;<br>
<br>
=C2=A0FILES:${PN}-pydoc +=3D &quot;${bindir}/pydoc${PYTHON_MAJMIN} ${bindir=
}/pydoc3&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173637): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173637" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173637</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95156228/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95156228/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004c4a1c05edef2586--

