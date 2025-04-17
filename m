Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90312C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:19:56 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.4606.1744881591210980802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 02:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mk8YSP8f;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so224954241.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744881590; x=1745486390; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZBHHOo0l+LcRJhn8DR+oA4YhHeG96vniwCWRRe0Y4o=;
        b=mk8YSP8f8fyxQ38EoXcybidpxWd6pmnSYLwjEVQGFcR/RIfE9jDoM23xTsxljGYT/4
         BhIj6t2BPuAPQMddkKCAkIHeDBDg4OogV3OJTvtTWjDHbIlRTQkOXtvG2iCRUCGbYers
         SUG25lBsyKxpDjjXVSbMLuoUo4ZNhIb/uKOnEWo18APw7yVxnAmydNGMEg9C+zTHj66T
         cITHl1mC9cHfH3rgj4Zt0F4QJpay0TwKOsR+DS5n2VbmUjVhYh84lA8mzl20NkTIqsTt
         gr1FyOE3I+hbrkFi/dbVqJhOH5x1RN5qXrg7ZCjGPlc/r2L03oBl3u40D8CXZuGUYEF3
         m0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881590; x=1745486390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZBHHOo0l+LcRJhn8DR+oA4YhHeG96vniwCWRRe0Y4o=;
        b=oAkaAZmLztwFwVeEtDXfJ9dOnoRMag7pWb3I3E1xXU4v1Iut7uESTy40TcvVQjackn
         QQ4ZzW1HWjSCtMq04PTkJwHkPi6i3St2bGC84wP6RIEDU/k4v0M3siHU7aTRBQ9mUrpF
         lvBDJQHeoFPnR1MJ8x+XLY/fMKLFTD6oGM38lb3F0HfgJqXBHzmTlpK1+WhFc5ZQjzU9
         9eSxjOtCOOTFJxxiFkV3LnY4idaRR5WPvC8buNaJSJEviiyHtyKb0govQzH1MhBEM2tv
         TpC9s3+V4vhn0lsKozSDEHTK/rdU1Z0AmorkYPYOCCbMjFCvaoUD+FzOP68KLDxCFlpC
         vaWw==
X-Forwarded-Encrypted: i=1; AJvYcCUVGERP4kaxWDJ5wYLsjan4PTIqcrqzuXDgLjc9V8HZBoBHgbTovaBcYS96xprypMxXw8XA75fQpRFVVdiEPVsuFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKlqIc2tlkH4ihq81LaebZoPRHwP+YlEgRSuP7okDCqYmmd4pX
	ijpULLiO1YojGCNeXQO0wF4xWUWksgFbIr3rkS/3DXC6l4qGpB3ubKZGilyAFfkD/V8FWa722mz
	uaIJIB9wcTv++5woW5z63OV+qG4o=
X-Gm-Gg: ASbGnctsx1LocD5LFq5wLfriBC2vMARvv0bvZ9v3GEWmGpu1UzDHEbGCE+b/jVP9XMQ
	MGiWh8/P0UzJy/b+oZteUbj8w1psq84cOMvca4zykod6Sd/27sPGbay3PIXAl8jBbqaq4ryiwmp
	F6gtN2SU1NZPdxRAE/KSWeT6rHuBeIKaGG1g==
X-Google-Smtp-Source: AGHT+IFv4gfuDnFgTu9MM64NSv5wPjbHUt0mrLVPKc3QZH7RWNZAftAK1tk7lqQbUIk0pvAgVh4/6hv++nFfQ+dsjSw=
X-Received: by 2002:a05:6102:3229:b0:4c3:c9:c667 with SMTP id
 ada2fe7eead31-4cb592f08e0mr3492565137.24.1744881589893; Thu, 17 Apr 2025
 02:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250415030820.673-1-leimaohui@fujitsu.com>
In-Reply-To: <20250415030820.673-1-leimaohui@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 17 Apr 2025 10:19:38 +0100
X-Gm-Features: ATxdqUFrbuaxL__D40ScGCeTHlVgCHdJBoVIocc00_4Z367ulO6R2JBqzQBYl8w
Message-ID: <CANPvuRkObGdWynTZHMo7CPTY5=TStuc5Md-d3ek5R=Y1paB6oQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when
 enable multilib
To: leimaohui@fujitsu.com
Cc: Anuj Mittal <anuj.mittal@intel.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005740720632f5e7ce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 09:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215046

--0000000000005740720632f5e7ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

leimaohui via lists.openembedded.org <leimaohui=3D
fujitsu.com@lists.openembedded.org> escreveu (ter=C3=A7a, 15/04/2025 =C3=A0=
(s) 04:08):

