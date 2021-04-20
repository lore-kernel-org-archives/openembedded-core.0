Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web09.171.1618940199279453115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 10:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e68vrB7N;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id k19so6700532vsg.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+UJpNbCOr9BHfcN0h2agOeT6V0dsRVuNmLNLrmuMVo=;
        b=e68vrB7NUeiJr2RVUGobkV3CHvbbFV14hPUMeUSkA+FsbwktC9v5mspzyTTRaPoHCb
         QWYAsil+vr1fjLQpqoB7ikWXVenKHhz4xsSk/GRXceFEtgClLFcdnH7AvhNW9CgM3U3M
         cP9D+dK8YQhZYO/39OHP+r6CPXcnmsYFjQ70SDfMeOHyZvZthfIOT8dO0QqA4/gNJN5H
         IyySJbamZunj3sz5CevuRZo8A0LgiT0CvAMJmrER3zU8IcIaKoii/awNVpp1o64Qqtq6
         fLAFQi9h4Vx4DD1ZJFC4mlZokeI7G7hqVIUWmoi9l288yF9mC9uuPRm7+2a7nPuRjDP+
         6sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+UJpNbCOr9BHfcN0h2agOeT6V0dsRVuNmLNLrmuMVo=;
        b=d/duyGxOvugkVTRG4jgMPxDzOv9AFxxaqlHnVfVCBNjbXPv5JJP7VBWrRLMmfdZwKM
         FQtxr/Zy/3feUNRFY6xijjEjp+EnOpaxMqjdaBl/SagkI8f9Z7yGzs43yLCTWczpD0y3
         Z1ClhVZYh3cQquM/t5zmga48697RuiI0IvibEJjmFpaTfc2XDp+vZcYsS4nESHaeTKLP
         v8jCBeVH1NypqzT+WHBAuyG+CeA1MdmdI4V/cAM08ZI87mhSiya64/TiDOjtcWei7yQj
         9oYnFCLsoRVui0NVqZDXWSshW1ZtQJixqJ/TDG6ulqI7hetX1b/fW7Ea1UYaw7QEs3uQ
         N50Q==
X-Gm-Message-State: AOAM5308msscjKuDJrv/u0UlCw2jFbQv9Pvl+HJi+UA9Ka1+FeGAzGFC
	w8+7vHpoH6GayNnCQNVxLzqZ46IvGHauj8WNfnPLcDe6F6A=
X-Google-Smtp-Source: ABdhPJypkC7DTXzjnGMJdh2IZwa5qsZssjdrIth0omaagYbtHKZEOq5amQNJo0iL5hEKAkZRGY/1OrqurZ5pf1gm8A8=
X-Received: by 2002:a67:1447:: with SMTP id 68mr20897498vsu.20.1618940138409;
 Tue, 20 Apr 2021 10:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210420162259.179433-1-ayaka@soulik.info>
In-Reply-To: <20210420162259.179433-1-ayaka@soulik.info>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Apr 2021 19:35:27 +0200
Message-ID: <CANNYZj9dcq0fsz+zStCiGnMFr_FmcGA-+frMVhwnjzW6ZnH31Q@mail.gmail.com>
Subject: Re: [PATCH v2] seatd: add seatd recipe
To: Randy Li <ayaka@soulik.info>
Cc: OE-core <openembedded-core@lists.openembedded.org>, contact@emersion.fr, 
	kl@kl.wtf
Content-Type: multipart/alternative; boundary="000000000000dcd1e705c06adf76"

--000000000000dcd1e705c06adf76
Content-Type: text/plain; charset="UTF-8"

I guess we need to wait for weston to actually do it, and hold off the
patch until then?

Alex

On Tue, 20 Apr 2021 at 18:23, Randy Li <ayaka@soulik.info> wrote:

> From: ayaka <ayaka@soulik.info>
>
> Weston would adapt the libseat for granting privilege and VT switch.
> wlroots has merged it.
>
> Signed-off-by: ayaka <ayaka@soulik.info>
> ---
>  .../nativesdk-packagegroup-sdk-host.bb        |  2 -
>  ...build-fixup-standalone-without-seatd.patch | 71 +++++++++++++++++++
>  meta/recipes-core/seatd/libseat/init          | 50 +++++++++++++
>  meta/recipes-core/seatd/libseat_0.5.0.bb      | 43 +++++++++++
>  4 files changed, 164 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
>  create mode 100644 meta/recipes-core/seatd/libseat/init
>  create mode 100644 meta/recipes-core/seatd/libseat_0.5.0.bb
>
> diff --git a/meta/recipes-core/packagegroups/
> nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/
> nativesdk-packagegroup-sdk-host.bb
> index ae989011f4..3e4e148c45 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -11,8 +11,6 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>
>  RDEPENDS_${PN} = "\
>      nativesdk-pkgconfig \
> -    nativesdk-qemu \
> -    nativesdk-qemu-helper \
>      nativesdk-pseudo \
>      nativesdk-unfs3 \
>      nativesdk-opkg \
> diff --git
> a/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
> b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
> new file mode 100644
> index 0000000000..66e1ac73ab
> --- /dev/null
> +++
> b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
> @@ -0,0 +1,71 @@
> +From 084df8ab271ce4b09c1ef5d9c5a859b2d02d20e7 Mon Sep 17 00:00:00 2001
> +From: ayaka <ayaka@soulik.info>
> +Date: Mon, 19 Apr 2021 22:15:46 +0800
> +Subject: [PATCH] build: fixup standalone without seatd
> +
> +I think that server option means the same thing as seatd, so I
> +get rid of it.
> +---
> + meson.build       | 10 +++++-----
> + meson_options.txt |  1 -
> + 2 files changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 7a70cb6..a2166c5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -104,10 +104,11 @@ server_files = [
> +
> + with_seatd = get_option('seatd') == 'enabled'
> + with_builtin = get_option('builtin') == 'enabled'
> +-with_server = get_option('server') == 'enabled'
> +
> +-if with_seatd
> ++if with_seatd or with_builtin
> +       private_files += 'libseat/backend/seatd.c'
> ++endif
> ++if with_seatd
> +       add_project_arguments('-DSEATD_ENABLED=1', language: 'c')
> + endif
> +
> +@@ -189,7 +190,7 @@ libseat = declare_dependency(
> +       variables: libseat_vars,
> + )
> +
> +-if with_server
> ++if with_seatd
> +       executable(
> +               'seatd',
> +               [ server_files, 'seatd/seatd.c' ],
> +@@ -221,7 +222,7 @@ foreach name, value : tests
> +               include_directories: [include_directories('.',
> 'include')]))
> + endforeach
> +
> +-if with_server
> ++if with_seatd
> +       scdoc = dependency('scdoc', required: get_option('man-pages'),
> version: '>= 1.9.7', native: true)
> + else
> +       scdoc = disabler()
> +@@ -252,7 +253,6 @@ endif
> + summary({
> +       'seatd': with_seatd,
> +       'builtin': with_builtin,
> +-      'server': with_server,
> +       'systemd': logind.found() and logind_provider == 'systemd',
> +       'elogind': logind.found() and logind_provider == 'elogind',
> + }, bool_yn: true)
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 144ce7a..c61d473 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -1,7 +1,6 @@
> + option('logind', type: 'combo', choices: ['auto', 'disabled', 'elogind',
> 'systemd'], value: 'auto', description: 'logind support')
> + option('seatd', type: 'combo', choices: ['enabled', 'disabled'], value:
> 'enabled', description: 'seatd support')
> + option('builtin', type: 'combo', choices: ['enabled', 'disabled'],
> value: 'disabled', description: 'builtin seatd server')
> +-option('server', type: 'combo', choices: ['enabled', 'disabled'], value:
> 'enabled', description: 'seatd server')
> + option('examples', type: 'combo', choices: ['enabled', 'disabled'],
> value: 'disabled', description: 'libseat example programs')
> + option('man-pages', type: 'feature', value: 'auto', description:
> 'Generate and install man pages')
> + option('defaultpath', type: 'string', value: '', description: 'Default
> location for seatd socket (empty for default)')
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-core/seatd/libseat/init
> b/meta/recipes-core/seatd/libseat/init
> new file mode 100644
> index 0000000000..8c9d77255d
> --- /dev/null
> +++ b/meta/recipes-core/seatd/libseat/init
> @@ -0,0 +1,50 @@
> +#!/bin/sh
> +#
> +### BEGIN INIT INFO
> +# Provides:          seatd
> +# Short-Description: Start seat management daemon
> +# Required-Start:    $local_fs $remote_fs
> +# Required-Stop:     $local_fs $remote_fs
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +### END INIT INFO
> +
> +PATH=/bin:/usr/bin:/sbin:/usr/sbin
> +
> +test -x /usr/bin/seatd || exit 0
> +
> +# For configuration of the init script use the file
> +# /etc/default/seatd, do not edit this init script.
> +
> +seatd_group="seatd"
> +
> +[ -e /etc/default/seatd ] && . /etc/default/seatd
> +
> +NAME=seatd
> +DAEMON=/usr/bin/seatd
> +STOP_RETRY_SCHEDULE='TERM/10/forever/KILL/1'
> +
> +. /etc/init.d/functions
> +
> +case "$1" in
> +  start)
> +    start-stop-daemon --start --backgroud --quiet --pidfile
> /var/run/$NAME.pid \
> +           --exec $DAEMON -- -g $seatd_group
> +    ;;
> +
> +  stop)
> +    killproc $NAME
> +    ;;
> +
> +  restart)
> +    $0 stop
> +    sleep 1
> +    $0 start
> +    ;;
> +  *)
> +    echo "Usage: $0 {start|stop|restart}"
> +    exit 1
> +
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-core/seatd/libseat_0.5.0.bb
> b/meta/recipes-core/seatd/libseat_0.5.0.bb
> new file mode 100644
> index 0000000000..8067d32a26
> --- /dev/null
> +++ b/meta/recipes-core/seatd/libseat_0.5.0.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "Seat management daemon and library"
> +HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd"
> +SECTION = "base"
> +
> +DESCRIPTION = "A minimal seat management daemon, and a universal seat
> management \
> +library. Seat management takes care of mediating access to shared devices
> \
> +(graphics, input), without requiring the applications needing access to
> be root."
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=3;md5=6a01e8ccc65bea4e8bfa79b09ea1444c"
> +
> +SRCREV = "5535c2c3b19b42ebfe4c451600059e9418e401a6"
> +SRCBRANCH = "master"
> +SRC_URI = "git://
> git.sr.ht/~kennylevinsen/seatd;protocol=http;branch=${SRCBRANCH}
> <http://git.sr.ht/~kennylevinsen/seatd;protocol=http;branch=$%7BSRCBRANCH%7D>
> \
> +           file://0001-build-fixup-standalone-without-seatd.patch \
> +           file://init"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig meson useradd update-rc.d
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager',
> 'systemd', 'systemd', 'seatd', d)}"
> +
> +PACKAGECONFIG[seatd] = "-Dseatd=enabled, -Dseatd=disabled"
> +PACKAGECONFIG[systemd] = "-Dlogind=systemd, -Dlogind=disabled, systemd
> dbus"
> +
> +PACKAGES += "seatd"
> +
> +FILES_${PN} = "${libdir}/lib*${SOLIBS}"
> +FILES_seatd = "${bindir}/seatd ${sysconfdir}"
> +
> +do_install_append() {
> +       if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> +               install -Dm755 ${WORKDIR}/init
> ${D}/${sysconfdir}/init.d/seatd
> +       fi
> +}
> +
> +INITSCRIPT_NAME = "seatd"
> +INITSCRIPT_PARAMS = "start 8 5 2 . stop 21 0 1 6 ."
> +
> +USERADD_PACKAGES = "seatd"
> +
> +GROUPADD_PARAM_seatd = "-r seatd"
> --
> 2.30.2
>
>

