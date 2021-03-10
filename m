Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.6021.1615365343253302432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 00:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PqOjRwvL;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id d3so5509159uap.4
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 00:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+GKZqmtIj9mmRZVsjSaWETfJtfC6EO1I4/H8i++2gGM=;
        b=PqOjRwvLjoUI0ev3SVteqzHZ4R1MYdEx1AbCKBwq4NRzZNOgnpWqhOAAbp0e9rARg3
         7TCXlUPAuKZ9wSzi0NM+MJ0dZ4/XP1ATbnt+aey62oZkuz3CStBi14aQwikds+82ImYR
         rq9y9Yx2e1ryy1PW9YW0KuXL03IgHeRsxSMqCyopp+d/w4w6HfrrbSVJZ8hEnbKwdyeQ
         YQ0FH8reP2K1rfP8+5WI5QuN9WvxVYEB6Az5kD4J5LKMjjGxx7p2zVZhR+/9jIK9MD8F
         97QnS7jDTD4X08Tp8dV0eWXkz7npMiTE60bP9pCV7MvOi2HVOXaglfThh7Ug5F1a/o5y
         l1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GKZqmtIj9mmRZVsjSaWETfJtfC6EO1I4/H8i++2gGM=;
        b=onFzY8gzMu7i5IfG8LrZVf0EnXCbmzsHYxuO3pdWgfl/zQ5y3SiyMlxN+VEKkDN6+e
         rILhtm1YVJOiZygfk1u61XbWFiFIOiw1bMvl9c+Ze4v6/rJoqg6W/mmZMzXPZGov6kIN
         z+O0DPtVftohmleQc/QwyuTOGjFdkKGoJKJRYqDPmA+K4krKNkQOCgBw+oXC1FXyaQ/C
         /GppISW4CR1tlXtbpa1Ckp2fRjyAIS0Zy+GRr1NSyb3Ouw2UEvISufF0ohu6Y2V+6uxH
         wMX4cu+btiunLW/eiNWdq3gIv/WyllYLtSL8X4vwFJEqw4m9azfX4Udb4HvXK/qHravD
         T/sQ==
X-Gm-Message-State: AOAM530J10uCWBlzJcxH/XYviwwp/GwLFPpYxxpzAcAZ3OWcCGNBvfz+
	ct/m/pueS21XgtsaXKwSlNlO9NjJhisW5jfLJdA=
X-Google-Smtp-Source: ABdhPJz3T8hEql/9oyQhbDbun990NanK8w3leDMOKCHNCKAaONRl6O0DOdOm5xoZkg0tZRHxtuHqnGuboOPhIeNf2JU=
X-Received: by 2002:a9f:2c0f:: with SMTP id r15mr1017281uaj.93.1615365342221;
 Wed, 10 Mar 2021 00:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20210310070810.20295-1-crg7475@mailbox.org>
In-Reply-To: <20210310070810.20295-1-crg7475@mailbox.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 10 Mar 2021 09:35:31 +0100
Message-ID: <CANNYZj__UMPf97d-5q0oHSdfOm_-OEdqfTdqFW3-9t50tuzrmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pipewire: add recipe from meta-openembedded and upgrade to 0.3.23
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000067d8a405bd2a8ddb"

--00000000000067d8a405bd2a8ddb
Content-Type: text/plain; charset="UTF-8"

But why should it be in oe-core?

Alex

On Wed, 10 Mar 2021 at 08:09, Carlos Rafael Giani via lists.openembedded.org
<crg7475=mailbox.org@lists.openembedded.org> wrote:

> PipeWire is a new multimedia daemon that aims to be a replacement for
> both JACK and PulseAudio. Additionally, it provides IO and routing
> functionality for video. It also has PulseAudio shim to act as a drop-in
> replacement.
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  .../pipewire/pipewire_0.3.23.bb               | 272 ++++++++++++++++++
>  1 file changed, 272 insertions(+)
>  create mode 100644 meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
>
> diff --git a/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
> b/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
> new file mode 100644
> index 0000000000..1c226b3faf
> --- /dev/null
> +++ b/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
> @@ -0,0 +1,272 @@
> +SUMMARY = "Multimedia processing server for Linux"
> +DESCRIPTION = "Linux server for handling and routing audio and video
> streams between applications and multimedia I/O devices"
> +HOMEPAGE = "https://pipewire.org/"
> +BUGTRACKER  = "https://gitlab.freedesktop.org/pipewire/pipewire/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69 \
> +    file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
> +"
> +SECTION = "multimedia"
> +
> +DEPENDS = "dbus"
> +
> +SRCREV = "68f6c75caed047af32320ab4de0c06457457be54"
> +SRC_URI = "git://
> gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd manpages gettext useradd
> +
> +USERADD_PACKAGES = "${PN}"
> +
> +GROUPADD_PARAM_${PN} = "--system pipewire"
> +
> +USERADD_PARAM_${PN} = "--system --home / --no-create-home \
> +                       --comment 'PipeWire multimedia daemon' \
> +                       --gid pipewire --groups audio,video \
> +                       pipewire"
> +
> +# For "EVL", look up https://evlproject.org/ . It involves
> +# a specially prepared kernel, and is currently unavailable
> +# in Yocto.
> +# FFmpeg and Vulkan aren't really supported - at the current
> +# stage (version 0.3.23), these are just experiments, not
> +# actual features.
> +# libcamera support currently does not build successfully.
> +# systemd user service files are disabled because per-user
> +# PipeWire instances aren't really something that makes
> +# much sense in an embedded environment. A system-wide
> +# instance does.
> +EXTRA_OEMESON += " \
> +    -Daudiotestsrc=true \
> +    -Devl=false \
> +    -Dsystemd-user-service=false \
> +    -Dtests=false \
> +    -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
> +    -Dvideotestsrc=true \
> +    -Dffmpeg=false \
> +    -Dvulkan=false \
> +    -Dlibcamera=false \
> +"
> +
> +PACKAGECONFIG ??= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}
> \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
> +    gstreamer jack v4l2 \
> +"
> +
> +# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> +# since "jack" imports libjack, and "pipewire-jack" generates
> +# libjack.so* files, thus colliding with the libpack package. This
> +# is why these two are marked in their respective packageconfigs
> +# as being in conflict.
> +
> +PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib udev"
> +PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
> +PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,doxygen"
> +PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0
> gstreamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack,,,pipewire-jack"
> +PACKAGECONFIG[manpages] =
> "-Dman=true,-Dman=false,libxml-parser-perl-native"
> +PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
> +PACKAGECONFIG[sndfile] =
> "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
> +PACKAGECONFIG[systemd] = "-Dsystemd=true -Dsystemd-system-service=true
> ,-Dsystemd=false -Dsystemd-system-service=false,systemd"
> +PACKAGECONFIG[v4l2] = "-Dv4l2=true,-Dv4l2=false,udev"
> +PACKAGECONFIG[pipewire-alsa] =
> "-Dpipewire-alsa=true,-Dpipewire-alsa=false,alsa-lib"
> +PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=true
> -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=false,jack,,,jack"
> +
> +PACKAGESPLITFUNCS_prepend = " split_dynamic_packages "
> +PACKAGESPLITFUNCS_append = " set_dynamic_metapkg_rdepends "
> +
> +SPA_SUBDIR = "spa-0.2"
> +PW_MODULE_SUBDIR = "pipewire-0.3"
> +
> +remove_unused_installed_files() {
> +    # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
> +    # Remove it if pipewire-jack is not built to avoid creating the
> +    # pipewire-jack package.
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false',
> 'true', d)}; then
> +        rm -f "${D}${sysconfdir}/pipewire/jack.conf"
> +    fi
> +}
> +
> +do_install[postfuncs] += "remove_unused_installed_files"
> +
> +python split_dynamic_packages () {
> +    # Create packages for each SPA plugin. These plugins are located
> +    # in individual subdirectories, so a recursive search is needed.
> +    spa_libdir = d.expand('${libdir}/${SPA_SUBDIR}')
> +    do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$',
> d.expand('${PN}-spa-plugins-%s'), 'PipeWire SPA plugin for %s',
> extra_depends='', recursive=True)
> +
> +    # Create packages for each PipeWire module.
> +    pw_module_libdir = d.expand('${libdir}/${PW_MODULE_SUBDIR}')
> +    do_split_packages(d, pw_module_libdir,
> r'^libpipewire-module-(.*)\.so$', d.expand('${PN}-modules-%s'), 'PipeWire
> %s module', extra_depends='', recursive=False)
> +}
> +
> +python set_dynamic_metapkg_rdepends () {
> +    import os
> +    import oe.utils
> +
> +    # Go through all generated SPA plugin and PipeWire module packages
> +    # (excluding the main package and the -meta package itself) and
> +    # add them to the -meta package as RDEPENDS.
> +
> +    base_pn = d.getVar('PN')
> +
> +    spa_pn = base_pn + '-spa-plugins'
> +    spa_metapkg =  spa_pn + '-meta'
> +
> +    pw_module_pn = base_pn + '-modules'
> +    pw_module_metapkg =  pw_module_pn + '-meta'
> +
> +    d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")
> +    d.setVar('FILES_' + spa_metapkg, "")
> +
> +    d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")
> +    d.setVar('FILES_' + pw_module_metapkg, "")
> +
> +    blacklist = [ spa_pn, spa_metapkg, pw_module_pn, pw_module_metapkg ]
> +    spa_metapkg_rdepends = []
> +    pw_module_metapkg_rdepends = []
> +    pkgdest = d.getVar('PKGDEST')
> +
> +    for pkg in oe.utils.packages_filter_out_system(d):
> +        if pkg in blacklist:
> +            continue
> +
> +        is_spa_pkg = pkg.startswith(spa_pn)
> +        is_pw_module_pkg = pkg.startswith(pw_module_pn)
> +        if not is_spa_pkg and not is_pw_module_pkg:
> +            continue
> +
> +        if pkg in spa_metapkg_rdepends or pkg in
> pw_module_metapkg_rdepends:
> +            continue
> +
> +        # See if the package is empty by looking at the contents of its
> +        # PKGDEST subdirectory. If this subdirectory is empty, then then
> +        # package is empty as well. Empty packages do not get added to
> +        # the meta package's RDEPENDS.
> +        pkgdir = os.path.join(pkgdest, pkg)
> +        if os.path.exists(pkgdir):
> +            dir_contents = os.listdir(pkgdir) or []
> +        else:
> +            dir_contents = []
> +        is_empty = len(dir_contents) == 0
> +        if not is_empty:
> +            if is_spa_pkg:
> +                spa_metapkg_rdepends.append(pkg)
> +            if is_pw_module_pkg:
> +                pw_module_metapkg_rdepends.append(pkg)
> +
> +    d.setVar('RDEPENDS_' + spa_metapkg, ' '.join(spa_metapkg_rdepends))
> +    d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + ' meta package')
> +
> +    d.setVar('RDEPENDS_' + pw_module_metapkg, '
> '.join(pw_module_metapkg_rdepends))
> +    d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_module_pn + ' meta
> package')
> +}
> +
> +PACKAGES =+ "\
> +    libpipewire \
> +    ${PN}-tools \
> +    ${PN}-pulse \
> +    ${PN}-alsa \
> +    ${PN}-jack \
> +    ${PN}-media-session \
> +    ${PN}-spa-plugins \
> +    ${PN}-spa-plugins-meta \
> +    ${PN}-spa-tools \
> +    ${PN}-modules \
> +    ${PN}-modules-meta \
> +    ${PN}-alsa-card-profile \
> +    gstreamer1.0-pipewire \
> +"
> +
> +PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
> +
> +SYSTEMD_SERVICE_${PN} = "pipewire.service"
> +CONFFILES_${PN} += "${sysconfdir}/pipewire/pipewire.conf"
> +FILES_${PN} = " \
> +    ${sysconfdir}/pipewire/pipewire.conf \
> +    ${systemd_system_unitdir}/pipewire.* \
> +    ${bindir}/pipewire \
> +"
> +
> +FILES_${PN}-dev += " \
> +    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
> +"
> +
> +CONFFILES_libpipewire += "${sysconfdir}/pipewire/client.conf"
> +FILES_libpipewire = " \
> +    ${sysconfdir}/pipewire/client.conf \
> +    ${libdir}/libpipewire-*.so.* \
> +"
> +# Add the bare minimum modules and plugins required to be able
> +# to use libpipewire. Without these, it is essentially unusable.
> +RDEPENDS_libpipewire += " \
> +    ${PN}-modules-client-node \
> +    ${PN}-modules-protocol-native \
> +    ${PN}-spa-plugins-support \
> +"
> +
> +FILES_${PN}-tools = " \
> +    ${bindir}/pw-* \
> +"
> +
> +# This is a shim daemon that is intended to be used as a
> +# drop-in PulseAudio replacement, providing a pulseaudio-compatible
> +# socket that can be used by applications that use libpulse.
> +CONFFILES_${PN}-pulse += "${sysconfdir}/pipewire/pipewire-pulse.conf"
> +FILES_${PN}-pulse = " \
> +    ${sysconfdir}/pipewire/pipewire-pulse.conf \
> +    ${bindir}/pipewire-pulse \
> +"
> +RDEPENDS_${PN}-pulse += " \
> +    ${PN}-modules-protocol-pulse \
> +"
> +
> +# alsa plugin to redirect audio to pipewire
> +FILES_${PN}-alsa = "\
> +    ${libdir}/alsa-lib/* \
> +    ${datadir}/alsa/alsa.conf.d/* \
> +"
> +
> +# jack drop-in libraries to redirect audio to pipewire
> +CONFFILES_${PN}-jack = "${sysconfdir}/pipewire/jack.conf"
> +FILES_${PN}-jack = "\
> +    ${sysconfdir}/pipewire/jack.conf \
> +    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
> +"
> +
> +# Example session manager. Not intended for use in production.
> +CONFFILES_${PN}-media-session = "${sysconfdir}/pipewire/media-session.d/*"
> +FILES_${PN}-media-session = " \
> +    ${bindir}/pipewire-media-session \
> +    ${sysconfdir}/pipewire/media-session.d/* \
> +"
> +RPROVIDES_${PN}-media-session = "virtual/pipewire-sessionmanager"
> +
> +# Dynamic packages (see set_dynamic_metapkg_rdepends).
> +FILES_${PN}-spa-plugins = ""
> +RRECOMMENDS_${PN}-spa-plugins += "${PN}-spa-plugins-meta"
> +
> +FILES_${PN}-spa-tools = " \
> +    ${bindir}/spa-* \
> +"
> +
> +# Dynamic packages (see set_dynamic_metapkg_rdepends).
> +FILES_${PN}-modules = ""
> +RRECOMMENDS_${PN}-modules += "${PN}-modules-meta"
> +
> +CONFFILES_${PN}-modules-rtkit = "${sysconfdir}/pipewire/client-rt.conf"
> +FILES_${PN}-modules-rtkit += " \
> +    ${sysconfdir}/pipewire/client-rt.conf \
> +    "
> +
> +FILES_${PN}-alsa-card-profile = " \
> +    ${datadir}/alsa-card-profile/* \
> +    ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
> +"
> +
> +FILES_gstreamer1.0-pipewire = " \
> +    ${libdir}/gstreamer-1.0/* \
> +"
> --
> 2.25.1
>
>
> 
>
>