> Error: Transaction test error:
>   file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted install=
s
> of lib32-gstreamer1.0-dev-1.26.0-r0.core2_32 and
> gstreamer1.0-dev-1.26.0-r0.core2_64
>
> fixed-size differs between 32 bit and 64 bit system
>
> $ diff
> /mnt/test/build_auh/tmp/work/core2-64-poky-linux/gstreamer1.0/1.26.0/imag=
e/usr/share/gir-1.0/Gst-1.0.gir
> /mnt/test/build_auh/tmp/work/core2-32-pokymllib32-linux/lib32-gstreamer1.=
0/1.26.0/image/usr/share/gir-1.0/Gst-1.0.gir
> 31864c31864
> <         <array zero-terminated=3D"0" fixed-size=3D"8">
> ---
> >         <array zero-terminated=3D"0" fixed-size=3D"12">
>
> source code:
> $ less gstreamer1.0-dev/usr/include/gstreamer-1.0/gst/gstidstr.h
> typedef struct {
>   /* < private > */
>   gpointer pointer;
>   guint8 padding[8];
>   guint8 padding[12];
>   #error "Only 32 bit and 64 bit pointers supported currently"
> } GstIdStr;
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
> index a908ecd166..5c795ad676 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
> @@ -8,7 +8,7 @@ LICENSE =3D "LGPL-2.1-or-later"
>
>  DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
>
> -inherit meson pkgconfig gettext upstream-version-is-even
> gobject-introspection ptest-gnome
> +inherit meson pkgconfig gettext upstream-version-is-even
> gobject-introspection ptest-gnome multilib_script
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a=
770 \
>
>  file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c=
079c016d0d"
> @@ -68,6 +68,8 @@ FILES:${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.a
> ${libdir}/gstreamer-1.0/include"
>  FILES:${PN}-bash-completion +=3D "${datadir}/bash-completion/completions=
/
> ${datadir}/bash-completion/helpers/gst*"
>  FILES:${PN}-dbg +=3D "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
>
> +MULTILIB_SCRIPTS:append =3D "${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"
> +
>

Missing space on the beginning of the string, it should be:
MULTILIB_SCRIPTS:append =3D " ${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"

Jose


>  RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-gconv-iso8859-5"
>
>  CVE_PRODUCT =3D "gstreamer"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214816):
> https://lists.openembedded.org/g/openembedded-core/message/214816
> Mute This Topic: https://lists.openembedded.org/mt/112270803/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005740720632f5e7ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">leimaohui via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;lei=
maohui=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@=
lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 15/04/2025 =C3=A0(s) 0=
4:08):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Error: Tr=
ansaction test error:<br>
=C2=A0 file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted inst=
alls of lib32-gstreamer1.0-dev-1.26.0-r0.core2_32 and gstreamer1.0-dev-1.26=
.0-r0.core2_64<br>
<br>
fixed-size differs between 32 bit and 64 bit system<br>
<br>
$ diff /mnt/test/build_auh/tmp/work/core2-64-poky-linux/gstreamer1.0/1.26.0=
/image/usr/share/gir-1.0/Gst-1.0.gir /mnt/test/build_auh/tmp/work/core2-32-=
pokymllib32-linux/lib32-gstreamer1.0/1.26.0/image/usr/share/gir-1.0/Gst-1.0=
.gir<br>
31864c31864<br>
&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;array zero-terminated=3D&quot;0&q=
uot; fixed-size=3D&quot;8&quot;&gt;<br>
---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;array zero-terminated=3D&quot;0&q=
uot; fixed-size=3D&quot;12&quot;&gt;<br>
<br>
source code:<br>
$ less gstreamer1.0-dev/usr/include/gstreamer-1.0/gst/gstidstr.h<br>
typedef struct {<br>
=C2=A0 /* &lt; private &gt; */<br>
=C2=A0 gpointer pointer;<br>
=C2=A0 guint8 padding[8];<br>
=C2=A0 guint8 padding[12];<br>
=C2=A0 #error &quot;Only 32 bit and 64 bit pointers supported currently&quo=
t;<br>
} GstIdStr;<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" targ=
et=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.26=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a> | 4 =
+++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</=
a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.26.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a><br>
index a908ecd166..5c795ad676 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.26=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.26=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a><br>
@@ -8,7 +8,7 @@ LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 glib-2.0-native libxml2 bison-native flex-=
native&quot;<br>
<br>
-inherit meson pkgconfig gettext upstream-version-is-even gobject-introspec=
tion ptest-gnome<br>
+inherit meson pkgconfig gettext upstream-version-is-even gobject-introspec=
tion ptest-gnome multilib_script<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D69333daa044cb77e486cc=
36129f7a770 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c=
079c016d0d&quot;<br>
@@ -68,6 +68,8 @@ FILES:${PN}-dev +=3D &quot;${libdir}/gstreamer-1.0/*.a ${=
libdir}/gstreamer-1.0/include&quot;<br>
=C2=A0FILES:${PN}-bash-completion +=3D &quot;${datadir}/bash-completion/com=
pletions/ ${datadir}/bash-completion/helpers/gst*&quot;<br>
=C2=A0FILES:${PN}-dbg +=3D &quot;${datadir}/gdb ${datadir}/gstreamer-1.0/gd=
b&quot;<br>
<br>
+MULTILIB_SCRIPTS:append =3D &quot;${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir=
&quot;<br>
+<br></blockquote><div><br></div><div>Missing space on the beginning=C2=A0o=
f the string, it should be:<br>MULTILIB_SCRIPTS:append =3D &quot; ${PN}-dev=
:${datadir}/gir-1.0/Gst-1.0.gir&quot;</div><div><br>Jose<br>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0RDEPENDS:${PN}-ptest:append:libc-glibc =3D &quot; glibc-gconv-iso8859=
-5&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;gstreamer&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214816): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214816" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214816</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112270803/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112270803/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000005740720632f5e7ce--

