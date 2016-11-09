Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 87556601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 12:07:35 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id x186so173863016vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 04:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zf99QYbWyO75RhFlh9thUlACbgjJzzu6blqVggQ1EBM=;
	b=0sCoOXvDsdl7vajzFhENcLLnqtAUcOrw4k8jy3d8hQgdb3HMN6RthzhfuwJYZCNZF8
	1pl4u/wM4Nr64gu48fj+4GiHA6/ZpkAxsoB3Gz076Pg6Oe5RAgn+LJUhirMeH8EXptKx
	AHBvWnJkGrpGb8IzO3ebd35g8YPKWKN7+l5wh0gA5vunaImPcA3z7P28SwachRp0FokA
	dhvu1OCTptnWlHwItKbR9EtqmZcu+wIsEnSmd0TlAZm0q1EPH/LdotTC0yICYa90Hf3K
	Hfy1HO0flh53lXTkruqp/QBOQ9NILmv/NNMCFQF2++wfO7+0irKL3SA0pmkR90AkWhvx
	T85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zf99QYbWyO75RhFlh9thUlACbgjJzzu6blqVggQ1EBM=;
	b=CgbRNisXqylRQ27vshczhYDb1r0E26s34sIJSJwroFEJ2xmPJzI0+gIvWtBh0jwBet
	mMEMq+lY59R1ntR81/V+d02SCXKFpODWUS7DQK6fuqJ6XgWq4Lizhog98s3AFFCrIjA0
	3ygevHjqsPbe2M7qm90BGIRCxTHclODoE0FE2Cxa+X88vCM13YiAV0WMmu+0W+J6pHXs
	N1+lDJmwFxQWamj3XVLzl3Gxgf4SwJVaYfhRcwfgMmMDLmIP7xGsnahDyRbNyb6ZtTAj
	xig/zEiFwgBTwiFVXT5Iy00g/qEX5p4VMv2fDFRkQ3fKup4GMqroVGoYcTCGKooNkkwI
	GW8g==
X-Gm-Message-State: ABUngvcQHo9hxsKwAyWWn9M10JLRuj59BidgaqBViQ6Ec1YuzsW/a2R5A1p35aLyOID0lPi7uJPZhtQb0T5vfML9
X-Received: by 10.31.102.6 with SMTP id a6mr10272407vkc.151.1478693256029;
	Wed, 09 Nov 2016 04:07:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.87.91 with HTTP; Wed, 9 Nov 2016 04:07:05 -0800 (PST)
In-Reply-To: <20161108135457.13249-1-fathi.boudra@linaro.org>
References: <20161108135457.13249-1-fathi.boudra@linaro.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 9 Nov 2016 14:07:05 +0200
Message-ID: <CAHiDW_Gjhfzn2OHvEZKbY961Gc9VRLkZXP_QJE30CyATgYBQ+Q@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: upgrade from 1.11.1 to 1.12.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2016 12:07:35 -0000
Content-Type: multipart/alternative; boundary=94eb2c092d6841f9640540dd1a57

--94eb2c092d6841f9640540dd1a57
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8 November 2016 at 15:54, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> From: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
>
> * Refresh patches to apply cleanly on 1.12.0 (no changes):
>   - 0001-make-error-portable.patch
>   - 0001-configure.ac-Fix-wayland-protocols-path.patch
>   - 0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
>   - 0001-Add-configuration-option-for-no-input-device.patch
> * Remove 0001-shared-include-stdint.h-for-int32_t.patch applied
>   upstream
>   https://cgit.freedesktop.org/wayland/weston/commit/?id=3D649bbce6
> * Update license files checksum, compositor.c location has changed.
>   No license changes.
> * Drop --disable-rpi-compositor from EXTRA_OE_CONF. Raspberry Pi backend
>   and renderer have been removed upstream. The option doesn't exist
>   anymore.
> * Adjust files names to the new naming: weston -> libweston-1.
>

These changes look good to me. That said I think we should start separating
the package into weston (compositor shells, plugins and essential tools)
and libweston (the public libraries) at this point since upstream is now
saying it should work. Can you do this as part of the upgrade?