--00000000000067d8a405bd2a8ddb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But why should it be in oe-core?</div><div><br></div>=
<div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, 10 Mar 2021 at 08:09, Carlos Rafael Giani via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;crg7=
475=3D<a href=3D"mailto:mailbox.org@lists.openembedded.org">mailbox.org@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">PipeWire is a new multimedia daemon that aims to be a re=
placement for<br>
both JACK and PulseAudio. Additionally, it provides IO and routing<br>
functionality for video. It also has PulseAudio shim to act as a drop-in<b=
r>
replacement.<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.o=
rg" target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
---<br>
=C2=A0.../pipewire/<a href=3D"http://pipewire_0.3.23.bb" rel=3D"noreferrer=
" target=3D"_blank">pipewire_0.3.23.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 272 ++++++++++++++++++<br>
=C2=A01 file changed, 272 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/pipewire/<a href=3D"http:=
//pipewire_0.3.23.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_0.3.23.=
bb</a><br>
<br>
diff --git a/meta/recipes-multimedia/pipewire/<a href=3D"http://pipewire_0=
.3.23.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_0.3.23.bb</a> b/met=
a/recipes-multimedia/pipewire/<a href=3D"http://pipewire_0.3.23.bb" rel=3D"=
noreferrer" target=3D"_blank">pipewire_0.3.23.bb</a><br>
new file mode 100644<br>
index 0000000000..1c226b3faf<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/pipewire/<a href=3D"http://pipewire_0.3.23.b=
b" rel=3D"noreferrer" target=3D"_blank">pipewire_0.3.23.bb</a><br>
@@ -0,0 +1,272 @@<br>
+SUMMARY =3D &quot;Multimedia processing server for Linux&quot;<br>
+DESCRIPTION =3D &quot;Linux server for handling and routing audio and vid=
eo streams between applications and multimedia I/O devices&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pipewire.org/" rel=3D"noreferrer" t=
arget=3D"_blank">https://pipewire.org/</a>&quot;<br>
+BUGTRACKER=C2=A0 =3D &quot;<a href=3D"https://gitlab.freedesktop.org/pipe=
wire/pipewire/issues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.f=
reedesktop.org/pipewire/pipewire/issues</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot; \<br>
+=C2=A0 =C2=A0 file://LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69 \<br>
+=C2=A0 =C2=A0 file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \<br>
+&quot;<br>
+SECTION =3D &quot;multimedia&quot;<br>
+<br>
+DEPENDS =3D &quot;dbus&quot;<br>
+<br>
+SRCREV =3D &quot;68f6c75caed047af32320ab4de0c06457457be54&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/pipewire=
/pipewire.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;p=
rotocol=3Dhttps</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit meson pkgconfig systemd manpages gettext useradd<br>
+<br>
+USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
+<br>
+GROUPADD_PARAM_${PN} =3D &quot;--system pipewire&quot;<br>
+<br>
+USERADD_PARAM_${PN} =3D &quot;--system --home / --no-create-home \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0--comment &#39;PipeWire multimedia daemon&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0--gid pipewire --groups audio,video \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0pipewire&quot;<br>
+<br>
+# For &quot;EVL&quot;, look up <a href=3D"https://evlproject.org/" rel=3D=
"noreferrer" target=3D"_blank">https://evlproject.org/</a> . It involves<br=
>
+# a specially prepared kernel, and is currently unavailable<br>
+# in Yocto.<br>
+# FFmpeg and Vulkan aren&#39;t really supported - at the current<br>
+# stage (version 0.3.23), these are just experiments, not<br>
+# actual features.<br>
+# libcamera support currently does not build successfully.<br>
+# systemd user service files are disabled because per-user<br>
+# PipeWire instances aren&#39;t really something that makes<br>
+# much sense in an embedded environment. A system-wide<br>
+# instance does.<br>
+EXTRA_OEMESON +=3D &quot; \<br>
+=C2=A0 =C2=A0 -Daudiotestsrc=3Dtrue \<br>
+=C2=A0 =C2=A0 -Devl=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dsystemd-user-service=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \<br>
+=C2=A0 =C2=A0 -Dvideotestsrc=3Dtrue \<br>
+=C2=A0 =C2=A0 -Dffmpeg=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dvulkan=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dlibcamera=3Dfalse \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;\<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blueto=
oth&#39;, &#39;bluez&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;alsa sys=
temd&#39;, d)} \<br>
+=C2=A0 =C2=A0 gstreamer jack v4l2 \<br>
+&quot;<br>
+<br>
+# &quot;jack&quot; and &quot;pipewire-jack&quot; packageconfigs cannot be=
 both enabled,<br>
