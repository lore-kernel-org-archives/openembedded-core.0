Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFC0C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 10:22:08 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.4929.1634984526924995498
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 03:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 448F3240005;
	Sat, 23 Oct 2021 10:22:03 +0000 (UTC)
Date: Sat, 23 Oct 2021 12:22:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] meson.bblcass: Remove empty egg-info
 directories before running meson
Message-ID: <YXPiS+J7K/xx3Kp+@piout.net>
References: <20211020141104.27627-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211020141104.27627-1-pkj@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 10:22:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157301

Hello Peter,

This causes issues with qemux86-world-alt builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2232/ste=
ps/11/logs/stdio

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemux86-w=
orld-alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-r0/temp/log=
=2Edo_configure.24847
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-work=
er/qemux86-world-alt/build/meta/recipes-gnome/gobject-introspection/gobject=
-introspection_1.70.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worke=
r/qemux86-world-alt/build/meta/recipes-gnome/gobject-introspection/gobject-=
introspection_1.70.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybui=
ld/yocto-worker/qemux86-world-alt/build/meta/recipes-devtools/meson/meson_0=
=2E59.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-work=
er/qemux86-world-alt/build/meta/recipes-devtools/python/python3_3.10.0.bb:d=
o_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/qemux86-w=
orld-alt/build/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb:do_populate_sy=
sroot', 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-alt/buil=
d/meta/recipes-devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot', '/home/=
pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-graphics/xorg-l=
ib/libxft_2.3.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qemu=
x86-world-alt/build/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_popula=
te_sysroot', '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/rec=
ipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot', '/home/pokybuil=
d/yocto-worker/qemux86-world-alt/build/meta/recipes-devtools/gcc/gcc-cross_=
11.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qemux86-world-a=
lt/build/meta/recipes-graphics/freetype/freetype_2.11.0.bb:do_populate_sysr=
oot', 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-alt/build/=
meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pok=
ybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-devtools/quilt/qui=
lt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qemux=
86-world-alt/build/meta/recipes-devtools/qemu/qemu-native_6.1.0.bb:do_popul=
ate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-al=
t/build/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot', =
'/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-support/=
fribidi/fribidi_1.0.11.bb:do_populate_sysroot', 'virtual:native:/home/pokyb=
uild/yocto-worker/qemux86-world-alt/build/meta/recipes-devtools/patch/patch=
_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qemux86-world=
-alt/build/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysro=
ot', 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-alt/build/m=
eta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/hom=
e/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-graphics/font=
config/fontconfig_2.13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo=
rker/qemux86-world-alt/build/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb:=
do_populate_sysroot', '/home/pokybuild/yocto-worker/qemux86-world-alt/build=
/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/p=
okybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-graphics/harfbuz=
z/harfbuzz_3.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qem=
ux86-world-alt/build/meta/recipes-core/glibc/glibc_2.34.bb:do_populate_sysr=
oot', 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-alt/build/=
meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot', 'virtua=
l:native:/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-=
extended/xz/xz_5.2.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gobject-introspection-nati=
ve', 'gobject-introspection', 'meson-native', 'python3-native', 'glib-2.0-n=
ative', 'ninja-native', 'libxft', 'gi-docgen', 'gcc-runtime', 'gcc-cross-x8=
6_64', 'freetype', 'pseudo-native', 'quilt-native', 'qemu-native', 'prelink=
-native', 'fribidi', 'patch-native', 'libx11', 'pkgconfig-native', 'fontcon=
fig', 'glib-2.0', 'cairo', 'harfbuzz', 'glibc', 'gi-docgen-native', 'xz-nat=
ive', 'zlib-native', 'libffi-native', 'flex-native', 'gtk-doc-native', 'lib=
ffi', 'zlib', 'python3', 'autoconf-archive', 'opkg-utils', 'python3-setupto=
ols-native', 'libnsl2-native', 'libtirpc-native', 'gdbm-native', 'openssl-n=
ative', 'readline-native', 'sqlite3-native', 'bzip2-native', 'util-linux-na=
tive', 'libtool-native', 'gettext-minimal-native', 'libpcre-native', 'gette=
xt-native', 're2c-native', 'util-macros', 'libxrender', 'libgcc', 'linux-li=
bc-headers', 'libmpc-native', 'mpfr-native', 'binutils-cross-x86_64', 'gnu-=
config-native', 'texinfo-dummy-native', 'gmp-native', 'libpng', 'binutils-n=
ative', 'elfutils-native', 'libsm', 'mesa', 'libxext', 'pixman', 'libxcb', =
'attr-native', 'xorgproto', 'xtrans', 'expat', 'util-linux', 'gtk-doc', 'db=
us', 'libpcre', 'bash-completion', 'icu', 'python3-toml-native', 'python3-t=
ypogrify-native', 'python3-markupsafe-native', 'python3-markdown-native', '=
python3-jinja2-native', 'python3-pygments-native', 'm4-native', 'xmlto-nati=
ve', 'libxslt-native', 'python3-six-native', 'xz', 'openssl', 'sqlite3', 'r=
eadline', 'libtirpc', 'libxcrypt', 'gdbm', 'libnsl2', 'bzip2', 'perl-native=
', 'ncurses-native', 'libpcre2-native', 'libcap-ng-native', 'util-linux-lib=
uuid-native', 'libmicrohttpd-native', 'curl-native', 'libarchive-native', '=
libice', 'libdrm', 'wayland-protocols', 'libxxf86vm', 'libxdamage', 'libxsh=
mfence', 'libxfixes', 'xrandr', 'wayland', 'libpthread-stubs', 'libxdmcp', =
'xcb-proto', 'libxau', 'ncurses', 'libpam', 'libcap-ng', 'util-linux-libuui=
d', 'python3-six', 'python3-pygments', 'shadow', 'base-passwd', 'shadow-nat=
ive', 'base-files', 'systemd', 'shadow-sysroot', 'python3-smartypants-nativ=
e', 'docbook-xsl-stylesheets-native', 'libxml2-native', 'docbook-xml-dtd4-n=
ative', 'perlcross-native', 'libgcrypt-native', 'gnutls-native', 'e2fsprogs=
-native', 'zstd-native', 'lzo-native', 'libpciaccess', 'libxrandr', 'libxml=
2', 'cracklib', 'flex', 'attr', 'acl', 'libseccomp', 'zstd', 'kmod', 'libxk=
bcommon', 'libcap', 'libgpg-error-native', 'libcap-native', 'libunistring-n=
ative', 'libidn2-native', 'nettle-native', 'xkeyboard-config', 'gperf-nativ=
e']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| rmdir: failed to remove '/home/pokybuild/yocto-worker/qemux86-world-alt/b=
uild/build/tmp/work/core2-64-poky-linux/pango/1.48.10-r0/recipe-sysroot-nat=
ive/usr/lib/python3.10/site-packages/smartypants-2.0.0-py3.10.egg-info': No=
t a directory
| WARNING: /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/w=
ork/core2-64-poky-linux/pango/1.48.10-r0/temp/run.do_configure.24847:172 ex=
it 1 from 'rmdir --ignore-fail-on-non-empty /home/pokybuild/yocto-worker/qe=
mux86-world-alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-r0/r=
ecipe-sysroot-native/usr/lib/python3.10/site-packages/*.egg-info'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_configure, /home/pokybuild/yocto-worker/qemux86-world-alt/b=
uild/build/tmp/work/core2-64-poky-linux/pango/1.48.10-r0/temp/run.do_config=
ure.24847, line 172
| 	#2: do_configure, /home/pokybuild/yocto-worker/qemux86-world-alt/build/b=
uild/tmp/work/core2-64-poky-linux/pango/1.48.10-r0/temp/run.do_configure.24=
847, line 157
| 	#3: main, /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp=
/work/core2-64-poky-linux/pango/1.48.10-r0/temp/run.do_configure.24847, lin=
e 203

On 20/10/2021 16:11:04+0200, Peter Kjellerstedt wrote:
> sstate.bbclass no longer removes empty directories to avoid a race (see
> commit 4f94d929 "sstate/staging: Handle directory creation race issue").
> Unfortunately Python apparently treats an empty egg-info directory as if
> the version it previously contained still exists and fails if a newer
> version is required, which Meson does. To avoid this, make sure there
> are no empty egg-info directories from previous versions left behind.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> RP: This is the solution I came up with regarding our discussion at the
> meeting yesterday. With this in place the upgrade to meson 0.59.1 now
> went without a hitch.
>=20
>  meta/classes/meson.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index e124d18144..d07b34fc5e 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -103,6 +103,14 @@ meson_do_configure() {
>      # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e5991=
6c18901cde90fa2b3
>      unset LD
> =20
> +    # sstate.bbclass no longer removes empty directories to avoid a race=
 (see
> +    # commit 4f94d929 "sstate/staging: Handle directory creation race is=
sue").
> +    # Unfortunately Python apparently treats an empty egg-info directory=
 as if
> +    # the version it previously contained still exists and fails if a ne=
wer
> +    # version is required, which Meson does. To avoid this, make sure th=
ere are
> +    # no empty egg-info directories from previous versions left behind.
> +    rmdir --ignore-fail-on-non-empty ${STAGING_LIBDIR_NATIVE}/${PYTHON_D=
IR}/site-packages/*.egg-info
> +
>      # Work around "Meson fails if /tmp is mounted with noexec #2972"
>      mkdir -p "${B}/meson-private/tmp"
>      export TMPDIR=3D"${B}/meson-private/tmp"

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157262): https://lists.openembedded.org/g/openembedde=
d-core/message/157262
> Mute This Topic: https://lists.openembedded.org/mt/86465686/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

