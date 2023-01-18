Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61822C38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:55:34 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.17125.1674053726839682144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YGyyG5I7;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id n190so32091742vsc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2GuHhZF59bPrjDuhnLu4NQT7z6PWqbmOJsHSGtP7rs=;
        b=YGyyG5I7cwjvah7kVY3X8F5SER+KlpG97WmTTY7kvZRiQTU73Oznx+jZ/My6L7gmxv
         4RQwFSlYCTu4EqWrvvtkMy/iCUd2y1g2vHVc5LFkQ1GohfzowgnUURLDCOJ3tatmQ/Bk
         +RK5LU/fPlNglbB918M2+1HuSVR3tJ1s1RpSZFO/lzvod/X52pfJ5FMrzXASh5qMCZCC
         a3xuiU1MS5LHSKLBRjhLzeMb3yFAIM6GohH5s2gipNqWojX6x5PQwFc52IOzFPBSCnla
         wU4kZpTtvgoqU9G9KPwyts6I5/TbSsLmJyz0COsgLR+MpMB8dRcseeubDPn8lf8gO6jF
         +R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2GuHhZF59bPrjDuhnLu4NQT7z6PWqbmOJsHSGtP7rs=;
        b=iFMblxxQhUPEQ3mFI/wPQTjhmzfT6ElnbQEi/cubXRCjYDKVAl+sGIyMTpked7tbRf
         aatXXLuStvJ0eDv8f4saT06DlskdHGp3rgPrZxsKnTzN5LW8q9HARvSw6ryxB8+VVvwX
         zh6q2NO1GhDD0iOxvwSpvR1ioJ78ErD4ozQKLRRWBV/VGdmftkDg5M5bN/tQ3RV138gp
         ZAkEfmaYV4srRwkz9pd4qXgKWzFsIkUbHI7rfeKa83h55TK9X7sU9PbKwOPkZKku4puW
         jKfNcxg2IkYBStfeku3qLue/Y7fYJK/Btlk/eQEen6OwoHUuJBX9My9iwqLZ5q2u7/Ek
         jrcg==
X-Gm-Message-State: AFqh2kp0IasQLzoO6ph0vw95DFLH7ngYDmNdVqPZCVD4HLn+lHHp0xoC
	WmneaLMDkr+pumK11MmV26dn7Z0up0kXprzkg30JLlVGkyzYKg==
X-Google-Smtp-Source: AMrXdXtHZdxfdSJ/L+wEpu3uZ176uCe0TC4q6cnf22w4xz+UVqGhF2cO4ylYkykcNzdauggaH0tvlc05LkJcL/7AD0w=
X-Received: by 2002:a67:ee4d:0:b0:3d3:d863:551d with SMTP id
 g13-20020a67ee4d000000b003d3d863551dmr955797vsp.60.1674053725935; Wed, 18 Jan
 2023 06:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20230118112759.3909741-1-pkj@axis.com> <CANPvuR=bjdvOdg9teOVuePmYAhHBdsL9u07=fmTRw2fgXZxU2w@mail.gmail.com>
 <a86b3682b19044999bb994a4e968ca9a@axis.com>
In-Reply-To: <a86b3682b19044999bb994a4e968ca9a@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 18 Jan 2023 14:55:14 +0000
Message-ID: <CANPvuRmT2Mv01C0TgASRz-f1Hh81Wtc20EHDzGwr0xuLpWMAmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ab640805f28b0157"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176104

--000000000000ab640805f28b0157
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quarta,
18/01/2023 =C3=A0(s) 14:44:

> gobject-instrospection is not enabled by default in DISTRO_FEATURES_NATIV=
E
> and DISTRO_FEATURES_NATIVESDK so unless you explicitly enable it yourself
> (which seems unlikely to me), it will not be enabled in the
> native/nativesdk cases.
>

Right, makes sense.
Thanks for explaining.

Jose