+# since &quot;jack&quot; imports libjack, and &quot;pipewire-jack&quot; g=
enerates<br>
+# libjack.so* files, thus colliding with the libpack package. This<br>
+# is why these two are marked in their respective packageconfigs<br>
+# as being in conflict.<br>
+<br>
+PACKAGECONFIG[alsa] =3D &quot;-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib udev&=
quot;<br>
+PACKAGECONFIG[bluez] =3D &quot;-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,bluez5 sb=
c&quot;<br>
+PACKAGECONFIG[docs] =3D &quot;-Ddocs=3Dtrue,-Ddocs=3Dfalse,doxygen&quot;<=
br>
+PACKAGECONFIG[gstreamer] =3D &quot;-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse=
,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base&quot;<br>
+PACKAGECONFIG[jack] =3D &quot;-Djack=3Dtrue,-Djack=3Dfalse,jack,,,pipewir=
e-jack&quot;<br>
+PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,libxml-parse=
r-perl-native&quot;<br>
+PACKAGECONFIG[sdl2] =3D &quot;-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/=
libsdl2&quot;<br>
+PACKAGECONFIG[sndfile] =3D &quot;-Dsndfile=3Denabled,-Dsndfile=3Ddisabled=
,libsndfile1&quot;<br>
+PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Dtrue -Dsystemd-system-servic=
e=3Dtrue ,-Dsystemd=3Dfalse -Dsystemd-system-service=3Dfalse,systemd&quot;<=
br>
+PACKAGECONFIG[v4l2] =3D &quot;-Dv4l2=3Dtrue,-Dv4l2=3Dfalse,udev&quot;<br>
+PACKAGECONFIG[pipewire-alsa] =3D &quot;-Dpipewire-alsa=3Dtrue,-Dpipewire-=
alsa=3Dfalse,alsa-lib&quot;<br>
+PACKAGECONFIG[pipewire-jack] =3D &quot;-Dpipewire-jack=3Dtrue -Dlibjack-p=
ath=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Dfalse,jack,,,jac=
k&quot;<br>
+<br>
+PACKAGESPLITFUNCS_prepend =3D &quot; split_dynamic_packages &quot;<br>
+PACKAGESPLITFUNCS_append =3D &quot; set_dynamic_metapkg_rdepends &quot;<b=
r>
+<br>
+SPA_SUBDIR =3D &quot;spa-0.2&quot;<br>
+PW_MODULE_SUBDIR =3D &quot;pipewire-0.3&quot;<br>
+<br>
+remove_unused_installed_files() {<br>
+=C2=A0 =C2=A0 # jack.conf is used by pipewire-jack (not the JACK SPA plug=
in).<br>
+=C2=A0 =C2=A0 # Remove it if pipewire-jack is not built to avoid creating=
 the<br>
