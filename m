Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208D8C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 13:55:15 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.32435.1635170113347603406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 06:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=HWbuK06x;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635170113;
  x=1666706113;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nPQKV7g0Sz9YVnvLnwTZIcVPg/JSEVo3SP3TalULGkw=;
  b=HWbuK06xa2gZa2XmjTPW5uzIMRYnpN70m5trNZ9LtTg2BfoUxmChc+Of
   5fimTAw2WHxacM2SDFBixGl2NVKlTseAKBFMB6IVhnFrqAFPZpnjCJvo2
   NuLarFvaqZbrVCuoXC70ppwwd723a/jmiKTLnXUn19C5MFSCt//bKqmzb
   kT442Y/NEvri8GQRrxJRd+guLXz5uQXE77uf/Ax7Jq6SQzXH8sQBE2woS
   Lw6W6SFunrpgGof4K9bzKgWr44Yu2boVKdRnpEj06ZRm0ZLXk5EQHfTU7
   ovFtjjAO2LCsFgYvtys1ftwnNVz1yPZdZI3Gge3Sf5B07Q1w7k0xy99zN
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] meson.bblcass: Remove empty egg-info
 directories before running meson
Thread-Topic: [OE-core] [PATCH] meson.bblcass: Remove empty egg-info
 directories before running meson
