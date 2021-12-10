Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E857C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:07:11 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web09.7442.1639145230385584091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hs5YGwdo;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 70so6073365vkx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jhURNPZjjHDOBbj4tNvu8C4QPQtZmVQZs3ZkxFpqfk=;
        b=Hs5YGwdoiYkeOl7OryYSj76oQx8hwTZnnqN/85rHud/scgi7WVYFlh8D26wKMWvxaL
         Z9ZNrLBZ1cztAHRICWO0TKZzbMYcxPhMAXzXls+RRdwQwt7xVU7uxccM6DzADAGr6FMI
         nd55gscI6NwqFlATmBjbdkj9rFPI7eKRXB/JXKG0Ds+wZdL3/vWnVuXrqF3ApiwjztJJ
         V6AHERTDyhFqC3iy+j0eDO0nLt4Xsb45VAeO1y8HNI3vJwcroBBH5RlgBT+8I/Wkypcf
         CfyorefIX+yMcDnmH797rpB9IW3TQGN22QJVn0lWXvXUmNwq7avgKtTTZdnBkXB9BOMg
         Q+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jhURNPZjjHDOBbj4tNvu8C4QPQtZmVQZs3ZkxFpqfk=;
        b=2xUfx60WtBkBtT5gk5hsieC6OwEE9GpwKxnIMDCekRh/KfOZpQE03uy61xn5+6JRyN
         ek+BzzkfdTgpdl9Ll0DcGOYRguTZgXsQ0l555EWqEyWzcJQJqWI7r5lXjmY426/B9ZMg
         jYEy6g5QJz0t1KypBdnw3vIXDYiXKZPEnx0IlTyNxPwyRbX78aSpeKi1nrCk5ZNs/qQC
         rXkbiAJ7chlYuSE9ypnE1OLv6luy9ZumZ05uKeFXehYKs0SEbJN+RODvPxho9LQYGHV2
         Zt5Z1h/NP8fA7VL8z68m3uZlzz9H/2nSFtWkXJW2tB+bAsIiqx6VHPt8mkbWFRgmR617
         46jA==
X-Gm-Message-State: AOAM533TQMGGpPUO1iFtn0B/nCi9P4J4pmoja6O8lmoLtzL9Hx3BBYw0
	5SkprW7D4y5vIkJYnsm7KVj2ZkVDnlH3abX8iqk=
X-Google-Smtp-Source: 
 ABdhPJxe8D3tuxoMJioaqf2hEhPJUtTh700nlIUcG9XmIxCO3I03d/NJP30IJIwrErXGjvFR7CzI0ybcYLpO5ZedVao=
X-Received: by 2002:a1f:3f4f:: with SMTP id m76mr19481512vka.1.1639145229053;
 Fri, 10 Dec 2021 06:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20211210140234.3713-1-f_l_k@t-online.de>
In-Reply-To: <20211210140234.3713-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Dec 2021 15:06:57 +0100
Message-ID: 
 <CANNYZj9YbZJxLADiti4fzsCex06DK9RUk4G-y3ARb3tLgkW9=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libva: move wayland PACKAGECONFIG to libva.inc
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001cf33a05d2cb3dbc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159524

--0000000000001cf33a05d2cb3dbc
Content-Type: text/plain; charset="UTF-8"

 | Run-time dependency wayland-client found: YES 1.19.0

Can you please explain how the issue can be reproduced? I find it odd that
libva-initial (which only needs libdrm, and is required by mesa) has
wayland in its sysroot in your build - where does that come from? There's a
chance the problem is elsewhere.

Alex

On Fri, 10 Dec 2021 at 15:03, Markus Volk <f_l_k@t-online.de> wrote:

> I encountered an error while trying to build libva under wayland.
> libva-initial
> was missing wayland-native dependency and failed like this:
>
> | Run-time dependency xfixes found: NO (tried pkgconfig and cmake)
> | Run-time dependency wayland-client found: YES 1.19.0
> | Program wayland-scanner /usr/bin/wayland-scanner found: NO
> |
> | ../libva-2.13.0/meson.build:107:4: ERROR: Program 'wayland-scanner
> /usr/bin/wayland-scanner' not found
> |
> | A full log can be found at
> /home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-linux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt
> | ERROR: meson failed
> | WARNING: exit code 1 from a shell command.
>
> This commit moves the PACKAGECONFIG[wayland] to libva.inc to make it
> available to libva-initial also
>
> Signed-off-by: MarkusVolk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/libva/libva.inc       | 7 +++++++
>  meta/recipes-graphics/libva/libva_2.13.0.bb | 4 +---
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/libva/libva.inc
> b/meta/recipes-graphics/libva/libva.inc
> index bcf9757c1a..0e2721e291 100644
> --- a/meta/recipes-graphics/libva/libva.inc
> +++ b/meta/recipes-graphics/libva/libva.inc
> @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI = "
> https://github.com/intel/libva/releases"
>  DEPENDS = "libdrm"
>
>  inherit meson pkgconfig
> +
> +PACKAGECONFIG:append = " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
> +"
> +
> +PACKAGECONFIG[wayland] =
> "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
> +
> diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb
> b/meta/recipes-graphics/libva/libva_2.13.0.bb
> index ed2be289fc..a8c6355b01 100644
> --- a/meta/recipes-graphics/libva/libva_2.13.0.bb
> +++ b/meta/recipes-graphics/libva/libva_2.13.0.bb
> @@ -2,14 +2,12 @@ require libva.inc
>
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
>  "
>
>  PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxext
> libxfixes"
>  PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
>
> -PACKAGECONFIG[wayland] =
> "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
> -
>  PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
>
>  RDEPENDS:${PN}-x11 =+ "${PN}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159523):
> https://lists.openembedded.org/g/openembedded-core/message/159523
> Mute This Topic: https://lists.openembedded.org/mt/87636241/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001cf33a05d2cb3dbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>
| Run-time dependency wayland-client found: YES 1.19.0</div><div><br></div>=
<div>Can you please explain how the issue can be reproduced? I find it odd =
that libva-initial (which only needs libdrm, and is required by mesa) has w=
ayland in its sysroot in your build - where does that come from? There&#39;=
s a chance the problem is elsewhere.<br></div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, 10 Dec 2021 at 15:03, Markus Volk &lt;<a href=3D"mailto:f_l_k@=
t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">I encountered an error while trying to build =
libva under wayland. libva-initial<br>
was missing wayland-native dependency and failed like this:<br>
<br>
| Run-time dependency xfixes found: NO (tried pkgconfig and cmake)<br>
| Run-time dependency wayland-client found: YES 1.19.0<br>
| Program wayland-scanner /usr/bin/wayland-scanner found: NO<br>
|<br>
| ../libva-2.13.0/meson.build:107:4: ERROR: Program &#39;wayland-scanner /u=
sr/bin/wayland-scanner&#39; not found<br>
|<br>
| A full log can be found at /home/flk/build/poky/build-rock/tmp/work/corte=
xa72-cortexa53-crypto-poky-linux/libva-initial/2.13.0-r0/build/meson-logs/m=
eson-log.txt<br>
| ERROR: meson failed<br>
| WARNING: exit code 1 from a shell command.<br>
<br>
This commit moves the PACKAGECONFIG[wayland] to libva.inc to make it availa=
ble to libva-initial also<br>
<br>
Signed-off-by: MarkusVolk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/libva/libva.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +=
++++++<br>
=C2=A0meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.bb" rel=3D=
"noreferrer" target=3D"_blank">libva_2.13.0.bb</a> | 4 +---<br>
=C2=A02 files changed, 8 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/=
libva/libva.inc<br>
index bcf9757c1a..0e2721e291 100644<br>
--- a/meta/recipes-graphics/libva/libva.inc<br>
+++ b/meta/recipes-graphics/libva/libva.inc<br>
@@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.c=
om/intel/libva/releases" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/intel/libva/releases</a>&quot;<br>
=C2=A0DEPENDS =3D &quot;libdrm&quot;<br>
<br>
=C2=A0inherit meson pkgconfig<br>
+<br>
+PACKAGECONFIG:append =3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;wayland&#=
39;, d)} \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG[wayland] =3D &quot;-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,=
wayland-native wayland&quot;<br>
+<br>
diff --git a/meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb</a> b/meta/recipes-gr=
aphics/libva/<a href=3D"http://libva_2.13.0.bb" rel=3D"noreferrer" target=
=3D"_blank">libva_2.13.0.bb</a><br>
index ed2be289fc..a8c6355b01 100644<br>
--- a/meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.bb" rel=3D=
"noreferrer" target=3D"_blank">libva_2.13.0.bb</a><br>
+++ b/meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.bb" rel=3D=
"noreferrer" target=3D"_blank">libva_2.13.0.bb</a><br>
@@ -2,14 +2,12 @@ require libva.inc<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x1=
1 opengl&#39;, &#39;glx&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11 wayla=
nd&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;,=
 d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual=
/libx11 libxext libxfixes&quot;<br>
=C2=A0PACKAGECONFIG[glx] =3D &quot;-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual=
/mesa&quot;<br>
<br>
-PACKAGECONFIG[wayland] =3D &quot;-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,=
wayland-native wayland&quot;<br>
-<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-x11 ${PN}-glx ${PN}-wayland&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-x11 =3D+ &quot;${PN}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159523): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159523" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159523</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87636241/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87636241/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001cf33a05d2cb3dbc--