>
>
> //Peter
>
>
>
> *From:* Jose Quaresma <quaresma.jose@gmail.com>
> *Sent:* den 18 januari 2023 13:13
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings
> if GObject Introspection is enabled
>
>
>
> Hi Peter,
>
>
>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quarta,
> 18/01/2023 =C3=A0(s) 11:28:
>
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
>
>
> This will be enabled in the native builds too and before it is only
> defined for target.
>
>
>
> Jose
>
>
>
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
>
>
> --
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ab640805f28b0157
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mai=
lto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escrev=
eu no dia quarta, 18/01/2023 =C3=A0(s) 14:44:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div class=3D"msg-3990286225467241354">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-3990286225467241354WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">gobject-instrospection</span><span lang=3D"EN-US" styl=
e=3D"color:rgb(148,54,52)"> is not enabled by default in
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:rgb(148,54,=
52)">DISTRO_FEATURES_NATIVE</span><span lang=3D"EN-US" style=3D"color:rgb(1=
48,54,52)"> and
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:rgb(148,54,=
52)">DISTRO_FEATURES_NATIVESDK</span><span lang=3D"EN-US" style=3D"color:rg=
b(148,54,52)"> so unless you explicitly enable it yourself (which seems unl=
ikely
 to me), it will not be enabled in the native/nativesdk cases.</span></p></=
div></div></div></blockquote><div><br>Right, makes sense.</div><div>Thanks =
for explaining.</div><div><br></div><div>Jose<br>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div class=3D"msg-3990286225467241354">=
<div lang=3D"SV" style=3D"overflow-wrap: break-word;"><div class=3D"m_-3990=
286225467241354WordSection1"><p class=3D"MsoNormal"><span lang=3D"EN-US" st=
yle=3D"color:rgb(148,54,52)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 18 januari 2023 13:13<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] librsvg: Only enable the Vala binding=
s if GObject Introspection is enabled<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Peter,<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjell=
erstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt; esc=
reveu no dia quarta, 18/01/2023 =C3=A0(s) 11:28:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">This avoids the following error:<br>
<br>
=C2=A0 configure: error: Vala bindings require GObject Introspection<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb" targe=
t=3D"_blank">librsvg_2.54.5.bb</a> | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb=
" target=3D"_blank">librsvg_2.54.5.bb</a> b/meta/recipes-gnome/librsvg/<a h=
ref=3D"http://librsvg_2.54.5.bb" target=3D"_blank">librsvg_2.54.5.bb</a><br=
>
index b2e93a2684..c55aa250e9 100644<br>
--- a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb" targe=
t=3D"_blank">librsvg_2.54.5.bb</a><br>
+++ b/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.54.5.bb" targe=
t=3D"_blank">librsvg_2.54.5.bb</a><br>
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
+PACKAGECONFIG ??=3D &quot;gdkpixbuf <a href=3D"mailto:$%7b@bb.utils.contai=
ns(&#39;GI_DATA_ENABLED" target=3D"_blank">
${@bb.utils.contains(&#39;GI_DATA_ENABLED</a>&#39;, &#39;True&#39;, &#39;va=
la&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0# The gdk-pixbuf loader<br>
=C2=A0PACKAGECONFIG[gdkpixbuf] =3D &quot;--enable-pixbuf-loader,--disable-p=
ixbuf-loader,gdk-pixbuf-native&quot;<br>
+PACKAGECONFIG[vala] =3D &quot;--enable-vala,--disable-vala&quot;<u></u><u>=
</u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">This will be enabled in the native builds too and be=
fore it is only defined for target.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jose=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Loadable modules don&#39;t need .a or .la on =
Linux<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176086): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176086" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/176086</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96351645/5052=
612" target=3D"_blank">
https://lists.openembedded.org/mt/96351645/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>=
]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Best regards,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><br>
Jos=C3=A9 Quaresma<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>J=
os=C3=A9 Quaresma</div></div></div></div>

--000000000000ab640805f28b0157--

