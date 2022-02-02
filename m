Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8851C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 17:58:02 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.1816.1643824682160351139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ji9goTLG;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id t9so199048lji.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BIUqK6S6AGl4J5NvR5wtNJ1vLapqwFH54njnv0QnhFA=;
        b=Ji9goTLGF7tqW2Og5AZYlqRFrQmOSm4TOb7HwzqshEBiP8hH2fJeR29kCuw89WPgT9
         kifD+iLl+RFGnbjruEuYKYzEsuX7i1hMgDbtDTKdqeK1JcRDocp4NJxq9bcnp4Ey8fhm
         S6m3b3lFqBzuy30mMaGl2yJNPo6VTscu3x3Ney3avnPQQMO5aUXn3t0rYKFLBD6WzIFA
         Q7Jo1HcMZZ37hnwX2RxpH8v5tvTgYfkDCAg7mZpM2hrF1jhsSFdUTb3l+d1dY15wX5wZ
         kvb8MZmHd36JITEalweRzlipfgzVwkQsr3YXSL2yEi+FCP1ZJbB9GJcSuTr+LafuEh5r
         5NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIUqK6S6AGl4J5NvR5wtNJ1vLapqwFH54njnv0QnhFA=;
        b=1oj9e3WWyycwpa+Vwmg0OxgKnGJpC8rUGU2R7QNXnN88z/5mnObTzxM8NCZ0DE2F2T
         +74C7/wR01AdiCgvSKsX1dniZ3rYXAIk6SoABjaZW8tkoluLOgxRES5mCWZmwWD2gIIP
         7kFetgSqpEuudMYEzexWiUU/SWrqqL85IOqHVMw31vET5p2kO5N1TsRTXmJGakmiDzRQ
         PVbgO4siJiD5aNizqW2ZWfn3J1iKPLolzY6S/hHiFRLG6vEHAL7Sqr0q1yJM2STqKUTL
         8cc8vFeM4X5r70c7HsVrcSTTqOo0+1YJGerVCMdAPHr4m9CPoGM4t9/qA1yAIxHwu6pZ
         jP/g==
X-Gm-Message-State: AOAM531cUbHvoYzPq3NatoywH4Vzf/2k1I1k3/rrmM3W//o1Y+yQ8i+D
	p48Pi6BQmsUPy/hNEcJwC0GpwIw4sr7L0WjJroE=
X-Google-Smtp-Source: 
 ABdhPJxVdte0MpN7BegulRfA69Ull6H/6Jcrxp0+UGaNnRpXPU/9ni+CqH27JJ0dtpBl+X6z472rz3FjxaEcOr4hG/k=
X-Received: by 2002:a2e:b0ca:: with SMTP id
 g10mr20430022ljl.216.1643824680134;
 Wed, 02 Feb 2022 09:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20220202134233.2091916-1-ch@denx.de>
 <20220202134233.2091916-3-ch@denx.de>
In-Reply-To: <20220202134233.2091916-3-ch@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Feb 2022 17:57:48 +0000
Message-ID: 
 <CANPvuRk4fdDOSsw27G5FWKXDO5D9btha79DKTcy8LRn8QDFxyQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] gstreamer1.0-plugins-base: 1.18.5 -> 1.19.90
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000021eeee05d70cc2ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 17:58:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161223

--00000000000021eeee05d70cc2ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Claudius Heine <ch@denx.de> escreveu no dia quarta, 2/02/2022 =C3=A0(s) 13:=
42:

> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>  ...004-glimagesink-Downrank-to-marginal.patch | 32 -------------------
>  ...b =3D> gstreamer1.0-plugins-base_1.19.90.bb} |  5 ++-
>  2 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimages=
ink-Downrank-to-marginal.patch
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.18.5.bb =3D>
> gstreamer1.0-plugins-base_1.19.90.bb} (94%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimag=
esink-Downrank-to-marginal.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimag=
esink-Downrank-to-marginal.patch
> deleted file mode 100644
> index f45ea65ef3..0000000000
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimag=
esink-Downrank-to-marginal.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 79841a02ee754eba736cb32aaf2ed2b2fc0483d4 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 24 Sep 2015 19:47:32 +0300
> -Subject: [PATCH 4/4] glimagesink: Downrank to marginal
> -
> -On desktop, where there is good OpenGL, xvimagesink will come up first,
> -on other platforms, OpenGL can't be trusted because it's either software
> (like
> -in a VM) or broken (like on embedded)., so let ximagesink come above.
> -
> -Upstream-Status: Submitted [
> https://bugzilla.gnome.org/show_bug.cgi?id=3D751684]
> -
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - ext/gl/gstopengl.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
> -index 302e845..463be9c 100644
> ---- a/ext/gl/gstopengl.c
> -+++ b/ext/gl/gstopengl.c
> -@@ -127,7 +127,7 @@ plugin_init (GstPlugin * plugin)
> - #endif
> -
> -   if (!gst_element_register (plugin, "glimagesink",
> --          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
> -+          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
> -     return FALSE;
> -   }
> -
> ---
> -2.28.0
> -
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.18.5.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.19.90.bb
> similarity index 94%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.18.5.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.19.90.bb
> index 180241828f..5b02d4565a 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.18.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.19.90.bb
> @@ -4,15 +4,14 @@ DESCRIPTION =3D "'Base' GStreamer plugins and helper
> libraries"
>  HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
>  BUGTRACKER =3D "
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
>  LICENSE =3D "GPLv2+ & LGPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a=
770"
>
>  SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-$=
{PV}.tar.xz
> \
>
> file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
>             file://0003-viv-fb-Make-sure-config.h-is-included.patch \
>             file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
> -           file://0004-glimagesink-Downrank-to-marginal.patch \
>

Why is this patch dropped? As Far as I know it is not merged upstream.


>             "
> -SRC_URI[sha256sum] =3D
> "960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3"
> +SRC_URI[sha256sum] =3D
> "667c5cbfae1873c8291b5911bedbf20ce92ee607b8b1b3d37120ed54e452db00"
>
>  S =3D "${WORKDIR}/gst-plugins-base-${PV}"
>
> --
> 2.34.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000021eeee05d70cc2ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Claudius Heine &lt;<a href=3D"mailto:ch@denx.de" t=
arget=3D"_blank">ch@denx.de</a>&gt; escreveu no dia quarta, 2/02/2022 =C3=
=A0(s) 13:42:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Claudius Heine &lt;<a href=3D"mailto:ch@denx.de" target=3D"_bl=
ank">ch@denx.de</a>&gt;<br>
---<br>
=C2=A0...004-glimagesink-Downrank-to-marginal.patch | 32 ------------------=
-<br>
=C2=A0...b =3D&gt; <a href=3D"http://gstreamer1.0-plugins-base_1.19.90.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.19.90.bb</=
a>} |=C2=A0 5 ++-<br>
=C2=A02 files changed, 2 insertions(+), 35 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-base/0004-glimagesink-Downrank-to-marginal.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-base_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-base_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-base_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-base_1.19.90.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
04-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch<br=
>
deleted file mode 100644<br>
index f45ea65ef3..0000000000<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glim=
agesink-Downrank-to-marginal.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 79841a02ee754eba736cb32aaf2ed2b2fc0483d4 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Thu, 24 Sep 2015 19:47:32 +0300<br>
-Subject: [PATCH 4/4] glimagesink: Downrank to marginal<br>
-<br>
-On desktop, where there is good OpenGL, xvimagesink will come up first,<br=
>
-on other platforms, OpenGL can&#39;t be trusted because it&#39;s either so=
ftware (like<br>
-in a VM) or broken (like on embedded)., so let ximagesink come above.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://bugzilla.gnome.org/show_bug=
.cgi?id=3D751684" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gno=
me.org/show_bug.cgi?id=3D751684</a>]<br>
-<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- ext/gl/gstopengl.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c<br>
-index 302e845..463be9c 100644<br>
---- a/ext/gl/gstopengl.c<br>
-+++ b/ext/gl/gstopengl.c<br>
-@@ -127,7 +127,7 @@ plugin_init (GstPlugin * plugin)<br>
- #endif<br>
- <br>
-=C2=A0 =C2=A0if (!gst_element_register (plugin, &quot;glimagesink&quot;,<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_RANK_SECONDARY, gst_gl_image_sink_=
bin_get_type ())) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_RANK_MARGINAL, gst_gl_image_sink_b=
in_get_type ())) {<br>
-=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
-=C2=A0 =C2=A0}<br>
- <br>
--- <br>
-2.28.0<br>
-<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-base_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-base_1.18.5.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-base_1.19.90.bb" rel=3D"noreferrer" target=3D"=
_blank">gstreamer1.0-plugins-base_1.19.90.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-base_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-base_1.18.5.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-base_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-base_1.19.90.bb</a><br>
index 180241828f..5b02d4565a 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-base_1.18.5.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-base_1.19.90.bb</a><br>
@@ -4,15 +4,14 @@ DESCRIPTION =3D &quot;&#39;Base&#39; GStreamer plugins an=
d helper libraries&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/" rel=
=3D"noreferrer" target=3D"_blank">https://gstreamer.freedesktop.org/</a>&qu=
ot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedesktop.org/gstrea=
mer/gst-plugins-base/-/issues" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2+ &amp; LGPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6762ed442b3822387a51c92d92=
8ead0d&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D69333daa044cb77e486cc36129=
f7a770&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/gs=
t-plugins-base/gst-plugins-base-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plug=
ins-base-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ENGR00312515-get-caps=
-from-src-pad-when-query-caps.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-viv-fb-Make-sure-conf=
ig.h-is-included.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ssaparse-enhance-SSA-=
text-lines-parsing.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-glimagesink-Downrank-=
to-marginal.patch \<br></blockquote><div><br></div><div>Why is this patch d=
ropped? As Far as I know it is not merged upstream.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;960b7af4585700db0fdd5b843554e11e2564fed9e061f=
591fae88a7be6446fa3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;667c5cbfae1873c8291b5911bedbf20ce92ee607b8b1b=
3d37120ed54e452db00&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-base-${PV}&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--00000000000021eeee05d70cc2ef--

