Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB11C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 16:14:20 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.20049.1710864859203068226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 09:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaGCs+3x;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d24a727f78so67388361fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710864857; x=1711469657; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sLRe1mRoEEbHtn3b0TFyeL5zWAHv0EDBFowy2+vR710=;
        b=JaGCs+3xSgBK1UBfCAfFRsdmzB46eS/Ud5k3gyF5qX4sEWH4nD+4IbswPTDgTCy8Yp
         B4+cONhoMubh9wGXTNhB93biX8fgqxrK/jE6Y4JUHfrDdh+Ibfiak47ya27+/JN1XuHL
         zfVxCRyGu1bSiZL7T5GaD1EOrPd4fE22JVqzUEYUld3FXFheO2MCxJs/tA5+52XpROZK
         hqvc3l9kxqDeoqOtpMg423H2WI9BALX2Ust6nEAMCPBoNTtjFJZcsR7hfH0zRAV02wzP
         E8bip+25Sla9LEiFIk2h1zgGwrIj19K6Uk2mniI5wGboenln7BUmPpkTn1l/K80Vaey/
         FOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864857; x=1711469657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLRe1mRoEEbHtn3b0TFyeL5zWAHv0EDBFowy2+vR710=;
        b=QH6ZRuv2CY2RqVxozP/5PFbKcasgAgnxIjS+PMpCYQJXZPkapGnWLHY/wy63GBZirb
         r+BX/4eLxe9cy1hwOiIbpIDWViK9ntu7rRLDS1vM1CPpVzEhawW8TtlMUZtMmcAWxtB0
         9adxlti1UxPSGRaq0P93mTz4IyLbe3p3MWBLxpwmSnXoED3RRNbyNf9xXIJniicTCTG/
         diGrVbM2UpFeZ5d/MRO2odq1w6WHCfgclEKZVZ4u0SwAqrJTj0xjHX172ZilpuV77JL/
         HEvhGL5Q9TMCH11SRsX66hfeQaAPcIVPH8Gbzeli8i9gS2V1USXELSzGtzNXf0ykbf2n
         Rnew==
X-Gm-Message-State: AOJu0YzxPz/G5+Js0YgMb/ve7QtGA4Ngv4H8cGPEcarJVHKu3KIrahcX
	fccV6rGgD7cayOM+GV0tqq1+3KJRXthdeE3279irh+CgzpaHIwJdlCERNi54p9siU3ycnl8XeDA
	Tu8DL6UVAHPLjBdjj9d2rkQ+2YbU=
X-Google-Smtp-Source: AGHT+IFyq64N9d6gZf3+jnUfysVyuS9EScqtI9iHmy4TTQ4Scr/r89uWj8b+w0ib8XEhzEP+hgq9aiYM1HrMm2HjfXI=
X-Received: by 2002:a2e:9c07:0:b0:2d4:3dbc:16ec with SMTP id
 s7-20020a2e9c07000000b002d43dbc16ecmr11955067lji.20.1710864856897; Tue, 19
 Mar 2024 09:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240319161026.2900153-1-daniel.ottiger@schindler.com>
In-Reply-To: <20240319161026.2900153-1-daniel.ottiger@schindler.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Mar 2024 17:14:05 +0100
Message-ID: <CANNYZj-yPRWBUL8tOoUudWEV0w+067Eb6vJKBV1e1nZmVzaHWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: replace "pulseaudio-" with "${PN}-"
To: daniel.ottiger@schindler.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000de381061405c48f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197325

--0000000000000de381061405c48f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wait, what do vorbis tools need pulseaudio for? It=E2=80=99s an odd depende=
ncy, can
you check?

Alex

On Tue 19. Mar 2024 at 17.10, Daniel Ottiger via lists.openembedded.org
<daniel.ottiger=3Dschindler.com@lists.openembedded.org> wrote:

> avoid preferred provider warnings when compiling pulseaudio natively.
>
> Enabling native compilation was done in a separate bbappend file for
> pulseadio:
> ----
> BBCLASSEXTEND +=3D "native"
> ----
>
> pulseaudio is a dependency of vorbis-tools,
> from which we like to use the native version of oggenc
> in order to convert wav to ogg files as part of the yocto build.
>
> Signed-off-by: Daniel Ottiger <daniel.ottiger@schindler.com>
> ---
>  .../pulseaudio/pulseaudio.inc                 | 78 +++++++++----------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index ae16056d243..85515b3581f 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -145,9 +145,9 @@ do_install:append() {
>         install -m 0644 ${WORKDIR}/volatiles.04_pulse
> ${D}${sysconfdir}/default/volatiles/04_pulse
>  }
>
> -USERADD_PACKAGES =3D "pulseaudio-server"
> -GROUPADD_PARAM:pulseaudio-server =3D "--system pulse"
> -USERADD_PARAM:pulseaudio-server =3D "--system --home /var/run/pulse \
> +USERADD_PACKAGES =3D "${PN}-server"
> +GROUPADD_PARAM:${PN}-server =3D "--system pulse"
> +USERADD_PARAM:${PN}-server =3D "--system --home /var/run/pulse \
>                                --no-create-home --shell /bin/false \
>                                --groups audio,pulse --gid pulse pulse"
>
> @@ -166,12 +166,12 @@ PACKAGES =3D+ "\
>  # RDEPENDS we define for it in this recipe, and thereby ensure that when
>  # adding the console-kit module to an image, we also get the necessary
>  # consolekit package produced.
> -PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus',
> 'pulseaudio-module-console-kit', '', d)}"
> +PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus',
> '${PN}-module-console-kit', '', d)}"
>
>  #upgrade path:
> -RREPLACES:pulseaudio-server =3D "libpulse-bin libpulse-conf"
> +RREPLACES:${PN}-server =3D "libpulse-bin libpulse-conf"
>
> -PACKAGES_DYNAMIC +=3D "^pulseaudio-lib-.* ^pulseaudio-module-.*"
> +PACKAGES_DYNAMIC +=3D "^${PN}-lib-.* ^${PN}-module-.*"
>
>  FILES:libpulsecore =3D "${libdir}/pulseaudio/libpulsecore*.so"
>  FILES:libpulsecommon =3D "${libdir}/pulseaudio/libpulsecommon*.so"
> @@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D "1"
>
>  CONFFILES:libpulse =3D "${sysconfdir}/pulse/client.conf"
>
> -CONFFILES:pulseaudio-server =3D "\
> +CONFFILES:${PN}-server =3D "\
>    ${sysconfdir}/pulse/default.pa \
>    ${sysconfdir}/pulse/daemon.conf \
>    ${sysconfdir}/pulse/system.pa \
> @@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D "\
>                            ${PN}-server \
>                            "
>
> -RDEPENDS:pulseaudio-server =3D " \
> -    pulseaudio-module-filter-apply \
> -    pulseaudio-module-filter-heuristics \
> -    pulseaudio-module-udev-detect \
> -    pulseaudio-module-null-sink \
> -    pulseaudio-module-device-restore \
> -    pulseaudio-module-stream-restore \
> -    pulseaudio-module-card-restore \
> -    pulseaudio-module-augment-properties \
> -    pulseaudio-module-detect \
> -    pulseaudio-module-alsa-sink \
> -    pulseaudio-module-alsa-source \
> -    pulseaudio-module-alsa-card \
> -    pulseaudio-module-native-protocol-unix \
> -    pulseaudio-module-default-device-restore \
> -    pulseaudio-module-intended-roles \
> -    pulseaudio-module-rescue-streams \
> -    pulseaudio-module-always-sink \
> -    pulseaudio-module-suspend-on-idle \
> -    pulseaudio-module-position-event-sounds \
> -    pulseaudio-module-role-cork \
> -    pulseaudio-module-switch-on-port-available"
> +RDEPENDS:${PN}-server =3D " \
> +    ${PN}-module-filter-apply \
> +    ${PN}-module-filter-heuristics \
> +    ${PN}-module-udev-detect \
> +    ${PN}-module-null-sink \
> +    ${PN}-module-device-restore \
> +    ${PN}-module-stream-restore \
> +    ${PN}-module-card-restore \
> +    ${PN}-module-augment-properties \
> +    ${PN}-module-detect \
> +    ${PN}-module-alsa-sink \
> +    ${PN}-module-alsa-source \
> +    ${PN}-module-alsa-card \
> +    ${PN}-module-native-protocol-unix \
> +    ${PN}-module-default-device-restore \
> +    ${PN}-module-intended-roles \
> +    ${PN}-module-rescue-streams \
> +    ${PN}-module-always-sink \
> +    ${PN}-module-suspend-on-idle \
> +    ${PN}-module-position-event-sounds \
> +    ${PN}-module-role-cork \
> +    ${PN}-module-switch-on-port-available"
>
>  # If the server is installed, it's usually desirable to make ALSA
> applications
>  # use PulseAudio. alsa-plugins-pulseaudio-conf will install the
> configuration
>  # that makes the PulseAudio plugin the default ALSA device.
> -RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
> +RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
>
>  # pulseaudio-module-console-kit is built whenever dbus is enabled by
> PACKAGECONFIG
>  # but consolekit depends on libx11 and is available only for DISTRO with
> x11 in DISTRO_FEATURES
> -RDEPENDS:pulseaudio-module-console-kit =3D+
> "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit x11', 'consolekit', ''=
,
> d)}"
> -RDEPENDS:pulseaudio-misc +=3D "pulseaudio-module-cli-protocol-unix"
> +RDEPENDS:${PN}-module-console-kit =3D+
> "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit x11', 'consolekit', ''=
,
> d)}"
> +RDEPENDS:${PN}-misc +=3D "${PN}-module-cli-protocol-unix"
>
>  FILES:${PN}-module-alsa-card +=3D "${datadir}/pulseaudio/alsa-mixer"
>
> @@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D
> "${libexecdir}/pulse/gsettings-helper ${datadir}
>  # running for the duration of the user login session). The device-manage=
r
> and
>  # x11-* modules are referenced from the start-pulseaudio-x11 script, so
> those
>  # modules must be installed when X11 is enabled.
> -RDEPENDS:pulseaudio-server +=3D "\
> +RDEPENDS:${PN}-server +=3D "\
>          ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
> -                pulseaudio-module-device-manager \
> -                pulseaudio-module-x11-cork-request \
> -                pulseaudio-module-x11-publish \
> -                pulseaudio-module-x11-xsmp \
> +                ${PN}-module-device-manager \
> +                ${PN}-module-x11-cork-request \
> +                ${PN}-module-x11-publish \
> +                ${PN}-module-x11-xsmp \
>          ', '', d)}"
>
> -RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', \
> -                                  bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'pulseaudio-module-systemd-login',
> 'pulseaudio-module-console-kit', d), \
> +RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', \
> +                                  bb.utils.contains('DISTRO_FEATURES',
> 'systemd', '${PN}-module-systemd-login', '${PN}-module-console-kit', d), =
\
>                                    '', d)}"
> --
> 2.39.2
>
>
> *****************************************************************
> The information contained in this message is intended only for use of the
> individual(s) named above and may contain confidential, proprietary or
> legally privileged information. No confidentiality or privilege is waived
> or lost by any mistransmission. If you are not the intended recipient of
> this message you are hereby notified that you must not use, disseminate,
> copy it in any form or take any action in reliance of it. If you have
> received this message in error please delete it and any copies of it and
> notify the sender immediately.
> *****************************************************************
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197324):
> https://lists.openembedded.org/g/openembedded-core/message/197324
> Mute This Topic: https://lists.openembedded.org/mt/105026949/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000de381061405c48f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wait, what do vorbis tools need pulseaudio for? It=E2=80=
=99s an odd dependency, can you check?</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue 19. Mar 2024 at 17.10, Daniel Ottiger via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;dani=
el.ottiger=3D<a href=3D"mailto:schindler.com@lists.openembedded.org">schind=
ler.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">avo=
id preferred provider warnings when compiling pulseaudio natively.<br>
<br>
Enabling native compilation was done in a separate bbappend file for pulsea=
dio:<br>
----<br>
BBCLASSEXTEND +=3D &quot;native&quot;<br>
----<br>
<br>
pulseaudio is a dependency of vorbis-tools,<br>
from which we like to use the native version of oggenc<br>
in order to convert wav to ogg files as part of the yocto build.<br>
<br>
Signed-off-by: Daniel Ottiger &lt;<a href=3D"mailto:daniel.ottiger@schindle=
r.com" target=3D"_blank">daniel.ottiger@schindler.com</a>&gt;<br>
---<br>
=C2=A0.../pulseaudio/pulseaudio.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 78 +++++++++----------<br>
=C2=A01 file changed, 39 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc<br>
index ae16056d243..85515b3581f 100644<br>
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
@@ -145,9 +145,9 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/volatiles.04_pulse=
=C2=A0 ${D}${sysconfdir}/default/volatiles/04_pulse<br>
=C2=A0}<br>
<br>
-USERADD_PACKAGES =3D &quot;pulseaudio-server&quot;<br>
-GROUPADD_PARAM:pulseaudio-server =3D &quot;--system pulse&quot;<br>
-USERADD_PARAM:pulseaudio-server =3D &quot;--system --home /var/run/pulse \=
<br>
+USERADD_PACKAGES =3D &quot;${PN}-server&quot;<br>
+GROUPADD_PARAM:${PN}-server =3D &quot;--system pulse&quot;<br>
+USERADD_PARAM:${PN}-server =3D &quot;--system --home /var/run/pulse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--no-create-home --shell /bin/false \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--groups audio,pulse --gid pulse puls=
e&quot;<br>
<br>
@@ -166,12 +166,12 @@ PACKAGES =3D+ &quot;\<br>
=C2=A0# RDEPENDS we define for it in this recipe, and thereby ensure that w=
hen<br>
=C2=A0# adding the console-kit module to an image, we also get the necessar=
y<br>
=C2=A0# consolekit package produced.<br>
-PACKAGES =3D+ &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;dbu=
s&#39;, &#39;pulseaudio-module-console-kit&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGES =3D+ &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;dbu=
s&#39;, &#39;${PN}-module-console-kit&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0#upgrade path:<br>
-RREPLACES:pulseaudio-server =3D &quot;libpulse-bin libpulse-conf&quot;<br>
+RREPLACES:${PN}-server =3D &quot;libpulse-bin libpulse-conf&quot;<br>
<br>
-PACKAGES_DYNAMIC +=3D &quot;^pulseaudio-lib-.* ^pulseaudio-module-.*&quot;=
<br>
+PACKAGES_DYNAMIC +=3D &quot;^${PN}-lib-.* ^${PN}-module-.*&quot;<br>
<br>
=C2=A0FILES:libpulsecore =3D &quot;${libdir}/pulseaudio/libpulsecore*.so&qu=
ot;<br>
=C2=A0FILES:libpulsecommon =3D &quot;${libdir}/pulseaudio/libpulsecommon*.s=
o&quot;<br>
@@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
<br>
=C2=A0CONFFILES:libpulse =3D &quot;${sysconfdir}/pulse/client.conf&quot;<br=
>
<br>
-CONFFILES:pulseaudio-server =3D &quot;\<br>
+CONFFILES:${PN}-server =3D &quot;\<br>
=C2=A0 =C2=A0${sysconfdir}/pulse/<a href=3D"http://default.pa" rel=3D"noref=
errer" target=3D"_blank">default.pa</a> \<br>
=C2=A0 =C2=A0${sysconfdir}/pulse/daemon.conf \<br>
=C2=A0 =C2=A0${sysconfdir}/pulse/<a href=3D"http://system.pa" rel=3D"norefe=
rrer" target=3D"_blank">system.pa</a> \<br>
@@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${PN}-server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-RDEPENDS:pulseaudio-server =3D &quot; \<br>
-=C2=A0 =C2=A0 pulseaudio-module-filter-apply \<br>
-=C2=A0 =C2=A0 pulseaudio-module-filter-heuristics \<br>
-=C2=A0 =C2=A0 pulseaudio-module-udev-detect \<br>
-=C2=A0 =C2=A0 pulseaudio-module-null-sink \<br>
-=C2=A0 =C2=A0 pulseaudio-module-device-restore \<br>
-=C2=A0 =C2=A0 pulseaudio-module-stream-restore \<br>
-=C2=A0 =C2=A0 pulseaudio-module-card-restore \<br>
-=C2=A0 =C2=A0 pulseaudio-module-augment-properties \<br>
-=C2=A0 =C2=A0 pulseaudio-module-detect \<br>
-=C2=A0 =C2=A0 pulseaudio-module-alsa-sink \<br>
-=C2=A0 =C2=A0 pulseaudio-module-alsa-source \<br>
-=C2=A0 =C2=A0 pulseaudio-module-alsa-card \<br>
-=C2=A0 =C2=A0 pulseaudio-module-native-protocol-unix \<br>
-=C2=A0 =C2=A0 pulseaudio-module-default-device-restore \<br>
-=C2=A0 =C2=A0 pulseaudio-module-intended-roles \<br>
-=C2=A0 =C2=A0 pulseaudio-module-rescue-streams \<br>
-=C2=A0 =C2=A0 pulseaudio-module-always-sink \<br>
-=C2=A0 =C2=A0 pulseaudio-module-suspend-on-idle \<br>
-=C2=A0 =C2=A0 pulseaudio-module-position-event-sounds \<br>
-=C2=A0 =C2=A0 pulseaudio-module-role-cork \<br>
-=C2=A0 =C2=A0 pulseaudio-module-switch-on-port-available&quot;<br>
+RDEPENDS:${PN}-server =3D &quot; \<br>
+=C2=A0 =C2=A0 ${PN}-module-filter-apply \<br>
+=C2=A0 =C2=A0 ${PN}-module-filter-heuristics \<br>
+=C2=A0 =C2=A0 ${PN}-module-udev-detect \<br>
+=C2=A0 =C2=A0 ${PN}-module-null-sink \<br>
+=C2=A0 =C2=A0 ${PN}-module-device-restore \<br>
+=C2=A0 =C2=A0 ${PN}-module-stream-restore \<br>
+=C2=A0 =C2=A0 ${PN}-module-card-restore \<br>
+=C2=A0 =C2=A0 ${PN}-module-augment-properties \<br>
+=C2=A0 =C2=A0 ${PN}-module-detect \<br>
+=C2=A0 =C2=A0 ${PN}-module-alsa-sink \<br>
+=C2=A0 =C2=A0 ${PN}-module-alsa-source \<br>
+=C2=A0 =C2=A0 ${PN}-module-alsa-card \<br>
+=C2=A0 =C2=A0 ${PN}-module-native-protocol-unix \<br>
+=C2=A0 =C2=A0 ${PN}-module-default-device-restore \<br>
+=C2=A0 =C2=A0 ${PN}-module-intended-roles \<br>
+=C2=A0 =C2=A0 ${PN}-module-rescue-streams \<br>
+=C2=A0 =C2=A0 ${PN}-module-always-sink \<br>
+=C2=A0 =C2=A0 ${PN}-module-suspend-on-idle \<br>
+=C2=A0 =C2=A0 ${PN}-module-position-event-sounds \<br>
+=C2=A0 =C2=A0 ${PN}-module-role-cork \<br>
+=C2=A0 =C2=A0 ${PN}-module-switch-on-port-available&quot;<br>
<br>
=C2=A0# If the server is installed, it&#39;s usually desirable to make ALSA=
 applications<br>