--000000000000dcd1e705c06adf76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I guess we need to wait for weston to actually do it,=
 and hold off the patch until then?</div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, 20 Apr 2021 at 18:23, Randy Li &lt;<a href=3D"mailto:ayaka@soulik.i=
nfo">ayaka@soulik.info</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: ayaka &lt;<a href=3D"mailto:ayaka@soulik.info" =
target=3D"_blank">ayaka@soulik.info</a>&gt;<br>
<br>
Weston would adapt the libseat for granting privilege and VT switch.<br>
wlroots has merged it.<br>
<br>
Signed-off-by: ayaka &lt;<a href=3D"mailto:ayaka@soulik.info" target=3D"_bl=
ank">ayaka@soulik.info</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://nativesdk-packagegroup-sdk-host.bb" rel=3D"nore=
ferrer" target=3D"_blank">nativesdk-packagegroup-sdk-host.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 -<br>
=C2=A0...build-fixup-standalone-without-seatd.patch | 71 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/seatd/libseat/init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 50 +++++++++++++<br>
=C2=A0meta/recipes-core/seatd/<a href=3D"http://libseat_0.5.0.bb" rel=3D"no=
referrer" target=3D"_blank">libseat_0.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 | 43 +=
++++++++++<br>
=C2=A04 files changed, 164 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/seatd/libseat/0001-build-fixup-s=
tandalone-without-seatd.patch<br>
=C2=A0create mode 100644 meta/recipes-core/seatd/libseat/init<br>
=C2=A0create mode 100644 meta/recipes-core/seatd/<a href=3D"http://libseat_=
0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libseat_0.5.0.bb</a><br>
<br>
diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://nativesdk-pa=
ckagegroup-sdk-host.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-pack=
agegroup-sdk-host.bb</a> b/meta/recipes-core/packagegroups/<a href=3D"http:=
//nativesdk-packagegroup-sdk-host.bb" rel=3D"noreferrer" target=3D"_blank">=
nativesdk-packagegroup-sdk-host.bb</a><br>
index ae989011f4..3e4e148c45 100644<br>
--- a/meta/recipes-core/packagegroups/<a href=3D"http://nativesdk-packagegr=
oup-sdk-host.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-packagegrou=
p-sdk-host.bb</a><br>
+++ b/meta/recipes-core/packagegroups/<a href=3D"http://nativesdk-packagegr=
oup-sdk-host.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-packagegrou=
p-sdk-host.bb</a><br>
@@ -11,8 +11,6 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D &quot;1&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-pkgconfig \<br>
-=C2=A0 =C2=A0 nativesdk-qemu \<br>
-=C2=A0 =C2=A0 nativesdk-qemu-helper \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-pseudo \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-unfs3 \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-opkg \<br>
diff --git a/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-wi=
thout-seatd.patch b/meta/recipes-core/seatd/libseat/0001-build-fixup-standa=
lone-without-seatd.patch<br>
new file mode 100644<br>
index 0000000000..66e1ac73ab<br>
--- /dev/null<br>
+++ b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-s=
eatd.patch<br>
@@ -0,0 +1,71 @@<br>
+From 084df8ab271ce4b09c1ef5d9c5a859b2d02d20e7 Mon Sep 17 00:00:00 2001<br>
+From: ayaka &lt;<a href=3D"mailto:ayaka@soulik.info" target=3D"_blank">aya=
ka@soulik.info</a>&gt;<br>
+Date: Mon, 19 Apr 2021 22:15:46 +0800<br>
+Subject: [PATCH] build: fixup standalone without seatd<br>
+<br>
+I think that server option means the same thing as seatd, so I<br>
+get rid of it.<br>
+---<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
+ meson_options.txt |=C2=A0 1 -<br>
+ 2 files changed, 5 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index 7a70cb6..a2166c5 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -104,10 +104,11 @@ server_files =3D [<br>
+ <br>
+ with_seatd =3D get_option(&#39;seatd&#39;) =3D=3D &#39;enabled&#39;<br>
+ with_builtin =3D get_option(&#39;builtin&#39;) =3D=3D &#39;enabled&#39;<b=
r>
+-with_server =3D get_option(&#39;server&#39;) =3D=3D &#39;enabled&#39;<br>
+ <br>
+-if with_seatd<br>
++if with_seatd or with_builtin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0private_files +=3D &#39;libseat/backend/seatd.c=
&#39;<br>
++endif<br>
++if with_seatd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0add_project_arguments(&#39;-DSEATD_ENABLED=3D1&=
#39;, language: &#39;c&#39;)<br>
+ endif<br>
+ <br>
+@@ -189,7 +190,7 @@ libseat =3D declare_dependency(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0variables: libseat_vars,<br>
+ )<br>
+ <br>
+-if with_server<br>
++if with_seatd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0executable(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;seatd&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ server_files, &#3=
9;seatd/seatd.c&#39; ],<br>
+@@ -221,7 +222,7 @@ foreach name, value : tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_directories=
: [include_directories(&#39;.&#39;, &#39;include&#39;)]))<br>
+ endforeach<br>
+ <br>
+-if with_server<br>
++if with_seatd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0scdoc =3D dependency(&#39;scdoc&#39;, required:=
 get_option(&#39;man-pages&#39;), version: &#39;&gt;=3D 1.9.7&#39;, native:=
 true)<br>
+ else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0scdoc =3D disabler()<br>
+@@ -252,7 +253,6 @@ endif<br>
+ summary({<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;seatd&#39;: with_seatd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;builtin&#39;: with_builtin,<br>
+-=C2=A0 =C2=A0 =C2=A0 &#39;server&#39;: with_server,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;systemd&#39;: logind.found() and logind_pr=
ovider =3D=3D &#39;systemd&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;elogind&#39;: logind.found() and logind_pr=
ovider =3D=3D &#39;elogind&#39;,<br>
+ }, bool_yn: true)<br>
+diff --git a/meson_options.txt b/meson_options.txt<br>
+index 144ce7a..c61d473 100644<br>
+--- a/meson_options.txt<br>
++++ b/meson_options.txt<br>
+@@ -1,7 +1,6 @@<br>
+ option(&#39;logind&#39;, type: &#39;combo&#39;, choices: [&#39;auto&#39;,=
 &#39;disabled&#39;, &#39;elogind&#39;, &#39;systemd&#39;], value: &#39;aut=
o&#39;, description: &#39;logind support&#39;)<br>
+ option(&#39;seatd&#39;, type: &#39;combo&#39;, choices: [&#39;enabled&#39=
;, &#39;disabled&#39;], value: &#39;enabled&#39;, description: &#39;seatd s=
upport&#39;)<br>
+ option(&#39;builtin&#39;, type: &#39;combo&#39;, choices: [&#39;enabled&#=
39;, &#39;disabled&#39;], value: &#39;disabled&#39;, description: &#39;buil=
tin seatd server&#39;)<br>
+-option(&#39;server&#39;, type: &#39;combo&#39;, choices: [&#39;enabled&#3=
9;, &#39;disabled&#39;], value: &#39;enabled&#39;, description: &#39;seatd =
server&#39;)<br>
+ option(&#39;examples&#39;, type: &#39;combo&#39;, choices: [&#39;enabled&=
#39;, &#39;disabled&#39;], value: &#39;disabled&#39;, description: &#39;lib=
seat example programs&#39;)<br>
+ option(&#39;man-pages&#39;, type: &#39;feature&#39;, value: &#39;auto&#39=
;, description: &#39;Generate and install man pages&#39;)<br>
+ option(&#39;defaultpath&#39;, type: &#39;string&#39;, value: &#39;&#39;, =
description: &#39;Default location for seatd socket (empty for default)&#39=
;)<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta/recipes-core/seatd/libseat/init b/meta/recipes-core/seatd=
/libseat/init<br>
new file mode 100644<br>
index 0000000000..8c9d77255d<br>
--- /dev/null<br>
+++ b/meta/recipes-core/seatd/libseat/init<br>
@@ -0,0 +1,50 @@<br>
+#!/bin/sh<br>
+#<br>
+### BEGIN INIT INFO<br>
+# Provides:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seatd<br>
+# Short-Description: Start seat management daemon<br>
+# Required-Start:=C2=A0 =C2=A0 $local_fs $remote_fs<br>
+# Required-Stop:=C2=A0 =C2=A0 =C2=A0$local_fs $remote_fs<br>
+# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4 5<br>
+# Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 6<br>
+### END INIT INFO<br>
+<br>
+PATH=3D/bin:/usr/bin:/sbin:/usr/sbin<br>
+<br>
+test -x /usr/bin/seatd || exit 0<br>
+<br>
+# For configuration of the init script use the file<br>
+# /etc/default/seatd, do not edit this init script.<br>
+<br>
+seatd_group=3D&quot;seatd&quot;<br>
+<br>
+[ -e /etc/default/seatd ] &amp;&amp; . /etc/default/seatd<br>
+<br>
+NAME=3Dseatd<br>
+DAEMON=3D/usr/bin/seatd<br>
+STOP_RETRY_SCHEDULE=3D&#39;TERM/10/forever/KILL/1&#39;<br>
+<br>
+. /etc/init.d/functions<br>
+<br>
+case &quot;$1&quot; in<br>
+=C2=A0 start)<br>
+=C2=A0 =C2=A0 start-stop-daemon --start --backgroud --quiet --pidfile /var=
/run/$NAME.pid \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--exec $DAEMON -- -g $seatd_group=
<br>
+=C2=A0 =C2=A0 ;;<br>
+<br>
+=C2=A0 stop)<br>
+=C2=A0 =C2=A0 killproc $NAME<br>
+=C2=A0 =C2=A0 ;;<br>
+<br>
+=C2=A0 restart)<br>
+=C2=A0 =C2=A0 $0 stop<br>
+=C2=A0 =C2=A0 sleep 1<br>
+=C2=A0 =C2=A0 $0 start<br>
+=C2=A0 =C2=A0 ;;<br>
+=C2=A0 *)<br>
+=C2=A0 =C2=A0 echo &quot;Usage: $0 {start|stop|restart}&quot;<br>
+=C2=A0 =C2=A0 exit 1<br>
+<br>
+esac<br>
+<br>
+exit 0<br>
diff --git a/meta/recipes-core/seatd/<a href=3D"http://libseat_0.5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libseat_0.5.0.bb</a> b/meta/recipes-core=
/seatd/<a href=3D"http://libseat_0.5.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libseat_0.5.0.bb</a><br>
new file mode 100644<br>
index 0000000000..8067d32a26<br>
--- /dev/null<br>
+++ b/meta/recipes-core/seatd/<a href=3D"http://libseat_0.5.0.bb" rel=3D"no=
referrer" target=3D"_blank">libseat_0.5.0.bb</a><br>
@@ -0,0 +1,43 @@<br>
+SUMMARY =3D &quot;Seat management daemon and library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.sr.ht/~kennylevinsen/seatd" rel=
=3D"noreferrer" target=3D"_blank">https://git.sr.ht/~kennylevinsen/seatd</a=
>&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+DESCRIPTION =3D &quot;A minimal seat management daemon, and a universal se=
at management \<br>
+library. Seat management takes care of mediating access to shared devices =
\<br>
+(graphics, input), without requiring the applications needing access to be=
 root.&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D3;md5=3D6a01e8ccc65b=
ea4e8bfa79b09ea1444c&quot;<br>
+<br>
+SRCREV =3D &quot;5535c2c3b19b42ebfe4c451600059e9418e401a6&quot;<br>
+SRCBRANCH =3D &quot;master&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.sr.ht/~kennylevinsen/seatd;p=
rotocol=3Dhttp;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" target=3D"_bla=
nk">git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttp;branch=3D${SRCBRANCH}</a=
> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-fixup-standalon=
e-without-seatd.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit pkgconfig meson useradd update-rc.d<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;VIRTUAL-RUNTIME_init_m=
anager&#39;, &#39;systemd&#39;, &#39;systemd&#39;, &#39;seatd&#39;, d)}&quo=
t;<br>
+<br>
+PACKAGECONFIG[seatd] =3D &quot;-Dseatd=3Denabled, -Dseatd=3Ddisabled&quot;=
<br>
+PACKAGECONFIG[systemd] =3D &quot;-Dlogind=3Dsystemd, -Dlogind=3Ddisabled, =
systemd dbus&quot;<br>
+<br>
+PACKAGES +=3D &quot;seatd&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
+FILES_seatd =3D &quot;${bindir}/seatd ${sysconfdir}&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VIRTUAL-RUNTIME_init_manager}&quot=
; !=3D &quot;systemd&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm755 ${WO=
RKDIR}/init ${D}/${sysconfdir}/init.d/seatd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+INITSCRIPT_NAME =3D &quot;seatd&quot;<br>
+INITSCRIPT_PARAMS =3D &quot;start 8 5 2 . stop 21 0 1 6 .&quot;<br>
+<br>
+USERADD_PACKAGES =3D &quot;seatd&quot;<br>
+<br>
+GROUPADD_PARAM_seatd =3D &quot;-r seatd&quot;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000dcd1e705c06adf76--