libweston should contain {libdir}/*.so.* as usual but I believe also
{libdir}/libweston-1/* (the backends). The weston plugins
({libdir}/weston/*) should stay in weston itself

Cheers,
  Jussi



> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  ...-configuration-option-for-no-input-device.patch | 39
> +++++++++++-----------
>  ...1-configure.ac-Fix-wayland-protocols-path.patch |  4 +--
>  .../wayland/weston/0001-make-error-portable.patch  | 20 +++++------
>  .../0001-shared-include-stdint.h-for-int32_t.patch | 23 -------------
>  ...ch-Provide-a-default-version-that-doesn-t.patch | 28 ++++++++--------
>  .../wayland/{weston_1.11.1.bb =3D> weston_1.12.0.bb} | 12 +++----
>  6 files changed, 51 insertions(+), 75 deletions(-)
>  delete mode 100644 meta/recipes-graphics/wayland/
> weston/0001-shared-include-stdint.h-for-int32_t.patch
>  rename meta/recipes-graphics/wayland/{weston_1.11.1.bb =3D>
> weston_1.12.0.bb} (92%)
>
> diff --git a/meta/recipes-graphics/wayland/weston/0001-Add-
> configuration-option-for-no-input-device.patch b/meta/recipes-graphics/
> wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
> index c45f3ad..a822d4a 100644
> --- a/meta/recipes-graphics/wayland/weston/0001-Add-
> configuration-option-for-no-input-device.patch
> +++ b/meta/recipes-graphics/wayland/weston/0001-Add-
> configuration-option-for-no-input-device.patch
> @@ -31,24 +31,24 @@ Reviewed-by: Daniel Stone <daniels@collabora.com>
>  Upstream-Status: backport from
>  https://cgit.freedesktop.org/wayland/weston/commit/?id=3D75b7197f
>  ---
> - man/weston.ini.man  |    5 +++++
> - src/compositor.h    |    3 +++
> - src/libinput-seat.c |    6 ++++++
> - src/main.c          |    5 +++++
> - weston.ini.in       |    1 +
> - 5 files changed, 20 insertions(+)
> + compositor/main.c         |    5 +++++
> + libweston/compositor.h    |    4 ++++
> + libweston/libinput-seat.c |    6 ++++++
> + man/weston.ini.man        |    5 +++++
> + weston.ini.in             |    1 +
> + 5 files changed, 21 insertions(+)
>
> ---- a/src/main.c
> -+++ b/src/main.c
> -@@ -1298,6 +1298,7 @@ int main(int argc, char *argv[])
> -       struct wl_client *primary_client;
> +--- a/compositor/main.c
> ++++ b/compositor/main.c
> +@@ -1595,6 +1595,7 @@ int main(int argc, char *argv[])
>         struct wl_listener primary_client_destroyed;
>         struct weston_seat *seat;
> -+      int require_input;
> +       struct wet_compositor user_data;
> ++      int require_input;
>
>         const struct weston_option core_options[] =3D {
>                 { WESTON_OPTION_STRING, "backend", 'B', &backend },
> -@@ -1373,6 +1374,10 @@ int main(int argc, char *argv[])
> +@@ -1678,6 +1679,10 @@ int main(int argc, char *argv[])
>         if (weston_compositor_init_config(ec, config) < 0)
>                 goto out;
>
> @@ -59,21 +59,22 @@ https://cgit.freedesktop.org/
> wayland/weston/commit/?id=3D75b7197f
>         if (load_backend(ec, backend, &argc, argv, config) < 0) {
>                 weston_log("fatal: failed to create compositor backend\n"=
);
>                 goto out;
> ---- a/src/compositor.h
> -+++ b/src/compositor.h
> -@@ -803,6 +803,9 @@ struct weston_compositor {
> +--- a/libweston/compositor.h
> ++++ b/libweston/compositor.h
> +@@ -836,6 +836,10 @@ struct weston_compositor {
>
>         void *user_data;
>         void (*exit)(struct weston_compositor *c);
>  +
>  +      /* Whether to let the compositor run without any input device. */
>  +      bool require_input;
> ++
>   };
>
>   struct weston_buffer {
> ---- a/src/libinput-seat.c
> -+++ b/src/libinput-seat.c
> -@@ -255,6 +255,12 @@ udev_input_enable(struct udev_input *inp
> +--- a/libweston/libinput-seat.c
> ++++ b/libweston/libinput-seat.c
> +@@ -259,6 +259,12 @@ udev_input_enable(struct udev_input *inp
>                         devices_found =3D 1;
>         }
>
> @@ -88,7 +89,7 @@ https://cgit.freedesktop.org/wayland/weston/commit/?id=
=3D
> 75b7197f
>                         "warning: no input devices on entering Weston. "
>  --- a/man/weston.ini.man
>  +++ b/man/weston.ini.man
> -@@ -169,6 +169,11 @@ time, the one specified in the command-l
> +@@ -168,6 +168,11 @@ time, the one specified in the command-l
>   hand, if none of these sets the value, default idle timeout will be
>   set to 300 seconds.
>   .RS
> diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.
> ac-Fix-wayland-protocols-path.patch b/meta/recipes-graphics/
> wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
> index edd3b91..39000d4 100644
> --- a/meta/recipes-graphics/wayland/weston/0001-configure.
> ac-Fix-wayland-protocols-path.patch
> +++ b/meta/recipes-graphics/wayland/weston/0001-configure.
> ac-Fix-wayland-protocols-path.patch
> @@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [lib
> +@@ -229,7 +229,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [lib
>   PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
>
> - PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >=3D 1.2],
> + PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >=3D 1.7],
>  -                [ac_wayland_protocols_pkgdatadir=3D`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-protocols`])
>  +                [ac_wayland_protocols_pkgdatadir=3D${WAYLAND_
> PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir
> wayland-protocols`])
>   AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portabl=
e.patch
> b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> index f7b5284..c41ea49 100644
> --- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> @@ -7,18 +7,18 @@ error() is not posix but gnu extension so may not be
> available on all
>  kind of systemsi e.g. musl.
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted
>
> - configure.ac        |    2 ++
> - src/weston-error.h  |   20 ++++++++++++++++++++
> - src/weston-launch.c |    2 +-
> +Upstream-Status: Submitted
> +---
> + configure.ac              |    2 ++
> + libweston/weston-error.h  |   20 ++++++++++++++++++++
> + libweston/weston-launch.c |    2 +-
>   3 files changed, 23 insertions(+), 1 deletion(-)
> - create mode 100644 src/weston-error.h
> + create mode 100644 libweston/weston-error.h
>
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -60,6 +60,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
> +@@ -102,6 +102,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
>               [[#include <time.h>]])
>   AC_CHECK_HEADERS([execinfo.h])
>
> @@ -28,7 +28,7 @@ Upstream-Status: Submitted
>
>   COMPOSITOR_MODULES=3D"wayland-server >=3D $WAYLAND_PREREQ_VERSION pixma=
n-1
> >=3D 0.25.2"
>  --- /dev/null
> -+++ b/src/weston-error.h
> ++++ b/libweston/weston-error.h
>  @@ -0,0 +1,20 @@
>  +#ifndef _WESTON_ERROR_H
>  +#define _WESTON_ERROR_H
> @@ -50,8 +50,8 @@ Upstream-Status: Submitted
>  +
>  +#endif
>  +
> ---- a/src/weston-launch.c
> -+++ b/src/weston-launch.c
> +--- a/libweston/weston-launch.c
> ++++ b/libweston/weston-launch.c
>  @@ -33,7 +33,6 @@
>   #include <poll.h>
>   #include <errno.h>
> diff --git a/meta/recipes-graphics/wayland/weston/0001-shared-
> include-stdint.h-for-int32_t.patch b/meta/recipes-graphics/
> wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
> deleted file mode 100644
> index ee66c20..0000000
> --- a/meta/recipes-graphics/wayland/weston/0001-shared-
> include-stdint.h-for-int32_t.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From ba02b8abe4e2afac2bfbf2559972d5059d75a041 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Sat, 16 Jul 2016 22:50:19 +0300
> -Subject: [PATCH weston] shared: include stdint.h for int32_t
> -
> -This fixes build on musl.
> -
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Upstream-Status: Submitted
> ----
> - shared/xalloc.h |    1 +
> - 1 file changed, 1 insertion(+)
> -
> ---- a/shared/xalloc.h
> -+++ b/shared/xalloc.h
> -@@ -30,6 +30,7 @@
> - extern "C" {
> - #endif
> -
> -+#include <stdint.h>
> - #include <stdlib.h>
> - #include <string.h>
> -
> diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-
> launch-Provide-a-default-version-that-doesn-t.patch
> b/meta/recipes-graphics/wayland/weston/0001-weston-
> launch-Provide-a-default-version-that-doesn-t.patch
> index d684b1c..3d12d53 100644
> --- a/meta/recipes-graphics/wayland/weston/0001-weston-
> launch-Provide-a-default-version-that-doesn-t.patch
> +++ b/meta/recipes-graphics/wayland/weston/0001-weston-
> launch-Provide-a-default-version-that-doesn-t.patch
> @@ -14,13 +14,13 @@ Upstream-Status: Pending
>
>  Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>  ---
> - configure.ac        |    9 +++++++--
> - src/weston-launch.c |   20 ++++++++++++++++++++
> + configure.ac              |    9 +++++++--
> + libweston/weston-launch.c |   20 ++++++++++++++++++++
>   2 files changed, 27 insertions(+), 2 deletions(-)
>
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -416,13 +416,17 @@ AC_ARG_ENABLE(resize-optimization,
> +@@ -441,13 +441,17 @@ AC_ARG_ENABLE(resize-optimization,
>   AS_IF([test "x$enable_resize_optimization" =3D "xyes"],
>         [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a
> performance optimization])])
>
> @@ -40,7 +40,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>   fi
>
>   AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" =3D "xyes")
> -@@ -673,6 +677,7 @@ AC_MSG_RESULT([
> +@@ -704,6 +708,7 @@ AC_MSG_RESULT([
>         Enable developer documentation  ${enable_devdocs}
>
>         weston-launch utility           ${enable_weston_launch}
> @@ -48,8 +48,8 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>         systemd-login support           ${have_systemd_login}
>         systemd notify support          ${enable_systemd_notify}
>
> ---- a/src/weston-launch.c
> -+++ b/src/weston-launch.c
> +--- a/libweston/weston-launch.c
> ++++ b/libweston/weston-launch.c
>  @@ -51,7 +51,9 @@
>
>   #include <pwd.h>
> @@ -103,7 +103,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>
>         if (ioctl(wl->tty, KDSKBMUTE, 0) &&
>             ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
> -@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl)
> +@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl,
>         setenv("HOME", wl->pw->pw_dir, 1);
>         setenv("SHELL", wl->pw->pw_shell, 1);
>
> @@ -111,15 +111,15 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com=
>
>         env =3D pam_getenvlist(wl->ph);
>         if (env) {
>                 for (i =3D 0; env[i]; ++i) {
> -@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl)
> +@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl,
>                 }
>                 free(env);
>         }
>  +#endif
> - }
>
> - static void
> -@@ -665,7 +675,9 @@ static void
> +       /*
> +        * We open a new session, so it makes sense
> +@@ -675,7 +685,9 @@ static void
>   help(const char *name)
>   {
>         fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n",
> name);
> @@ -129,7 +129,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>         fprintf(stderr, "  -t, --tty       Start session on alternative
> tty\n");
>         fprintf(stderr, "  -v, --verbose   Be verbose\n");
>         fprintf(stderr, "  -h, --help      Display this help message\n");
> -@@ -678,7 +690,9 @@ main(int argc, char *argv[])
> +@@ -688,7 +700,9 @@ main(int argc, char *argv[])
>         int i, c;
>         char *tty =3D NULL;
>         struct option opts[] =3D {
> @@ -139,7 +139,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>                 { "tty",     required_argument, NULL, 't' },
>                 { "verbose", no_argument,       NULL, 'v' },
>                 { "help",    no_argument,       NULL, 'h' },
> -@@ -690,9 +704,13 @@ main(int argc, char *argv[])
> +@@ -700,9 +714,13 @@ main(int argc, char *argv[])
>         while ((c =3D getopt_long(argc, argv, "u:t::vh", opts, &i)) !=3D =
-1) {
>                 switch (c) {
>                 case 'u':
> @@ -153,7 +153,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>                         break;
>                 case 't':
>                         tty =3D optarg;
> -@@ -732,8 +750,10 @@ main(int argc, char *argv[])
> +@@ -740,8 +758,10 @@ main(int argc, char *argv[])
>         if (setup_tty(&wl, tty) < 0)
>                 exit(EXIT_FAILURE);
>
> diff --git a/meta/recipes-graphics/wayland/weston_1.11.1.bb
> b/meta/recipes-graphics/wayland/weston_1.12.0.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/weston_1.11.1.bb
> rename to meta/recipes-graphics/wayland/weston_1.12.0.bb
> index 7e75cf7..f944646 100644
> --- a/meta/recipes-graphics/wayland/weston_1.11.1.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.12.0.bb
> @@ -3,20 +3,19 @@ DESCRIPTION =3D "Weston is the reference implementation=
 of
> a Wayland compositor"
>  HOMEPAGE =3D "http://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f95d3386a7acae780=
b70 \
> -                    file://src/compositor.c;endline=3D23;md5=3D
> 1d535fed266cf39f6d8c0647f52ac331"
> +                    file://libweston/compositor.c;endline=3D23;md5=3D
> 1d535fed266cf39f6d8c0647f52ac331"
>
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
>             file://weston.png \
>             file://weston.desktop \
>             file://0001-make-error-portable.patch \
>             file://0001-configure.ac-Fix-wayland-protocols-path.patch \
> -           file://0001-shared-include-stdint.h-for-int32_t.patch \
>             file://xwayland.weston-start \
>             file://0001-weston-launch-Provide-a-default-version-that-does=
n-t.patch
> \
>             file://0001-Add-configuration-option-for-no-input-device.patc=
h
> \
>  "
> -SRC_URI[md5sum] =3D "c5fdc02ab67d33c0fca8f72d341facdf"
> -SRC_URI[sha256sum] =3D "548973496a5c8613d6690f9120f210
> 66946a544df65ce4fe0ef153a8dc0bf6de"
> +SRC_URI[md5sum] =3D "310af6d7f8ba03c3418cec8ad72ea748"
> +SRC_URI[sha256sum] =3D "ac7ac2a32e3b9f50131fccded5d232
> 6bd36b2226712d90b61999118a09af5033"
>
>  inherit autotools pkgconfig useradd distro_features_check
>  # depends on virtual/egl
> @@ -26,7 +25,6 @@ DEPENDS =3D "libxkbcommon gdk-pixbuf pixman cairo glib-=
2.0
> jpeg"
>  DEPENDS +=3D "wayland wayland-protocols libinput virtual/egl pango
> wayland-native"
>
>  EXTRA_OECONF =3D "--enable-setuid-install \
> -                --disable-rpi-compositor \
>                  --disable-rdp-compositor \
>                  WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${STAGING_DIR}/${MACHINE=
} \
>                  "
> @@ -84,7 +82,7 @@ PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam=
"
>
>  do_install_append() {
>         # Weston doesn't need the .la files to load modules, so wipe them
> -       rm -f ${D}/${libdir}/weston/*.la
> +       rm -f ${D}/${libdir}/libweston-1/*.la
>
>         # If X11, ship a desktop file to launch it
>         if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '',
> d)}" =3D "x11" ]; then
> @@ -103,7 +101,7 @@ do_install_append() {
>  PACKAGE_BEFORE_PN +=3D "${@bb.utils.contains('PACKAGECONFIG', 'xwayland'=
,
> '${PN}-xwayland', '', d)}"
>  PACKAGES +=3D "${PN}-examples"
>
> -FILES_${PN} =3D "${bindir}/weston ${bindir}/weston-terminal
> ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode
> ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
> +FILES_${PN} =3D "${bindir}/weston ${bindir}/weston-terminal
> ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode
> ${libexecdir} ${libdir}/*${SOLIBS} ${libdir}/${BPN}/*.so
> ${libdir}/libweston-1/*.so ${datadir}"
>  FILES_${PN}-examples =3D "${bindir}/*"
>
>  FILES_${PN}-xwayland =3D "${libdir}/${BPN}/xwayland.so"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c092d6841f9640540dd1a57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 November 2016 at 15:54, Fathi Boudra <span dir=3D"ltr">&lt;<a href=3D"mail=
to:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@linaro.org">daniel.diaz=
@linaro.org</a>&gt;<br>
<br>
* Refresh patches to apply cleanly on 1.12.0 (no changes):<br>
=C2=A0 - 0001-make-error-portable.patch<br>
=C2=A0 - 0001-configure.ac-Fix-wayland-<wbr>protocols-path.patch<br>
=C2=A0 - 0001-weston-launch-Provide-a-<wbr>default-version-that-doesn-t.<wb=
r>patch<br>
=C2=A0 - 0001-Add-configuration-option-<wbr>for-no-input-device.patch<br>
* Remove 0001-shared-include-stdint.h-<wbr>for-int32_t.patch applied<br>
=C2=A0 upstream<br>
=C2=A0 <a href=3D"https://cgit.freedesktop.org/wayland/weston/commit/?id=3D=
649bbce6" rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org=
/<wbr>wayland/weston/commit/?id=3D<wbr>649bbce6</a><br>
* Update license files checksum, compositor.c location has changed.<br>
=C2=A0 No license changes.<br>
* Drop --disable-rpi-compositor from EXTRA_OE_CONF. Raspberry Pi backend<br=
>
=C2=A0 and renderer have been removed upstream. The option doesn&#39;t exis=
t<br>
=C2=A0 anymore.<br>
* Adjust files names to the new naming: weston -&gt; libweston-1.<br></bloc=
kquote><div><br></div><div>These changes look good to me. That said I think=
 we should start separating the package into weston (compositor shells, plu=
gins and essential tools) and libweston (the public libraries) at this poin=
t since upstream is now saying it should work. Can you do this as part of t=
he upgrade?</div><div><br></div><div>libweston should contain {libdir}/*.so=
.* as usual but I believe also {libdir}/libweston-1/* (the backends). The w=
eston plugins ({libdir}/weston/*) should stay in weston itself</div><div><b=
r></div><div>Cheers,</div><div>=C2=A0 Jussi</div><div><br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@linaro.or=
g">daniel.diaz@linaro.org</a>&gt;<br>
Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org">=
fathi.boudra@linaro.org</a>&gt;<br>
---<br>
=C2=A0...-configuration-option-for-<wbr>no-input-device.patch | 39 ++++++++=
+++-----------<br>
=C2=A0...1-configure.ac-Fix-wayland-<wbr>protocols-path.patch |=C2=A0 4 +--=
<br>
=C2=A0.../wayland/weston/0001-make-<wbr>error-portable.patch=C2=A0 | 20 +++=
++------<br>
=C2=A0.../0001-shared-include-<wbr>stdint.h-for-int32_t.patch | 23 --------=
-----<br>
=C2=A0...ch-Provide-a-default-<wbr>version-that-doesn-t.patch | 28 ++++++++=
--------<br>
=C2=A0.../wayland/{<a href=3D"http://weston_1.11.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">weston_1.11.1.bb</a> =3D&gt; <a href=3D"http://weston_1.12=
.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_1.12.0.bb</a>} | 12 +++-=
---<br>
=C2=A06 files changed, 51 insertions(+), 75 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/wayland/<wbr>weston/0001-sha=
red-include-<wbr>stdint.h-for-int32_t.patch<br>
=C2=A0rename meta/recipes-graphics/wayland/<wbr>{<a href=3D"http://weston_1=
.11.1.bb" rel=3D"noreferrer" target=3D"_blank">weston_1.11.1.bb</a> =3D&gt;=
 <a href=3D"http://weston_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">w=
eston_1.12.0.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/weston/0001-Add-<wbr>config=
uration-option-for-no-<wbr>input-device.patch b/meta/recipes-graphics/<wbr>=
wayland/weston/0001-Add-<wbr>configuration-option-for-no-<wbr>input-device.=
patch<br>
index c45f3ad..a822d4a 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/weston/0001-Add-<wbr>configuration=
-option-for-no-<wbr>input-device.patch<br>
+++ b/meta/recipes-graphics/<wbr>wayland/weston/0001-Add-<wbr>configuration=
-option-for-no-<wbr>input-device.patch<br>
@@ -31,24 +31,24 @@ Reviewed-by: Daniel Stone &lt;<a href=3D"mailto:daniels=
@collabora.com">daniels@collabora.com</a>&gt;<br>
=C2=A0Upstream-Status: backport from<br>
=C2=A0<a href=3D"https://cgit.freedesktop.org/wayland/weston/commit/?id=3D7=
5b7197f" rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/=
<wbr>wayland/weston/commit/?id=3D<wbr>75b7197f</a><br>
=C2=A0---<br>
- man/weston.ini.man=C2=A0 |=C2=A0 =C2=A0 5 +++++<br>
- src/compositor.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +++<br>
- src/libinput-seat.c |=C2=A0 =C2=A0 6 ++++++<br>
- src/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +++++<br>
- <a href=3D"http://weston.ini.in" rel=3D"noreferrer" target=3D"_blank">wes=
ton.ini.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
- 5 files changed, 20 insertions(+)<br>
+ compositor/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +++++=
<br>
+ libweston/compositor.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 ++++<br>
+ libweston/libinput-seat.c |=C2=A0 =C2=A0 6 ++++++<br>
+ man/weston.ini.man=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +++++<br>
+ <a href=3D"http://weston.ini.in" rel=3D"noreferrer" target=3D"_blank">wes=
ton.ini.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
+ 5 files changed, 21 insertions(+)<br>
<br>
---- a/src/main.c<br>
-+++ b/src/main.c<br>
-@@ -1298,6 +1298,7 @@ int main(int argc, char *argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wl_client *primary_client;<br>
+--- a/compositor/main.c<br>
++++ b/compositor/main.c<br>
+@@ -1595,6 +1595,7 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct wl_listener primary_client_destroyed;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct weston_seat *seat;<br>
-+=C2=A0 =C2=A0 =C2=A0 int require_input;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wet_compositor user_data;<br>
++=C2=A0 =C2=A0 =C2=A0 int require_input;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct weston_option core_options[] =3D {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { WESTON_OPTION_STR=
ING, &quot;backend&quot;, &#39;B&#39;, &amp;backend },<br>
-@@ -1373,6 +1374,10 @@ int main(int argc, char *argv[])<br>
+@@ -1678,6 +1679,10 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (weston_compositor_init_<wbr>config(ec, conf=
ig) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
<br>
@@ -59,21 +59,22 @@ <a href=3D"https://cgit.freedesktop.org/wayland/weston/=
commit/?id=3D75b7197f" rel=3D"noreferrer" target=3D"_blank">https://cgit.fr=
eedesktop.org/<wbr>wayland/weston/commit/?id=3D<wbr>75b7197f</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (load_backend(ec, backend, &amp;argc, argv, =
config) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 weston_log(&quot;fa=
tal: failed to create compositor backend\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
---- a/src/compositor.h<br>
-+++ b/src/compositor.h<br>
-@@ -803,6 +803,9 @@ struct weston_compositor {<br>
+--- a/libweston/compositor.h<br>
++++ b/libweston/compositor.h<br>
+@@ -836,6 +836,10 @@ struct weston_compositor {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *user_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void (*exit)(struct weston_compositor *c);<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 /* Whether to let the compositor run without an=
y input device. */<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 bool require_input;<br>
++<br>
=C2=A0 };<br>
<br>
=C2=A0 struct weston_buffer {<br>
---- a/src/libinput-seat.c<br>
-+++ b/src/libinput-seat.c<br>
-@@ -255,6 +255,12 @@ udev_input_enable(struct udev_input *inp<br>
+--- a/libweston/libinput-seat.c<br>
++++ b/libweston/libinput-seat.c<br>
+@@ -259,6 +259,12 @@ udev_input_enable(struct udev_input *inp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 devices_found =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -88,7 +89,7 @@ <a href=3D"https://cgit.freedesktop.org/wayland/weston/co=
mmit/?id=3D75b7197f" rel=3D"noreferrer" target=3D"_blank">https://cgit.free=
desktop.org/<wbr>wayland/weston/commit/?id=3D<wbr>75b7197f</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;warning: no input devices on entering Weston. &quot;<br>
=C2=A0--- a/man/weston.ini.man<br>
=C2=A0+++ b/man/weston.ini.man<br>
-@@ -169,6 +169,11 @@ time, the one specified in the command-l<br>
+@@ -168,6 +168,11 @@ time, the one specified in the command-l<br>
=C2=A0 hand, if none of these sets the value, default idle timeout will be<=
br>
=C2=A0 set to 300 seconds.<br>
=C2=A0 .RS<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/weston/0001-configure.<wbr>=
ac-Fix-wayland-protocols-path.<wbr>patch b/meta/recipes-graphics/<wbr>wayla=
nd/weston/0001-configure.<wbr>ac-Fix-wayland-protocols-path.<wbr>patch<br>
index edd3b91..39000d4 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/weston/0001-configure.<wbr>ac-Fix-=
wayland-protocols-path.<wbr>patch<br>
+++ b/meta/recipes-graphics/<wbr>wayland/weston/0001-configure.<wbr>ac-Fix-=
wayland-protocols-path.<wbr>patch<br>
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_<wbr>BACKEND, [lib<br>
+@@ -229,7 +229,7 @@ PKG_CHECK_MODULES(LIBINPUT_<wbr>BACKEND, [lib<br>
=C2=A0 PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])<br>
<br>
- PKG_CHECK_MODULES(WAYLAND_<wbr>PROTOCOLS, [wayland-protocols &gt;=3D 1.2]=
,<br>
+ PKG_CHECK_MODULES(WAYLAND_<wbr>PROTOCOLS, [wayland-protocols &gt;=3D 1.7]=
,<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ac_wayland_=
protocols_<wbr>pkgdatadir=3D`$PKG_CONFIG --variable=3Dpkgdatadir wayland-pr=
otocols`])<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ac_wayland_=
protocols_<wbr>pkgdatadir=3D${WAYLAND_<wbr>PROTOCOLS_SYSROOT_DIR}`$PKG_<wbr=
>CONFIG --variable=3Dpkgdatadir wayland-protocols`])<br>
=C2=A0 AC_SUBST(WAYLAND_PROTOCOLS_<wbr>DATADIR, $ac_wayland_protocols_<wbr>=
pkgdatadir)<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/weston/0001-make-<wbr>error=
-portable.patch b/meta/recipes-graphics/<wbr>wayland/weston/0001-make-<wbr>=
error-portable.patch<br>
index f7b5284..c41ea49 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/weston/0001-make-<wbr>error-portab=
le.patch<br>
+++ b/meta/recipes-graphics/<wbr>wayland/weston/0001-make-<wbr>error-portab=
le.patch<br>
@@ -7,18 +7,18 @@ error() is not posix but gnu extension so may not be avai=
lable on all<br>
=C2=A0kind of systemsi e.g. musl.<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted<br>
<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 ++<br>
- src/weston-error.h=C2=A0 |=C2=A0 =C2=A020 ++++++++++++++++++++<br>
- src/weston-launch.c |=C2=A0 =C2=A0 2 +-<br>
+Upstream-Status: Submitted<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 2 ++<br>
+ libweston/weston-error.h=C2=A0 |=C2=A0 =C2=A020 ++++++++++++++++++++<br>
+ libweston/weston-launch.c |=C2=A0 =C2=A0 2 +-<br>
=C2=A0 3 files changed, 23 insertions(+), 1 deletion(-)<br>
- create mode 100644 src/weston-error.h<br>
+ create mode 100644 libweston/weston-error.h<br>
<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -60,6 +60,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,<wbr>[],<br>
+@@ -102,6 +102,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,<wbr>[],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#include &lt;time.h&gt;]=
])<br>
=C2=A0 AC_CHECK_HEADERS([execinfo.h])<br>
<br>
@@ -28,7 +28,7 @@ Upstream-Status: Submitted<br>
<br>
=C2=A0 COMPOSITOR_MODULES=3D&quot;wayland-<wbr>server &gt;=3D $WAYLAND_PRER=
EQ_VERSION pixman-1 &gt;=3D 0.25.2&quot;<br>
=C2=A0--- /dev/null<br>
-+++ b/src/weston-error.h<br>
++++ b/libweston/weston-error.h<br>
=C2=A0@@ -0,0 +1,20 @@<br>
=C2=A0+#ifndef _WESTON_ERROR_H<br>
=C2=A0+#define _WESTON_ERROR_H<br>
@@ -50,8 +50,8 @@ Upstream-Status: Submitted<br>
=C2=A0+<br>
=C2=A0+#endif<br>
=C2=A0+<br>
---- a/src/weston-launch.c<br>
-+++ b/src/weston-launch.c<br>
+--- a/libweston/weston-launch.c<br>
++++ b/libweston/weston-launch.c<br>
=C2=A0@@ -33,7 +33,6 @@<br>
=C2=A0 #include &lt;poll.h&gt;<br>
=C2=A0 #include &lt;errno.h&gt;<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/weston/0001-shared-<wbr>inc=
lude-stdint.h-for-int32_t.<wbr>patch b/meta/recipes-graphics/<wbr>wayland/w=
eston/0001-shared-<wbr>include-stdint.h-for-int32_t.<wbr>patch<br>
deleted file mode 100644<br>
index ee66c20..0000000<br>
--- a/meta/recipes-graphics/<wbr>wayland/weston/0001-shared-<wbr>include-st=
dint.h-for-int32_t.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-From ba02b8abe4e2afac2bfbf2559972d5<wbr>059d75a041 Mon Sep 17 00:00:00 200=
1<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
-Date: Sat, 16 Jul 2016 22:50:19 +0300<br>
-Subject: [PATCH weston] shared: include stdint.h for int32_t<br>
-<br>
-This fixes build on musl.<br>
-<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
-Upstream-Status: Submitted<br>
----<br>
- shared/xalloc.h |=C2=A0 =C2=A0 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
---- a/shared/xalloc.h<br>
-+++ b/shared/xalloc.h<br>
-@@ -30,6 +30,7 @@<br>
- extern &quot;C&quot; {<br>
- #endif<br>
-<br>
-+#include &lt;stdint.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;string.h&gt;<br>
-<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/weston/0001-weston-<wbr>lau=
nch-Provide-a-default-<wbr>version-that-doesn-t.patch b/meta/recipes-graphi=
cs/<wbr>wayland/weston/0001-weston-<wbr>launch-Provide-a-default-<wbr>versi=
on-that-doesn-t.patch<br>
index d684b1c..3d12d53 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/weston/0001-weston-<wbr>launch-Pro=
vide-a-default-<wbr>version-that-doesn-t.patch<br>
+++ b/meta/recipes-graphics/<wbr>wayland/weston/0001-weston-<wbr>launch-Pro=
vide-a-default-<wbr>version-that-doesn-t.patch<br>
@@ -14,13 +14,13 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.=
com">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0---<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +++++++--<br>
- src/weston-launch.c |=C2=A0 =C2=A020 ++++++++++++++++++++<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 9 +++++++--<br>
+ libweston/weston-launch.c |=C2=A0 =C2=A020 ++++++++++++++++++++<br>
=C2=A0 2 files changed, 27 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -416,13 +416,17 @@ AC_ARG_ENABLE(resize-<wbr>optimization,<br>
+@@ -441,13 +441,17 @@ AC_ARG_ENABLE(resize-<wbr>optimization,<br>
=C2=A0 AS_IF([test &quot;x$enable_resize_optimization&quot; =3D &quot;xyes&=
quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize =
memory pool as a performance optimization])])<br>
<br>
@@ -40,7 +40,7 @@ Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.ho=
chstein@nxp.com">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0 fi<br>
<br>
=C2=A0 AM_CONDITIONAL(HAVE_PANGO, test &quot;x$have_pango&quot; =3D &quot;x=
yes&quot;)<br>
-@@ -673,6 +677,7 @@ AC_MSG_RESULT([<br>
+@@ -704,6 +708,7 @@ AC_MSG_RESULT([<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable developer documentation=C2=A0 ${enable_d=
evdocs}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 weston-launch utility=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${enable_weston_launch}<br>
@@ -48,8 +48,8 @@ Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.ho=
chstein@nxp.com">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd-login support=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${have_systemd_login}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd notify support=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${enable_systemd_notify}<br>
<br>
---- a/src/weston-launch.c<br>
-+++ b/src/weston-launch.c<br>
+--- a/libweston/weston-launch.c<br>
++++ b/libweston/weston-launch.c<br>
=C2=A0@@ -51,7 +51,9 @@<br>
<br>
=C2=A0 #include &lt;pwd.h&gt;<br>
@@ -103,7 +103,7 @@ Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.=
hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(wl-&gt;tty, KDSKBMUTE, 0) &amp;&amp;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ioctl(wl-&gt;tty, KDSKBMODE, wl-&=
gt;kb_mode))<br>
-@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl)<br>
+@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv(&quot;HOME&quot;, wl-&gt;pw-&gt;pw_dir, =
1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv(&quot;SHELL&quot;, wl-&gt;pw-&gt;pw_shel=
l, 1);<br>
<br>
@@ -111,15 +111,15 @@ Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:to=
m.hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D pam_getenvlist(wl-&gt;ph);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; env[i=
]; ++i) {<br>
-@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl)<br>
+@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(env);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+#endif<br>
- }<br>
<br>
- static void<br>
-@@ -665,7 +675,9 @@ static void<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We open a new session, so it makes sense<br>
+@@ -675,7 +685,9 @@ static void<br>
=C2=A0 help(const char *name)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Usage: %s [args...] [-- [=
weston args..]]\n&quot;, name);<br>
@@ -129,7 +129,7 @@ Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.=
hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 -t, --tty=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Start session on alternative tty\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 -v, --verbose=C2=
=A0 =C2=A0Be verbose\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 -h, --help=C2=A0 =
=C2=A0 =C2=A0 Display this help message\n&quot;);<br>
-@@ -678,7 +690,9 @@ main(int argc, char *argv[])<br>
+@@ -688,7 +700,9 @@ main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, c;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *tty =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct option opts[] =3D {<br>
@@ -139,7 +139,7 @@ Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.=
hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;tty&quot;,=
=C2=A0 =C2=A0 =C2=A0required_argument, NULL, &#39;t&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;verbose&quo=
t;, no_argument,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;v&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;help&quot;,=
=C2=A0 =C2=A0 no_argument,=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &#39;h&#39; },<b=
r>
-@@ -690,9 +704,13 @@ main(int argc, char *argv[])<br>
+@@ -700,9 +714,13 @@ main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((c =3D getopt_long(argc, argv, &quot;u:t=
::vh&quot;, opts, &amp;i)) !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (c) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;u&#39;:<b=
r>
@@ -153,7 +153,7 @@ Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.=
hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;t&#39;:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tty =3D optarg;<br>
-@@ -732,8 +750,10 @@ main(int argc, char *argv[])<br>
+@@ -740,8 +758,10 @@ main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setup_tty(&amp;wl, tty) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);=
<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_1.=
11.1.bb" rel=3D"noreferrer" target=3D"_blank">weston_1.11.1.bb</a> b/meta/r=
ecipes-graphics/<wbr>wayland/<a href=3D"http://weston_1.12.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">weston_1.12.0.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-graphics/wayland/<a href=3D"http://weston_1.11.1.b=
b" rel=3D"noreferrer" target=3D"_blank"><wbr>weston_1.11.1.bb</a><br>
rename to meta/recipes-graphics/wayland/<a href=3D"http://weston_1.12.0.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>weston_1.12.0.bb</a><br>
index 7e75cf7..f944646 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_1.11.1.bb=
" rel=3D"noreferrer" target=3D"_blank">weston_1.11.1.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_1.12.0.bb=
" rel=3D"noreferrer" target=3D"_blank">weston_1.12.0.bb</a><br>
@@ -3,20 +3,19 @@ DESCRIPTION =3D &quot;Weston is the reference implementat=
ion of a Wayland compositor&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://wayland.freedesktop.org" rel=3D"=
noreferrer" target=3D"_blank">http://wayland.freedesktop.<wbr>org</a>&quot;=
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>d79ee9e66bb0f95d=
3386a7acae780b<wbr>70 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/compositor.c;<wbr>endline=3D23;md5=3D<wbr>1d535fed266cf39f6d8c0647f5=
2ac3<wbr>31&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://libweston/compositor.c;<wbr>endline=3D23;md5=3D<wbr>1d535fed266cf39f6d8c=
0647f52ac3<wbr>31&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.org/releases=
/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wayland.=
freedesktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://weston.png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://weston.desktop \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-make-error-<wbr>porta=
ble.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.ac-Fix-<wbr=
>wayland-protocols-path.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-shared-include-<wbr>s=
tdint.h-for-int32_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://xwayland.weston-start \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-weston-launch-<wbr>Pr=
ovide-a-default-version-<wbr>that-doesn-t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-configuration-<wb=
r>option-for-no-input-device.<wbr>patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>c5fdc02ab67d33c0fca8f72d341fac<wbr>df&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>548973496a5c8613d6690f9120f210<wbr>66946=
a544df65ce4fe0ef153a8dc0b<wbr>f6de&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>310af6d7f8ba03c3418cec8ad72ea7<wbr>48&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>ac7ac2a32e3b9f50131fccded5d232<wbr>6bd36=
b2226712d90b61999118a09af<wbr>5033&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig useradd distro_features_check<br>
=C2=A0# depends on virtual/egl<br>
@@ -26,7 +25,6 @@ DEPENDS =3D &quot;libxkbcommon gdk-pixbuf pixman cairo gl=
ib-2.0 jpeg&quot;<br>
=C2=A0DEPENDS +=3D &quot;wayland wayland-protocols libinput virtual/egl pan=
go wayland-native&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-setuid-install \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-rpi-comp=
ositor \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-rdp=
-compositor \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROTO=
COLS_SYSROOT_DIR=3D<wbr>${STAGING_DIR}/${MACHINE} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -84,7 +82,7 @@ PACKAGECONFIG[pam] =3D &quot;--with-pam,--without-pam,<wb=
r>libpam&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Weston doesn&#39;t need the .la files to load=
 modules, so wipe them<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/weston/*.la<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/libweston-1/*.<wbr>la<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If X11, ship a desktop file to launch it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${@bb.utils.contains(&#39;DISTRO_<wb=
r>FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;&#39;, d)}&quot; =3D &q=
uot;x11&quot; ]; then<br>
@@ -103,7 +101,7 @@ do_install_append() {<br>
=C2=A0PACKAGE_BEFORE_PN +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECO=
NFIG&#39;, &#39;xwayland&#39;, &#39;${PN}-xwayland&#39;, &#39;&#39;, d)}&qu=
ot;<br>
=C2=A0PACKAGES +=3D &quot;${PN}-examples&quot;<br>
<br>
-FILES_${PN} =3D &quot;${bindir}/weston ${bindir}/weston-terminal ${bindir}=
/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${=
libdir}/${BPN}/*.so ${datadir}&quot;<br>
+FILES_${PN} =3D &quot;${bindir}/weston ${bindir}/weston-terminal ${bindir}=
/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${=
libdir}/*${SOLIBS} ${libdir}/${BPN}/*.so ${libdir}/libweston-1/*.so ${datad=
ir}&quot;<br>
=C2=A0FILES_${PN}-examples =3D &quot;${bindir}/*&quot;<br>
<br>
=C2=A0FILES_${PN}-xwayland =3D &quot;${libdir}/${BPN}/xwayland.so&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c092d6841f9640540dd1a57--