+=C2=A0 =C2=A0 # pipewire-jack package.<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;pipew=
ire-jack&#39;, &#39;false&#39;, &#39;true&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${D}${sysconfdir}/pipewire/jack.c=
onf&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+do_install[postfuncs] +=3D &quot;remove_unused_installed_files&quot;<br>
+<br>
+python split_dynamic_packages () {<br>
+=C2=A0 =C2=A0 # Create packages for each SPA plugin. These plugins are lo=
cated<br>
+=C2=A0 =C2=A0 # in individual subdirectories, so a recursive search is ne=
eded.<br>
+=C2=A0 =C2=A0 spa_libdir =3D d.expand(&#39;${libdir}/${SPA_SUBDIR}&#39;)<=
br>
+=C2=A0 =C2=A0 do_split_packages(d, spa_libdir, r&#39;^libspa-(.*)\.so$&#3=
9;, d.expand(&#39;${PN}-spa-plugins-%s&#39;), &#39;PipeWire SPA plugin for =
%s&#39;, extra_depends=3D&#39;&#39;, recursive=3DTrue)<br>
+<br>
+=C2=A0 =C2=A0 # Create packages for each PipeWire module.<br>
+=C2=A0 =C2=A0 pw_module_libdir =3D d.expand(&#39;${libdir}/${PW_MODULE_SU=
BDIR}&#39;)<br>
+=C2=A0 =C2=A0 do_split_packages(d, pw_module_libdir, r&#39;^libpipewire-m=
odule-(.*)\.so$&#39;, d.expand(&#39;${PN}-modules-%s&#39;), &#39;PipeWire %=
s module&#39;, extra_depends=3D&#39;&#39;, recursive=3DFalse)<br>
+}<br>
+<br>
+python set_dynamic_metapkg_rdepends () {<br>
+=C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 import oe.utils<br>
+<br>
+=C2=A0 =C2=A0 # Go through all generated SPA plugin and PipeWire module p=
ackages<br>
+=C2=A0 =C2=A0 # (excluding the main package and the -meta package itself)=
 and<br>
+=C2=A0 =C2=A0 # add them to the -meta package as RDEPENDS.<br>
+<br>
+=C2=A0 =C2=A0 base_pn =3D d.getVar(&#39;PN&#39;)<br>
+<br>
+=C2=A0 =C2=A0 spa_pn =3D base_pn + &#39;-spa-plugins&#39;<br>
+=C2=A0 =C2=A0 spa_metapkg =3D=C2=A0 spa_pn + &#39;-meta&#39;<br>
+<br>
+=C2=A0 =C2=A0 pw_module_pn =3D base_pn + &#39;-modules&#39;<br>
+=C2=A0 =C2=A0 pw_module_metapkg =3D=C2=A0 pw_module_pn + &#39;-meta&#39;<=
br>
+<br>
+=C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_&#39; + spa_metapkg, &quot;1&quot=
;)<br>
+=C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + spa_metapkg, &quot;&quot;)<br>
+<br>
+=C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_&#39; + pw_module_metapkg, &quot;=
1&quot;)<br>
+=C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + pw_module_metapkg, &quot;&quot;=
)<br>
+<br>
+=C2=A0 =C2=A0 blacklist =3D [ spa_pn, spa_metapkg, pw_module_pn, pw_modul=
e_metapkg ]<br>
+=C2=A0 =C2=A0 spa_metapkg_rdepends =3D []<br>
+=C2=A0 =C2=A0 pw_module_metapkg_rdepends =3D []<br>
+=C2=A0 =C2=A0 pkgdest =3D d.getVar(&#39;PKGDEST&#39;)<br>
+<br>
+=C2=A0 =C2=A0 for pkg in oe.utils.packages_filter_out_system(d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg in blacklist:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_spa_pkg =3D pkg.startswith(spa_pn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_pw_module_pkg =3D pkg.startswith(pw_module=
_pn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_spa_pkg and not is_pw_module_pkg:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg in spa_metapkg_rdepends or pkg in pw_m=
odule_metapkg_rdepends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # See if the package is empty by looking at t=
he contents of its<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # PKGDEST subdirectory. If this subdirectory =
is empty, then then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # package is empty as well. Empty packages do=
 not get added to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the meta package&#39;s RDEPENDS.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgdir =3D os.path.join(pkgdest, pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(pkgdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D os.listdir(pkg=
dir) or []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_empty =3D len(dir_contents) =3D=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_empty:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_spa_pkg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_metapkg_rdepe=
nds.append(pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_pw_module_pkg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_module_metapkg=
_rdepends.append(pkg)<br>
+<br>
+=C2=A0 =C2=A0 d.setVar(&#39;RDEPENDS_&#39; + spa_metapkg, &#39; &#39;.joi=
n(spa_metapkg_rdepends))<br>
+=C2=A0 =C2=A0 d.setVar(&#39;DESCRIPTION_&#39; + spa_metapkg, spa_pn + &#3=
9; meta package&#39;)<br>
+<br>
+=C2=A0 =C2=A0 d.setVar(&#39;RDEPENDS_&#39; + pw_module_metapkg, &#39; &#3=
9;.join(pw_module_metapkg_rdepends))<br>
+=C2=A0 =C2=A0 d.setVar(&#39;DESCRIPTION_&#39; + pw_module_metapkg, pw_mod=
ule_pn + &#39; meta package&#39;)<br>
+}<br>
+<br>
+PACKAGES =3D+ &quot;\<br>
+=C2=A0 =C2=A0 libpipewire \<br>
+=C2=A0 =C2=A0 ${PN}-tools \<br>
+=C2=A0 =C2=A0 ${PN}-pulse \<br>
+=C2=A0 =C2=A0 ${PN}-alsa \<br>
+=C2=A0 =C2=A0 ${PN}-jack \<br>
+=C2=A0 =C2=A0 ${PN}-media-session \<br>
+=C2=A0 =C2=A0 ${PN}-spa-plugins \<br>
+=C2=A0 =C2=A0 ${PN}-spa-plugins-meta \<br>
+=C2=A0 =C2=A0 ${PN}-spa-tools \<br>
+=C2=A0 =C2=A0 ${PN}-modules \<br>
+=C2=A0 =C2=A0 ${PN}-modules-meta \<br>
+=C2=A0 =C2=A0 ${PN}-alsa-card-profile \<br>
+=C2=A0 =C2=A0 gstreamer1.0-pipewire \<br>
+&quot;<br>
+<br>
+PACKAGES_DYNAMIC =3D &quot;^${PN}-spa-plugins.* ^${PN}-modules.*&quot;<br=
>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;pipewire.service&quot;<br>
+CONFFILES_${PN} +=3D &quot;${sysconfdir}/pipewire/pipewire.conf&quot;<br>
+FILES_${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/pipewire/pipewire.conf \<br>
+=C2=A0 =C2=A0 ${systemd_system_unitdir}/pipewire.* \<br>
+=C2=A0 =C2=A0 ${bindir}/pipewire \<br>
+&quot;<br>
+<br>
+FILES_${PN}-dev +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \<br>
+&quot;<br>
+<br>
+CONFFILES_libpipewire +=3D &quot;${sysconfdir}/pipewire/client.conf&quot;=
<br>
+FILES_libpipewire =3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/pipewire/client.conf \<br>
+=C2=A0 =C2=A0 ${libdir}/libpipewire-*.so.* \<br>
+&quot;<br>
+# Add the bare minimum modules and plugins required to be able<br>
+# to use libpipewire. Without these, it is essentially unusable.<br>
+RDEPENDS_libpipewire +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PN}-modules-client-node \<br>
+=C2=A0 =C2=A0 ${PN}-modules-protocol-native \<br>
+=C2=A0 =C2=A0 ${PN}-spa-plugins-support \<br>
+&quot;<br>
+<br>
+FILES_${PN}-tools =3D &quot; \<br>
+=C2=A0 =C2=A0 ${bindir}/pw-* \<br>
+&quot;<br>
+<br>
+# This is a shim daemon that is intended to be used as a<br>
+# drop-in PulseAudio replacement, providing a pulseaudio-compatible<br>
+# socket that can be used by applications that use libpulse.<br>
+CONFFILES_${PN}-pulse +=3D &quot;${sysconfdir}/pipewire/pipewire-pulse.co=
nf&quot;<br>
+FILES_${PN}-pulse =3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/pipewire/pipewire-pulse.conf \<br>
+=C2=A0 =C2=A0 ${bindir}/pipewire-pulse \<br>
+&quot;<br>
+RDEPENDS_${PN}-pulse +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PN}-modules-protocol-pulse \<br>
+&quot;<br>
+<br>
+# alsa plugin to redirect audio to pipewire<br>
+FILES_${PN}-alsa =3D &quot;\<br>
+=C2=A0 =C2=A0 ${libdir}/alsa-lib/* \<br>
+=C2=A0 =C2=A0 ${datadir}/alsa/alsa.conf.d/* \<br>
+&quot;<br>
+<br>
+# jack drop-in libraries to redirect audio to pipewire<br>
+CONFFILES_${PN}-jack =3D &quot;${sysconfdir}/pipewire/jack.conf&quot;<br>
+FILES_${PN}-jack =3D &quot;\<br>
+=C2=A0 =C2=A0 ${sysconfdir}/pipewire/jack.conf \<br>
+=C2=A0 =C2=A0 ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \<br>
+&quot;<br>
+<br>
+# Example session manager. Not intended for use in production.<br>
+CONFFILES_${PN}-media-session =3D &quot;${sysconfdir}/pipewire/media-sess=
ion.d/*&quot;<br>
+FILES_${PN}-media-session =3D &quot; \<br>
+=C2=A0 =C2=A0 ${bindir}/pipewire-media-session \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/pipewire/media-session.d/* \<br>
+&quot;<br>
+RPROVIDES_${PN}-media-session =3D &quot;virtual/pipewire-sessionmanager&q=
uot;<br>
+<br>
+# Dynamic packages (see set_dynamic_metapkg_rdepends).<br>
+FILES_${PN}-spa-plugins =3D &quot;&quot;<br>
+RRECOMMENDS_${PN}-spa-plugins +=3D &quot;${PN}-spa-plugins-meta&quot;<br>
+<br>
+FILES_${PN}-spa-tools =3D &quot; \<br>
+=C2=A0 =C2=A0 ${bindir}/spa-* \<br>
+&quot;<br>
+<br>
+# Dynamic packages (see set_dynamic_metapkg_rdepends).<br>
+FILES_${PN}-modules =3D &quot;&quot;<br>
+RRECOMMENDS_${PN}-modules +=3D &quot;${PN}-modules-meta&quot;<br>
+<br>
+CONFFILES_${PN}-modules-rtkit =3D &quot;${sysconfdir}/pipewire/client-rt.=
conf&quot;<br>
+FILES_${PN}-modules-rtkit +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/pipewire/client-rt.conf \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+FILES_${PN}-alsa-card-profile =3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/alsa-card-profile/* \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules =
\<br>
+&quot;<br>
+<br>
+FILES_gstreamer1.0-pipewire =3D &quot; \<br>
+=C2=A0 =C2=A0 ${libdir}/gstreamer-1.0/* \<br>
+&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000067d8a405bd2a8ddb--