=C2=A0# use PulseAudio. alsa-plugins-pulseaudio-conf will install the confi=
guration<br>
=C2=A0# that makes the PulseAudio plugin the default ALSA device.<br>
-RDEPENDS:pulseaudio-server +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;pulseaudio&#39;, &#39;alsa-plugins-pulseaudio-conf&#39;, &=
#39;&#39;, d)}&quot;<br>
+RDEPENDS:${PN}-server +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;pulseaudio&#39;, &#39;alsa-plugins-pulseaudio-conf&#39;, &#39;&=
#39;, d)}&quot;<br>
<br>
=C2=A0# pulseaudio-module-console-kit is built whenever dbus is enabled by =
PACKAGECONFIG<br>
=C2=A0# but consolekit depends on libx11 and is available only for DISTRO w=
ith x11 in DISTRO_FEATURES<br>
-RDEPENDS:pulseaudio-module-console-kit =3D+ &quot;${@bb.utils.contains(&#3=
9;DISTRO_FEATURES&#39;, &#39;sysvinit x11&#39;, &#39;consolekit&#39;, &#39;=
&#39;, d)}&quot;<br>
-RDEPENDS:pulseaudio-misc +=3D &quot;pulseaudio-module-cli-protocol-unix&qu=
ot;<br>
+RDEPENDS:${PN}-module-console-kit =3D+ &quot;${@bb.utils.contains(&#39;DIS=
TRO_FEATURES&#39;, &#39;sysvinit x11&#39;, &#39;consolekit&#39;, &#39;&#39;=
, d)}&quot;<br>
+RDEPENDS:${PN}-misc +=3D &quot;${PN}-module-cli-protocol-unix&quot;<br>
<br>
=C2=A0FILES:${PN}-module-alsa-card +=3D &quot;${datadir}/pulseaudio/alsa-mi=
xer&quot;<br>
<br>
@@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D &quot;${libexecdir}=
/pulse/gsettings-helper ${datadir}<br>
=C2=A0# running for the duration of the user login session). The device-man=
ager and<br>
=C2=A0# x11-* modules are referenced from the start-pulseaudio-x11 script, =
so those<br>
=C2=A0# modules must be installed when X11 is enabled.<br>
-RDEPENDS:pulseaudio-server +=3D &quot;\<br>
+RDEPENDS:${PN}-server +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;x11&#39;, &#39;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pulseaudio-module-=
device-manager \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pulseaudio-module-=
x11-cork-request \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pulseaudio-module-=
x11-publish \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pulseaudio-module-=
x11-xsmp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-devic=
e-manager \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-x11-c=
ork-request \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-x11-p=
ublish \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-module-x11-x=
smp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;, &#39;&#39;, d)}&quot;<br>
<br>
-RDEPENDS:pulseaudio-server +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;x11&#39;, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;systemd&#39;, &#39;pulseaudio-module-systemd-login&#39=
;, &#39;pulseaudio-module-console-kit&#39;, d), \<br>
+RDEPENDS:${PN}-server +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;x11&#39;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;systemd&#39;, &#39;${PN}-module-systemd-login&#39;, &#=
39;${PN}-module-console-kit&#39;, d), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;, d)}&quot;<b=
r>
--<br>
2.39.2<br>
<br>
<br>
*****************************************************************<br>
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you are not the intended recipient of this mes=
sage you are hereby notified that you must not use, disseminate, copy it in=
 any form or take any action in reliance of it. If you have received this m=
essage in error please delete it and any copies of it and notify the sender=
 immediately.<br>
*****************************************************************<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197324" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105026949/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105026949/1686489</a><br>
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

--0000000000000de381061405c48f--

