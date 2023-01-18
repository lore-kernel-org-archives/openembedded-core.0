Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E04C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 12:13:23 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.13605.1674043995074123768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 04:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4Q+mrlv;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id 187so4774567vsv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 04:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uAtH83qw0jEqTfr8e0PP1ITVQVKdCopHDmzE+Aulo3o=;
        b=R4Q+mrlvqyjfGCY7YuYiFJ+KQY5TY4S3SQNffFD6cL0qD/B2kJWbt5/mk8O5Ed0N8+
         Z5jMPRgwXTfSFK0Av0gGDBOBpaiCSlU1KSnDn2njis5ojzASRgGOMJ/v0NnymXAltonl
         XdXHKLUYZM7M/9Baq9Bb//xtCtZtwoe4jahQgLcx+VRAhSEbMJ3na1xujkRjHHvQ1i8G
         YnFCMNfLOhpPuGp/eALEqBPYaoqxwm7QNJxHqDFeDP0vWuQlIz3yjvAe4xwuS3FIo5tR
         CxMatp44TOMfECkK70kgC+tqOx3fOCv3iHWLdrWpwS0gDPPGl+4DzUVEXpURlaFCvu54
         k2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAtH83qw0jEqTfr8e0PP1ITVQVKdCopHDmzE+Aulo3o=;
        b=CZytc8YzYRyqolZeoyKXvnovGM3jOyR8minl/Tu0ulb/2DyrCAH24LQXZy9Dgv4W3N
         +q8nBsw7nCwoMl3RMb2jXA+G+mi1agWi5RAl4lo4xzREMO+ddTg7uo4N60L27XqmmNvW
         E8GtePf8g/yQYO9PfNvBwefCONh1JTLnFrk+ittBNcwXdtEw3qnF1g4YPmOQnnVyzv/Y
         xEKYgTPRC9Ky4203271oLTJfS0qdXc3i5jqB1IBNSwECKPTB6tL4wh+YIWSzBugeNXus
         Kz56cApBUQ2H7r58nUktLU2AOqf+n21NOZn7TRwYl3Fi3rChcd2XvEBeslkUwYEwMwRb
         2G2w==
X-Gm-Message-State: AFqh2kq2/f20KHvdDtBBE9sHaBGunrMXzrI31nsTmvztbn4yk43tuWS8
	1vt1g6voNMb4aaxBgDumgOnHgKb3sFK4ZmtXAbL1HmT3Hr4=
X-Google-Smtp-Source: AMrXdXthDCVYLTYbffcAlCdg/nESBFmJjsaTmq6lIAn672P5PhfMbNKGD3lQyGqb6f8HH+ZfNHyiOaKYGggagb8tS5k=
X-Received: by 2002:a67:fe48:0:b0:3cb:ba4:3831 with SMTP id
 m8-20020a67fe48000000b003cb0ba43831mr984058vsr.87.1674043994151; Wed, 18 Jan
 2023 04:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20230118112759.3909741-1-pkj@axis.com>
In-Reply-To: <20230118112759.3909741-1-pkj@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 18 Jan 2023 12:13:02 +0000
Message-ID: <CANPvuR=bjdvOdg9teOVuePmYAhHBdsL9u07=fmTRw2fgXZxU2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009c20f305f288bd15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 12:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176090

--0000000000009c20f305f288bd15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quarta,
18/01/2023 =C3=A0(s) 11:28:

> This avoids the following error:
>
>   configure: error: Vala bindings require GObject Introspection
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> index b2e93a2684..c55aa250e9 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> @@ -42,8 +42,6 @@ do_configure[postfuncs] +=3D "cargo_common_do_configure=
"
>
>  inherit rust-target-config
>
> -EXTRA_OECONF:class-target =3D "--enable-vala"
> -
>  # rust-cross writes the target linker binary into target json definition
> without any flags.
>  # This breaks here because the linker isn't going to work without at
> least knowing where
>  # the sysroot is. So copy the json to workdir, and patch in the path to
> wrapper from rust class
> @@ -57,9 +55,10 @@ CVE_CHECK_IGNORE +=3D "CVE-2018-1000041"
>
>  CACHED_CONFIGUREVARS =3D
> "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=3D${STAGING_LIBDIR_NATIVE}/gdk-pixbuf=
-2.0/gdk-pixbuf-query-loaders"
>
> -PACKAGECONFIG ??=3D "gdkpixbuf"
> +PACKAGECONFIG ??=3D "gdkpixbuf ${@bb.utils.contains('GI_DATA_ENABLED',
> 'True', 'vala', '', d)}"
>  # The gdk-pixbuf loader
>  PACKAGECONFIG[gdkpixbuf] =3D
> "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
> +PACKAGECONFIG[vala] =3D "--enable-vala,--disable-vala"
>

This will be enabled in the native builds too and before it is only defined
for target.

Jose


>
>  do_install:append() {
>         # Loadable modules don't need .a or .la on Linux
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176086):
> https://lists.openembedded.org/g/openembedded-core/message/176086
> Mute This Topic: https://lists.openembedded.org/mt/96351645/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009c20f305f288bd15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mailto:pet=
er.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escreveu no d=
ia quarta, 18/01/2023 =C3=A0(s) 11:28:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">This avoids the following error:<br>
<br>
=C2=A0 configure: error: Vala bindings require GObject Introspection<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb" rel=
=3D"noreferrer" target=3D"_blank">librsvg_2.54.5.bb</a> | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb=
" rel=3D"noreferrer" target=3D"_blank">librsvg_2.54.5.bb</a> b/meta/recipes=
-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">librsvg_2.54.5.bb</a><br>
index b2e93a2684..c55aa250e9 100644<br>
--- a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb" rel=
=3D"noreferrer" target=3D"_blank">librsvg_2.54.5.bb</a><br>
+++ b/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb" rel=
=3D"noreferrer" target=3D"_blank">librsvg_2.54.5.bb</a><br>
@@ -42,8 +42,6 @@ do_configure[postfuncs] +=3D &quot;cargo_common_do_config=
ure&quot;<br>
<br>
=C2=A0inherit rust-target-config<br>
<br>
-EXTRA_OECONF:class-target =3D &quot;--enable-vala&quot;<br>
-<br>
=C2=A0# rust-cross writes the target linker binary into target json definit=
ion without any flags.<br>
=C2=A0# This breaks here because the linker isn&#39;t going to work without=
 at least knowing where<br>
=C2=A0# the sysroot is. So copy the json to workdir, and patch in the path =
to wrapper from rust class<br>
@@ -57,9 +55,10 @@ CVE_CHECK_IGNORE +=3D &quot;CVE-2018-1000041&quot;<br>
<br>
=C2=A0CACHED_CONFIGUREVARS =3D &quot;ac_cv_path_GDK_PIXBUF_QUERYLOADERS=3D$=
{STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;gdkpixbuf&quot;<br>
+PACKAGECONFIG ??=3D &quot;gdkpixbuf ${@bb.utils.contains(&#39;GI_DATA_ENAB=
LED&#39;, &#39;True&#39;, &#39;vala&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0# The gdk-pixbuf loader<br>
=C2=A0PACKAGECONFIG[gdkpixbuf] =3D &quot;--enable-pixbuf-loader,--disable-p=
ixbuf-loader,gdk-pixbuf-native&quot;<br>
+PACKAGECONFIG[vala] =3D &quot;--enable-vala,--disable-vala&quot;<br></bloc=
kquote><div><br></div><div>This will be enabled in the native builds too an=
d before it is only defined for target.</div><div><br></div><div>Jose=C2=A0=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Loadable modules don&#39;t need .a or .la on =
Linux<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176086): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176086" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176086</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96351645/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96351645/5052612</a><br>
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
 Quaresma</div></div></div></div>

--0000000000009c20f305f288bd15--