Thread-Index: AQHXx/fSEAcpuWZj5Ey4HYqa4qEPoqvjuE3g
Date: Mon, 25 Oct 2021 13:55:10 +0000
Message-ID: <f3546b1eaedf4f69aee66c037c1acf84@axis.com>
References: <20211020141104.27627-1-pkj@axis.com> <YXPiS+J7K/xx3Kp+@piout.net>
In-Reply-To: <YXPiS+J7K/xx3Kp+@piout.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 13:55:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157338

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: den 23 oktober 2021 12:22
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] meson.bblcass: Remove empty egg-info
> directories before running meson
>=20
> Hello Peter,
>=20
> This causes issues with qemux86-world-alt builds:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2232/s=
t
> eps/11/logs/stdio
>=20
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemux86=
-
> world-alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-
> r0/temp/log.do_configure.24847
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-
> worker/qemux86-world-alt/build/meta/recipes-gnome/gobject-
> introspection/gobject-introspection_1.70.0.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> gnome/gobject-introspection/gobject-
> introspection_1.70.0.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-
> devtools/meson/meson_0.59.2.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-
> devtools/python/python3_3.10.0.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-core/glib-2.0/glib-
> 2.0_2.70.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto=
-
> worker/qemux86-world-alt/build/meta/recipes-
> devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> graphics/freetype/freetype_2.11.0.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot'=
,
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> devtools/qemu/qemu-native_6.1.0.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-
> devtools/prelink/prelink_git.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot'=
,
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-
> devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> core/glib-2.0/glib-2.0_2.70.0.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> graphics/harfbuzz/harfbuzz_3.0.0.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-
> core/glibc/glibc_2.34.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/meta/recipes-gnome/gi-docgen/gi-
> docgen_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto=
-
> worker/qemux86-world-alt/build/meta/recipes-
> extended/xz/xz_5.2.5.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['gobject-introspection-
> native', 'gobject-introspection', 'meson-native', 'python3-native', 'glib=
-
> 2.0-native', 'ninja-native', 'libxft', 'gi-docgen', 'gcc-runtime', 'gcc-
> cross-x86_64', 'freetype', 'pseudo-native', 'quilt-native', 'qemu-native'=
,
> 'prelink-native', 'fribidi', 'patch-native', 'libx11', 'pkgconfig-native'=
,
> 'fontconfig', 'glib-2.0', 'cairo', 'harfbuzz', 'glibc', 'gi-docgen-
> native', 'xz-native', 'zlib-native', 'libffi-native', 'flex-native', 'gtk=
-
> doc-native', 'libffi', 'zlib', 'python3', 'autoconf-archive', 'opkg-
> utils', 'python3-setuptools-native', 'libnsl2-native', 'libtirpc-native',
> 'gdbm-native', 'openssl-native', 'readline-native', 'sqlite3-native',
> 'bzip2-native', 'util-linux-native', 'libtool-native', 'gettext-minimal-
> native', 'libpcre-native', 'gettext-native', 're2c-native', 'util-macros'=
,
> 'libxrender', 'libgcc', 'linux-libc-headers', 'libmpc-native', 'mpfr-
> native', 'binutils-cross-x86_64', 'gnu-config-native', 'texinfo-dummy-
> native', 'gmp-native', 'libpng', 'binutils-native', 'elfutils-native',
> 'libsm', 'mesa', 'libxext', 'pixman', 'libxcb', 'attr-native',
> 'xorgproto', 'xtrans', 'expat', 'util-linux', 'gtk-doc', 'dbus',
> 'libpcre', 'bash-completion', 'icu', 'python3-toml-native', 'python3-
> typogrify-native', 'python3-markupsafe-native', 'python3-markdown-native'=
,
> 'python3-jinja2-native', 'python3-pygments-native', 'm4-native', 'xmlto-
> native', 'libxslt-native', 'python3-six-native', 'xz', 'openssl',
> 'sqlite3', 'readline', 'libtirpc', 'libxcrypt', 'gdbm', 'libnsl2',
> 'bzip2', 'perl-native', 'ncurses-native', 'libpcre2-native', 'libcap-ng-
> native', 'util-linux-libuuid-native', 'libmicrohttpd-native', 'curl-
> native', 'libarchive-native', 'libice', 'libdrm', 'wayland-protocols',
> 'libxxf86vm', 'libxdamage', 'libxshmfence', 'libxfixes', 'xrandr',
> 'wayland', 'libpthread-stubs', 'libxdmcp', 'xcb-proto', 'libxau',
> 'ncurses', 'libpam', 'libcap-ng', 'util-linux-libuuid', 'python3-six',
> 'python3-pygments', 'shadow', 'base-passwd', 'shadow-native', 'base-
> files', 'systemd', 'shadow-sysroot', 'python3-smartypants-native',
> 'docbook-xsl-stylesheets-native', 'libxml2-native', 'docbook-xml-dtd4-
> native', 'perlcross-native', 'libgcrypt-native', 'gnutls-native',
> 'e2fsprogs-native', 'zstd-native', 'lzo-native', 'libpciaccess',
> 'libxrandr', 'libxml2', 'cracklib', 'flex', 'attr', 'acl', 'libseccomp',
> 'zstd', 'kmod', 'libxkbcommon', 'libcap', 'libgpg-error-native', 'libcap-
> native', 'libunistring-native', 'libidn2-native', 'nettle-native',
> 'xkeyboard-config', 'gperf-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_configure
> | rmdir: failed to remove '/home/pokybuild/yocto-worker/qemux86-world-
> alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-r0/recipe-
> sysroot-native/usr/lib/python3.10/site-packages/smartypants-2.0.0-
> py3.10.egg-info': Not a directory

Stupid me assuming that all egg-info are directories. I will send an=20
updated patch.

//Peter

> | WARNING: /home/pokybuild/yocto-worker/qemux86-world-
> alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-
> r0/temp/run.do_configure.24847:172 exit 1 from 'rmdir --ignore-fail-on-
> non-empty /home/pokybuild/yocto-worker/qemux86-world-
> alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-r0/recipe-
> sysroot-native/usr/lib/python3.10/site-packages/*.egg-info'
> | WARNING: Backtrace (BB generated script):
> | 	#1: meson_do_configure, /home/pokybuild/yocto-worker/qemux86-
> world-alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-
> r0/temp/run.do_configure.24847, line 172
> | 	#2: do_configure, /home/pokybuild/yocto-worker/qemux86-world-
> alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-
> r0/temp/run.do_configure.24847, line 157
> | 	#3: main, /home/pokybuild/yocto-worker/qemux86-world-
> alt/build/build/tmp/work/core2-64-poky-linux/pango/1.48.10-
> r0/temp/run.do_configure.24847, line 203
>=20
> On 20/10/2021 16:11:04+0200, Peter Kjellerstedt wrote:
> > sstate.bbclass no longer removes empty directories to avoid a race (see
> > commit 4f94d929 "sstate/staging: Handle directory creation race issue")=
.
> > Unfortunately Python apparently treats an empty egg-info directory as i=
f
> > the version it previously contained still exists and fails if a newer
> > version is required, which Meson does. To avoid this, make sure there
> > are no empty egg-info directories from previous versions left behind.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >
> > RP: This is the solution I came up with regarding our discussion at the
> > meeting yesterday. With this in place the upgrade to meson 0.59.1 now
> > went without a hitch.
> >
> >  meta/classes/meson.bbclass | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index e124d18144..d07b34fc5e 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -103,6 +103,14 @@ meson_do_configure() {
> >      #
> https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901=
c
> de90fa2b3
> >      unset LD
> >
> > +    # sstate.bbclass no longer removes empty directories to avoid a
> race (see
> > +    # commit 4f94d929 "sstate/staging: Handle directory creation race
> issue").
> > +    # Unfortunately Python apparently treats an empty egg-info
> directory as if
> > +    # the version it previously contained still exists and fails if a
> newer
> > +    # version is required, which Meson does. To avoid this, make sure
> there are
> > +    # no empty egg-info directories from previous versions left behind=
.
> > +    rmdir --ignore-fail-on-non-empty
> ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info
> > +
> >      # Work around "Meson fails if /tmp is mounted with noexec #2972"
> >      mkdir -p "${B}/meson-private/tmp"
> >      export TMPDIR=3D"${B}/meson-private/tmp"
>=20
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157262):
> https://lists.openembedded.org/g/openembedded-core/message/157262
> > Mute This Topic: https://lists.openembedded.org/mt/86465686/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

