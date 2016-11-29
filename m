Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 92BDC71AAE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:12:22 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so17239665wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BBcZyl+m+rXTk2X3IbVQfHgMXkQP9+5IpqLBctLuaE4=;
	b=tlSg7+PBUaYBxrUhWWa6sjZmTkfez12HfgVNWnCw7poA7BtwFkQxCZNmmf8f5QwdBV
	fCG2zXoyR/byMQpSIE8P76gISqCZSw+bDKXwCBcMXtRGkmUxU57LQ9Rv9Ap5+kiwHv9w
	dh7ftrnZen0D7JsKOM5UWSuxalbSexYgfjNu/wFC96PaB0W2D7qLTOi38Du+Lz+cifi0
	C1aTnHY4aEol4E7Fs4DM1c+OwtFpHFvo6t9Xz3g5NaZbmn4R4scHi2nhf03MVU8v6IKf
	EyYDoCrk925F7PKL3zYJxe49pYnuUwKsGFNYnFCwFqjud/ZQGyxAmQzi2Bq8Rs9LQFSg
	jBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BBcZyl+m+rXTk2X3IbVQfHgMXkQP9+5IpqLBctLuaE4=;
	b=EEgw9aubwa+gSk3+Io56DBcnpfyvh+0ryozko9Vg0RyiCH565CMqBI80jbkq6NuUb6
	plz8rAW75uhqtzH7sYN9rWivxUhc4kcu+YB7dnpphebU9QoY2jNmHppGO9gwhbADpqJU
	U9lt94KrYWPGvVghENUrUhNLWGHJgh3ku8u+ySnResAf2F2sLO4tASHuhdtAm8xToogw
	SSl9XvV/VoRrDX1dzMZSfxbkFWsCoUAEiqzUzNH0YlpVacpjIsxcGbRG5I8xxOpytxdY
	sOo4L3VJ1voWry0ZrBVIZQ45Z60p0k3GonbzJboPrI630bZWmXQm0Eqig9gx9LZXVwTZ
	kJbQ==
X-Gm-Message-State: AKaTC00+F8np5VgNzYLwLnUJYbh6LInGZRjFzM6tSMV2m+Z/8dB2LZh37HU1nd4PnyPVXA==
X-Received: by 10.194.117.134 with SMTP id ke6mr22229306wjb.123.1480410741159; 
	Tue, 29 Nov 2016 01:12:21 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d64sm1726620wmh.3.2016.11.29.01.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Nov 2016 01:12:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Nov 2016 10:12:21 +0100
To: Joshua Lock <joshua.g.lock@intel.com>
Message-ID: <20161129091221.GB2700@jama>
References: <1480087649-26543-1-git-send-email-joshua.g.lock@intel.com>
MIME-Version: 1.0
In-Reply-To: <1480087649-26543-1-git-send-email-joshua.g.lock@intel.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] meta: remove True option to getVar calls
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
X-List-Received-Date: Tue, 29 Nov 2016 09:12:24 -0000
X-Groupsio-MsgNum: 89988
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2016 at 03:27:28PM +0000, Joshua Lock wrote:
> getVar() now defaults to expanding by default, thus remove the True
> option from getVar() calls with a regex search and replace.
>=20
> Search made with the following regex: getVar ?\(( ?[^,()]*), True\)

This touches big number of recipes and makes it harder to backport their
changes to morty or older releases, maybe it's worth considering
removing the tabs from shell functions as well?

It's not a good time, because there is still a lot of backporting to
morty (end of release cycle is much better for change like this), but
I'm hoping for consistent indentation for last maybe 4 years, so I just
wanted to mention it here.

> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/classes/allarch.bbclass                       |   4 +-
>  meta/classes/archiver.bbclass                      |  74 +++---
>  meta/classes/autotools.bbclass                     |  12 +-
>  meta/classes/base.bbclass                          | 120 ++++-----
>  meta/classes/binconfig.bbclass                     |   2 +-
>  meta/classes/blacklist.bbclass                     |   4 +-
>  meta/classes/bugzilla.bbclass                      |  24 +-
>  meta/classes/buildhistory.bbclass                  |  62 ++---
>  meta/classes/buildstats-summary.bbclass            |   2 +-
>  meta/classes/buildstats.bbclass                    |  12 +-
>  meta/classes/ccache.bbclass                        |   2 +-
>  meta/classes/chrpath.bbclass                       |   4 +-
>  meta/classes/cmake.bbclass                         |  16 +-
>  meta/classes/cml1.bbclass                          |   4 +-
>  meta/classes/compress_doc.bbclass                  |  26 +-
>  meta/classes/copyleft_compliance.bbclass           |  10 +-
>  meta/classes/copyleft_filter.bbclass               |  10 +-
>  meta/classes/cross-canadian.bbclass                |  34 +--
>  meta/classes/crosssdk.bbclass                      |   2 +-
>  meta/classes/cve-check.bbclass                     |  48 ++--
>  meta/classes/debian.bbclass                        |  24 +-
>  meta/classes/devshell.bbclass                      |   6 +-
>  meta/classes/distro_features_check.bbclass         |   8 +-
>  meta/classes/distrodata.bbclass                    | 132 +++++-----
>  meta/classes/distutils-base.bbclass                |   2 +-
>  meta/classes/distutils3-base.bbclass               |   2 +-
>  meta/classes/externalsrc.bbclass                   |  38 +--
>  meta/classes/extrausers.bbclass                    |   2 +-
>  meta/classes/fontcache.bbclass                     |  14 +-
>  meta/classes/fs-uuid.bbclass                       |   2 +-
>  meta/classes/gconf.bbclass                         |  12 +-
>  meta/classes/gettext.bbclass                       |   8 +-
>  meta/classes/gio-module-cache.bbclass              |  10 +-
>  meta/classes/grub-efi.bbclass                      |  22 +-
>  meta/classes/gsettings.bbclass                     |  10 +-
>  meta/classes/gtk-icon-cache.bbclass                |  14 +-
>  meta/classes/gtk-immodules-cache.bbclass           |  10 +-
>  meta/classes/gummiboot.bbclass                     |  14 +-
>  meta/classes/icecc.bbclass                         |   4 +-
>  meta/classes/image-buildinfo.bbclass               |  10 +-
>  meta/classes/image-live.bbclass                    |   8 +-
>  meta/classes/image-vm.bbclass                      |  12 +-
>  meta/classes/image.bbclass                         |  94 +++----
>  meta/classes/image_types.bbclass                   |  24 +-
>  meta/classes/insane.bbclass                        | 192 +++++++-------
>  meta/classes/kernel-arch.bbclass                   |   6 +-
>  meta/classes/kernel-fitimage.bbclass               |  14 +-
>  meta/classes/kernel-grub.bbclass                   |   2 +-
>  meta/classes/kernel-module-split.bbclass           |  38 +--
>  meta/classes/kernel-uimage.bbclass                 |   8 +-
>  meta/classes/kernel-yocto.bbclass                  |   2 +-
>  meta/classes/kernel.bbclass                        |  40 +--
>  meta/classes/libc-common.bbclass                   |  10 +-
>  meta/classes/libc-package.bbclass                  |  56 ++--
>  meta/classes/license.bbclass                       |  96 +++----
>  meta/classes/live-vm-common.bbclass                |   8 +-
>  meta/classes/metadata_scm.bbclass                  |   2 +-
>  meta/classes/migrate_localcount.bbclass            |  12 +-
>  meta/classes/mime.bbclass                          |  12 +-
>  meta/classes/module.bbclass                        |   2 +-
>  meta/classes/multilib.bbclass                      |  32 +--
>  meta/classes/multilib_global.bbclass               |  22 +-
>  meta/classes/native.bbclass                        |  10 +-
>  meta/classes/nativesdk.bbclass                     |   8 +-
>  meta/classes/npm.bbclass                           |   4 +-
>  meta/classes/oelint.bbclass                        |   4 +-
>  meta/classes/package.bbclass                       | 282 ++++++++++-----=
------
>  meta/classes/package_deb.bbclass                   |  54 ++--
>  meta/classes/package_ipk.bbclass                   |  60 ++---
>  meta/classes/package_rpm.bbclass                   | 136 +++++-----
>  meta/classes/package_tar.bbclass                   |  14 +-
>  meta/classes/packagedata.bbclass                   |  10 +-
>  meta/classes/packagefeed-stability.bbclass         |  14 +-
>  meta/classes/packagegroup.bbclass                  |   8 +-
>  meta/classes/patch.bbclass                         |  26 +-
>  meta/classes/pixbufcache.bbclass                   |  10 +-
>  meta/classes/populate_sdk_base.bbclass             |  36 +--
>  meta/classes/populate_sdk_ext.bbclass              | 108 ++++----
>  meta/classes/prexport.bbclass                      |   4 +-
>  meta/classes/ptest.bbclass                         |   2 +-
>  meta/classes/qemu.bbclass                          |  10 +-
>  meta/classes/qemuboot.bbclass                      |   8 +-
>  meta/classes/recipe_sanity.bbclass                 |  26 +-
>  meta/classes/report-error.bbclass                  |  22 +-
>  meta/classes/rm_work.bbclass                       |   6 +-
>  meta/classes/rootfs-postcommands.bbclass           |   6 +-
>  meta/classes/rootfs_deb.bbclass                    |   4 +-
>  meta/classes/rootfs_ipk.bbclass                    |   2 +-
>  meta/classes/rootfs_rpm.bbclass                    |   2 +-
>  meta/classes/sanity.bbclass                        | 108 ++++----
>  meta/classes/sign_ipk.bbclass                      |  12 +-
>  meta/classes/sign_package_feed.bbclass             |   4 +-
>  meta/classes/sign_rpm.bbclass                      |  12 +-
>  meta/classes/siteconfig.bbclass                    |   2 +-
>  meta/classes/siteinfo.bbclass                      |  14 +-
>  meta/classes/spdx.bbclass                          |  26 +-
>  meta/classes/sstate.bbclass                        | 114 ++++-----
>  meta/classes/staging.bbclass                       |  22 +-
>  meta/classes/syslinux.bbclass                      |  34 +--
>  meta/classes/systemd-boot.bbclass                  |  14 +-
>  meta/classes/systemd.bbclass                       |  38 +--
>  meta/classes/terminal.bbclass                      |   8 +-
>  meta/classes/testexport.bbclass                    |  40 +--
>  meta/classes/testimage.bbclass                     |  12 +-
>  meta/classes/testsdk.bbclass                       |  12 +-
>  meta/classes/tinderclient.bbclass                  |  54 ++--
>  meta/classes/toaster.bbclass                       |  14 +-
>  meta/classes/toolchain-scripts.bbclass             |   4 +-
>  meta/classes/uboot-config.bbclass                  |  14 +-
>  meta/classes/uboot-extlinux-config.bbclass         |  24 +-
>  meta/classes/uboot-sign.bbclass                    |   6 +-
>  meta/classes/uninative.bbclass                     |  18 +-
>  meta/classes/update-alternatives.bbclass           |  52 ++--
>  meta/classes/update-rc.d.bbclass                   |  28 +-
>  meta/classes/useradd-staticids.bbclass             |  48 ++--
>  meta/classes/useradd.bbclass                       |  22 +-
>  meta/classes/utility-tasks.bbclass                 |   4 +-
>  meta/classes/utils.bbclass                         |  30 +--
>  meta/classes/waf.bbclass                           |   2 +-
>  meta/conf/bitbake.conf                             |  30 +--
>  meta/conf/distro/defaultsetup.conf                 |   2 +-
>  meta/conf/distro/include/tclibc-glibc.inc          |   6 +-
>  meta/conf/machine/include/arm/arch-arm.inc         |   2 +-
>  meta/conf/machine/include/arm/arch-arm64.inc       |   2 +-
>  .../conf/machine/include/arm/feature-arm-thumb.inc |  10 +-
>  meta/conf/machine/include/arm/feature-arm-vfp.inc  |  10 +-
>  .../machine/include/mips/feature-mips-mips16e.inc  |   6 +-
>  meta/conf/multilib.conf                            |   2 +-
>  meta/lib/oe/classextend.py                         |  12 +-
>  meta/lib/oe/copy_buildsystem.py                    |  12 +-
>  meta/lib/oe/data.py                                |   2 +-
>  meta/lib/oe/distro_check.py                        |  20 +-
>  meta/lib/oe/gpg_sign.py                            |   4 +-
>  meta/lib/oe/manifest.py                            |  26 +-
>  meta/lib/oe/package.py                             |   2 +-
>  meta/lib/oe/package_manager.py                     | 174 ++++++-------
>  meta/lib/oe/packagedata.py                         |   2 +-
>  meta/lib/oe/packagegroup.py                        |   6 +-
>  meta/lib/oe/patch.py                               |  12 +-
>  meta/lib/oe/path.py                                |   2 +-
>  meta/lib/oe/prservice.py                           |  26 +-
>  meta/lib/oe/qa.py                                  |   4 +-
>  meta/lib/oe/recipeutils.py                         |  38 +--
>  meta/lib/oe/rootfs.py                              | 114 ++++-----
>  meta/lib/oe/sdk.py                                 |  76 +++---
>  meta/lib/oe/sstatesig.py                           |  30 +--
>  meta/lib/oe/terminal.py                            |   2 +-
>  meta/lib/oe/utils.py                               |  28 +-
>  meta/lib/oeqa/controllers/masterimage.py           |  16 +-
>  meta/lib/oeqa/oetest.py                            |  60 ++---
>  meta/lib/oeqa/runexported.py                       |   8 +-
>  meta/lib/oeqa/runtime/_ptest.py                    |  16 +-
>  meta/lib/oeqa/runtime/date.py                      |   4 +-
>  meta/lib/oeqa/runtime/multilib.py                  |   2 +-
>  meta/lib/oeqa/runtime/parselogs.py                 |   4 +-
>  meta/lib/oeqa/runtime/rpm.py                       |   6 +-
>  meta/lib/oeqa/runtime/scp.py                       |   2 +-
>  meta/lib/oeqa/runtime/smart.py                     |  18 +-
>  meta/lib/oeqa/runtime/systemd.py                   |   2 +-
>  meta/lib/oeqa/runtime/x32lib.py                    |   2 +-
>  meta/lib/oeqa/sdk/gcc.py                           |   2 +-
>  meta/lib/oeqa/targetcontrol.py                     |  52 ++--
>  meta/lib/oeqa/utils/commands.py                    |   2 +-
>  meta/lib/oeqa/utils/dump.py                        |   4 +-
>  meta/lib/oeqa/utils/package_manager.py             |  12 +-
>  meta/lib/oeqa/utils/targetbuild.py                 |   8 +-
>  meta/lib/oeqa/utils/testexport.py                  |  14 +-
>  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb          |   2 +-
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |   2 +-
>  meta/recipes-bsp/u-boot/u-boot.inc                 |   2 +-
>  meta/recipes-connectivity/bluez5/bluez5.inc        |   4 +-
>  meta/recipes-connectivity/connman/connman.inc      |   4 +-
>  meta/recipes-core/base-files/base-files_3.0.14.bb  |   2 +-
>  meta/recipes-core/busybox/busybox.inc              |  14 +-
>  meta/recipes-core/busybox/busybox_1.24.1.bb        |   4 +-
>  meta/recipes-core/busybox/busybox_git.bb           |   4 +-
>  meta/recipes-core/coreutils/coreutils_6.9.bb       |   8 +-
>  meta/recipes-core/coreutils/coreutils_8.25.bb      |   8 +-
>  meta/recipes-core/glibc/glibc-ld.inc               |   6 +-
>  meta/recipes-core/glibc/glibc-locale.inc           |   8 +-
>  meta/recipes-core/glibc/glibc-package.inc          |   4 +-
>  meta/recipes-core/glibc/glibc.inc                  |   6 +-
>  meta/recipes-core/libxml/libxml2_2.9.4.bb          |   2 +-
>  meta/recipes-core/meta/meta-environment-extsdk.bb  |   4 +-
>  meta/recipes-core/meta/meta-environment.bb         |   6 +-
>  meta/recipes-core/meta/meta-extsdk-toolchain.bb    |   2 +-
>  meta/recipes-core/meta/meta-world-pkgdata.bb       |   2 +-
>  meta/recipes-core/meta/signing-keys.bb             |  18 +-
>  meta/recipes-core/os-release/os-release.bb         |   4 +-
>  .../packagegroups/packagegroup-base.bb             |   4 +-
>  .../packagegroups/packagegroup-core-sdk.bb         |   2 +-
>  meta/recipes-core/psplash/psplash_git.bb           |  20 +-
>  meta/recipes-core/systemd/systemd_230.bb           |   4 +-
>  meta/recipes-core/util-linux/util-linux.inc        |   2 +-
>  meta/recipes-core/volatile-binds/volatile-binds.bb |   2 +-
>  meta/recipes-devtools/apt/apt-native.inc           |   4 +-
>  meta/recipes-devtools/apt/apt-package.inc          |   4 +-
>  meta/recipes-devtools/automake/automake.inc        |   2 +-
>  meta/recipes-devtools/binutils/binutils-2.27.inc   |   2 +-
>  meta/recipes-devtools/binutils/binutils.inc        |   6 +-
>  meta/recipes-devtools/cmake/cmake.inc              |   2 +-
>  meta/recipes-devtools/cmake/cmake_3.6.2.bb         |   4 +-
>  meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
>  meta/recipes-devtools/gcc/gcc-common.inc           |  32 +--
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +-
>  meta/recipes-devtools/gcc/gcc-cross.inc            |   2 +-
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  20 +-
>  meta/recipes-devtools/gcc/libgcc-common.inc        |  38 +--
>  meta/recipes-devtools/gcc/libgfortran.inc          |   2 +-
>  meta/recipes-devtools/git/git.inc                  |   2 +-
>  .../kconfig-frontends_3.12.0.0.bb                  |   2 +-
>  meta/recipes-devtools/perl/perl_5.22.1.bb          |   2 +-
>  meta/recipes-devtools/prelink/prelink_git.bb       |   2 +-
>  meta/recipes-devtools/python/python-smartpm_git.bb |   6 +-
>  meta/recipes-devtools/qemu/qemu-targets.inc        |   4 +-
>  meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  60 ++---
>  meta/recipes-devtools/swig/swig.inc                |   4 +-
>  meta/recipes-devtools/vala/vala.inc                |   2 +-
>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   2 +-
>  meta/recipes-extended/cups/cups.inc                |   2 +-
>  meta/recipes-extended/man/man_1.6g.bb              |   4 +-
>  .../net-tools/net-tools_1.60-26.bb                 |   8 +-
>  .../packagegroup-core-full-cmdline.bb              |   2 +-
>  .../packagegroups/packagegroup-core-lsb.bb         |   4 +-
>  meta/recipes-extended/pam/libpam_1.3.0.bb          |  14 +-
>  meta/recipes-extended/procps/procps_3.3.12.bb      |   8 +-
>  meta/recipes-extended/texinfo/texinfo_6.0.bb       |   2 +-
>  meta/recipes-extended/tzdata/tzdata_2016i.bb       |   2 +-
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb |   2 +-
>  .../gobject-introspection_1.48.0.bb                |   2 +-
>  meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
>  meta/recipes-gnome/gtk+/gtk+_2.24.31.bb            |   2 +-
>  meta/recipes-graphics/cairo/cairo-fpu.inc          |   2 +-
>  meta/recipes-graphics/mesa/mesa.inc                |   6 +-
>  .../xorg-driver/xorg-driver-common.inc             |   4 +-
>  meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb     |   2 +-
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   4 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |   2 +-
>  meta/recipes-kernel/linux/linux-yocto.inc          |   4 +-
>  meta/recipes-kernel/lttng/lttng-modules_git.bb     |   4 +-
>  meta/recipes-kernel/perf/perf-features.inc         |   2 +-
>  meta/recipes-kernel/perf/perf.bb                   |   2 +-
>  meta/recipes-multimedia/alsa/alsa-fpu.inc          |   2 +-
>  .../gstreamer/gst-plugins-package.inc              |  10 +-
>  .../gstreamer/gstreamer1.0-omx.inc                 |   4 +-
>  meta/recipes-rt/images/core-image-rt-sdk.bb        |   2 +-
>  meta/recipes-rt/images/core-image-rt.bb            |   2 +-
>  meta/recipes-support/attr/ea-acl.inc               |   4 +-
>  meta/recipes-support/boost/boost-1.62.0.inc        |   4 +-
>  meta/recipes-support/boost/boost.inc               |   8 +-
>  meta/recipes-support/gnutls/gnutls.inc             |   2 +-
>  meta/recipes-support/icu/icu_57.1.bb               |   2 +-
>  meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   2 +-
>  meta/recipes-support/libiconv/libiconv_1.14.bb     |   4 +-
>  meta/recipes-support/libnl/libnl_3.2.28.bb         |   2 +-
>  meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb |   2 +-
>  meta/recipes-support/sqlite/sqlite3.inc            |   2 +-
>  meta/recipes-support/taglib/taglib_1.11.bb         |   2 +-
>  scripts/contrib/list-packageconfig-flags.py        |   6 +-
>  scripts/contrib/verify-homepage.py                 |   2 +-
>  scripts/devtool                                    |   2 +-
>  scripts/lib/devtool/__init__.py                    |   8 +-
>  scripts/lib/devtool/build_image.py                 |  10 +-
>  scripts/lib/devtool/deploy.py                      |   2 +-
>  scripts/lib/devtool/package.py                     |   2 +-
>  scripts/lib/devtool/runqemu.py                     |   4 +-
>  scripts/lib/devtool/sdk.py                         |   8 +-
>  scripts/lib/devtool/search.py                      |   4 +-
>  scripts/lib/devtool/standard.py                    |  62 ++---
>  scripts/lib/devtool/upgrade.py                     |  20 +-
>  scripts/lib/devtool/utilcmds.py                    |  18 +-
>  scripts/lib/recipetool/append.py                   |  22 +-
>  scripts/lib/recipetool/create.py                   |  24 +-
>  scripts/lib/recipetool/create_buildsys_python.py   |   4 +-
>  scripts/lib/recipetool/create_kernel.py            |   4 +-
>  scripts/lib/recipetool/create_npm.py               |   6 +-
>  scripts/lib/recipetool/newappend.py                |   2 +-
>  scripts/lib/scriptutils.py                         |   2 +-
>  scripts/oe-pkgdata-util                            |   2 +-
>  scripts/recipetool                                 |   2 +-
>  282 files changed, 2395 insertions(+), 2395 deletions(-)
>=20
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index ddc2a85..9dce498 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -11,7 +11,7 @@ PACKAGE_ARCH =3D "all"
>  python () {
>      # Allow this class to be included but overridden - only set
>      # the values if we're still "all" package arch.
> -    if d.getVar("PACKAGE_ARCH", True) =3D=3D "all":
> +    if d.getVar("PACKAGE_ARCH") =3D=3D "all":
>          # No need for virtual/libc or a cross compiler
>          d.setVar("INHIBIT_DEFAULT_DEPS","1")
> =20
> @@ -47,6 +47,6 @@ python () {
>          d.setVarFlag("emit_pkgdata", "vardepsexclude", "MULTILIB_VARIANT=
S")
>          d.setVarFlag("write_specfile", "vardepsexclude", "MULTILIBS")
>      elif bb.data.inherits_class('packagegroup', d) and not bb.data.inher=
its_class('nativesdk', d):
> -        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inher=
it packagegroup" % d.getVar("FILE", True))
> +        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inher=
it packagegroup" % d.getVar("FILE"))
>  }
> =20
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 9239983..30215ae 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -52,10 +52,10 @@ do_deploy_all_archives[dirs] =3D "${WORKDIR}"
> =20
> =20
>  python () {
> -    pn =3D d.getVar('PN', True)
> -    assume_provided =3D (d.getVar("ASSUME_PROVIDED", True) or "").split()
> +    pn =3D d.getVar('PN')
> +    assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
>      if pn in assume_provided:
> -        for p in d.getVar("PROVIDES", True).split():
> +        for p in d.getVar("PROVIDES").split():
>              if p !=3D pn:
>                  pn =3D p
>                  break
> @@ -68,7 +68,7 @@ python () {
>          bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
> =20
>      # We just archive gcc-source for all the gcc related recipes
> -    if d.getVar('BPN', True) in ['gcc', 'libgcc'] \
> +    if d.getVar('BPN') in ['gcc', 'libgcc'] \
>              and not pn.startswith('gcc-source'):
>          bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % =
pn)
>          return
> @@ -106,7 +106,7 @@ python () {
>      # Output the srpm package
>      ar_srpm =3D d.getVarFlag('ARCHIVER_MODE', 'srpm', True)
>      if ar_srpm =3D=3D "1":
> -        if d.getVar('PACKAGES', True) !=3D '' and d.getVar('IMAGE_PKGTYP=
E', True) =3D=3D 'rpm':
> +        if d.getVar('PACKAGES') !=3D '' and d.getVar('IMAGE_PKGTYPE') =
=3D=3D 'rpm':
>              d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_pac=
kage_write_rpm' % pn)
>              if ar_dumpdata =3D=3D "1":
>                  d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:=
do_dumpdata' % pn)
> @@ -130,9 +130,9 @@ python do_ar_original() {
>      if d.getVarFlag('ARCHIVER_MODE', 'src', True) !=3D "original":
>          return
> =20
> -    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR', True)
> +    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR')
>      bb.note('Archiving the original source...')
> -    urls =3D d.getVar("SRC_URI", True).split()
> +    urls =3D d.getVar("SRC_URI").split()
>      # destsuffix (git fetcher) and subdir (everything else) are allowed =
to be
>      # absolute paths (for example, destsuffix=3D${S}/foobar).
>      # That messes with unpacking inside our tmpdir below, because the fe=
tchers
> @@ -157,7 +157,7 @@ python do_ar_original() {
>          if os.path.isfile(local):
>              shutil.copy(local, ar_outdir)
>          elif os.path.isdir(local):
> -            tmpdir =3D tempfile.mkdtemp(dir=3Dd.getVar('ARCHIVER_WORKDIR=
', True))
> +            tmpdir =3D tempfile.mkdtemp(dir=3Dd.getVar('ARCHIVER_WORKDIR=
'))
>              fetch.unpack(tmpdir, (url,))
>              # To handle recipes with more than one source, we add the "n=
ame"
>              # URL parameter as suffix. We treat it as an error when
> @@ -195,24 +195,24 @@ python do_ar_patched() {
>          return
> =20
>      # Get the ARCHIVER_OUTDIR before we reset the WORKDIR
> -    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR', True)
> -    ar_workdir =3D d.getVar('ARCHIVER_WORKDIR', True)
> +    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR')
> +    ar_workdir =3D d.getVar('ARCHIVER_WORKDIR')
>      bb.note('Archiving the patched source...')
>      d.setVar('WORKDIR', ar_workdir)
> -    create_tarball(d, d.getVar('S', True), 'patched', ar_outdir)
> +    create_tarball(d, d.getVar('S'), 'patched', ar_outdir)
>  }
> =20
>  python do_ar_configured() {
>      import shutil
> =20
> -    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR', True)
> +    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR')
>      if d.getVarFlag('ARCHIVER_MODE', 'src', True) =3D=3D 'configured':
>          bb.note('Archiving the configured source...')
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
>          # "gcc-source-${PV}" recipes don't have "do_configure"
>          # task, so we need to run "do_preconfigure" instead
>          if pn.startswith("gcc-source-"):
> -            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
> +            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR'))
>              bb.build.exec_func('do_preconfigure', d)
> =20
>          # The libtool-native's do_configure will remove the
> @@ -221,7 +221,7 @@ python do_ar_configured() {
>          # instead of.
>          elif pn !=3D 'libtool-native':
>              # Change the WORKDIR to make do_configure run in another dir.
> -            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
> +            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR'))
>              if bb.data.inherits_class('kernel-yocto', d):
>                  bb.build.exec_func('do_kernel_configme', d)
>              if bb.data.inherits_class('cmake', d):
> @@ -235,12 +235,12 @@ python do_ar_configured() {
>              for func in (postfuncs or '').split():
>                  if func !=3D "do_qa_configure":
>                      bb.build.exec_func(func, d)
> -        srcdir =3D d.getVar('S', True)
> -        builddir =3D d.getVar('B', True)
> +        srcdir =3D d.getVar('S')
> +        builddir =3D d.getVar('B')
>          if srcdir !=3D builddir:
>              if os.path.exists(builddir):
>                  oe.path.copytree(builddir, os.path.join(srcdir, \
> -                    'build.%s.ar_configured' % d.getVar('PF', True)))
> +                    'build.%s.ar_configured' % d.getVar('PF')))
>          create_tarball(d, srcdir, 'configured', ar_outdir)
>  }
> =20
> @@ -251,14 +251,14 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
>      import tarfile
> =20
>      # Make sure we are only creating a single tarball for gcc sources
> -    if (d.getVar('SRC_URI', True) =3D=3D ""):
> +    if (d.getVar('SRC_URI') =3D=3D ""):
>          return
> =20
>      bb.utils.mkdirhier(ar_outdir)
>      if suffix:
> -        filename =3D '%s-%s.tar.gz' % (d.getVar('PF', True), suffix)
> +        filename =3D '%s-%s.tar.gz' % (d.getVar('PF'), suffix)
>      else:
> -        filename =3D '%s.tar.gz' % d.getVar('PF', True)
> +        filename =3D '%s.tar.gz' % d.getVar('PF')
>      tarname =3D os.path.join(ar_outdir, filename)
> =20
>      srcdir =3D srcdir.rstrip('/')
> @@ -290,7 +290,7 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
>      dirname =3D os.path.dirname(src)
>      basename =3D os.path.basename(src)
>      os.chdir(dirname)
> -    out_file =3D os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF', T=
rue))
> +    out_file =3D os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF'))
>      diff_cmd =3D 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basen=
ame, basename, out_file)
>      subprocess.call(diff_cmd, shell=3DTrue)
>      bb.utils.remove(src_patched, recurse=3DTrue)
> @@ -301,9 +301,9 @@ python do_unpack_and_patch() {
>              [ 'patched', 'configured'] and \
>              d.getVarFlag('ARCHIVER_MODE', 'diff', True) !=3D '1':
>          return
> -    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR', True)
> -    ar_workdir =3D d.getVar('ARCHIVER_WORKDIR', True)
> -    pn =3D d.getVar('PN', True)
> +    ar_outdir =3D d.getVar('ARCHIVER_OUTDIR')
> +    ar_workdir =3D d.getVar('ARCHIVER_WORKDIR')
> +    pn =3D d.getVar('PN')
> =20
>      # The kernel class functions require it to be on work-shared, so we =
dont change WORKDIR
>      if not (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('=
gcc-source')):
> @@ -313,18 +313,18 @@ python do_unpack_and_patch() {
>          # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' =
for the
>          # possibly requiring of the following tasks (such as some recipe=
s's
>          # do_patch required 'B' existed).
> -        bb.utils.mkdirhier(d.getVar('B', True))
> +        bb.utils.mkdirhier(d.getVar('B'))
> =20
>          bb.build.exec_func('do_unpack', d)
> =20
>      # Save the original source for creating the patches
>      if d.getVarFlag('ARCHIVER_MODE', 'diff', True) =3D=3D '1':
> -        src =3D d.getVar('S', True).rstrip('/')
> +        src =3D d.getVar('S').rstrip('/')
>          src_orig =3D '%s.orig' % src
>          oe.path.copytree(src, src_orig)
> =20
>      # Make sure gcc and kernel sources are patched only once
> -    if not (d.getVar('SRC_URI', True) =3D=3D "" or (bb.data.inherits_cla=
ss('kernel-yocto', d) or pn.startswith('gcc-source'))):
> +    if not (d.getVar('SRC_URI') =3D=3D "" or (bb.data.inherits_class('ke=
rnel-yocto', d) or pn.startswith('gcc-source'))):
>          bb.build.exec_func('do_patch', d)
> =20
>      # Create the patches
> @@ -343,14 +343,14 @@ python do_ar_recipe () {
> =20
>      require_re =3D re.compile( r"require\s+(.+)" )
>      include_re =3D re.compile( r"include\s+(.+)" )
> -    bbfile =3D d.getVar('FILE', True)
> -    outdir =3D os.path.join(d.getVar('WORKDIR', True), \
> -            '%s-recipe' % d.getVar('PF', True))
> +    bbfile =3D d.getVar('FILE')
> +    outdir =3D os.path.join(d.getVar('WORKDIR'), \
> +            '%s-recipe' % d.getVar('PF'))
>      bb.utils.mkdirhier(outdir)
>      shutil.copy(bbfile, outdir)
> =20
> -    pn =3D d.getVar('PN', True)
> -    bbappend_files =3D d.getVar('BBINCLUDED', True).split()
> +    pn =3D d.getVar('PN')
> +    bbappend_files =3D d.getVar('BBINCLUDED').split()
>      # If recipe name is aa, we need to match files like aa.bbappend and =
aa_1.1.bbappend
>      # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
>      bbappend_re =3D re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
> @@ -360,7 +360,7 @@ python do_ar_recipe () {
>              shutil.copy(file, outdir)
> =20
>      dirname =3D os.path.dirname(bbfile)
> -    bbpath =3D '%s:%s' % (dirname, d.getVar('BBPATH', True))
> +    bbpath =3D '%s:%s' % (dirname, d.getVar('BBPATH'))
>      f =3D open(bbfile, 'r')
>      for line in f.readlines():
>          incfile =3D None
> @@ -374,7 +374,7 @@ python do_ar_recipe () {
>              if incfile:
>                  shutil.copy(incfile, outdir)
> =20
> -    create_tarball(d, outdir, 'recipe', d.getVar('ARCHIVER_OUTDIR', True=
))
> +    create_tarball(d, outdir, 'recipe', d.getVar('ARCHIVER_OUTDIR'))
>      bb.utils.remove(outdir, recurse=3DTrue)
>  }
> =20
> @@ -383,8 +383,8 @@ python do_dumpdata () {
>      dump environment data to ${PF}-showdata.dump
>      """
> =20
> -    dumpfile =3D os.path.join(d.getVar('ARCHIVER_OUTDIR', True), \
> -        '%s-showdata.dump' % d.getVar('PF', True))
> +    dumpfile =3D os.path.join(d.getVar('ARCHIVER_OUTDIR'), \
> +        '%s-showdata.dump' % d.getVar('PF'))
>      bb.note('Dumping metadata into %s' % dumpfile)
>      with open(dumpfile, "w") as f:
>          # emit variables and shell functions
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbcl=
ass
> index c43ea9a..c43531b 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -1,8 +1,8 @@
>  def autotools_dep_prepend(d):
> -    if d.getVar('INHIBIT_AUTOTOOLS_DEPS', True):
> +    if d.getVar('INHIBIT_AUTOTOOLS_DEPS'):
>          return ''
> =20
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      deps =3D ''
> =20
>      if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
> @@ -14,7 +14,7 @@ def autotools_dep_prepend(d):
>          if not bb.data.inherits_class('native', d) \
>                          and not bb.data.inherits_class('nativesdk', d) \
>                          and not bb.data.inherits_class('cross', d) \
> -                        and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
> +                        and not d.getVar('INHIBIT_DEFAULT_DEPS'):
>              deps +=3D 'libtool-cross '
> =20
>      return deps + 'gnu-config-native '
> @@ -139,15 +139,15 @@ ACLOCALDIR =3D "${WORKDIR}/aclocal-copy"
>  python autotools_copy_aclocals () {
>      import copy
> =20
> -    s =3D d.getVar("AUTOTOOLS_SCRIPT_PATH", True)
> +    s =3D d.getVar("AUTOTOOLS_SCRIPT_PATH")
>      if not os.path.exists(s + "/configure.in") and not os.path.exists(s =
+ "/configure.ac"):
>          if not d.getVar("AUTOTOOLS_COPYACLOCAL", False):
>              return
> =20
>      taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
>      #bb.warn(str(taskdepdata))
> -    pn =3D d.getVar("PN", True)
> -    aclocaldir =3D d.getVar("ACLOCALDIR", True)
> +    pn =3D d.getVar("PN")
> +    aclocaldir =3D d.getVar("ACLOCALDIR")
>      oe.path.remove(aclocaldir)
>      bb.utils.mkdirhier(aclocaldir)
>      start =3D None
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 024fe43..0bc1569 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -16,7 +16,7 @@ OE_IMPORTS[type] =3D "list"
>  def oe_import(d):
>      import sys
> =20
> -    bbpath =3D d.getVar("BBPATH", True).split(":")
> +    bbpath =3D d.getVar("BBPATH").split(":")
>      sys.path[0:0] =3D [os.path.join(dir, "lib") for dir in bbpath]
> =20
>      def inject(name, value):
> @@ -37,7 +37,7 @@ def oe_import(d):
>  OE_IMPORTED :=3D "${@oe_import(d)}"
> =20
>  def lsb_distro_identifier(d):
> -    adjust =3D d.getVar('LSB_DISTRO_ADJUST', True)
> +    adjust =3D d.getVar('LSB_DISTRO_ADJUST')
>      adjust_func =3D None
>      if adjust:
>          try:
> @@ -72,7 +72,7 @@ def base_dep_prepend(d):
>      # we need that built is the responsibility of the patch function / c=
lass, not
>      # the application.
>      if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
> -        if (d.getVar('HOST_SYS', True) !=3D d.getVar('BUILD_SYS', True)):
> +        if (d.getVar('HOST_SYS') !=3D d.getVar('BUILD_SYS')):
>              deps +=3D " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PRE=
FIX}compilerlibs virtual/libc "
>      return deps
> =20
> @@ -83,11 +83,11 @@ DEPENDS_prepend=3D"${BASEDEPENDS} "
>  FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_D=
IRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
>  # THISDIR only works properly with imediate expansion as it has to run
>  # in the context of the location its used (:=3D)
> -THISDIR =3D "${@os.path.dirname(d.getVar('FILE', True))}"
> +THISDIR =3D "${@os.path.dirname(d.getVar('FILE'))}"
> =20
>  def extra_path_elements(d):
>      path =3D ""
> -    elements =3D (d.getVar('EXTRANATIVEPATH', True) or "").split()
> +    elements =3D (d.getVar('EXTRANATIVEPATH') or "").split()
>      for e in elements:
>          path =3D path + "${STAGING_BINDIR_NATIVE}/" + e + ":"
>      return path
> @@ -96,8 +96,8 @@ PATH_prepend =3D "${@extra_path_elements(d)}"
> =20
>  def get_lic_checksum_file_list(d):
>      filelist =3D []
> -    lic_files =3D d.getVar("LIC_FILES_CHKSUM", True) or ''
> -    tmpdir =3D d.getVar("TMPDIR", True)
> +    lic_files =3D d.getVar("LIC_FILES_CHKSUM") or ''
> +    tmpdir =3D d.getVar("TMPDIR")
> =20
>      urls =3D lic_files.split()
>      for url in urls:
> @@ -113,7 +113,7 @@ def get_lic_checksum_file_list(d):
>                      continue
>                  filelist.append(path + ":" + str(os.path.exists(path)))
>          except bb.fetch.MalformedUrl:
> -            bb.fatal(d.getVar('PN', True) + ": LIC_FILES_CHKSUM contains=
 an invalid URL: " + url)
> +            bb.fatal(d.getVar('PN') + ": LIC_FILES_CHKSUM contains an in=
valid URL: " + url)
>      return " ".join(filelist)
> =20
>  addtask fetch
> @@ -123,7 +123,7 @@ do_fetch[file-checksums] +=3D " ${@get_lic_checksum_f=
ile_list(d)}"
>  do_fetch[vardeps] +=3D "SRCREV"
>  python base_do_fetch() {
> =20
> -    src_uri =3D (d.getVar('SRC_URI', True) or "").split()
> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
>      if len(src_uri) =3D=3D 0:
>          return
> =20
> @@ -138,31 +138,31 @@ addtask unpack after do_fetch
>  do_unpack[dirs] =3D "${WORKDIR}"
> =20
>  python () {
> -    if d.getVar('S', True) !=3D d.getVar('WORKDIR', True):
> +    if d.getVar('S') !=3D d.getVar('WORKDIR'):
>          d.setVarFlag('do_unpack', 'cleandirs', '${S}')
>      else:
>          d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}', 'pat=
ches'))
>  }
>  python base_do_unpack() {
> -    src_uri =3D (d.getVar('SRC_URI', True) or "").split()
> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
>      if len(src_uri) =3D=3D 0:
>          return
> =20
>      try:
>          fetcher =3D bb.fetch2.Fetch(src_uri, d)
> -        fetcher.unpack(d.getVar('WORKDIR', True))
> +        fetcher.unpack(d.getVar('WORKDIR'))
>      except bb.fetch2.BBFetchException as e:
>          bb.fatal(str(e))
>  }
> =20
>  def pkgarch_mapping(d):
>      # Compatibility mappings of TUNE_PKGARCH (opt in)
> -    if d.getVar("PKGARCHCOMPAT_ARMV7A", True):
> -        if d.getVar("TUNE_PKGARCH", True) =3D=3D "armv7a-vfp-neon":
> +    if d.getVar("PKGARCHCOMPAT_ARMV7A"):
> +        if d.getVar("TUNE_PKGARCH") =3D=3D "armv7a-vfp-neon":
>              d.setVar("TUNE_PKGARCH", "armv7a")
> =20
>  def get_layers_branch_rev(d):
> -    layers =3D (d.getVar("BBLAYERS", True) or "").split()
> +    layers =3D (d.getVar("BBLAYERS") or "").split()
>      layers_branch_rev =3D ["%-17s =3D \"%s:%s\"" % (os.path.basename(i),=
 \
>          base_get_metadata_git_branch(i, None).strip(), \
>          base_get_metadata_git_revision(i, None)) \
> @@ -189,7 +189,7 @@ BUILDCFG_FUNCS[type] =3D "list"
>  def buildcfg_vars(d):
>      statusvars =3D oe.data.typed_value('BUILDCFG_VARS', d)
>      for var in statusvars:
> -        value =3D d.getVar(var, True)
> +        value =3D d.getVar(var)
>          if value is not None:
>              yield '%-17s =3D "%s"' % (var, value)
> =20
> @@ -197,7 +197,7 @@ def buildcfg_neededvars(d):
>      needed_vars =3D oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
>      pesteruser =3D []
>      for v in needed_vars:
> -        val =3D d.getVar(v, True)
> +        val =3D d.getVar(v)
>          if not val or val =3D=3D 'INVALID':
>              pesteruser.append(v)
> =20
> @@ -230,7 +230,7 @@ python base_eventhandler() {
>                  if flines:
>                      statuslines.extend(flines)
> =20
> -        statusheader =3D e.data.getVar('BUILDCFG_HEADER', True)
> +        statusheader =3D e.data.getVar('BUILDCFG_HEADER')
>          if statusheader:
>              bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines=
)))
> =20
> @@ -238,7 +238,7 @@ python base_eventhandler() {
>      # target ones and we'd see dulpicate key names overwriting each other
>      # for various PREFERRED_PROVIDERS
>      if isinstance(e, bb.event.RecipePreFinalise):
> -        if e.data.getVar("TARGET_PREFIX", True) =3D=3D e.data.getVar("SD=
K_PREFIX", True):
> +        if e.data.getVar("TARGET_PREFIX") =3D=3D e.data.getVar("SDK_PREF=
IX"):
>              e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}bi=
nutils")
>              e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gc=
c-initial")
>              e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gc=
c")
> @@ -264,14 +264,14 @@ python base_eventhandler() {
>          # sysroot since they're now "unreachable". This makes switching =
virtual/kernel work in=20
>          # particular.
>          #
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
>          source_mirror_fetch =3D d.getVar('SOURCE_MIRROR_FETCH', False)
>          if not source_mirror_fetch:
> -            provs =3D (d.getVar("PROVIDES", True) or "").split()
> -            multiwhitelist =3D (d.getVar("MULTI_PROVIDER_WHITELIST", Tru=
e) or "").split()
> +            provs =3D (d.getVar("PROVIDES") or "").split()
> +            multiwhitelist =3D (d.getVar("MULTI_PROVIDER_WHITELIST") or =
"").split()
>              for p in provs:
>                  if p.startswith("virtual/") and p not in multiwhitelist:
> -                    profprov =3D d.getVar("PREFERRED_PROVIDER_" + p, Tru=
e)
> +                    profprov =3D d.getVar("PREFERRED_PROVIDER_" + p)
>                      if profprov and pn !=3D profprov:
>                          raise bb.parse.SkipPackage("PREFERRED_PROVIDER_%=
s set to %s, not %s" % (p, profprov, pn))
>  }
> @@ -333,9 +333,9 @@ def set_packagetriplet(d):
>      tos =3D []
>      tvs =3D []
> =20
> -    archs.append(d.getVar("PACKAGE_ARCHS", True).split())
> -    tos.append(d.getVar("TARGET_OS", True))
> -    tvs.append(d.getVar("TARGET_VENDOR", True))
> +    archs.append(d.getVar("PACKAGE_ARCHS").split())
> +    tos.append(d.getVar("TARGET_OS"))
> +    tvs.append(d.getVar("TARGET_VENDOR"))
> =20
>      def settriplet(d, varname, archs, tos, tvs):
>          triplets =3D []
> @@ -347,16 +347,16 @@ def set_packagetriplet(d):
> =20
>      settriplet(d, "PKGTRIPLETS", archs, tos, tvs)
> =20
> -    variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""
> +    variants =3D d.getVar("MULTILIB_VARIANTS") or ""
>      for item in variants.split():
>          localdata =3D bb.data.createCopy(d)
>          overrides =3D localdata.getVar("OVERRIDES", False) + ":virtclass=
-multilib-" + item
>          localdata.setVar("OVERRIDES", overrides)
>          bb.data.update_data(localdata)
> =20
> -        archs.append(localdata.getVar("PACKAGE_ARCHS", True).split())
> -        tos.append(localdata.getVar("TARGET_OS", True))
> -        tvs.append(localdata.getVar("TARGET_VENDOR", True))
> +        archs.append(localdata.getVar("PACKAGE_ARCHS").split())
> +        tos.append(localdata.getVar("TARGET_OS"))
> +        tvs.append(localdata.getVar("TARGET_VENDOR"))
> =20
>      settriplet(d, "PKGMLTRIPLETS", archs, tos, tvs)
> =20
> @@ -371,10 +371,10 @@ python () {
>      # PACKAGECONFIG[foo] =3D "--enable-foo,--disable-foo,foo_depends,foo=
_runtime_depends"
>      pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
>      if pkgconfigflags:
> -        pkgconfig =3D (d.getVar('PACKAGECONFIG', True) or "").split()
> -        pn =3D d.getVar("PN", True)
> +        pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
> +        pn =3D d.getVar("PN")
> =20
> -        mlprefix =3D d.getVar("MLPREFIX", True)
> +        mlprefix =3D d.getVar("MLPREFIX")
> =20
>          def expandFilter(appends, extension, prefix):
>              appends =3D bb.utils.explode_deps(d.expand(" ".join(appends)=
))
> @@ -416,7 +416,7 @@ python () {
>              num =3D len(items)
>              if num > 4:
>                  bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depe=
nd,rdepend can be specified!"
> -                    % (d.getVar('PN', True), flag))
> +                    % (d.getVar('PN'), flag))
> =20
>              if flag in pkgconfig:
>                  if num >=3D 3 and items[2]:
> @@ -431,8 +431,8 @@ python () {
>          appendVar('RDEPENDS_${PN}', extrardeps)
>          appendVar('PACKAGECONFIG_CONFARGS', extraconf)
> =20
> -    pn =3D d.getVar('PN', True)
> -    license =3D d.getVar('LICENSE', True)
> +    pn =3D d.getVar('PN')
> +    license =3D d.getVar('LICENSE')
>      if license =3D=3D "INVALID":
>          bb.fatal('This recipe does not have the LICENSE field set (%s)' =
% pn)
> =20
> @@ -462,26 +462,26 @@ python () {
>          d.setVarFlag('do_devshell', 'fakeroot', '1')
>          d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-nat=
ive:do_populate_sysroot')
> =20
> -    need_machine =3D d.getVar('COMPATIBLE_MACHINE', True)
> +    need_machine =3D d.getVar('COMPATIBLE_MACHINE')
>      if need_machine:
>          import re
> -        compat_machines =3D (d.getVar('MACHINEOVERRIDES', True) or "").s=
plit(":")
> +        compat_machines =3D (d.getVar('MACHINEOVERRIDES') or "").split("=
:")
>          for m in compat_machines:
>              if re.match(need_machine, m):
>                  break
>          else:
> -            raise bb.parse.SkipPackage("incompatible with machine %s (no=
t in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
> +            raise bb.parse.SkipPackage("incompatible with machine %s (no=
t in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))
> =20
>      source_mirror_fetch =3D d.getVar('SOURCE_MIRROR_FETCH', False)
>      if not source_mirror_fetch:
> -        need_host =3D d.getVar('COMPATIBLE_HOST', True)
> +        need_host =3D d.getVar('COMPATIBLE_HOST')
>          if need_host:
>              import re
> -            this_host =3D d.getVar('HOST_SYS', True)
> +            this_host =3D d.getVar('HOST_SYS')
>              if not re.match(need_host, this_host):
>                  raise bb.parse.SkipPackage("incompatible with host %s (n=
ot in COMPATIBLE_HOST)" % this_host)
> =20
> -        bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE', True) or "").=
split()
> +        bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
> =20
>          check_license =3D False if pn.startswith("nativesdk-") else True
>          for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${=
TARGET_ARCH}",
> @@ -500,21 +500,21 @@ python () {
>              for lic in bad_licenses:
>                  spdx_license =3D return_spdx(d, lic)
>                  for w in ["LGPLv2_WHITELIST_", "WHITELIST_"]:
> -                    whitelist.extend((d.getVar(w + lic, True) or "").spl=
it())
> +                    whitelist.extend((d.getVar(w + lic) or "").split())
>                      if spdx_license:
> -                        whitelist.extend((d.getVar(w + spdx_license, Tru=
e) or "").split())
> +                        whitelist.extend((d.getVar(w + spdx_license) or =
"").split())
>                      '''
>                      We need to track what we are whitelisting and why. I=
f pn is
>                      incompatible we need to be able to note that the ima=
ge that
>                      is created may infact contain incompatible licenses =
despite
>                      INCOMPATIBLE_LICENSE being set.
>                      '''
> -                    incompatwl.extend((d.getVar(w + lic, True) or "").sp=
lit())
> +                    incompatwl.extend((d.getVar(w + lic) or "").split())
>                      if spdx_license:
> -                        incompatwl.extend((d.getVar(w + spdx_license, Tr=
ue) or "").split())
> +                        incompatwl.extend((d.getVar(w + spdx_license) or=
 "").split())
> =20
>              if not pn in whitelist:
> -                pkgs =3D d.getVar('PACKAGES', True).split()
> +                pkgs =3D d.getVar('PACKAGES').split()
>                  skipped_pkgs =3D []
>                  unskipped_pkgs =3D []
>                  for pkg in pkgs:
> @@ -526,7 +526,7 @@ python () {
>                  if unskipped_pkgs:
>                      for pkg in skipped_pkgs:
>                          bb.debug(1, "SKIPPING the package " + pkg + " at=
 do_rootfs because it's " + license)
> -                        mlprefix =3D d.getVar('MLPREFIX', True)
> +                        mlprefix =3D d.getVar('MLPREFIX')
>                          d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, =
1)
>                      for pkg in unskipped_pkgs:
>                          bb.debug(1, "INCLUDING the package " + pkg)
> @@ -542,8 +542,8 @@ python () {
>          # matching of license expressions - just check that all license =
strings
>          # in LICENSE_<pkg> are found in LICENSE.
>          license_set =3D oe.license.list_licenses(license)
> -        for pkg in d.getVar('PACKAGES', True).split():
> -            pkg_license =3D d.getVar('LICENSE_' + pkg, True)
> +        for pkg in d.getVar('PACKAGES').split():
> +            pkg_license =3D d.getVar('LICENSE_' + pkg)
>              if pkg_license:
>                  unlisted =3D oe.license.list_licenses(pkg_license) - lic=
ense_set
>                  if unlisted:
> @@ -551,7 +551,7 @@ python () {
>                              "listed in LICENSE" % (pkg, ' '.join(unliste=
d)))
> =20
>      needsrcrev =3D False
> -    srcuri =3D d.getVar('SRC_URI', True)
> +    srcuri =3D d.getVar('SRC_URI')
>      for uri in srcuri.split():
>          (scheme, _ , path) =3D bb.fetch.decodeurl(uri)[:3]
> =20
> @@ -611,8 +611,8 @@ python () {
>      set_packagetriplet(d)
> =20
>      # 'multimachine' handling
> -    mach_arch =3D d.getVar('MACHINE_ARCH', True)
> -    pkg_arch =3D d.getVar('PACKAGE_ARCH', True)
> +    mach_arch =3D d.getVar('MACHINE_ARCH')
> +    pkg_arch =3D d.getVar('PACKAGE_ARCH')
> =20
>      if (pkg_arch =3D=3D mach_arch):
>          # Already machine specific - nothing further to do
> @@ -622,11 +622,11 @@ python () {
>      # We always try to scan SRC_URI for urls with machine overrides
>      # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=3D0
>      #
> -    override =3D d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
> +    override =3D d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH')
>      if override !=3D '0':
>          paths =3D []
> -        fpaths =3D (d.getVar('FILESPATH', True) or '').split(':')
> -        machine =3D d.getVar('MACHINE', True)
> +        fpaths =3D (d.getVar('FILESPATH') or '').split(':')
> +        machine =3D d.getVar('MACHINE')
>          for p in fpaths:
>              if os.path.basename(p) =3D=3D machine and os.path.isdir(p):
>                  paths.append(p)
> @@ -643,16 +643,16 @@ python () {
>                          d.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}")
>                          return
> =20
> -    packages =3D d.getVar('PACKAGES', True).split()
> +    packages =3D d.getVar('PACKAGES').split()
>      for pkg in packages:
> -        pkgarch =3D d.getVar("PACKAGE_ARCH_%s" % pkg, True)
> +        pkgarch =3D d.getVar("PACKAGE_ARCH_%s" % pkg)
> =20
>          # We could look for !=3D PACKAGE_ARCH here but how to choose
>          # if multiple differences are present?
>          # Look through PACKAGE_ARCHS for the priority order?
>          if pkgarch and pkgarch =3D=3D mach_arch:
>              d.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}")
> -            bb.warn("Recipe %s is marked as only being architecture spec=
ific but seems to have machine specific packages?! The recipe may as well m=
ark itself as machine specific directly." % d.getVar("PN", True))
> +            bb.warn("Recipe %s is marked as only being architecture spec=
ific but seems to have machine specific packages?! The recipe may as well m=
ark itself as machine specific directly." % d.getVar("PN"))
>  }
> =20
>  addtask cleansstate after do_clean
> @@ -663,7 +663,7 @@ addtask cleanall after do_cleansstate
>  do_cleansstate[nostamp] =3D "1"
> =20
>  python do_cleanall() {
> -    src_uri =3D (d.getVar('SRC_URI', True) or "").split()
> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
>      if len(src_uri) =3D=3D 0:
>          return
> =20
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbcl=
ass
> index 8591308..5372294 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -22,7 +22,7 @@ def get_binconfig_mangle(d):
>          s +=3D " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
>          s +=3D " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
>          if d.getVar("OE_BINCONFIG_EXTRA_MANGLE", False):
> -            s +=3D d.getVar("OE_BINCONFIG_EXTRA_MANGLE", True)
> +            s +=3D d.getVar("OE_BINCONFIG_EXTRA_MANGLE")
> =20
>      return s
> =20
> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbcl=
ass
> index a0141a8..c6f4223 100644
> --- a/meta/classes/blacklist.bbclass
> +++ b/meta/classes/blacklist.bbclass
> @@ -16,7 +16,7 @@
>  addhandler blacklist_multilib_eventhandler
>  blacklist_multilib_eventhandler[eventmask] =3D "bb.event.ConfigParsed"
>  python blacklist_multilib_eventhandler() {
> -    multilibs =3D e.data.getVar('MULTILIBS', True)
> +    multilibs =3D e.data.getVar('MULTILIBS')
>      if not multilibs:
>          return
> =20
> @@ -38,7 +38,7 @@ python blacklist_multilib_eventhandler() {
>  }
> =20
>  python () {
> -    blacklist =3D d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
> +    blacklist =3D d.getVarFlag('PNBLACKLIST', d.getVar('PN'), True)
> =20
>      if blacklist:
>          raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (blackl=
ist))
> diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
> index 3fc8956..6d9a821 100644
> --- a/meta/classes/bugzilla.bbclass
> +++ b/meta/classes/bugzilla.bbclass
> @@ -110,12 +110,12 @@ python bugzilla_eventhandler() {
>          return
> =20
>      if name =3D=3D "TaskFailed":
> -        xmlrpc  =3D data.getVar("BUGZILLA_XMLRPC", True)
> -        user    =3D data.getVar("BUGZILLA_USER", True)
> -        passw   =3D data.getVar("BUGZILLA_PASS", True)
> -        product =3D data.getVar("BUGZILLA_PRODUCT", True)
> -        compon  =3D data.getVar("BUGZILLA_COMPONENT", True)
> -        version =3D data.getVar("BUGZILLA_VERSION", True)
> +        xmlrpc  =3D data.getVar("BUGZILLA_XMLRPC")
> +        user    =3D data.getVar("BUGZILLA_USER")
> +        passw   =3D data.getVar("BUGZILLA_PASS")
> +        product =3D data.getVar("BUGZILLA_PRODUCT")
> +        compon  =3D data.getVar("BUGZILLA_COMPONENT")
> +        version =3D data.getVar("BUGZILLA_VERSION")
> =20
>          proxy   =3D data.getVar('http_proxy', True )
>          if (proxy):
> @@ -133,14 +133,14 @@ python bugzilla_eventhandler() {
>              'component': compon}
> =20
>          # evil hack to figure out what is going on
> -        debug_file =3D open(os.path.join(data.getVar("TMPDIR", True),"..=
","bugzilla-log"),"a")
> +        debug_file =3D open(os.path.join(data.getVar("TMPDIR"),"..","bug=
zilla-log"),"a")
> =20
>          file =3D None
> -        bugname =3D "%(package)s-%(pv)s-autobuild" % { "package" : data.=
getVar("PN", True),
> -                                                           "pv"      : d=
ata.getVar("PV", True),
> +        bugname =3D "%(package)s-%(pv)s-autobuild" % { "package" : data.=
getVar("PN"),
> +                                                           "pv"      : d=
ata.getVar("PV"),
>                                                             }
> -        log_file =3D glob.glob("%s/log.%s.*" % (event.data.getVar('T', T=
rue), event.task))
> -        text     =3D "The %s step in %s failed at %s for machine %s" % (=
e.task, data.getVar("PN", True), data.getVar('DATETIME', True), data.getVar=
( 'MACHINE', True ) )
> +        log_file =3D glob.glob("%s/log.%s.*" % (event.data.getVar('T'), =
event.task))
> +        text     =3D "The %s step in %s failed at %s for machine %s" % (=
e.task, data.getVar("PN"), data.getVar('DATETIME'), data.getVar( 'MACHINE',=
 True ) )
>          if len(log_file) !=3D 0:
>              print >> debug_file, "Adding log file %s" % log_file[0]
>              file =3D open(log_file[0], 'r')
> @@ -168,7 +168,7 @@ python bugzilla_eventhandler() {
> =20
>          if bug_number and log:
>              print >> debug_file, "The bug is known as '%s'" % bug_number
> -            desc =3D "Build log for machine %s" % (data.getVar('MACHINE'=
, True))
> +            desc =3D "Build log for machine %s" % (data.getVar('MACHINE'=
))
>              if not bugzilla_create_attachment(debug_file, server, args.c=
opy(), bug_number, text, log_file[0], log, desc):
>                   print >> debug_file, "Failed to attach the build log fo=
r bug #%s" % bug_number
>              else:
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index d82e9bb..73cd886 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -64,18 +64,18 @@ PATCH_GIT_USER_NAME ?=3D "OpenEmbedded"
>  # Write out metadata about this package for comparison when writing futu=
re packages
>  #
>  python buildhistory_emit_pkghistory() {
> -    if not d.getVar('BB_CURRENTTASK', True) in ['packagedata', 'packaged=
ata_setscene']:
> +    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_se=
tscene']:
>          return 0
> =20
> -    if not "package" in (d.getVar('BUILDHISTORY_FEATURES', True) or "").=
split():
> +    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split(=
):
>          return 0
> =20
>      import re
>      import json
>      import errno
> =20
> -    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
> -    oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE', True)
> +    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
> +    oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
> =20
>      class RecipeInfo:
>          def __init__(self, name):
> @@ -182,12 +182,12 @@ python buildhistory_emit_pkghistory() {
>          items.sort()
>          return ' '.join(items)
> =20
> -    pn =3D d.getVar('PN', True)
> -    pe =3D d.getVar('PE', True) or "0"
> -    pv =3D d.getVar('PV', True)
> -    pr =3D d.getVar('PR', True)
> +    pn =3D d.getVar('PN')
> +    pe =3D d.getVar('PE') or "0"
> +    pv =3D d.getVar('PV')
> +    pr =3D d.getVar('PR')
> =20
> -    pkgdata_dir =3D d.getVar('PKGDATA_DIR', True)
> +    pkgdata_dir =3D d.getVar('PKGDATA_DIR')
>      packages =3D ""
>      try:
>          with open(os.path.join(pkgdata_dir, pn)) as f:
> @@ -203,7 +203,7 @@ python buildhistory_emit_pkghistory() {
>              raise
> =20
>      packagelist =3D packages.split()
> -    preserve =3D d.getVar('BUILDHISTORY_PRESERVE', True).split()
> +    preserve =3D d.getVar('BUILDHISTORY_PRESERVE').split()
>      if not os.path.exists(pkghistdir):
>          bb.utils.mkdirhier(pkghistdir)
>      else:
> @@ -223,11 +223,11 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.pe =3D pe
>      rcpinfo.pv =3D pv
>      rcpinfo.pr =3D pr
> -    rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS=
', True) or ""))
> +    rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS=
') or ""))
>      rcpinfo.packages =3D packages
>      write_recipehistory(rcpinfo, d)
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
>      for pkg in packagelist:
>          pkgdata =3D {}
>          with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
> @@ -293,7 +293,7 @@ python buildhistory_emit_pkghistory() {
>  def write_recipehistory(rcpinfo, d):
>      bb.debug(2, "Writing recipe history")
> =20
> -    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
> +    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
> =20
>      infofile =3D os.path.join(pkghistdir, "latest")
>      with open(infofile, "w") as f:
> @@ -308,7 +308,7 @@ def write_recipehistory(rcpinfo, d):
>  def write_pkghistory(pkginfo, d):
>      bb.debug(2, "Writing package history for package %s" % pkginfo.name)
> =20
> -    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
> +    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
> =20
>      pkgpath =3D os.path.join(pkghistdir, pkginfo.name)
>      if not os.path.exists(pkgpath):
> @@ -369,7 +369,7 @@ def buildhistory_list_installed(d, rootfs_type=3D"ima=
ge"):
>          pkgs =3D sdk_list_installed_packages(d, rootfs_type =3D=3D "sdk_=
target")
> =20
>      for output_type, output_file in process_list:
> -        output_file_full =3D os.path.join(d.getVar('WORKDIR', True), out=
put_file)
> +        output_file_full =3D os.path.join(d.getVar('WORKDIR'), output_fi=
le)
> =20
>          with open(output_file_full, 'w') as output:
>              output.write(format_pkg_list(pkgs, output_type))
> @@ -550,7 +550,7 @@ END
>  python buildhistory_get_extra_sdkinfo() {
>      import operator
>      import math
> -    if d.getVar('BB_CURRENTTASK', True) =3D=3D 'populate_sdk_ext':
> +    if d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk_ext':
>          tasksizes =3D {}
>          filesizes =3D {}
>          for root, _, files in os.walk(d.expand('${SDK_OUTPUT}/${SDKPATH}=
/sstate-cache')):
> @@ -591,7 +591,7 @@ SDK_POSTPROCESS_COMMAND_append =3D " buildhistory_get=
_sdkinfo ; buildhistory_get_e
>  SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .=3D "| buildhistory_get_sdk=
info ; buildhistory_get_extra_sdkinfo; "
> =20
>  def buildhistory_get_build_id(d):
> -    if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> +    if d.getVar('BB_WORKERCONTEXT') !=3D '1':
>          return ""
>      localdata =3D bb.data.createCopy(d)
>      bb.data.update_data(localdata)
> @@ -605,12 +605,12 @@ def buildhistory_get_build_id(d):
>              if flines:
>                  statuslines.extend(flines)
> =20
> -    statusheader =3D d.getVar('BUILDCFG_HEADER', True)
> +    statusheader =3D d.getVar('BUILDCFG_HEADER')
>      return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
> =20
>  def buildhistory_get_metadata_revs(d):
>      # We want an easily machine-readable format here, so get_layers_bran=
ch_rev isn't quite what we want
> -    layers =3D (d.getVar("BBLAYERS", True) or "").split()
> +    layers =3D (d.getVar("BBLAYERS") or "").split()
>      medadata_revs =3D ["%-17s =3D %s:%s" % (os.path.basename(i), \
>          base_get_metadata_git_branch(i, None).strip(), \
>          base_get_metadata_git_revision(i, None)) \
> @@ -622,7 +622,7 @@ def outputvars(vars, listvars, d):
>      listvars =3D listvars.split()
>      ret =3D ""
>      for var in vars:
> -        value =3D d.getVar(var, True) or ""
> +        value =3D d.getVar(var) or ""
>          if var in listvars:
>              # Squash out spaces
>              value =3D oe.utils.squashspaces(value)
> @@ -630,17 +630,17 @@ def outputvars(vars, listvars, d):
>      return ret.rstrip('\n')
> =20
>  def buildhistory_get_imagevars(d):
> -    if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> +    if d.getVar('BB_WORKERCONTEXT') !=3D '1':
>          return ""
>      imagevars =3D "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAG=
E_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS NO_RECOMMENDATIO=
NS PACKAGE_EXCLUDE ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
>      listvars =3D "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUA=
S IMAGE_INSTALL BAD_RECOMMENDATIONS PACKAGE_EXCLUDE"
>      return outputvars(imagevars, listvars, d)
> =20
>  def buildhistory_get_sdkvars(d):
> -    if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> +    if d.getVar('BB_WORKERCONTEXT') !=3D '1':
>          return ""
>      sdkvars =3D "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE S=
DKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
> -    if d.getVar('BB_CURRENTTASK', True) =3D=3D 'populate_sdk_ext':
> +    if d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk_ext':
>          # Extensible SDK uses some additional variables
>          sdkvars +=3D " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST=
 SDK_INHERIT_BLACKLIST SDK_UPDATE_URL SDK_EXT_TYPE SDK_RECRDEP_TASKS SDK_IN=
CLUDE_PKGDATA SDK_INCLUDE_TOOLCHAIN"
>      listvars =3D "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE =
SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST"
> @@ -735,16 +735,16 @@ END
>  }
> =20
>  python buildhistory_eventhandler() {
> -    if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
> -        reset =3D e.data.getVar("BUILDHISTORY_RESET", True)
> -        olddir =3D e.data.getVar("BUILDHISTORY_OLD_DIR", True)
> +    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
> +        reset =3D e.data.getVar("BUILDHISTORY_RESET")
> +        olddir =3D e.data.getVar("BUILDHISTORY_OLD_DIR")
>          if isinstance(e, bb.event.BuildStarted):
>              if reset:
>                  import shutil
>                  # Clean up after potentially interrupted build.
>                  if os.path.isdir(olddir):
>                      shutil.rmtree(olddir)
> -                rootdir =3D e.data.getVar("BUILDHISTORY_DIR", True)
> +                rootdir =3D e.data.getVar("BUILDHISTORY_DIR")
>                  entries =3D [ x for x in os.listdir(rootdir) if not x.st=
artswith('.') ]
>                  bb.utils.mkdirhier(olddir)
>                  for entry in entries:
> @@ -754,7 +754,7 @@ python buildhistory_eventhandler() {
>              if reset:
>                  import shutil
>                  shutil.rmtree(olddir)
> -            if e.data.getVar("BUILDHISTORY_COMMIT", True) =3D=3D "1":
> +            if e.data.getVar("BUILDHISTORY_COMMIT") =3D=3D "1":
>                  bb.note("Writing buildhistory")
>                  localdata =3D bb.data.createCopy(e.data)
>                  localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._f=
ailures))
> @@ -774,7 +774,7 @@ def _get_srcrev_values(d):
>      """
> =20
>      scms =3D []
> -    fetcher =3D bb.fetch.Fetch(d.getVar('SRC_URI', True).split(), d)
> +    fetcher =3D bb.fetch.Fetch(d.getVar('SRC_URI').split(), d)
>      urldata =3D fetcher.ud
>      for u in urldata:
>          if urldata[u].method.supports_srcrev():
> @@ -806,7 +806,7 @@ def _get_srcrev_values(d):
>  do_fetch[postfuncs] +=3D "write_srcrev"
>  do_fetch[vardepsexclude] +=3D "write_srcrev"
>  python write_srcrev() {
> -    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
> +    pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
>      srcrevfile =3D os.path.join(pkghistdir, 'latest_srcrev')
> =20
>      srcrevs, tag_srcrevs =3D _get_srcrev_values(d)
> @@ -838,7 +838,7 @@ python write_srcrev() {
>                  for name, srcrev in tag_srcrevs.items():
>                      f.write('# tag_%s =3D "%s"\n' % (name, srcrev))
>                      if name in old_tag_srcrevs and old_tag_srcrevs[name]=
 !=3D srcrev:
> -                        pkg =3D d.getVar('PN', True)
> +                        pkg =3D d.getVar('PN')
>                          bb.warn("Revision for tag %s in package %s was c=
hanged since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name=
], srcrev))
> =20
>      else:
> diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/build=
stats-summary.bbclass
> index b86abcc..f9b241b 100644
> --- a/meta/classes/buildstats-summary.bbclass
> +++ b/meta/classes/buildstats-summary.bbclass
> @@ -7,7 +7,7 @@ python buildstats_summary () {
>      if not os.path.exists(bsdir):
>          return
> =20
> -    sstatetasks =3D (e.data.getVar('SSTATETASKS', True) or '').split()
> +    sstatetasks =3D (e.data.getVar('SSTATETASKS') or '').split()
>      built =3D collections.defaultdict(lambda: [set(), set()])
>      for pf in os.listdir(bsdir):
>          taskdir =3D os.path.join(bsdir, pf)
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bb=
class
> index 57ecc8f..0174ae0 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -75,8 +75,8 @@ def get_buildtimedata(var, d):
>      return timediff, cpuperc
> =20
>  def write_task_data(status, logfile, e, d):
> -    bn =3D d.getVar('BUILDNAME', True)
> -    bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
> +    bn =3D d.getVar('BUILDNAME')
> +    bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
>      with open(os.path.join(logfile), "a") as f:
>          elapsedtime =3D get_timedata("__timedata_task", d, e.time)
>          if elapsedtime:
> @@ -106,9 +106,9 @@ python run_buildstats () {
>      import bb.event
>      import time, subprocess, platform
> =20
> -    bn =3D d.getVar('BUILDNAME', True)
> -    bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
> -    taskdir =3D os.path.join(bsdir, d.getVar('PF', True))
> +    bn =3D d.getVar('BUILDNAME')
> +    bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
> +    taskdir =3D os.path.join(bsdir, d.getVar('PF'))
> =20
>      if isinstance(e, bb.event.BuildStarted):
>          ################################################################=
########
> @@ -162,7 +162,7 @@ python run_buildstats () {
>          if e.task =3D=3D "do_rootfs":
>              bs =3D os.path.join(bsdir, "build_stats")
>              with open(bs, "a") as f:
> -                rootfs =3D d.getVar('IMAGE_ROOTFS', True)
> +                rootfs =3D d.getVar('IMAGE_ROOTFS')
>                  if os.path.isdir(rootfs):
>                      try:
>                          rootfs_size =3D subprocess.check_output(["du", "=
-sh", rootfs],
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 2e9837c..93fcaca 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -1,4 +1,4 @@
> -CCACHE =3D "${@bb.utils.which(d.getVar('PATH', True), 'ccache') and 'cca=
che '}"
> +CCACHE =3D "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
>  export CCACHE_DIR ?=3D "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
>  CCACHE_DISABLE[unexport] =3D "1"
> =20
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> index f183b4a..ad3c397 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -44,7 +44,7 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix,=
 tmpdir, d):
>          p =3D sub.Popen([cmd, '-r', args, fpath],stdout=3Dsub.PIPE,stder=
r=3Dsub.PIPE)
>          out, err =3D p.communicate()
>          if p.returncode !=3D 0:
> -            bb.fatal("%s: chrpath command failed with exit code %d:\n%s%=
s" % (d.getVar('PN', True), p.returncode, out, err))
> +            bb.fatal("%s: chrpath command failed with exit code %d:\n%s%=
s" % (d.getVar('PN'), p.returncode, out, err))
> =20
>  def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
>      import subprocess as sub
> @@ -72,7 +72,7 @@ def process_dir (rootdir, directory, d):
>      cmd =3D d.expand('${CHRPATH_BIN}')
>      tmpdir =3D os.path.normpath(d.getVar('TMPDIR', False))
>      baseprefix =3D os.path.normpath(d.expand('${base_prefix}'))
> -    hostos =3D d.getVar("HOST_OS", True)
> +    hostos =3D d.getVar("HOST_OS")
> =20
>      #bb.debug("Checking %s for binaries to process" % directory)
>      if not os.path.exists(directory):
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index fad0baa..9e74599 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -46,7 +46,7 @@ cmake_do_generate_toolchain_file() {
>  # CMake system name must be something like "Linux".
>  # This is important for cross-compiling.
>  set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(=
Linux\).*/\1/'` )
> -set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('T=
ARGET_ARCH', True))} )
> +set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('T=
ARGET_ARCH'))} )
>  set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>  set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
>  set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
> @@ -112,15 +112,15 @@ cmake_do_configure() {
>  	  ${OECMAKE_SITEFILE} \
>  	  ${OECMAKE_SOURCEPATH} \
>  	  -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} \
> -	  -DCMAKE_INSTALL_BINDIR:PATH=3D${@os.path.relpath(d.getVar('bindir', T=
rue), d.getVar('prefix', True))} \
> -	  -DCMAKE_INSTALL_SBINDIR:PATH=3D${@os.path.relpath(d.getVar('sbindir',=
 True), d.getVar('prefix', True))} \
> -	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=3D${@os.path.relpath(d.getVar('libexe=
cdir', True), d.getVar('prefix', True))} \
> +	  -DCMAKE_INSTALL_BINDIR:PATH=3D${@os.path.relpath(d.getVar('bindir'), =
d.getVar('prefix'))} \
> +	  -DCMAKE_INSTALL_SBINDIR:PATH=3D${@os.path.relpath(d.getVar('sbindir')=
, d.getVar('prefix'))} \
> +	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=3D${@os.path.relpath(d.getVar('libexe=
cdir'), d.getVar('prefix'))} \
>  	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=3D${sysconfdir} \
> -	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=3D${@os.path.relpath(d.getVar('sh=
aredstatedir', True), d.  getVar('prefix', True))} \
> +	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=3D${@os.path.relpath(d.getVar('sh=
aredstatedir'), d.  getVar('prefix'))} \
>  	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D${localstatedir} \
> -	  -DCMAKE_INSTALL_LIBDIR:PATH=3D${@os.path.relpath(d.getVar('libdir', T=
rue), d.getVar('prefix', True))} \
> -	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=3D${@os.path.relpath(d.getVar('includ=
edir', True), d.getVar('prefix', True))} \
> -	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=3D${@os.path.relpath(d.getVar('datad=
ir', True), d.getVar('prefix', True))} \
> +	  -DCMAKE_INSTALL_LIBDIR:PATH=3D${@os.path.relpath(d.getVar('libdir'), =
d.getVar('prefix'))} \
> +	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=3D${@os.path.relpath(d.getVar('includ=
edir'), d.getVar('prefix'))} \
> +	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=3D${@os.path.relpath(d.getVar('datad=
ir'), d.getVar('prefix'))} \
>  	  -DCMAKE_INSTALL_SO_NO_EXE=3D0 \
>  	  -DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
>  	  -DCMAKE_VERBOSE_MAKEFILE=3D1 \
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 5834806..187d407 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -26,7 +26,7 @@ python do_menuconfig() {
>      except OSError:
>          mtime =3D 0
> =20
> -    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Com=
mand failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.ge=
tVar('KCONFIG_CONFIG_COMMAND', True),
> +    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Com=
mand failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.ge=
tVar('KCONFIG_CONFIG_COMMAND'),
>                  d.getVar('PN', True ) + ' Configuration', d)
> =20
>      # FIXME this check can be removed when the minimum bitbake version h=
as been bumped
> @@ -49,7 +49,7 @@ python do_diffconfig() {
>      import shutil
>      import subprocess
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      fragment =3D workdir + '/fragment.cfg'
>      configorig =3D '.config.orig'
>      config =3D '.config'
> diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_do=
c.bbclass
> index 8073c17..069db19 100644
> --- a/meta/classes/compress_doc.bbclass
> +++ b/meta/classes/compress_doc.bbclass
> @@ -31,25 +31,25 @@ DOC_DECOMPRESS_CMD[xz] ?=3D "unxz -v"
> =20
>  PACKAGE_PREPROCESS_FUNCS +=3D "package_do_compress_doc compress_doc_upda=
tealternatives"
>  python package_do_compress_doc() {
> -    compress_mode =3D d.getVar('DOC_COMPRESS', True)
> -    compress_list =3D (d.getVar('DOC_COMPRESS_LIST', True) or '').split()
> +    compress_mode =3D d.getVar('DOC_COMPRESS')
> +    compress_list =3D (d.getVar('DOC_COMPRESS_LIST') or '').split()
>      if compress_mode not in compress_list:
>          bb.fatal('Compression policy %s not supported (not listed in %s)=
\n' % (compress_mode, compress_list))
> =20
> -    dvar =3D d.getVar('PKGD', True)
> +    dvar =3D d.getVar('PKGD')
>      compress_cmds =3D {}
>      decompress_cmds =3D {}
>      for mode in compress_list:
>          compress_cmds[mode] =3D d.getVarFlag('DOC_COMPRESS_CMD', mode, T=
rue)
>          decompress_cmds[mode] =3D d.getVarFlag('DOC_DECOMPRESS_CMD', mod=
e, True)
> =20
> -    mandir =3D os.path.abspath(dvar + os.sep + d.getVar("mandir", True))
> +    mandir =3D os.path.abspath(dvar + os.sep + d.getVar("mandir"))
>      if os.path.exists(mandir):
>          # Decompress doc files which format is not compress_mode
>          decompress_doc(mandir, compress_mode, decompress_cmds)
>          compress_doc(mandir, compress_mode, compress_cmds)
> =20
> -    infodir =3D os.path.abspath(dvar + os.sep + d.getVar("infodir", True=
))
> +    infodir =3D os.path.abspath(dvar + os.sep + d.getVar("infodir"))
>      if os.path.exists(infodir):
>          # Decompress doc files which format is not compress_mode
>          decompress_doc(infodir, compress_mode, decompress_cmds)
> @@ -218,18 +218,18 @@ python compress_doc_updatealternatives () {
>      if not bb.data.inherits_class('update-alternatives', d):
>          return
> =20
> -    mandir =3D d.getVar("mandir", True)
> -    infodir =3D d.getVar("infodir", True)
> -    compress_mode =3D d.getVar('DOC_COMPRESS', True)
> -    for pkg in (d.getVar('PACKAGES', True) or "").split():
> -        old_names =3D (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").spl=
it()
> +    mandir =3D d.getVar("mandir")
> +    infodir =3D d.getVar("infodir")
> +    compress_mode =3D d.getVar('DOC_COMPRESS')
> +    for pkg in (d.getVar('PACKAGES') or "").split():
> +        old_names =3D (d.getVar('ALTERNATIVE_%s' % pkg) or "").split()
>          new_names =3D []
>          for old_name in old_names:
>              old_link     =3D d.getVarFlag('ALTERNATIVE_LINK_NAME', old_n=
ame, True)
>              old_target   =3D d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg,=
 old_name, True) or \
>                  d.getVarFlag('ALTERNATIVE_TARGET', old_name, True) or \
> -                d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or \
> -                d.getVar('ALTERNATIVE_TARGET', True) or \
> +                d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or \
> +                d.getVar('ALTERNATIVE_TARGET') or \
>                  old_link
>              # Sometimes old_target is specified as relative to the link =
name.
>              old_target   =3D os.path.join(os.path.dirname(old_link), old=
_target)
> @@ -247,7 +247,7 @@ python compress_doc_updatealternatives () {
>                  elif d.getVarFlag('ALTERNATIVE_TARGET', old_name, True):
>                      d.delVarFlag('ALTERNATIVE_TARGET', old_name)
>                      d.setVarFlag('ALTERNATIVE_TARGET', new_name, new_tar=
get)
> -                elif d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True):
> +                elif d.getVar('ALTERNATIVE_TARGET_%s' % pkg):
>                      d.setVar('ALTERNATIVE_TARGET_%s' % pkg, new_target)
>                  elif d.getVar('ALTERNATIVE_TARGET', old_name, True):
>                      d.setVar('ALTERNATIVE_TARGET', new_target)
> diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copy=
left_compliance.bbclass
> index 907c183..eabf12c 100644
> --- a/meta/classes/copyleft_compliance.bbclass
> +++ b/meta/classes/copyleft_compliance.bbclass
> @@ -13,7 +13,7 @@ python do_prepare_copyleft_sources () {
>      import os.path
>      import shutil
> =20
> -    p =3D d.getVar('P', True)
> +    p =3D d.getVar('P')
>      included, reason =3D copyleft_should_include(d)
>      if not included:
>          bb.debug(1, 'copyleft: %s is excluded: %s' % (p, reason))
> @@ -21,13 +21,13 @@ python do_prepare_copyleft_sources () {
>      else:
>          bb.debug(1, 'copyleft: %s is included: %s' % (p, reason))
> =20
> -    sources_dir =3D d.getVar('COPYLEFT_SOURCES_DIR', True)
> -    dl_dir =3D d.getVar('DL_DIR', True)
> -    src_uri =3D d.getVar('SRC_URI', True).split()
> +    sources_dir =3D d.getVar('COPYLEFT_SOURCES_DIR')
> +    dl_dir =3D d.getVar('DL_DIR')
> +    src_uri =3D d.getVar('SRC_URI').split()
>      fetch =3D bb.fetch2.Fetch(src_uri, d)
>      ud =3D fetch.ud
> =20
> -    pf =3D d.getVar('PF', True)
> +    pf =3D d.getVar('PF')
>      dest =3D os.path.join(sources_dir, pf)
>      shutil.rmtree(dest, ignore_errors=3DTrue)
>      bb.utils.mkdirhier(dest)
> diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft=
_filter.bbclass
> index 46be7f7..426956f 100644
> --- a/meta/classes/copyleft_filter.bbclass
> +++ b/meta/classes/copyleft_filter.bbclass
> @@ -49,7 +49,7 @@ def copyleft_should_include(d):
> =20
>      included, motive =3D False, 'recipe did not match anything'
> =20
> -    recipe_type =3D d.getVar('COPYLEFT_RECIPE_TYPE', True)
> +    recipe_type =3D d.getVar('COPYLEFT_RECIPE_TYPE')
>      if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d=
):
>          include, motive =3D False, 'recipe type "%s" is excluded' % reci=
pe_type
> =20
> @@ -57,9 +57,9 @@ def copyleft_should_include(d):
>      exclude =3D oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
> =20
>      try:
> -        is_included, reason =3D oe.license.is_included(d.getVar('LICENSE=
', True), include, exclude)
> +        is_included, reason =3D oe.license.is_included(d.getVar('LICENSE=
'), include, exclude)
>      except oe.license.LicenseError as exc:
> -        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
> +        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
>      else:
>          if is_included:
>              if reason:
> @@ -69,10 +69,10 @@ def copyleft_should_include(d):
>          else:
>              included, motive =3D False, 'recipe has excluded licenses: %=
s' % ', '.join(reason)
> =20
> -    if any(fnmatch(d.getVar('PN', True), name) \
> +    if any(fnmatch(d.getVar('PN'), name) \
>              for name in oe.data.typed_value('COPYLEFT_PN_INCLUDE', d)):
>          included, motive =3D  True, 'recipe included by name'
> -    if any(fnmatch(d.getVar('PN', True), name) \
> +    if any(fnmatch(d.getVar('PN'), name) \
>              for name in oe.data.typed_value('COPYLEFT_PN_EXCLUDE', d)):
>          included, motive =3D False, 'recipe excluded by name'
> =20
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-can=
adian.bbclass
> index 21921b3..64db113 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -20,25 +20,25 @@ CANADIANEXTRAOS =3D "${BASECANADIANEXTRAOS}"
>  CANADIANEXTRAVENDOR =3D ""
>  MODIFYTOS ??=3D "1"
>  python () {
> -    archs =3D d.getVar('PACKAGE_ARCHS', True).split()
> +    archs =3D d.getVar('PACKAGE_ARCHS').split()
>      sdkarchs =3D []
>      for arch in archs:
>          sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
>      d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
> =20
>      # Allow the following code segment to be disabled, e.g. meta-environ=
ment
> -    if d.getVar("MODIFYTOS", True) !=3D "1":
> +    if d.getVar("MODIFYTOS") !=3D "1":
>          return
> =20
> -    if d.getVar("TCLIBC", True) =3D=3D "baremetal":
> +    if d.getVar("TCLIBC") =3D=3D "baremetal":
>          return
> =20
> -    tos =3D d.getVar("TARGET_OS", True)
> +    tos =3D d.getVar("TARGET_OS")
>      whitelist =3D []
>      extralibcs =3D [""]
> -    if "uclibc" in d.getVar("BASECANADIANEXTRAOS", True):
> +    if "uclibc" in d.getVar("BASECANADIANEXTRAOS"):
>          extralibcs.append("uclibc")
> -    if "musl" in d.getVar("BASECANADIANEXTRAOS", True):
> +    if "musl" in d.getVar("BASECANADIANEXTRAOS"):
>          extralibcs.append("musl")
>      for variant in ["", "spe", "x32", "eabi", "n32"]:
>          for libc in extralibcs:
> @@ -51,33 +51,33 @@ python () {
>                  entry =3D entry + "-" + libc
>              whitelist.append(entry)
>      if tos not in whitelist:
> -        bb.fatal("Building cross-candian for an unknown TARGET_SYS (%s),=
 please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
> +        bb.fatal("Building cross-candian for an unknown TARGET_SYS (%s),=
 please update cross-canadian.bbclass" % d.getVar("TARGET_SYS"))
> =20
>      for n in ["PROVIDES", "DEPENDS"]:
> -        d.setVar(n, d.getVar(n, True))
> -    d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCH=
AIN", True))
> +        d.setVar(n, d.getVar(n))
> +    d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCH=
AIN"))
>      for prefix in ["AR", "AS", "DLLTOOL", "CC", "CXX", "GCC", "LD", "LIP=
O", "NM", "OBJDUMP", "RANLIB", "STRIP", "WINDRES"]:
>          n =3D prefix + "_FOR_TARGET"
> -        d.setVar(n, d.getVar(n, True))
> +        d.setVar(n, d.getVar(n))
>      # This is a bit ugly. We need to zero LIBC/ABI extension which will =
change TARGET_OS
>      # however we need the old value in some variables. We expand those h=
ere first.
> -    tarch =3D d.getVar("TARGET_ARCH", True)
> +    tarch =3D d.getVar("TARGET_ARCH")
>      if tarch =3D=3D "x86_64":
>          d.setVar("LIBCEXTENSION", "")
>          d.setVar("ABIEXTENSION", "")
>          d.appendVar("CANADIANEXTRAOS", " linux-gnux32")
> -        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
> +        for extraos in d.getVar("BASECANADIANEXTRAOS").split():
>              d.appendVar("CANADIANEXTRAOS", " " + extraos + "x32")
>      elif tarch =3D=3D "powerpc":
>          # PowerPC can build "linux" and "linux-gnuspe"
>          d.setVar("LIBCEXTENSION", "")
>          d.setVar("ABIEXTENSION", "")
>          d.appendVar("CANADIANEXTRAOS", " linux-gnuspe")
> -        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
> +        for extraos in d.getVar("BASECANADIANEXTRAOS").split():
>              d.appendVar("CANADIANEXTRAOS", " " + extraos + "spe")
>      elif tarch =3D=3D "mips64":
>          d.appendVar("CANADIANEXTRAOS", " linux-gnun32")
> -        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
> +        for extraos in d.getVar("BASECANADIANEXTRAOS").split():
>              d.appendVar("CANADIANEXTRAOS", " " + extraos + "n32")
>      if tarch =3D=3D "arm" or tarch =3D=3D "armeb":
>          d.appendVar("CANADIANEXTRAOS", " linux-gnueabi linux-musleabi li=
nux-uclibceabi")
> @@ -86,10 +86,10 @@ python () {
>          d.setVar("TARGET_OS", "linux")
> =20
>      # Also need to handle multilib target vendors
> -    vendors =3D d.getVar("CANADIANEXTRAVENDOR", True)
> +    vendors =3D d.getVar("CANADIANEXTRAVENDOR")
>      if not vendors:
>          vendors =3D all_multilib_tune_values(d, 'TARGET_VENDOR')
> -    origvendor =3D d.getVar("TARGET_VENDOR_MULTILIB_ORIGINAL", True)
> +    origvendor =3D d.getVar("TARGET_VENDOR_MULTILIB_ORIGINAL")
>      if origvendor:
>          d.setVar("TARGET_VENDOR", origvendor)
>          if origvendor not in vendors.split():
> @@ -116,7 +116,7 @@ HOST_LD_ARCH =3D "${SDK_LD_ARCH}"
>  HOST_AS_ARCH =3D "${SDK_AS_ARCH}"
> =20
>  #assign DPKG_ARCH
> -DPKG_ARCH =3D "${@debian_arch_map(d.getVar('SDK_ARCH', True), '')}"
> +DPKG_ARCH =3D "${@debian_arch_map(d.getVar('SDK_ARCH'), '')}"
> =20
>  CPPFLAGS =3D "${BUILDSDK_CPPFLAGS}"
>  CFLAGS =3D "${BUILDSDK_CFLAGS}"
> diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
> index 7315c38..eaf2beb 100644
> --- a/meta/classes/crosssdk.bbclass
> +++ b/meta/classes/crosssdk.bbclass
> @@ -5,7 +5,7 @@ MACHINEOVERRIDES =3D ""
>  PACKAGE_ARCH =3D "${SDK_ARCH}"
>  python () {
>  	# set TUNE_PKGARCH to SDK_ARCH
> -	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH', True))
> +	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
>  }
> =20
>  STAGING_DIR_TARGET =3D "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_=
VENDOR}-${SDK_OS}"
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index b0febfb..30f90cc 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -47,7 +47,7 @@ python do_cve_check () {
>      Check recipe for patched and unpatched CVEs
>      """
> =20
> -    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", True)):
> +    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
>          patched_cves =3D get_patches_cves(d)
>          patched, unpatched =3D check_cves(d, patched_cves)
>          if patched or unpatched:
> @@ -66,7 +66,7 @@ python cve_check_cleanup () {
>      Delete the file used to gather all the CVE information.
>      """
> =20
> -    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE", True))
> +    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
>  }
> =20
>  addhandler cve_check_cleanup
> @@ -79,12 +79,12 @@ python cve_check_write_rootfs_manifest () {
> =20
>      import shutil
> =20
> -    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", True)):
> +    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
>          bb.note("Writing rootfs CVE manifest")
> -        deploy_dir =3D d.getVar("DEPLOY_DIR_IMAGE", True)
> -        link_name =3D d.getVar("IMAGE_LINK_NAME", True)
> -        manifest_name =3D d.getVar("CVE_CHECK_MANIFEST", True)
> -        cve_tmp_file =3D d.getVar("CVE_CHECK_TMP_FILE", True)
> +        deploy_dir =3D d.getVar("DEPLOY_DIR_IMAGE")
> +        link_name =3D d.getVar("IMAGE_LINK_NAME")
> +        manifest_name =3D d.getVar("CVE_CHECK_MANIFEST")
> +        cve_tmp_file =3D d.getVar("CVE_CHECK_TMP_FILE")
> =20
>          shutil.copyfile(cve_tmp_file, manifest_name)
> =20
> @@ -97,7 +97,7 @@ python cve_check_write_rootfs_manifest () {
>              bb.plain("Image CVE report stored in: %s" % manifest_name)
>  }
> =20
> -ROOTFS_POSTPROCESS_COMMAND_prepend =3D "${@'cve_check_write_rootfs_manif=
est; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST', True) =3D=3D '1' else ''}"
> +ROOTFS_POSTPROCESS_COMMAND_prepend =3D "${@'cve_check_write_rootfs_manif=
est; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
> =20
>  def get_patches_cves(d):
>      """
> @@ -106,7 +106,7 @@ def get_patches_cves(d):
> =20
>      import re
> =20
> -    pn =3D d.getVar("PN", True)
> +    pn =3D d.getVar("PN")
>      cve_match =3D re.compile("CVE:( CVE\-\d{4}\-\d+)+")
>      patched_cves =3D set()
>      bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
> @@ -144,16 +144,16 @@ def check_cves(d, patched_cves):
> =20
>      cves_patched =3D []
>      cves_unpatched =3D []
> -    bpn =3D d.getVar("BPN", True)
> -    pv =3D d.getVar("PV", True).split("git+")[0]
> +    bpn =3D d.getVar("BPN")
> +    pv =3D d.getVar("PV").split("git+")[0]
>      cves =3D " ".join(patched_cves)
> -    cve_db_dir =3D d.getVar("CVE_CHECK_DB_DIR", True)
> -    cve_whitelist =3D ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST=
", True))
> +    cve_db_dir =3D d.getVar("CVE_CHECK_DB_DIR")
> +    cve_whitelist =3D ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST=
"))
>      cve_cmd =3D "cve-check-tool"
>      cmd =3D [cve_cmd, "--no-html", "--csv", "--not-affected", "-t", "fau=
x", "-d", cve_db_dir]
> =20
>      # If the recipe has been whitlisted we return empty lists
> -    if d.getVar("PN", True) in d.getVar("CVE_CHECK_PN_WHITELIST", True).=
split():
> +    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
>          bb.note("Recipe has been whitelisted, skipping check")
>          return ([], [])
> =20
> @@ -206,7 +206,7 @@ def get_cve_info(d, cves):
>          from pysqlite2 import dbapi2 as sqlite3
> =20
>      cve_data =3D {}
> -    db_file =3D d.getVar("CVE_CHECK_DB_FILE", True)
> +    db_file =3D d.getVar("CVE_CHECK_DB_FILE")
>      placeholder =3D ",".join("?" * len(cves))
>      query =3D "SELECT * FROM NVD WHERE id IN (%s)" % placeholder
>      conn =3D sqlite3.connect(db_file)
> @@ -227,15 +227,15 @@ def cve_write_data(d, patched, unpatched, cve_data):
>      CVE manifest if enabled.
>      """
> =20
> -    cve_file =3D d.getVar("CVE_CHECK_LOCAL_FILE", True)
> +    cve_file =3D d.getVar("CVE_CHECK_LOCAL_FILE")
>      nvd_link =3D "https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D"
>      write_string =3D ""
>      first_alert =3D True
> -    bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR", True))
> +    bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR"))
> =20
>      for cve in sorted(cve_data):
> -        write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN", True)
> -        write_string +=3D "PACKAGE VERSION: %s\n" % d.getVar("PV", True)
> +        write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN")
> +        write_string +=3D "PACKAGE VERSION: %s\n" % d.getVar("PV")
>          write_string +=3D "CVE: %s\n" % cve
>          if cve in patched:
>              write_string +=3D "CVE STATUS: Patched\n"
> @@ -253,13 +253,13 @@ def cve_write_data(d, patched, unpatched, cve_data):
>          bb.note("Writing file %s with CVE information" % cve_file)
>          f.write(write_string)
> =20
> -    if d.getVar("CVE_CHECK_COPY_FILES", True) =3D=3D "1":
> -        cve_dir =3D d.getVar("CVE_CHECK_DIR", True)
> +    if d.getVar("CVE_CHECK_COPY_FILES") =3D=3D "1":
> +        cve_dir =3D d.getVar("CVE_CHECK_DIR")
>          bb.utils.mkdirhier(cve_dir)
> -        deploy_file =3D os.path.join(cve_dir, d.getVar("PN", True))
> +        deploy_file =3D os.path.join(cve_dir, d.getVar("PN"))
>          with open(deploy_file, "w") as f:
>              f.write(write_string)
> =20
> -    if d.getVar("CVE_CHECK_CREATE_MANIFEST", True) =3D=3D "1":
> -        with open(d.getVar("CVE_CHECK_TMP_FILE", True), "a") as f:
> +    if d.getVar("CVE_CHECK_CREATE_MANIFEST") =3D=3D "1":
> +        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
>              f.write("%s" % write_string)
> diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
> index be7cacc..8124558 100644
> --- a/meta/classes/debian.bbclass
> +++ b/meta/classes/debian.bbclass
> @@ -20,17 +20,17 @@ do_package_write_tar[rdeptask] =3D "${DEBIANRDEP}"
>  do_package_write_rpm[rdeptask] =3D "${DEBIANRDEP}"
> =20
>  python () {
> -    if not d.getVar("PACKAGES", True):
> +    if not d.getVar("PACKAGES"):
>          d.setVar("DEBIANRDEP", "")
>  }
> =20
>  python debian_package_name_hook () {
>      import glob, copy, stat, errno, re
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> -    packages =3D d.getVar('PACKAGES', True)
> -    bin_re =3D re.compile(".*/s?" + os.path.basename(d.getVar("bindir", =
True)) + "$")
> -    lib_re =3D re.compile(".*/" + os.path.basename(d.getVar("libdir", Tr=
ue)) + "$")
> +    pkgdest =3D d.getVar('PKGDEST')
> +    packages =3D d.getVar('PACKAGES')
> +    bin_re =3D re.compile(".*/s?" + os.path.basename(d.getVar("bindir"))=
 + "$")
> +    lib_re =3D re.compile(".*/" + os.path.basename(d.getVar("libdir")) +=
 "$")
>      so_re =3D re.compile("lib.*\.so")
> =20
>      def socrunch(s):
> @@ -53,11 +53,11 @@ python debian_package_name_hook () {
>          return (s[stat.ST_MODE] & stat.S_IEXEC)
> =20
>      def add_rprovides(pkg, d):
> -        newpkg =3D d.getVar('PKG_' + pkg, True)
> +        newpkg =3D d.getVar('PKG_' + pkg)
>          if newpkg and newpkg !=3D pkg:
> -            provs =3D (d.getVar('RPROVIDES_' + pkg, True) or "").split()
> +            provs =3D (d.getVar('RPROVIDES_' + pkg) or "").split()
>              if pkg not in provs:
> -                d.appendVar('RPROVIDES_' + pkg, " " + pkg + " (=3D" + d.=
getVar("PKGV", True) + ")")
> +                d.appendVar('RPROVIDES_' + pkg, " " + pkg + " (=3D" + d.=
getVar("PKGV") + ")")
> =20
>      def auto_libname(packages, orig_pkg):
>          sonames =3D []
> @@ -70,7 +70,7 @@ python debian_package_name_hook () {
>              if lib_re.match(root):
>                  has_libs =3D 1
>                  if so_re.match(os.path.basename(file)):
> -                    cmd =3D (d.getVar('TARGET_PREFIX', True) or "") + "o=
bjdump -p " + file + " 2>/dev/null"
> +                    cmd =3D (d.getVar('TARGET_PREFIX') or "") + "objdump=
 -p " + file + " 2>/dev/null"
>                      fd =3D os.popen(cmd)
>                      lines =3D fd.readlines()
>                      fd.close()
> @@ -84,7 +84,7 @@ python debian_package_name_hook () {
>          if len(sonames) =3D=3D 1:
>              soname =3D sonames[0]
>          elif len(sonames) > 1:
> -            lead =3D d.getVar('LEAD_SONAME', True)
> +            lead =3D d.getVar('LEAD_SONAME')
>              if lead:
>                  r =3D re.compile(lead)
>                  filtered =3D []
> @@ -115,7 +115,7 @@ python debian_package_name_hook () {
>                          newpkg =3D pkgname
>                      else:
>                          newpkg =3D pkg.replace(orig_pkg, devname, 1)
> -                    mlpre=3Dd.getVar('MLPREFIX', True)
> +                    mlpre=3Dd.getVar('MLPREFIX')
>                      if mlpre:
>                          if not newpkg.find(mlpre) =3D=3D 0:
>                              newpkg =3D mlpre + newpkg
> @@ -131,7 +131,7 @@ python debian_package_name_hook () {
>      # and later
>      # DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libtic=
w orig_pkg ncurses-libtic debian_pn None newpkg libticw
>      # so we need to handle ncurses-libticw->libticw5 before ncurses-libt=
ic->libtic5
> -    for pkg in sorted((d.getVar('AUTO_LIBNAME_PKGS', True) or "").split(=
), reverse=3DTrue):
> +    for pkg in sorted((d.getVar('AUTO_LIBNAME_PKGS') or "").split(), rev=
erse=3DTrue):
>          auto_libname(packages, pkg)
>  }
> =20
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index be71aff..864ace4 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -5,14 +5,14 @@ DEVSHELL =3D "${SHELL}"
>  python do_devshell () {
>      if d.getVarFlag("do_devshell", "manualfakeroot", True):
>         d.prependVar("DEVSHELL", "pseudo ")
> -       fakeenv =3D d.getVar("FAKEROOTENV", True).split()
> +       fakeenv =3D d.getVar("FAKEROOTENV").split()
>         for f in fakeenv:
>              k =3D f.split("=3D")
>              d.setVar(k[0], k[1])          =20
>              d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
>         d.delVarFlag("do_devshell", "fakeroot")
> =20
> -    oe_terminal(d.getVar('DEVSHELL', True), 'OpenEmbedded Developer Shel=
l', d)
> +    oe_terminal(d.getVar('DEVSHELL'), 'OpenEmbedded Developer Shell', d)
>  }
> =20
>  addtask devshell after do_patch
> @@ -82,7 +82,7 @@ def devpyshell(d):
>          more =3D False
> =20
>          i =3D code.InteractiveInterpreter(locals=3D_context)
> -        print("OE PyShell (PN =3D %s)\n" % d.getVar("PN", True))
> +        print("OE PyShell (PN =3D %s)\n" % d.getVar("PN"))
> =20
>          def prompt(more):
>              if more:
> diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/di=
stro_features_check.bbclass
> index 7e91dbc..e74d3c0 100644
> --- a/meta/classes/distro_features_check.bbclass
> +++ b/meta/classes/distro_features_check.bbclass
> @@ -11,15 +11,15 @@
> =20
>  python () {
>      # Assume at least one var is set.
> -    distro_features =3D (d.getVar('DISTRO_FEATURES', True) or "").split()
> +    distro_features =3D (d.getVar('DISTRO_FEATURES') or "").split()
> =20
> -    any_of_distro_features =3D d.getVar('ANY_OF_DISTRO_FEATURES', True)
> +    any_of_distro_features =3D d.getVar('ANY_OF_DISTRO_FEATURES')
>      if any_of_distro_features:
>          any_of_distro_features =3D any_of_distro_features.split()
>          if set.isdisjoint(set(any_of_distro_features),set(distro_feature=
s)):
>              raise bb.parse.SkipPackage("one of '%s' needs to be in DISTR=
O_FEATURES" % any_of_distro_features)
> =20
> -    required_distro_features =3D d.getVar('REQUIRED_DISTRO_FEATURES', Tr=
ue)
> +    required_distro_features =3D d.getVar('REQUIRED_DISTRO_FEATURES')
>      if required_distro_features:
>          required_distro_features =3D required_distro_features.split()
>          for f in required_distro_features:
> @@ -28,7 +28,7 @@ python () {
>              else:
>                  raise bb.parse.SkipPackage("missing required distro feat=
ure '%s' (not in DISTRO_FEATURES)" % f)
> =20
> -    conflict_distro_features =3D d.getVar('CONFLICT_DISTRO_FEATURES', Tr=
ue)
> +    conflict_distro_features =3D d.getVar('CONFLICT_DISTRO_FEATURES')
>      if conflict_distro_features:
>          conflict_distro_features =3D conflict_distro_features.split()
>          for f in conflict_distro_features:
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bb=
class
> index fbb7402..5b3a3e0 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -25,75 +25,75 @@ addtask distrodata_np
>  do_distrodata_np[nostamp] =3D "1"
>  python do_distrodata_np() {
>          localdata =3D bb.data.createCopy(d)
> -        pn =3D d.getVar("PN", True)
> +        pn =3D d.getVar("PN")
>          bb.note("Package Name: %s" % pn)
> =20
>          import oe.distro_check as dist_check
> -        tmpdir =3D d.getVar('TMPDIR', True)
> +        tmpdir =3D d.getVar('TMPDIR')
>          distro_check_dir =3D os.path.join(tmpdir, "distro_check")
> -        datetime =3D localdata.getVar('DATETIME', True)
> +        datetime =3D localdata.getVar('DATETIME')
>          dist_check.update_distro_data(distro_check_dir, datetime, locald=
ata)
> =20
>          if pn.find("-native") !=3D -1:
>              pnstripped =3D pn.split("-native")
>              bb.note("Native Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pn.find("-cross") !=3D -1:
>              pnstripped =3D pn.split("-cross")
>              bb.note("cross Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pn.find("-crosssdk") !=3D -1:
>              pnstripped =3D pn.split("-crosssdk")
>              bb.note("cross Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pn.startswith("nativesdk-"):
>              pnstripped =3D pn.replace("nativesdk-", "")
>              bb.note("NativeSDK Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.g=
etVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.g=
etVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
> =20
>          if pn.find("-initial") !=3D -1:
>              pnstripped =3D pn.split("-initial")
>              bb.note("initial Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          """generate package information from .bb file"""
> -        pname =3D localdata.getVar('PN', True)
> -        pcurver =3D localdata.getVar('PV', True)
> -        pdesc =3D localdata.getVar('DESCRIPTION', True)
> +        pname =3D localdata.getVar('PN')
> +        pcurver =3D localdata.getVar('PV')
> +        pdesc =3D localdata.getVar('DESCRIPTION')
>          if pdesc is not None:
>                  pdesc =3D pdesc.replace(',','')
>                  pdesc =3D pdesc.replace('\n','')
> =20
> -        pgrp =3D localdata.getVar('SECTION', True)
> -        plicense =3D localdata.getVar('LICENSE', True).replace(',','_')
> +        pgrp =3D localdata.getVar('SECTION')
> +        plicense =3D localdata.getVar('LICENSE').replace(',','_')
> =20
> -        rstatus =3D localdata.getVar('RECIPE_COLOR', True)
> +        rstatus =3D localdata.getVar('RECIPE_COLOR')
>          if rstatus is not None:
>                  rstatus =3D rstatus.replace(',','')
> =20
> -        pupver =3D localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
> +        pupver =3D localdata.getVar('RECIPE_UPSTREAM_VERSION')
>          if pcurver =3D=3D pupver:
>                  vermatch=3D"1"
>          else:
>                  vermatch=3D"0"
> -        noupdate_reason =3D localdata.getVar('RECIPE_NO_UPDATE_REASON', =
True)
> +        noupdate_reason =3D localdata.getVar('RECIPE_NO_UPDATE_REASON')
>          if noupdate_reason is None:
>                  noupdate=3D"0"
>          else:
>                  noupdate=3D"1"
>                  noupdate_reason =3D noupdate_reason.replace(',','')
> =20
> -        maintainer =3D localdata.getVar('RECIPE_MAINTAINER', True)
> -        rlrd =3D localdata.getVar('RECIPE_UPSTREAM_DATE', True)
> +        maintainer =3D localdata.getVar('RECIPE_MAINTAINER')
> +        rlrd =3D localdata.getVar('RECIPE_UPSTREAM_DATE')
>          result =3D dist_check.compare_in_distro_packages_list(distro_che=
ck_dir, localdata)
> =20
>          bb.note("DISTRO: %s,%s,%s,%s,%s,%s,%s,%s,%s\n" % \
> @@ -109,80 +109,80 @@ addtask distrodata
>  do_distrodata[nostamp] =3D "1"
>  python do_distrodata() {
>          import csv
> -        logpath =3D d.getVar('LOG_DIR', True)
> +        logpath =3D d.getVar('LOG_DIR')
>          bb.utils.mkdirhier(logpath)
>          logfile =3D os.path.join(logpath, "distrodata.csv")
> =20
>          import oe.distro_check as dist_check
>          localdata =3D bb.data.createCopy(d)
> -        tmpdir =3D d.getVar('TMPDIR', True)
> +        tmpdir =3D d.getVar('TMPDIR')
>          distro_check_dir =3D os.path.join(tmpdir, "distro_check")
> -        datetime =3D localdata.getVar('DATETIME', True)
> +        datetime =3D localdata.getVar('DATETIME')
>          dist_check.update_distro_data(distro_check_dir, datetime, locald=
ata)
> =20
> -        pn =3D d.getVar("PN", True)
> +        pn =3D d.getVar("PN")
>          bb.note("Package Name: %s" % pn)
> =20
>          if pn.find("-native") !=3D -1:
>              pnstripped =3D pn.split("-native")
>              bb.note("Native Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pn.startswith("nativesdk-"):
>              pnstripped =3D pn.replace("nativesdk-", "")
>              bb.note("NativeSDK Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.g=
etVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.g=
etVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pn.find("-cross") !=3D -1:
>              pnstripped =3D pn.split("-cross")
>              bb.note("cross Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pn.find("-crosssdk") !=3D -1:
>              pnstripped =3D pn.split("-crosssdk")
>              bb.note("cross Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pn.find("-initial") !=3D -1:
>              pnstripped =3D pn.split("-initial")
>              bb.note("initial Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          """generate package information from .bb file"""
> -        pname =3D localdata.getVar('PN', True)
> -        pcurver =3D localdata.getVar('PV', True)
> -        pdesc =3D localdata.getVar('DESCRIPTION', True)
> +        pname =3D localdata.getVar('PN')
> +        pcurver =3D localdata.getVar('PV')
> +        pdesc =3D localdata.getVar('DESCRIPTION')
>          if pdesc is not None:
>                  pdesc =3D pdesc.replace(',','')
>                  pdesc =3D pdesc.replace('\n','')
> =20
> -        pgrp =3D localdata.getVar('SECTION', True)
> -        plicense =3D localdata.getVar('LICENSE', True).replace(',','_')
> +        pgrp =3D localdata.getVar('SECTION')
> +        plicense =3D localdata.getVar('LICENSE').replace(',','_')
> =20
> -        rstatus =3D localdata.getVar('RECIPE_COLOR', True)
> +        rstatus =3D localdata.getVar('RECIPE_COLOR')
>          if rstatus is not None:
>                  rstatus =3D rstatus.replace(',','')
> =20
> -        pupver =3D localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
> +        pupver =3D localdata.getVar('RECIPE_UPSTREAM_VERSION')
>          if pcurver =3D=3D pupver:
>                  vermatch=3D"1"
>          else:
>                  vermatch=3D"0"
> =20
> -        noupdate_reason =3D localdata.getVar('RECIPE_NO_UPDATE_REASON', =
True)
> +        noupdate_reason =3D localdata.getVar('RECIPE_NO_UPDATE_REASON')
>          if noupdate_reason is None:
>                  noupdate=3D"0"
>          else:
>                  noupdate=3D"1"
>                  noupdate_reason =3D noupdate_reason.replace(',','')
> =20
> -        maintainer =3D localdata.getVar('RECIPE_MAINTAINER', True)
> -        rlrd =3D localdata.getVar('RECIPE_UPSTREAM_DATE', True)
> +        maintainer =3D localdata.getVar('RECIPE_MAINTAINER')
> +        rlrd =3D localdata.getVar('RECIPE_UPSTREAM_DATE')
>          # do the comparison
>          result =3D dist_check.compare_in_distro_packages_list(distro_che=
ck_dir, localdata)
> =20
> @@ -272,60 +272,60 @@ python do_checkpkg() {
>          from bb.fetch2 import FetchError, NoMethodError, decodeurl
> =20
>          """first check whether a uri is provided"""
> -        src_uri =3D (d.getVar('SRC_URI', True) or '').split()
> +        src_uri =3D (d.getVar('SRC_URI') or '').split()
>          if src_uri:
>              uri_type, _, _, _, _, _ =3D decodeurl(src_uri[0])
>          else:
>              uri_type =3D "none"
> =20
>          """initialize log files."""
> -        logpath =3D d.getVar('LOG_DIR', True)
> +        logpath =3D d.getVar('LOG_DIR')
>          bb.utils.mkdirhier(logpath)
>          logfile =3D os.path.join(logpath, "checkpkg.csv")
> =20
>          """generate package information from .bb file"""
> -        pname =3D d.getVar('PN', True)
> +        pname =3D d.getVar('PN')
> =20
>          if pname.find("-native") !=3D -1:
> -            if d.getVar('BBCLASSEXTEND', True):
> +            if d.getVar('BBCLASSEXTEND'):
>                      return
>              pnstripped =3D pname.split("-native")
>              bb.note("Native Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pname.startswith("nativesdk-"):
> -            if d.getVar('BBCLASSEXTEND', True):
> +            if d.getVar('BBCLASSEXTEND'):
>                      return
>              pnstripped =3D pname.replace("nativesdk-", "")
>              bb.note("NativeSDK Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.g=
etVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.g=
etVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pname.find("-cross") !=3D -1:
>              pnstripped =3D pname.split("-cross")
>              bb.note("cross Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
>          if pname.find("-initial") !=3D -1:
>              pnstripped =3D pname.split("-initial")
>              bb.note("initial Split: %s" % pnstripped)
> -            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES', True))
> +            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + =
d.getVar('OVERRIDES'))
>              bb.data.update_data(localdata)
> =20
> -        pdesc =3D localdata.getVar('DESCRIPTION', True)
> -        pgrp =3D localdata.getVar('SECTION', True)
> -        pversion =3D localdata.getVar('PV', True)
> -        plicense =3D localdata.getVar('LICENSE', True)
> -        psection =3D localdata.getVar('SECTION', True)
> -        phome =3D localdata.getVar('HOMEPAGE', True)
> -        prelease =3D localdata.getVar('PR', True)
> -        pdepends =3D localdata.getVar('DEPENDS', True)
> -        pbugtracker =3D localdata.getVar('BUGTRACKER', True)
> -        ppe =3D localdata.getVar('PE', True)
> -        psrcuri =3D localdata.getVar('SRC_URI', True)
> -        maintainer =3D localdata.getVar('RECIPE_MAINTAINER', True)
> +        pdesc =3D localdata.getVar('DESCRIPTION')
> +        pgrp =3D localdata.getVar('SECTION')
> +        pversion =3D localdata.getVar('PV')
> +        plicense =3D localdata.getVar('LICENSE')
> +        psection =3D localdata.getVar('SECTION')
> +        phome =3D localdata.getVar('HOMEPAGE')
> +        prelease =3D localdata.getVar('PR')
> +        pdepends =3D localdata.getVar('DEPENDS')
> +        pbugtracker =3D localdata.getVar('BUGTRACKER')
> +        ppe =3D localdata.getVar('PE')
> +        psrcuri =3D localdata.getVar('SRC_URI')
> +        maintainer =3D localdata.getVar('RECIPE_MAINTAINER')
> =20
>          """ Get upstream version version """
>          pupver =3D ""
> @@ -362,7 +362,7 @@ python do_checkpkg() {
>              psrcuri =3D "none"
>          pdepends =3D "".join(pdepends.split("\t"))
>          pdesc =3D "".join(pdesc.split("\t"))
> -        no_upgr_reason =3D d.getVar('RECIPE_NO_UPDATE_REASON', True)
> +        no_upgr_reason =3D d.getVar('RECIPE_NO_UPDATE_REASON')
>          lf =3D bb.utils.lockfile("%s.lock" % logfile)
>          with open(logfile, "a") as f:
>              writer =3D csv.writer(f, delimiter=3D'\t')
> @@ -401,12 +401,12 @@ python do_distro_check() {
> =20
>      localdata =3D bb.data.createCopy(d)
>      bb.data.update_data(localdata)
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
>      distro_check_dir =3D os.path.join(tmpdir, "distro_check")
> -    logpath =3D d.getVar('LOG_DIR', True)
> +    logpath =3D d.getVar('LOG_DIR')
>      bb.utils.mkdirhier(logpath)
>      result_file =3D os.path.join(logpath, "distrocheck.csv")
> -    datetime =3D localdata.getVar('DATETIME', True)
> +    datetime =3D localdata.getVar('DATETIME')
>      dc.update_distro_data(distro_check_dir, datetime, localdata)
> =20
>      # do the comparison
> @@ -449,12 +449,12 @@ do_checklicense[nostamp] =3D "1"
>  python do_checklicense() {
>      import csv
>      import shutil
> -    logpath =3D d.getVar('LOG_DIR', True)
> +    logpath =3D d.getVar('LOG_DIR')
>      bb.utils.mkdirhier(logpath)
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      logfile =3D os.path.join(logpath, "missinglicense.csv")
> -    generic_directory =3D d.getVar('COMMON_LICENSE_DIR', True)
> -    license_types =3D d.getVar('LICENSE', True)
> +    generic_directory =3D d.getVar('COMMON_LICENSE_DIR')
> +    license_types =3D d.getVar('LICENSE')
>      for license_type in ((license_types.replace('+', '').replace('|', '&=
')
>                            .replace('(', '').replace(')', '').replace(';'=
, '')
>                            .replace(',', '').replace(" ", "").split("&"))=
):
> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils=
-base.bbclass
> index aa18e8b..9f398d7 100644
> --- a/meta/classes/distutils-base.bbclass
> +++ b/meta/classes/distutils-base.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PA=
CKAGES', True) =3D=3D '')]}"
> +DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PA=
CKAGES') =3D=3D '')]}"
>  RDEPENDS_${PN} +=3D "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' =3D=
=3D 'class-target']}"
> =20
>  inherit distutils-common-base pythonnative
> diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutil=
s3-base.bbclass
> index 82ab6a3..7dbf07a 100644
> --- a/meta/classes/distutils3-base.bbclass
> +++ b/meta/classes/distutils3-base.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PA=
CKAGES', True) =3D=3D '')]}"
> +DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PA=
CKAGES') =3D=3D '')]}"
>  RDEPENDS_${PN} +=3D "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' =3D=
=3D 'class-target']}"
> =20
>  inherit distutils-common-base python3native
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index 31908c3..5ba6c34 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -28,34 +28,34 @@ SRCTREECOVEREDTASKS ?=3D "do_patch do_unpack do_fetch"
>  EXTERNALSRC_SYMLINKS ?=3D "oe-workdir:${WORKDIR} oe-logs:${T}"
> =20
>  python () {
> -    externalsrc =3D d.getVar('EXTERNALSRC', True)
> +    externalsrc =3D d.getVar('EXTERNALSRC')
> =20
>      # If this is the base recipe and EXTERNALSRC is set for it or any of=
 its
>      # derivatives, then enable BB_DONT_CACHE to force the recipe to alwa=
ys be
>      # re-parsed so that the file-checksums function for do_compile is ru=
n every
>      # time.
> -    bpn =3D d.getVar('BPN', True)
> -    if bpn =3D=3D d.getVar('PN', True):
> -        classextend =3D (d.getVar('BBCLASSEXTEND', True) or '').split()
> +    bpn =3D d.getVar('BPN')
> +    if bpn =3D=3D d.getVar('PN'):
> +        classextend =3D (d.getVar('BBCLASSEXTEND') or '').split()
>          if (externalsrc or
>                  ('native' in classextend and
> -                 d.getVar('EXTERNALSRC_pn-%s-native' % bpn, True)) or
> +                 d.getVar('EXTERNALSRC_pn-%s-native' % bpn)) or
>                  ('nativesdk' in classextend and
> -                 d.getVar('EXTERNALSRC_pn-nativesdk-%s' % bpn, True)) or
> +                 d.getVar('EXTERNALSRC_pn-nativesdk-%s' % bpn)) or
>                  ('cross' in classextend and
> -                 d.getVar('EXTERNALSRC_pn-%s-cross' % bpn, True))):
> +                 d.getVar('EXTERNALSRC_pn-%s-cross' % bpn))):
>              d.setVar('BB_DONT_CACHE', '1')
> =20
>      if externalsrc:
>          d.setVar('S', externalsrc)
> -        externalsrcbuild =3D d.getVar('EXTERNALSRC_BUILD', True)
> +        externalsrcbuild =3D d.getVar('EXTERNALSRC_BUILD')
>          if externalsrcbuild:
>              d.setVar('B', externalsrcbuild)
>          else:
>              d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
> =20
>          local_srcuri =3D []
> -        fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI', True) or '').spli=
t(), d)
> +        fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
>          for url in fetch.urls:
>              url_data =3D fetch.ud[url]
>              parm =3D url_data.parm
> @@ -94,7 +94,7 @@ python () {
>          # Note that we cannot use d.appendVarFlag() here because deps is=
 expected to be a list object, not a string
>          d.setVarFlag('do_configure', 'deps', (d.getVarFlag('do_configure=
', 'deps', False) or []) + ['do_unpack'])
> =20
> -        for task in d.getVar("SRCTREECOVEREDTASKS", True).split():
> +        for task in d.getVar("SRCTREECOVEREDTASKS").split():
>              if local_srcuri and task in fetch_tasks:
>                  continue
>              bb.build.deltask(task, d)
> @@ -106,13 +106,13 @@ python () {
>          d.setVarFlag('do_configure', 'file-checksums', '${@srctree_confi=
gure_hash_files(d)}')
> =20
>          # We don't want the workdir to go away
> -        d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN', True))
> +        d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
> =20
>          # If B=3DS the same builddir is used even for different architec=
tures.
>          # Thus, use a shared CONFIGURESTAMPFILE and STAMP directory so t=
hat
>          # change of do_configure task hash is correctly detected and sta=
mps are
>          # invalidated if e.g. MACHINE changes.
> -        if d.getVar('S', True) =3D=3D d.getVar('B', True):
> +        if d.getVar('S') =3D=3D d.getVar('B'):
>              configstamp =3D '${TMPDIR}/work-shared/${PN}/${EXTENDPE}${PV=
}-${PR}/configure.sstate'
>              d.setVar('CONFIGURESTAMPFILE', configstamp)
>              d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDP=
E}${PV}-${PR}')
> @@ -120,10 +120,10 @@ python () {
> =20
>  python externalsrc_configure_prefunc() {
>      # Create desired symlinks
> -    symlinks =3D (d.getVar('EXTERNALSRC_SYMLINKS', True) or '').split()
> +    symlinks =3D (d.getVar('EXTERNALSRC_SYMLINKS') or '').split()
>      for symlink in symlinks:
>          symsplit =3D symlink.split(':', 1)
> -        lnkfile =3D os.path.join(d.getVar('S', True), symsplit[0])
> +        lnkfile =3D os.path.join(d.getVar('S'), symsplit[0])
>          target =3D d.expand(symsplit[1])
>          if len(symsplit) > 1:
>              if os.path.islink(lnkfile):
> @@ -139,7 +139,7 @@ python externalsrc_configure_prefunc() {
> =20
>  python externalsrc_compile_prefunc() {
>      # Make it obvious that this is happening, since forgetting about it =
could lead to much confusion
> -    bb.plain('NOTE: %s: compiling from external source tree %s' % (d.get=
Var('PN', True), d.getVar('EXTERNALSRC', True)))
> +    bb.plain('NOTE: %s: compiling from external source tree %s' % (d.get=
Var('PN'), d.getVar('EXTERNALSRC')))
>  }
> =20
>  def srctree_hash_files(d):
> @@ -147,7 +147,7 @@ def srctree_hash_files(d):
>      import subprocess
>      import tempfile
> =20
> -    s_dir =3D d.getVar('EXTERNALSRC', True)
> +    s_dir =3D d.getVar('EXTERNALSRC')
>      git_dir =3D os.path.join(s_dir, '.git')
>      oe_hash_file =3D os.path.join(git_dir, 'oe-devtool-tree-sha1')
> =20
> @@ -165,7 +165,7 @@ def srctree_hash_files(d):
>              fobj.write(sha1)
>          ret =3D oe_hash_file + ':True'
>      else:
> -        ret =3D d.getVar('EXTERNALSRC', True) + '/*:True'
> +        ret =3D d.getVar('EXTERNALSRC') + '/*:True'
>      return ret
> =20
>  def srctree_configure_hash_files(d):
> @@ -173,7 +173,7 @@ def srctree_configure_hash_files(d):
>      Get the list of files that should trigger do_configure to re-execute,
>      based on the value of CONFIGURE_FILES
>      """
> -    in_files =3D (d.getVar('CONFIGURE_FILES', True) or '').split()
> +    in_files =3D (d.getVar('CONFIGURE_FILES') or '').split()
>      out_items =3D []
>      search_files =3D []
>      for entry in in_files:
> @@ -182,7 +182,7 @@ def srctree_configure_hash_files(d):
>          else:
>              search_files.append(entry)
>      if search_files:
> -        s_dir =3D d.getVar('EXTERNALSRC', True)
> +        s_dir =3D d.getVar('EXTERNALSRC')
>          for root, _, files in os.walk(s_dir):
>              for f in files:
>                  if f in search_files:
> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bb=
class
> index 43900f3..39e5ff2 100644
> --- a/meta/classes/extrausers.bbclass
> +++ b/meta/classes/extrausers.bbclass
> @@ -15,7 +15,7 @@
> =20
>  inherit useradd_base
> =20
> -IMAGE_INSTALL_append =3D " ${@['', 'base-passwd shadow'][bool(d.getVar('=
EXTRA_USERS_PARAMS', True))]}"
> +IMAGE_INSTALL_append =3D " ${@['', 'base-passwd shadow'][bool(d.getVar('=
EXTRA_USERS_PARAMS'))]}"
> =20
>  # Image level user / group settings
>  ROOTFS_POSTPROCESS_COMMAND_append =3D " set_user_group;"
> diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbcl=
ass
> index 8ebdfc4..d047a79 100644
> --- a/meta/classes/fontcache.bbclass
> +++ b/meta/classes/fontcache.bbclass
> @@ -30,26 +30,26 @@ fi
>  }
> =20
>  python () {
> -    font_pkgs =3D d.getVar('FONT_PACKAGES', True).split()
> -    deps =3D d.getVar("FONT_EXTRA_RDEPENDS", True)
> +    font_pkgs =3D d.getVar('FONT_PACKAGES').split()
> +    deps =3D d.getVar("FONT_EXTRA_RDEPENDS")
> =20
>      for pkg in font_pkgs:
>          if deps: d.appendVar('RDEPENDS_' + pkg, ' '+deps)
>  }
> =20
>  python add_fontcache_postinsts() {
> -    for pkg in d.getVar('FONT_PACKAGES', True).split():
> +    for pkg in d.getVar('FONT_PACKAGES').split():
>          bb.note("adding fonts postinst and postrm scripts to %s" % pkg)
> -        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar=
('pkg_postinst', True)
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_=
postinst')
>          if not postinst:
>              postinst =3D '#!/bin/sh\n'
> -        postinst +=3D d.getVar('fontcache_common', True)
> +        postinst +=3D d.getVar('fontcache_common')
>          d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pk=
g_postrm', True)
> +        postrm =3D d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_post=
rm')
>          if not postrm:
>              postrm =3D '#!/bin/sh\n'
> -        postrm +=3D d.getVar('fontcache_common', True)
> +        postrm +=3D d.getVar('fontcache_common')
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> =20
> diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
> index bd2613c..313c5a3 100644
> --- a/meta/classes/fs-uuid.bbclass
> +++ b/meta/classes/fs-uuid.bbclass
> @@ -3,7 +3,7 @@
>  # on ext file systems and depends on tune2fs.
>  def get_rootfs_uuid(d):
>      import subprocess
> -    rootfs =3D d.getVar('ROOTFS', True)
> +    rootfs =3D d.getVar('ROOTFS')
>      output =3D subprocess.check_output(['tune2fs', '-l', rootfs])
>      for line in output.split('\n'):
>          if line.startswith('Filesystem UUID:'):
> diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
> index d7afa72..d07bead 100644
> --- a/meta/classes/gconf.bbclass
> +++ b/meta/classes/gconf.bbclass
> @@ -42,8 +42,8 @@ done
> =20
>  python populate_packages_append () {
>      import re
> -    packages =3D d.getVar('PACKAGES', True).split()
> -    pkgdest =3D  d.getVar('PKGDEST', True)
> +    packages =3D d.getVar('PACKAGES').split()
> +    pkgdest =3D  d.getVar('PKGDEST')
>     =20
>      for pkg in packages:
>          schema_dir =3D '%s/%s/etc/gconf/schemas' % (pkgdest, pkg)
> @@ -56,15 +56,15 @@ python populate_packages_append () {
>          if schemas !=3D []:
>              bb.note("adding gconf postinst and prerm scripts to %s" % pk=
g)
>              d.setVar('SCHEMA_FILES', " ".join(schemas))
> -            postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +            postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>              if not postinst:
>                  postinst =3D '#!/bin/sh\n'
> -            postinst +=3D d.getVar('gconf_postinst', True)
> +            postinst +=3D d.getVar('gconf_postinst')
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> -            prerm =3D d.getVar('pkg_prerm_%s' % pkg, True)
> +            prerm =3D d.getVar('pkg_prerm_%s' % pkg)
>              if not prerm:
>                  prerm =3D '#!/bin/sh\n'
> -            prerm +=3D d.getVar('gconf_prerm', True)
> +            prerm +=3D d.getVar('gconf_prerm')
>              d.setVar('pkg_prerm_%s' % pkg, prerm)
>              d.appendVar("RDEPENDS_%s" % pkg, ' ' + d.getVar('MLPREFIX', =
False) + 'gconf')
>  }
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index 03b89b2..0be1424 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -1,15 +1,15 @@
>  def gettext_dependencies(d):
> -    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(=
d, 'cross-canadian'):
> +    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cr=
oss-canadian'):
>          return ""
> -    if d.getVar('USE_NLS', True) =3D=3D 'no':
> +    if d.getVar('USE_NLS') =3D=3D 'no':
>          return "gettext-minimal-native"
>      return d.getVar('DEPENDS_GETTEXT', False)
> =20
>  def gettext_oeconf(d):
> -    if d.getVar('USE_NLS', True) =3D=3D 'no':
> +    if d.getVar('USE_NLS') =3D=3D 'no':
>          return '--disable-nls'
>      # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
> -    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(=
d, 'cross-canadian'):
> +    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cr=
oss-canadian'):
>          return '--disable-nls'
>      return "--enable-nls"
> =20
> diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-mod=
ule-cache.bbclass
> index 91461b1..39b7bef 100644
> --- a/meta/classes/gio-module-cache.bbclass
> +++ b/meta/classes/gio-module-cache.bbclass
> @@ -17,21 +17,21 @@ fi
>  }
> =20
>  python populate_packages_append () {
> -    packages =3D d.getVar('GIO_MODULE_PACKAGES', True).split()
> +    packages =3D d.getVar('GIO_MODULE_PACKAGES').split()
> =20
>      for pkg in packages:
>          bb.note("adding gio-module-cache postinst and postrm scripts to =
%s" % pkg)
> =20
> -        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>          if not postinst:
>              postinst =3D '#!/bin/sh\n'
> -        postinst +=3D d.getVar('gio_module_cache_common', True)
> +        postinst +=3D d.getVar('gio_module_cache_common')
>          d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True)
> +        postrm =3D d.getVar('pkg_postrm_%s' % pkg)
>          if not postrm:
>              postrm =3D '#!/bin/sh\n'
> -        postrm +=3D d.getVar('gio_module_cache_common', True)
> +        postrm +=3D d.getVar('gio_module_cache_common')
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> =20
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index 17417ba..3dc9146 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -72,14 +72,14 @@ efi_hddimg_populate() {
>  python build_efi_cfg() {
>      import sys
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      if not workdir:
>          bb.error("WORKDIR not defined, unable to package")
>          return
> =20
> -    gfxserial =3D d.getVar('GRUB_GFXSERIAL', True) or ""
> +    gfxserial =3D d.getVar('GRUB_GFXSERIAL') or ""
> =20
> -    labels =3D d.getVar('LABELS', True)
> +    labels =3D d.getVar('LABELS')
>      if not labels:
>          bb.debug(1, "LABELS not defined, nothing to do")
>          return
> @@ -88,7 +88,7 @@ python build_efi_cfg() {
>          bb.debug(1, "No labels, nothing to do")
>          return
> =20
> -    cfile =3D d.getVar('GRUB_CFG', True)
> +    cfile =3D d.getVar('GRUB_CFG')
>      if not cfile:
>          bb.fatal('Unable to read GRUB_CFG')
> =20
> @@ -99,33 +99,33 @@ python build_efi_cfg() {
> =20
>      cfgfile.write('# Automatically created by OE\n')
> =20
> -    opts =3D d.getVar('GRUB_OPTS', True)
> +    opts =3D d.getVar('GRUB_OPTS')
>      if opts:
>          for opt in opts.split(';'):
>              cfgfile.write('%s\n' % opt)
> =20
>      cfgfile.write('default=3D%s\n' % (labels.split()[0]))
> =20
> -    timeout =3D d.getVar('GRUB_TIMEOUT', True)
> +    timeout =3D d.getVar('GRUB_TIMEOUT')
>      if timeout:
>          cfgfile.write('timeout=3D%s\n' % timeout)
>      else:
>          cfgfile.write('timeout=3D50\n')
> =20
> -    root =3D d.getVar('GRUB_ROOT', True)
> +    root =3D d.getVar('GRUB_ROOT')
>      if not root:
>          bb.fatal('GRUB_ROOT not defined')
> =20
>      if gfxserial =3D=3D "1":
>          btypes =3D [ [ " graphics console", "" ],
> -            [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
> +            [ " serial console", d.getVar('GRUB_SERIAL') or "" ] ]
>      else:
>          btypes =3D [ [ "", "" ] ]
> =20
>      for label in labels.split():
>          localdata =3D d.createCopy()
> =20
> -        overrides =3D localdata.getVar('OVERRIDES', True)
> +        overrides =3D localdata.getVar('OVERRIDES')
>          if not overrides:
>              bb.fatal('OVERRIDES not defined')
> =20
> @@ -141,8 +141,8 @@ python build_efi_cfg() {
> =20
>              cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
> =20
> -            append =3D localdata.getVar('APPEND', True)
> -            initrd =3D localdata.getVar('INITRD', True)
> +            append =3D localdata.getVar('APPEND')
> +            initrd =3D localdata.getVar('INITRD')
> =20
>              if append:
>                  append =3D replace_rootfs_uuid(d, append)
> diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbcl=
ass
> index dec5abc..e6d1c8a 100644
> --- a/meta/classes/gsettings.bbclass
> +++ b/meta/classes/gsettings.bbclass
> @@ -18,20 +18,20 @@ gsettings_postinstrm () {
>  }
> =20
>  python populate_packages_append () {
> -    pkg =3D d.getVar('PN', True)
> +    pkg =3D d.getVar('PN')
>      bb.note("adding gsettings postinst scripts to %s" % pkg)
> =20
> -    postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pk=
g_postinst', True)
> +    postinst =3D d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_post=
inst')
>      if not postinst:
>          postinst =3D '#!/bin/sh\n'
> -    postinst +=3D d.getVar('gsettings_postinstrm', True)
> +    postinst +=3D d.getVar('gsettings_postinstrm')
>      d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
>      bb.note("adding gsettings postrm scripts to %s" % pkg)
> =20
> -    postrm =3D d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_po=
strm', True)
> +    postrm =3D d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
>      if not postrm:
>          postrm =3D '#!/bin/sh\n'
> -    postrm +=3D d.getVar('gsettings_postinstrm', True)
> +    postrm +=3D d.getVar('gsettings_postinstrm')
>      d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-=
cache.bbclass
> index 0f1052b..c5d8d7c 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -35,11 +35,11 @@ fi
>  }
> =20
>  python populate_packages_append () {
> -    packages =3D d.getVar('PACKAGES', True).split()
> -    pkgdest =3D  d.getVar('PKGDEST', True)
> +    packages =3D d.getVar('PACKAGES').split()
> +    pkgdest =3D  d.getVar('PKGDEST')
>     =20
>      for pkg in packages:
> -        icon_dir =3D '%s/%s/%s/icons' % (pkgdest, pkg, d.getVar('datadir=
', True))
> +        icon_dir =3D '%s/%s/%s/icons' % (pkgdest, pkg, d.getVar('datadir=
'))
>          if not os.path.exists(icon_dir):
>              continue
> =20
> @@ -49,16 +49,16 @@ python populate_packages_append () {
>     =20
>          bb.note("adding gtk-icon-cache postinst and postrm scripts to %s=
" % pkg)
>         =20
> -        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>          if not postinst:
>              postinst =3D '#!/bin/sh\n'
> -        postinst +=3D d.getVar('gtk_icon_cache_postinst', True)
> +        postinst +=3D d.getVar('gtk_icon_cache_postinst')
>          d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True)
> +        postrm =3D d.getVar('pkg_postrm_%s' % pkg)
>          if not postrm:
>              postrm =3D '#!/bin/sh\n'
> -        postrm +=3D d.getVar('gtk_icon_cache_postrm', True)
> +        postrm +=3D d.getVar('gtk_icon_cache_postrm')
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> =20
> diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-=
immodules-cache.bbclass
> index ebbc9de..baea959 100644
> --- a/meta/classes/gtk-immodules-cache.bbclass
> +++ b/meta/classes/gtk-immodules-cache.bbclass
> @@ -61,21 +61,21 @@ fi
>  }
> =20
>  python populate_packages_append () {
> -    gtkimmodules_pkgs =3D d.getVar('GTKIMMODULES_PACKAGES', True).split()
> +    gtkimmodules_pkgs =3D d.getVar('GTKIMMODULES_PACKAGES').split()
> =20
>      for pkg in gtkimmodules_pkgs:
>              bb.note("adding gtk-immodule-cache postinst and postrm scrip=
ts to %s" % pkg)
> =20
> -            postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +            postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>              if not postinst:
>                  postinst =3D '#!/bin/sh\n'
> -            postinst +=3D d.getVar('gtk_immodule_cache_postinst', True)
> +            postinst +=3D d.getVar('gtk_immodule_cache_postinst')
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -            postrm =3D d.getVar('pkg_postrm_%s' % pkg, True)
> +            postrm =3D d.getVar('pkg_postrm_%s' % pkg)
>              if not postrm:
>                  postrm =3D '#!/bin/sh\n'
> -            postrm +=3D d.getVar('gtk_immodule_cache_postrm', True)
> +            postrm +=3D d.getVar('gtk_immodule_cache_postrm')
>              d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> =20
> diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbcl=
ass
> index 4f2dea6..5aaf766 100644
> --- a/meta/classes/gummiboot.bbclass
> +++ b/meta/classes/gummiboot.bbclass
> @@ -60,8 +60,8 @@ efi_hddimg_populate() {
>  }
> =20
>  python build_efi_cfg() {
> -    s =3D d.getVar("S", True)
> -    labels =3D d.getVar('LABELS', True)
> +    s =3D d.getVar("S")
> +    labels =3D d.getVar('LABELS')
>      if not labels:
>          bb.debug(1, "LABELS not defined, nothing to do")
>          return
> @@ -70,7 +70,7 @@ python build_efi_cfg() {
>          bb.debug(1, "No labels, nothing to do")
>          return
> =20
> -    cfile =3D d.getVar('GUMMIBOOT_CFG', True)
> +    cfile =3D d.getVar('GUMMIBOOT_CFG')
>      try:
>           cfgfile =3D open(cfile, 'w')
>      except OSError:
> @@ -78,7 +78,7 @@ python build_efi_cfg() {
> =20
>      cfgfile.write('# Automatically created by OE\n')
>      cfgfile.write('default %s\n' % (labels.split()[0]))
> -    timeout =3D d.getVar('GUMMIBOOT_TIMEOUT', True)
> +    timeout =3D d.getVar('GUMMIBOOT_TIMEOUT')
>      if timeout:
>          cfgfile.write('timeout %s\n' % timeout)
>      else:
> @@ -88,7 +88,7 @@ python build_efi_cfg() {
>      for label in labels.split():
>          localdata =3D d.createCopy()
> =20
> -        overrides =3D localdata.getVar('OVERRIDES', True)
> +        overrides =3D localdata.getVar('OVERRIDES')
>          if not overrides:
>              bb.fatal('OVERRIDES not defined')
> =20
> @@ -104,8 +104,8 @@ python build_efi_cfg() {
>          entrycfg.write('title %s\n' % label)
>          entrycfg.write('linux /vmlinuz\n')
> =20
> -        append =3D localdata.getVar('APPEND', True)
> -        initrd =3D localdata.getVar('INITRD', True)
> +        append =3D localdata.getVar('APPEND')
> +        initrd =3D localdata.getVar('INITRD')
> =20
>          if initrd:
>              entrycfg.write('initrd /initrd\n')
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index a837894..8a351cf 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -100,7 +100,7 @@ def use_icecc(bb,d):
>      if icecc_is_allarch(bb, d):
>          return "no"
> =20
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
> =20
>      system_class_blacklist =3D []
>      user_class_blacklist =3D (d.getVar('ICECC_USER_CLASS_BL', False) or =
"none").split()
> @@ -139,7 +139,7 @@ def use_icecc(bb,d):
>      return "yes"
> =20
>  def icecc_is_allarch(bb, d):
> -    return d.getVar("PACKAGE_ARCH", True) =3D=3D "all" or bb.data.inheri=
ts_class('allarch', d)
> +    return d.getVar("PACKAGE_ARCH") =3D=3D "all" or bb.data.inherits_cla=
ss('allarch', d)
> =20
>  def icecc_is_kernel(bb, d):
>      return \
> diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-bu=
ildinfo.bbclass
> index da1edf7..3b79de5 100644
> --- a/meta/classes/image-buildinfo.bbclass
> +++ b/meta/classes/image-buildinfo.bbclass
> @@ -18,7 +18,7 @@ def image_buildinfo_outputvars(vars, listvars, d):
>      listvars =3D listvars.split()
>      ret =3D ""
>      for var in vars:
> -        value =3D d.getVar(var, True) or ""
> +        value =3D d.getVar(var) or ""
>          if (d.getVarFlag(var, 'type', True) =3D=3D "list"):
>              value =3D oe.utils.squashspaces(value)
>          ret +=3D "%s =3D %s\n" % (var, value)
> @@ -42,7 +42,7 @@ def get_layer_git_status(path):
> =20
>  # Returns layer revisions along with their respective status
>  def get_layer_revs(d):
> -    layers =3D (d.getVar("BBLAYERS", True) or "").split()
> +    layers =3D (d.getVar("BBLAYERS") or "").split()
>      medadata_revs =3D ["%-17s =3D %s:%s %s" % (os.path.basename(i), \
>          base_get_metadata_git_branch(i, None).strip(), \
>          base_get_metadata_git_revision(i, None), \
> @@ -52,11 +52,11 @@ def get_layer_revs(d):
> =20
>  def buildinfo_target(d):
>          # Get context
> -        if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> +        if d.getVar('BB_WORKERCONTEXT') !=3D '1':
>                  return ""
>          # Single and list variables to be read
> -        vars =3D (d.getVar("IMAGE_BUILDINFO_VARS", True) or "")
> -        listvars =3D (d.getVar("IMAGE_BUILDINFO_LVARS", True) or "")
> +        vars =3D (d.getVar("IMAGE_BUILDINFO_VARS") or "")
> +        listvars =3D (d.getVar("IMAGE_BUILDINFO_LVARS") or "")
>          return image_buildinfo_outputvars(vars, listvars, d)
> =20
>  # Write build information to target filesystem
> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bb=
class
> index 4a634dc..a3d1b4e 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -51,8 +51,8 @@ IMAGE_TYPEDEP_hddimg =3D "ext4"
>  IMAGE_TYPES_MASKED +=3D "live hddimg iso"
> =20
>  python() {
> -    image_b =3D d.getVar('IMAGE_BASENAME', True)
> -    initrd_i =3D d.getVar('INITRD_IMAGE_LIVE', True)
> +    image_b =3D d.getVar('IMAGE_BASENAME')
> +    initrd_i =3D d.getVar('INITRD_IMAGE_LIVE')
>      if image_b =3D=3D initrd_i:
>          bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or =
iso.' % initrd_i)
>          bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
> @@ -264,9 +264,9 @@ build_hddimg() {
> =20
>  python do_bootimg() {
>      set_live_vm_vars(d, 'LIVE')
> -    if d.getVar("PCBIOS", True) =3D=3D "1":
> +    if d.getVar("PCBIOS") =3D=3D "1":
>          bb.build.exec_func('build_syslinux_cfg', d)
> -    if d.getVar("EFI", True) =3D=3D "1":
> +    if d.getVar("EFI") =3D=3D "1":
>          bb.build.exec_func('build_efi_cfg', d)
>      bb.build.exec_func('build_hddimg', d)
>      bb.build.exec_func('build_iso', d)
> diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
> index 2f35d6b..35c9244 100644
> --- a/meta/classes/image-vm.bbclass
> +++ b/meta/classes/image-vm.bbclass
> @@ -112,9 +112,9 @@ build_boot_dd() {
>  python do_bootdirectdisk() {
>      validate_disk_signature(d)
>      set_live_vm_vars(d, 'VM')
> -    if d.getVar("PCBIOS", True) =3D=3D "1":
> +    if d.getVar("PCBIOS") =3D=3D "1":
>          bb.build.exec_func('build_syslinux_cfg', d)
> -    if d.getVar("EFI", True) =3D=3D "1":
> +    if d.getVar("EFI") =3D=3D "1":
>          bb.build.exec_func('build_efi_cfg', d)
>      bb.build.exec_func('build_boot_dd', d)
>  }
> @@ -132,7 +132,7 @@ def generate_disk_signature():
>  def validate_disk_signature(d):
>      import re
> =20
> -    disk_signature =3D d.getVar("DISK_SIGNATURE", True)
> +    disk_signature =3D d.getVar("DISK_SIGNATURE")
> =20
>      if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
>          bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" % d=
isk_signature)
> @@ -158,11 +158,11 @@ create_qcow2_image () {
>  }
> =20
>  python do_vmimg() {
> -    if 'vmdk' in d.getVar('IMAGE_FSTYPES', True):
> +    if 'vmdk' in d.getVar('IMAGE_FSTYPES'):
>          bb.build.exec_func('create_vmdk_image', d)
> -    if 'vdi' in d.getVar('IMAGE_FSTYPES', True):
> +    if 'vdi' in d.getVar('IMAGE_FSTYPES'):
>          bb.build.exec_func('create_vdi_image', d)
> -    if 'qcow2' in d.getVar('IMAGE_FSTYPES', True):
> +    if 'qcow2' in d.getVar('IMAGE_FSTYPES'):
>          bb.build.exec_func('create_qcow2_image', d)
>  }
> =20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 6111f6d..13c7bf9 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -2,7 +2,7 @@ inherit rootfs_${IMAGE_PKGTYPE}
> =20
>  # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk
>  # in the non-Linux SDK_OS case, such as mingw32
> -SDKEXTCLASS ?=3D "${@['populate_sdk', 'populate_sdk_ext']['linux' in d.g=
etVar("SDK_OS", True)]}"
> +SDKEXTCLASS ?=3D "${@['populate_sdk', 'populate_sdk_ext']['linux' in d.g=
etVar("SDK_OS")]}"
>  inherit ${SDKEXTCLASS}
> =20
>  TOOLCHAIN_TARGET_TASK +=3D "${PACKAGE_INSTALL}"
> @@ -133,7 +133,7 @@ def build_live(d):
>      if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) =3D=3D=
 "0": # live is not set but hob might set iso or hddimg
>          d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0",=
 "1", d))
>          d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "=
0", "1", d))
> -        if d.getVar('NOISO', True) =3D=3D "0" or d.getVar('NOHDD', True)=
 =3D=3D "0":
> +        if d.getVar('NOISO') =3D=3D "0" or d.getVar('NOHDD') =3D=3D "0":
>              return "image-live"
>          return ""
>      return "image-live"
> @@ -149,7 +149,7 @@ python () {
>      d.appendVarFlag('do_rootfs', 'depends', deps)
> =20
>      deps =3D ""
> -    for dep in (d.getVar('EXTRA_IMAGEDEPENDS', True) or "").split():
> +    for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
>          deps +=3D " %s:do_populate_sysroot" % dep
>      d.appendVarFlag('do_build', 'depends', deps)
> =20
> @@ -158,22 +158,22 @@ python () {
>      features =3D set(oe.data.typed_value('IMAGE_FEATURES', d))
>      remain_features =3D features.copy()
>      for feature in features:
> -        replaces =3D set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % featur=
e, True) or "").split())
> +        replaces =3D set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % featur=
e) or "").split())
>          remain_features -=3D replaces
> =20
>      #Check for conflict image features
>      for feature in remain_features:
> -        conflicts =3D set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" % feat=
ure, True) or "").split())
> +        conflicts =3D set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" % feat=
ure) or "").split())
>          temp =3D conflicts & remain_features
>          if temp:
> -            bb.fatal("%s contains conflicting IMAGE_FEATURES %s %s" % (d=
=2EgetVar('PN', True), feature, ' '.join(list(temp))))
> +            bb.fatal("%s contains conflicting IMAGE_FEATURES %s %s" % (d=
=2EgetVar('PN'), feature, ' '.join(list(temp))))
> =20
>      d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
> =20
>      check_image_features(d)
> -    initramfs_image =3D d.getVar('INITRAMFS_IMAGE', True) or ""
> +    initramfs_image =3D d.getVar('INITRAMFS_IMAGE') or ""
>      if initramfs_image !=3D "":
> -        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs"=
 %  d.getVar('PN', True))
> +        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs"=
 %  d.getVar('PN'))
>          d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_=
complete" % initramfs_image)
>  }
> =20
> @@ -185,7 +185,7 @@ IMAGE_POSTPROCESS_COMMAND ?=3D ""
>  # some default locales
>  IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> =20
> -LINGUAS_INSTALL ?=3D "${@" ".join(map(lambda s: "locale-base-%s" % s, d.=
getVar('IMAGE_LINGUAS', True).split()))}"
> +LINGUAS_INSTALL ?=3D "${@" ".join(map(lambda s: "locale-base-%s" % s, d.=
getVar('IMAGE_LINGUAS').split()))}"
> =20
>  # Prefer image, but use the fallback files for lookups if the image ones
>  # aren't yet available.
> @@ -212,20 +212,20 @@ fakeroot python do_rootfs () {
>      progress_reporter.next_stage()
> =20
>      # Handle package exclusions
> -    excl_pkgs =3D d.getVar("PACKAGE_EXCLUDE", True).split()
> -    inst_pkgs =3D d.getVar("PACKAGE_INSTALL", True).split()
> -    inst_attempt_pkgs =3D d.getVar("PACKAGE_INSTALL_ATTEMPTONLY", True).=
split()
> +    excl_pkgs =3D d.getVar("PACKAGE_EXCLUDE").split()
> +    inst_pkgs =3D d.getVar("PACKAGE_INSTALL").split()
> +    inst_attempt_pkgs =3D d.getVar("PACKAGE_INSTALL_ATTEMPTONLY").split()
> =20
>      d.setVar('PACKAGE_INSTALL_ORIG', ' '.join(inst_pkgs))
>      d.setVar('PACKAGE_INSTALL_ATTEMPTONLY', ' '.join(inst_attempt_pkgs))
> =20
>      for pkg in excl_pkgs:
>          if pkg in inst_pkgs:
> -            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_IN=
STALL (%s).  It will be removed from the list." % (pkg, d.getVar('PN', True=
), inst_pkgs))
> +            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_IN=
STALL (%s).  It will be removed from the list." % (pkg, d.getVar('PN'), ins=
t_pkgs))
>              inst_pkgs.remove(pkg)
> =20
>          if pkg in inst_attempt_pkgs:
> -            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_IN=
STALL_ATTEMPTONLY (%s).  It will be removed from the list." % (pkg, d.getVa=
r('PN', True), inst_pkgs))
> +            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_IN=
STALL_ATTEMPTONLY (%s).  It will be removed from the list." % (pkg, d.getVa=
r('PN'), inst_pkgs))
>              inst_attempt_pkgs.remove(pkg)
> =20
>      d.setVar("PACKAGE_INSTALL", ' '.join(inst_pkgs))
> @@ -235,7 +235,7 @@ fakeroot python do_rootfs () {
>      # We have to delay the runtime_mapping_rename until just before root=
fs runs
>      # otherwise, the multilib renaming could step in and squash any fixu=
ps that
>      # may have occurred.
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
>      runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
>      runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
> @@ -258,7 +258,7 @@ addtask rootfs before do_build
>  fakeroot python do_image () {
>      from oe.utils import execute_pre_post_process
> =20
> -    pre_process_cmds =3D d.getVar("IMAGE_PREPROCESS_COMMAND", True)
> +    pre_process_cmds =3D d.getVar("IMAGE_PREPROCESS_COMMAND")
> =20
>      execute_pre_post_process(d, pre_process_cmds)
>  }
> @@ -269,7 +269,7 @@ addtask do_image after do_rootfs before do_build
>  fakeroot python do_image_complete () {
>      from oe.utils import execute_pre_post_process
> =20
> -    post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND", True)
> +    post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
> =20
>      execute_pre_post_process(d, post_process_cmds)
>  }
> @@ -292,7 +292,7 @@ addtask do_image_complete after do_image before do_bu=
ild
>  fakeroot python do_image_qa () {
>      from oe.utils import ImageQAFailed
> =20
> -    qa_cmds =3D (d.getVar('IMAGE_QA_COMMANDS', True) or '').split()
> +    qa_cmds =3D (d.getVar('IMAGE_QA_COMMANDS') or '').split()
>      qamsg =3D ""
> =20
>      for cmd in qa_cmds:
> @@ -307,7 +307,7 @@ fakeroot python do_image_qa () {
>              qamsg =3D qamsg + '\n'
> =20
>      if qamsg:
> -        imgname =3D d.getVar('IMAGE_NAME', True)
> +        imgname =3D d.getVar('IMAGE_NAME')
>          bb.fatal("QA errors found whilst validating image: %s\n%s" % (im=
gname, qamsg))
>  }
>  addtask do_image_qa after do_image_complete before do_build
> @@ -317,17 +317,17 @@ addtask do_image_qa after do_image_complete before =
do_build
>  # to tmp/sysroots/<machine>/imgdata/<image>.env
>  #
>  python do_rootfs_wicenv () {
> -    wicvars =3D d.getVar('WICVARS', True)
> +    wicvars =3D d.getVar('WICVARS')
>      if not wicvars:
>          return
> =20
> -    stdir =3D d.getVar('STAGING_DIR_TARGET', True)
> +    stdir =3D d.getVar('STAGING_DIR_TARGET')
>      outdir =3D os.path.join(stdir, 'imgdata')
>      bb.utils.mkdirhier(outdir)
> -    basename =3D d.getVar('IMAGE_BASENAME', True)
> +    basename =3D d.getVar('IMAGE_BASENAME')
>      with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
>          for var in wicvars.split():
> -            value =3D d.getVar(var, True)
> +            value =3D d.getVar(var)
>              if value:
>                  envf.write('%s=3D"%s"\n' % (var, value.strip()))
>  }
> @@ -340,7 +340,7 @@ def setup_debugfs_variables(d):
>      d.appendVar('IMAGE_LINK_NAME', '-dbg')
>      d.appendVar('IMAGE_NAME','-dbg')
>      d.setVar('IMAGE_BUILDING_DEBUGFS', 'true')
> -    debugfs_image_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS', True)
> +    debugfs_image_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS')
>      if debugfs_image_fstypes:
>          d.setVar('IMAGE_FSTYPES', debugfs_image_fstypes)
> =20
> @@ -358,7 +358,7 @@ python () {
>      #
>      # Without de-duplication, gen_conversion_cmds() below
>      # would create the same compression command multiple times.
> -    ctypes =3D set(d.getVar('CONVERSIONTYPES', True).split())
> +    ctypes =3D set(d.getVar('CONVERSIONTYPES').split())
>      old_overrides =3D d.getVar('OVERRIDES', False)
> =20
>      def _image_base_type(type):
> @@ -375,11 +375,11 @@ python () {
>          return basetype
> =20
>      basetypes =3D {}
> -    alltypes =3D d.getVar('IMAGE_FSTYPES', True).split()
> +    alltypes =3D d.getVar('IMAGE_FSTYPES').split()
>      typedeps =3D {}
> =20
> -    if d.getVar('IMAGE_GEN_DEBUGFS', True) =3D=3D "1":
> -        debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS', True).spli=
t()
> +    if d.getVar('IMAGE_GEN_DEBUGFS') =3D=3D "1":
> +        debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
>          for t in debugfs_fstypes:
>              alltypes.append("debugfs_" + t)
> =20
> @@ -394,7 +394,7 @@ python () {
>          if t.startswith("debugfs_"):
>              t =3D t[8:]
>              debug =3D "debugfs_"
> -        deps =3D (d.getVar('IMAGE_TYPEDEP_' + t, True) or "").split()
> +        deps =3D (d.getVar('IMAGE_TYPEDEP_' + t) or "").split()
>          vardeps.add('IMAGE_TYPEDEP_' + t)
>          if baset not in typedeps:
>              typedeps[baset] =3D set()
> @@ -414,7 +414,7 @@ python () {
> =20
>      d.appendVarFlag('do_image', 'vardeps', ' '.join(vardeps))
> =20
> -    maskedtypes =3D (d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
> +    maskedtypes =3D (d.getVar('IMAGE_TYPES_MASKED') or "").split()
>      maskedtypes =3D [dbg + t for t in maskedtypes for dbg in ("", "debug=
fs_")]
> =20
>      for t in basetypes:
> @@ -442,7 +442,7 @@ python () {
>          localdata.delVar('DATETIME')
>          localdata.delVar('TMPDIR')
> =20
> -        image_cmd =3D localdata.getVar("IMAGE_CMD", True)
> +        image_cmd =3D localdata.getVar("IMAGE_CMD")
>          vardeps.add('IMAGE_CMD_' + realt)
>          if image_cmd:
>              cmds.append("\t" + image_cmd)
> @@ -464,7 +464,7 @@ python () {
>                      # Create input image first.
>                      gen_conversion_cmds(type)
>                      localdata.setVar('type', type)
> -                    cmd =3D "\t" + (localdata.getVar("CONVERSION_CMD_" +=
 ctype, True) or localdata.getVar("COMPRESS_CMD_" + ctype, True))
> +                    cmd =3D "\t" + (localdata.getVar("CONVERSION_CMD_" +=
 ctype) or localdata.getVar("COMPRESS_CMD_" + ctype))
>                      if cmd not in cmds:
>                          cmds.append(cmd)
>                      vardeps.add('CONVERSION_CMD_' + ctype)
> @@ -515,17 +515,17 @@ python () {
>  def get_rootfs_size(d):
>      import subprocess
> =20
> -    rootfs_alignment =3D int(d.getVar('IMAGE_ROOTFS_ALIGNMENT', True))
> -    overhead_factor =3D float(d.getVar('IMAGE_OVERHEAD_FACTOR', True))
> -    rootfs_req_size =3D int(d.getVar('IMAGE_ROOTFS_SIZE', True))
> -    rootfs_extra_space =3D eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE', Tru=
e))
> -    rootfs_maxsize =3D d.getVar('IMAGE_ROOTFS_MAXSIZE', True)
> -    image_fstypes =3D d.getVar('IMAGE_FSTYPES', True) or ''
> -    initramfs_fstypes =3D d.getVar('INITRAMFS_FSTYPES', True) or ''
> -    initramfs_maxsize =3D d.getVar('INITRAMFS_MAXSIZE', True)
> +    rootfs_alignment =3D int(d.getVar('IMAGE_ROOTFS_ALIGNMENT'))
> +    overhead_factor =3D float(d.getVar('IMAGE_OVERHEAD_FACTOR'))
> +    rootfs_req_size =3D int(d.getVar('IMAGE_ROOTFS_SIZE'))
> +    rootfs_extra_space =3D eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE'))
> +    rootfs_maxsize =3D d.getVar('IMAGE_ROOTFS_MAXSIZE')
> +    image_fstypes =3D d.getVar('IMAGE_FSTYPES') or ''
> +    initramfs_fstypes =3D d.getVar('INITRAMFS_FSTYPES') or ''
> +    initramfs_maxsize =3D d.getVar('INITRAMFS_MAXSIZE')
> =20
>      output =3D subprocess.check_output(['du', '-ks',
> -                                      d.getVar('IMAGE_ROOTFS', True)])
> +                                      d.getVar('IMAGE_ROOTFS')])
>      size_kb =3D int(output.split()[0])
>      base_size =3D size_kb * overhead_factor
>      base_size =3D max(base_size, rootfs_req_size) + rootfs_extra_space
> @@ -541,7 +541,7 @@ def get_rootfs_size(d):
>      # Do not check image size of the debugfs image. This is not supposed
>      # to be deployed, etc. so it doesn't make sense to limit the size
>      # of the debug.
> -    if (d.getVar('IMAGE_BUILDING_DEBUGFS', True) or "") =3D=3D "true":
> +    if (d.getVar('IMAGE_BUILDING_DEBUGFS') or "") =3D=3D "true":
>          return base_size
> =20
>      # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
> @@ -572,11 +572,11 @@ python set_image_size () {
>  #
>  python create_symlinks() {
> =20
> -    deploy_dir =3D d.getVar('IMGDEPLOYDIR', True)
> -    img_name =3D d.getVar('IMAGE_NAME', True)
> -    link_name =3D d.getVar('IMAGE_LINK_NAME', True)
> -    manifest_name =3D d.getVar('IMAGE_MANIFEST', True)
> -    taskname =3D d.getVar("BB_CURRENTTASK", True)
> +    deploy_dir =3D d.getVar('IMGDEPLOYDIR')
> +    img_name =3D d.getVar('IMAGE_NAME')
> +    link_name =3D d.getVar('IMAGE_LINK_NAME')
> +    manifest_name =3D d.getVar('IMAGE_MANIFEST')
> +    taskname =3D d.getVar("BB_CURRENTTASK")
>      subimages =3D (d.getVarFlag("do_" + taskname, 'subimages', False) or=
 "").split()
>      imgsuffix =3D d.getVarFlag("do_" + taskname, 'imgsuffix', True) or d=
=2Eexpand("${IMAGE_NAME_SUFFIX}.")
> =20
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 9d66d7d..8f04849 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -17,20 +17,20 @@ def imagetypes_getdepends(d):
>                  d +=3D ":do_populate_sysroot"
>              deps.add(d)
> =20
> -    fstypes =3D set((d.getVar('IMAGE_FSTYPES', True) or "").split())
> -    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").spl=
it())
> +    fstypes =3D set((d.getVar('IMAGE_FSTYPES') or "").split())
> +    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
> =20
>      deps =3D set()
>      for typestring in fstypes:
>          types =3D typestring.split(".")
>          basetype, resttypes =3D types[0], types[1:]
> =20
> -        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
> -        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True=
) or "").split():
> -            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , de=
ps)
> +        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype) , deps)
> +        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype) or "=
").split():
> +            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends) , deps)
>          for ctype in resttypes:
> -            adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
> -            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
> +            adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
> +            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype), deps)
> =20
>      # Sort the set so that ordering is consistant
>      return " ".join(sorted(deps))
> @@ -220,7 +220,7 @@ WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' % os.=
path.exists('${WKS_FULL_PATH}
>  do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
> =20
>  python () {
> -    if d.getVar('USING_WIC', True) and 'do_bootimg' in d:
> +    if d.getVar('USING_WIC') and 'do_bootimg' in d:
>          bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
>  }
> =20
> @@ -228,7 +228,7 @@ python do_write_wks_template () {
>      """Write out expanded template contents to WKS_FULL_PATH."""
>      import re
> =20
> -    template_body =3D d.getVar('_WKS_TEMPLATE', True)
> +    template_body =3D d.getVar('_WKS_TEMPLATE')
> =20
>      # Remove any remnant variable references left behind by the expansion
>      # due to undefined variables
> @@ -240,18 +240,18 @@ python do_write_wks_template () {
>          else:
>              template_body =3D new_body
> =20
> -    wks_file =3D d.getVar('WKS_FULL_PATH', True)
> +    wks_file =3D d.getVar('WKS_FULL_PATH')
>      with open(wks_file, 'w') as f:
>          f.write(template_body)
>  }
> =20
>  python () {
> -    if d.getVar('USING_WIC', True):
> +    if d.getVar('USING_WIC'):
>          wks_file_u =3D d.getVar('WKS_FULL_PATH', False)
>          wks_file =3D d.expand(wks_file_u)
>          base, ext =3D os.path.splitext(wks_file)
>          if ext =3D=3D '.in' and os.path.exists(wks_file):
> -            wks_out_file =3D os.path.join(d.getVar('WORKDIR', True), os.=
path.basename(base))
> +            wks_out_file =3D os.path.join(d.getVar('WORKDIR'), os.path.b=
asename(base))
>              d.setVar('WKS_FULL_PATH', wks_out_file)
>              d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
>              d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index a5c93f3..d7fc2f3 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -176,7 +176,7 @@ def package_qa_get_machine_dict(d):
> =20
>      # Add in any extra user supplied data which may come from a BSP laye=
r, removing the
>      # need to always change this class directly
> -    extra_machdata =3D (d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS", True) o=
r "").split()
> +    extra_machdata =3D (d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS") or "").=
split()
>      for m in extra_machdata:
>          call =3D m + "(machdata, d)"
>          locs =3D { "machdata" : machdata, "d" : d}
> @@ -191,23 +191,23 @@ def package_qa_clean_path(path, d, pkg=3DNone):
>      TMPDIR is stripped, otherwise PKGDEST/pkg is stripped.
>      """
>      if pkg:
> -        path =3D path.replace(os.path.join(d.getVar("PKGDEST", True), pk=
g), "/")
> -    return path.replace(d.getVar("TMPDIR", True), "/").replace("//", "/")
> +        path =3D path.replace(os.path.join(d.getVar("PKGDEST"), pkg), "/=
")
> +    return path.replace(d.getVar("TMPDIR"), "/").replace("//", "/")
> =20
>  def package_qa_write_error(type, error, d):
> -    logfile =3D d.getVar('QA_LOGFILE', True)
> +    logfile =3D d.getVar('QA_LOGFILE')
>      if logfile:
> -        p =3D d.getVar('P', True)
> +        p =3D d.getVar('P')
>          with open(logfile, "a+") as f:
>              f.write("%s: %s [%s]\n" % (p, error, type))
> =20
>  def package_qa_handle_error(error_class, error_msg, d):
>      package_qa_write_error(error_class, error_msg, d)
> -    if error_class in (d.getVar("ERROR_QA", True) or "").split():
> +    if error_class in (d.getVar("ERROR_QA") or "").split():
>          bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
>          d.setVar("QA_SANE", False)
>          return False
> -    elif error_class in (d.getVar("WARN_QA", True) or "").split():
> +    elif error_class in (d.getVar("WARN_QA") or "").split():
>          bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
>      else:
>          bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
> @@ -223,7 +223,7 @@ QAPATHTEST[libexec] =3D "package_qa_check_libexec"
>  def package_qa_check_libexec(path,name, d, elf, messages):
> =20
>      # Skip the case where the default is explicitly /usr/libexec
> -    libexec =3D d.getVar('libexecdir', True)
> +    libexec =3D d.getVar('libexecdir')
>      if libexec =3D=3D "/usr/libexec":
>          return True
> =20
> @@ -244,7 +244,7 @@ def package_qa_check_rpath(file,name, d, elf, message=
s):
>      if os.path.islink(file):
>          return
> =20
> -    bad_dirs =3D [d.getVar('BASE_WORKDIR', True), d.getVar('STAGING_DIR_=
TARGET', True)]
> +    bad_dirs =3D [d.getVar('BASE_WORKDIR'), d.getVar('STAGING_DIR_TARGET=
')]
> =20
>      phdrs =3D elf.run_objdump("-p", d)
> =20
> @@ -272,8 +272,8 @@ def package_qa_check_useless_rpaths(file, name, d, el=
f, messages):
>      if os.path.islink(file):
>          return
> =20
> -    libdir =3D d.getVar("libdir", True)
> -    base_libdir =3D d.getVar("base_libdir", True)
> +    libdir =3D d.getVar("libdir")
> +    base_libdir =3D d.getVar("base_libdir")
> =20
>      phdrs =3D elf.run_objdump("-p", d)
> =20
> @@ -330,11 +330,11 @@ def package_qa_check_libdir(d):
>      """
>      import re
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
>      base_libdir =3D d.getVar("base_libdir",True) + os.sep
> -    libdir =3D d.getVar("libdir", True) + os.sep
> -    libexecdir =3D d.getVar("libexecdir", True) + os.sep
> -    exec_prefix =3D d.getVar("exec_prefix", True) + os.sep
> +    libdir =3D d.getVar("libdir") + os.sep
> +    libexecdir =3D d.getVar("libexecdir") + os.sep
> +    exec_prefix =3D d.getVar("exec_prefix") + os.sep
> =20
>      messages =3D []
> =20
> @@ -349,10 +349,10 @@ def package_qa_check_libdir(d):
>              # Skip subdirectories for any packages with libdir in INSANE=
_SKIP
>              skippackages =3D []
>              for package in dirs:
> -                if 'libdir' in (d.getVar('INSANE_SKIP_' + package, True)=
 or "").split():
> +                if 'libdir' in (d.getVar('INSANE_SKIP_' + package) or ""=
).split():
>                      bb.note("Package %s skipping libdir QA test" % (pack=
age))
>                      skippackages.append(package)
> -                elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) =3D=3D =
'debug-file-directory' and package.endswith("-dbg"):
> +                elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') =3D=3D 'debug=
-file-directory' and package.endswith("-dbg"):
>                      bb.note("Package %s skipping libdir QA test for PACK=
AGE_DEBUG_SPLIT_STYLE equals debug-file-directory" % (package))
>                      skippackages.append(package)
>              for package in skippackages:
> @@ -413,10 +413,10 @@ def package_qa_check_unsafe_references_in_binaries(=
path, name, d, elf, messages)
> =20
>      if elf:
>          import subprocess as sub
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
> =20
> -        exec_prefix =3D d.getVar('exec_prefix', True)
> -        sysroot_path =3D d.getVar('STAGING_DIR_TARGET', True)
> +        exec_prefix =3D d.getVar('exec_prefix')
> +        sysroot_path =3D d.getVar('STAGING_DIR_TARGET')
>          sysroot_path_usr =3D sysroot_path + exec_prefix
> =20
>          try:
> @@ -429,8 +429,8 @@ def package_qa_check_unsafe_references_in_binaries(pa=
th, name, d, elf, messages)
>          if sysroot_path_usr in ldd_output:
>              ldd_output =3D ldd_output.replace(sysroot_path, "")
> =20
> -            pkgdest =3D d.getVar('PKGDEST', True)
> -            packages =3D d.getVar('PACKAGES', True)
> +            pkgdest =3D d.getVar('PKGDEST')
> +            packages =3D d.getVar('PACKAGES')
> =20
>              for package in packages.split():
>                  short_path =3D path.replace('%s/%s' % (pkgdest, package)=
, "", 1)
> @@ -456,13 +456,13 @@ def package_qa_check_unsafe_references_in_scripts(p=
ath, name, d, elf, messages):
>      if not elf:
>          import stat
>          import subprocess
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
> =20
>          # Ensure we're checking an executable script
>          statinfo =3D os.stat(path)
>          if bool(statinfo.st_mode & stat.S_IXUSR):
>              # grep shell scripts for possible references to /exec_prefix/
> -            exec_prefix =3D d.getVar('exec_prefix', True)
> +            exec_prefix =3D d.getVar('exec_prefix')
>              statement =3D "grep -e '%s/[^ :]\{1,\}/[^ :]\{1,\}' %s > /de=
v/null" % (exec_prefix, path)
>              if subprocess.call(statement, shell=3DTrue) =3D=3D 0:
>                  error_msg =3D pn + ": Found a reference to %s/ in %s" % =
(exec_prefix, path)
> @@ -486,19 +486,19 @@ def unsafe_references_skippable(path, name, d):
>          return True
> =20
>      # Skip unusual rootfs layouts which make these tests irrelevant
> -    exec_prefix =3D d.getVar('exec_prefix', True)
> +    exec_prefix =3D d.getVar('exec_prefix')
>      if exec_prefix =3D=3D "":
>          return True
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
>      pkgdest =3D pkgdest + "/" + name
>      pkgdest =3D os.path.abspath(pkgdest)
> -    base_bindir =3D pkgdest + d.getVar('base_bindir', True)
> -    base_sbindir =3D pkgdest + d.getVar('base_sbindir', True)
> -    base_libdir =3D pkgdest + d.getVar('base_libdir', True)
> -    bindir =3D pkgdest + d.getVar('bindir', True)
> -    sbindir =3D pkgdest + d.getVar('sbindir', True)
> -    libdir =3D pkgdest + d.getVar('libdir', True)
> +    base_bindir =3D pkgdest + d.getVar('base_bindir')
> +    base_sbindir =3D pkgdest + d.getVar('base_sbindir')
> +    base_libdir =3D pkgdest + d.getVar('base_libdir')
> +    bindir =3D pkgdest + d.getVar('bindir')
> +    sbindir =3D pkgdest + d.getVar('sbindir')
> +    libdir =3D pkgdest + d.getVar('libdir')
> =20
>      if base_bindir =3D=3D bindir and base_sbindir =3D=3D sbindir and bas=
e_libdir =3D=3D libdir:
>          return True
> @@ -520,13 +520,13 @@ def package_qa_check_arch(path,name,d, elf, message=
s):
>      if not elf:
>          return
> =20
> -    target_os   =3D d.getVar('TARGET_OS', True)
> -    target_arch =3D d.getVar('TARGET_ARCH', True)
> -    provides =3D d.getVar('PROVIDES', True)
> -    bpn =3D d.getVar('BPN', True)
> +    target_os   =3D d.getVar('TARGET_OS')
> +    target_arch =3D d.getVar('TARGET_ARCH')
> +    provides =3D d.getVar('PROVIDES')
> +    bpn =3D d.getVar('BPN')
> =20
>      if target_arch =3D=3D "allarch":
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
>          package_qa_add_message(messages, "arch", pn + ": Recipe inherits=
 the allarch class, but has packaged architecture-specific binaries")
>          return
> =20
> @@ -546,7 +546,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
> =20
>      # Check the architecture and endiannes of the binary
>      is_32 =3D (("virtual/kernel" in provides) or bb.data.inherits_class(=
"module", d)) and \
> -            (target_os =3D=3D "linux-gnux32" or re.match('mips64.*32', d=
=2EgetVar('DEFAULTTUNE', True)))
> +            (target_os =3D=3D "linux-gnux32" or re.match('mips64.*32', d=
=2EgetVar('DEFAULTTUNE')))
>      if not ((machine =3D=3D elf.machine()) or is_32):
>          package_qa_add_message(messages, "arch", "Architecture did not m=
atch (%s, expected %s) on %s" % \
>                   (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_=
machine_to_string(machine), package_qa_clean_path(path,d)))
> @@ -605,9 +605,9 @@ def package_qa_hash_style(path, name, d, elf, message=
s):
>      if os.path.islink(path):
>          return
> =20
> -    gnu_hash =3D "--hash-style=3Dgnu" in d.getVar('LDFLAGS', True)
> +    gnu_hash =3D "--hash-style=3Dgnu" in d.getVar('LDFLAGS')
>      if not gnu_hash:
> -        gnu_hash =3D "--hash-style=3Dboth" in d.getVar('LDFLAGS', True)
> +        gnu_hash =3D "--hash-style=3Dboth" in d.getVar('LDFLAGS')
>      if not gnu_hash:
>          return
> =20
> @@ -646,7 +646,7 @@ def package_qa_check_buildpaths(path, name, d, elf, m=
essages):
>      if path.find(name + "/CONTROL/") !=3D -1 or path.find(name + "/DEBIA=
N/") !=3D -1:
>          return
> =20
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
>      with open(path, 'rb') as f:
>          file_content =3D f.read().decode('utf-8', errors=3D'ignore')
>          if tmpdir in file_content:
> @@ -665,8 +665,8 @@ def package_qa_check_xorg_driver_abi(path, name, d, e=
lf, messages):
> =20
>      driverdir =3D d.expand("${libdir}/xorg/modules/drivers/")
>      if driverdir in path and path.endswith(".so"):
> -        mlprefix =3D d.getVar('MLPREFIX', True) or ''
> -        for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name, T=
rue) or ""):
> +        mlprefix =3D d.getVar('MLPREFIX') or ''
> +        for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name) o=
r ""):
>              if rdep.startswith("%sxorg-abi-" % mlprefix):
>                  return
>          package_qa_add_message(messages, "xorg-driver-abi", "Package %s =
contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.b=
asename(path)))
> @@ -689,9 +689,9 @@ def package_qa_check_symlink_to_sysroot(path, name, d=
, elf, messages):
>      if os.path.islink(path):
>          target =3D os.readlink(path)
>          if os.path.isabs(target):
> -            tmpdir =3D d.getVar('TMPDIR', True)
> +            tmpdir =3D d.getVar('TMPDIR')
>              if target.startswith(tmpdir):
> -                trimmed =3D path.replace(os.path.join (d.getVar("PKGDEST=
", True), name), "")
> +                trimmed =3D path.replace(os.path.join (d.getVar("PKGDEST=
"), name), "")
>                  package_qa_add_message(messages, "symlink-to-sysroot", "=
Symlink %s in %s points to TMPDIR" % (trimmed, name))
> =20
>  # Check license variables
> @@ -703,17 +703,17 @@ python populate_lic_qa_checksum() {
>      import tempfile
>      sane =3D True
> =20
> -    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True) or ''
> -    lic =3D d.getVar('LICENSE', True)
> -    pn =3D d.getVar('PN', True)
> +    lic_files =3D d.getVar('LIC_FILES_CHKSUM') or ''
> +    lic =3D d.getVar('LICENSE')
> +    pn =3D d.getVar('PN')
> =20
>      if lic =3D=3D "CLOSED":
>          return
> =20
> -    if not lic_files and d.getVar('SRC_URI', True):
> +    if not lic_files and d.getVar('SRC_URI'):
>          sane =3D package_qa_handle_error("license-checksum", pn + ": Rec=
ipe file fetches files and does not have license file information (LIC_FILE=
S_CHKSUM)", d)
> =20
> -    srcdir =3D d.getVar('S', True)
> +    srcdir =3D d.getVar('S')
> =20
>      for url in lic_files.split():
>          try:
> @@ -791,7 +791,7 @@ def package_qa_check_staged(path,d):
>      """
> =20
>      sane =3D True
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
>      workdir =3D os.path.join(tmpdir, "work")
> =20
>      if bb.data.inherits_class("native", d) or bb.data.inherits_class("cr=
oss", d):
> @@ -825,8 +825,8 @@ def package_qa_walk(warnfuncs, errorfuncs, skip, pack=
age, d):
>      import oe.qa
> =20
>      #if this will throw an exception, then fix the dict above
> -    target_os   =3D d.getVar('TARGET_OS', True)
> -    target_arch =3D d.getVar('TARGET_ARCH', True)
> +    target_os   =3D d.getVar('TARGET_OS')
> +    target_arch =3D d.getVar('TARGET_ARCH')
> =20
>      warnings =3D {}
>      errors =3D {}
> @@ -859,7 +859,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, tas=
kdeps, packages, d):
>          bb.data.update_data(localdata)
> =20
>          # Now check the RDEPENDS
> -        rdepends =3D bb.utils.explode_deps(localdata.getVar('RDEPENDS', =
True) or "")
> +        rdepends =3D bb.utils.explode_deps(localdata.getVar('RDEPENDS') =
or "")
> =20
>          # Now do the sanity check!!!
>          if "build-deps" not in skip:
> @@ -875,7 +875,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, tas=
kdeps, packages, d):
>                      if rdep_data and 'PN' in rdep_data and rdep_data['PN=
'] in taskdeps:
>                          continue
>                      if not rdep_data or not 'PN' in rdep_data:
> -                        pkgdata_dir =3D d.getVar("PKGDATA_DIR", True)
> +                        pkgdata_dir =3D d.getVar("PKGDATA_DIR")
>                          try:
>                              possibles =3D os.listdir("%s/runtime-rprovid=
es/%s/" % (pkgdata_dir, rdepend))
>                          except OSError:
> @@ -934,7 +934,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, tas=
kdeps, packages, d):
>                  # The python is not a package, but python-core provides =
it, so
>                  # skip checking /usr/bin/python if python is in the rdep=
s, in
>                  # case there is a RDEPENDS_pkg =3D "python" in the recip=
e.
> -                for py in [ d.getVar('MLPREFIX', True) + "python", "pyth=
on" ]:
> +                for py in [ d.getVar('MLPREFIX') + "python", "python" ]:
>                      if py in done:
>                          filerdepends.pop("/usr/bin/python",None)
>                          done.remove(py)
> @@ -967,7 +967,7 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
> =20
>      def check_valid_deps(var):
>          try:
> -            rvar =3D bb.utils.explode_dep_versions2(localdata.getVar(var=
, True) or "")
> +            rvar =3D bb.utils.explode_dep_versions2(localdata.getVar(var=
) or "")
>          except ValueError as e:
>              bb.fatal("%s_%s: %s" % (var, pkg, e))
>          for dep in rvar:
> @@ -994,7 +994,7 @@ def package_qa_check_expanded_d(path,name,d,elf,messa=
ges):
>      expanded_d =3D d.getVar('D',True)
> =20
>      # Get packages for current recipe and iterate
> -    packages =3D d.getVar('PACKAGES', True).split(" ")
> +    packages =3D d.getVar('PACKAGES').split(" ")
>      for pak in packages:
>      # Go through all variables and check if expanded D is found, warn th=
e user accordingly
>          for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', '=
pkg_postrm':
> @@ -1013,7 +1013,7 @@ def package_qa_check_expanded_d(path,name,d,elf,mes=
sages):
>  def package_qa_check_encoding(keys, encode, d):
>      def check_encoding(key, enc):
>          sane =3D True
> -        value =3D d.getVar(key, True)
> +        value =3D d.getVar(key)
>          if value:
>              try:
>                  s =3D value.encode(enc)
> @@ -1038,8 +1038,8 @@ def package_qa_check_host_user(path, name, d, elf, =
messages):
>      if not os.path.lexists(path):
>          return
> =20
> -    dest =3D d.getVar('PKGDEST', True)
> -    pn =3D d.getVar('PN', True)
> +    dest =3D d.getVar('PKGDEST')
> +    pn =3D d.getVar('PN')
>      home =3D os.path.join(dest, 'home')
>      if path =3D=3D home or path.startswith(home + os.sep):
>          return
> @@ -1052,12 +1052,12 @@ def package_qa_check_host_user(path, name, d, elf=
, messages):
>              raise
>      else:
>          rootfs_path =3D path[len(dest):]
> -        check_uid =3D int(d.getVar('HOST_USER_UID', True))
> +        check_uid =3D int(d.getVar('HOST_USER_UID'))
>          if stat.st_uid =3D=3D check_uid:
>              package_qa_add_message(messages, "host-user-contaminated", "=
%s: %s is owned by uid %d, which is the same as the user running bitbake. T=
his may be due to host contamination" % (pn, rootfs_path, check_uid))
>              return False
> =20
> -        check_gid =3D int(d.getVar('HOST_USER_GID', True))
> +        check_gid =3D int(d.getVar('HOST_USER_GID'))
>          if stat.st_gid =3D=3D check_gid:
>              package_qa_add_message(messages, "host-user-contaminated", "=
%s: %s is owned by gid %d, which is the same as the user running bitbake. T=
his may be due to host contamination" % (pn, rootfs_path, check_gid))
>              return False
> @@ -1075,8 +1075,8 @@ python do_package_qa () {
>      # Check non UTF-8 characters on recipe's metadata
>      package_qa_check_encoding(['DESCRIPTION', 'SUMMARY', 'LICENSE', 'SEC=
TION'], 'utf-8', d)
> =20
> -    logdir =3D d.getVar('T', True)
> -    pkg =3D d.getVar('PN', True)
> +    logdir =3D d.getVar('T')
> +    pkg =3D d.getVar('PN')
> =20
>      # Check the compile log for host contamination
>      compilelog =3D os.path.join(logdir,"log.do_compile")
> @@ -1099,8 +1099,8 @@ python do_package_qa () {
>              package_qa_handle_error("install-host-path", msg, d)
> =20
>      # Scan the packages...
> -    pkgdest =3D d.getVar('PKGDEST', True)
> -    packages =3D set((d.getVar('PACKAGES', True) or '').split())
> +    pkgdest =3D d.getVar('PKGDEST')
> +    packages =3D set((d.getVar('PACKAGES') or '').split())
> =20
>      cpath =3D oe.cachedpath.CachedPath()
>      global pkgfiles
> @@ -1127,11 +1127,11 @@ python do_package_qa () {
> =20
>      g =3D globals()
>      for package in packages:
> -        skip =3D (d.getVar('INSANE_SKIP_' + package, True) or "").split()
> +        skip =3D (d.getVar('INSANE_SKIP_' + package) or "").split()
>          if skip:
>              bb.note("Package %s skipping QA tests: %s" % (package, str(s=
kip)))
>          warnchecks =3D []
> -        for w in (d.getVar("WARN_QA", True) or "").split():
> +        for w in (d.getVar("WARN_QA") or "").split():
>              if w in skip:
>                 continue
>              if w in testmatrix and testmatrix[w] in g:
> @@ -1140,7 +1140,7 @@ python do_package_qa () {
>                  oe.utils.write_ld_so_conf(d)
> =20
>          errorchecks =3D []
> -        for e in (d.getVar("ERROR_QA", True) or "").split():
> +        for e in (d.getVar("ERROR_QA") or "").split():
>              if e in skip:
>                 continue
>              if e in testmatrix and testmatrix[e] in g:
> @@ -1160,10 +1160,10 @@ python do_package_qa () {
>          package_qa_check_rdepends(package, pkgdest, skip, taskdeps, pack=
ages, d)
>          package_qa_check_deps(package, pkgdest, skip, d)
> =20
> -    if 'libdir' in d.getVar("ALL_QA", True).split():
> +    if 'libdir' in d.getVar("ALL_QA").split():
>          package_qa_check_libdir(d)
> =20
> -    qa_sane =3D d.getVar("QA_SANE", True)
> +    qa_sane =3D d.getVar("QA_SANE")
>      if not qa_sane:
>          bb.fatal("QA run found fatal errors. Please consider fixing them=
=2E")
>      bb.note("DONE with PACKAGE QA")
> @@ -1196,7 +1196,7 @@ python do_qa_configure() {
>      ####################################################################=
#######
> =20
>      configs =3D []
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
> =20
>      if bb.data.inherits_class('autotools', d):
>          bb.note("Checking autotools environment for common misconfigurat=
ion")
> @@ -1217,16 +1217,16 @@ Rerun configure task after fixing this.""")
>      # Check gettext configuration and dependencies are correct
>      ####################################################################=
#######
> =20
> -    cnf =3D d.getVar('EXTRA_OECONF', True) or ""
> -    if "gettext" not in d.getVar('P', True) and "gcc-runtime" not in d.g=
etVar('P', True) and "--disable-nls" not in cnf:
> -        ml =3D d.getVar("MLPREFIX", True) or ""
> +    cnf =3D d.getVar('EXTRA_OECONF') or ""
> +    if "gettext" not in d.getVar('P') and "gcc-runtime" not in d.getVar(=
'P') and "--disable-nls" not in cnf:
> +        ml =3D d.getVar("MLPREFIX") or ""
>          if bb.data.inherits_class('native', d) or bb.data.inherits_class=
('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_c=
lass('nativesdk', d):
>              gt =3D "gettext-native"
>          elif bb.data.inherits_class('cross-canadian', d):
>              gt =3D "nativesdk-gettext"
>          else:
>              gt =3D "virtual/" + ml + "gettext"
> -        deps =3D bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
> +        deps =3D bb.utils.explode_deps(d.getVar('DEPENDS') or "")
>          if gt not in deps:
>              for config in configs:
>                  gnu =3D "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/n=
ull" % config
> @@ -1241,40 +1241,40 @@ Missing inherit gettext?""" % (gt, config))
>          bb.note("Checking configure output for unrecognised options")
>          try:
>              flag =3D "WARNING: unrecognized options:"
> -            log =3D os.path.join(d.getVar('B', True), 'config.log')
> +            log =3D os.path.join(d.getVar('B'), 'config.log')
>              output =3D subprocess.check_output(['grep', '-F', flag, log]=
).decode("utf-8").replace(', ', ' ')
>              options =3D set()
>              for line in output.splitlines():
>                  options |=3D set(line.partition(flag)[2].split())
> -            whitelist =3D set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST", Tr=
ue).split())
> +            whitelist =3D set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST").sp=
lit())
>              options -=3D whitelist
>              if options:
> -                pn =3D d.getVar('PN', True)
> +                pn =3D d.getVar('PN')
>                  error_msg =3D pn + ": configure was passed unrecognised =
options: " + " ".join(options)
>                  package_qa_handle_error("unknown-configure-option", erro=
r_msg, d)
>          except subprocess.CalledProcessError:
>              pass
> =20
>      # Check invalid PACKAGECONFIG
> -    pkgconfig =3D (d.getVar("PACKAGECONFIG", True) or "").split()
> +    pkgconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
>      if pkgconfig:
>          pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
>          for pconfig in pkgconfig:
>              if pconfig not in pkgconfigflags:
> -                pn =3D d.getVar('PN', True)
> +                pn =3D d.getVar('PN')
>                  error_msg =3D "%s: invalid PACKAGECONFIG: %s" % (pn, pco=
nfig)
>                  package_qa_handle_error("invalid-packageconfig", error_m=
sg, d)
> =20
> -    qa_sane =3D d.getVar("QA_SANE", True)
> +    qa_sane =3D d.getVar("QA_SANE")
>      if not qa_sane:
>          bb.fatal("Fatal QA errors found, failing task.")
>  }
> =20
>  python do_qa_unpack() {
> -    src_uri =3D d.getVar('SRC_URI', True)
> -    s_dir =3D d.getVar('S', True)
> +    src_uri =3D d.getVar('SRC_URI')
> +    s_dir =3D d.getVar('S')
>      if src_uri and not os.path.exists(s_dir):
> -        bb.warn('%s: the directory %s (%s) pointed to by the S variable =
doesn\'t exist - please set S within the recipe to point to where the sourc=
e has been unpacked to' % (d.getVar('PN', True), d.getVar('S', False), s_di=
r))
> +        bb.warn('%s: the directory %s (%s) pointed to by the S variable =
doesn\'t exist - please set S within the recipe to point to where the sourc=
e has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
>  }
> =20
>  # The Staging Func, to check all staging
> @@ -1290,7 +1290,7 @@ do_configure[postfuncs] +=3D "do_qa_configure "
>  do_unpack[postfuncs] +=3D "do_qa_unpack"
> =20
>  python () {
> -    tests =3D d.getVar('ALL_QA', True).split()
> +    tests =3D d.getVar('ALL_QA').split()
>      if "desktop" in tests:
>          d.appendVar("PACKAGE_DEPENDS", " desktop-file-utils-native")
> =20
> @@ -1299,7 +1299,7 @@ python () {
>      ####################################################################=
#######
> =20
>      # Checking ${FILESEXTRAPATHS}
> -    extrapaths =3D (d.getVar("FILESEXTRAPATHS", True) or "")
> +    extrapaths =3D (d.getVar("FILESEXTRAPATHS") or "")
>      if '__default' not in extrapaths.split(":"):
>          msg =3D "FILESEXTRAPATHS-variable, must always use _prepend (or =
_append)\n"
>          msg +=3D "type of assignment, and don't forget the colon.\n"
> @@ -1311,29 +1311,29 @@ python () {
>          msg +=3D "%s\n" % extrapaths
>          bb.warn(msg)
> =20
> -    overrides =3D d.getVar('OVERRIDES', True).split(':')
> -    pn =3D d.getVar('PN', True)
> +    overrides =3D d.getVar('OVERRIDES').split(':')
> +    pn =3D d.getVar('PN')
>      if pn in overrides:
> -        msg =3D 'Recipe %s has PN of "%s" which is in OVERRIDES, this ca=
n result in unexpected behaviour.' % (d.getVar("FILE", True), pn)
> +        msg =3D 'Recipe %s has PN of "%s" which is in OVERRIDES, this ca=
n result in unexpected behaviour.' % (d.getVar("FILE"), pn)
>          package_qa_handle_error("pn-overrides", msg, d)
> =20
>      issues =3D []
> -    if (d.getVar('PACKAGES', True) or "").split():
> -        for dep in (d.getVar('QADEPENDS', True) or "").split():
> +    if (d.getVar('PACKAGES') or "").split():
> +        for dep in (d.getVar('QADEPENDS') or "").split():
>              d.appendVarFlag('do_package_qa', 'depends', " %s:do_populate=
_sysroot" % dep)
>          for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS',=
 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_pre=
rm', 'pkg_postrm', 'ALLOW_EMPTY':
>              if d.getVar(var, False):
>                  issues.append(var)
> =20
> -        fakeroot_tests =3D d.getVar('FAKEROOT_QA', True).split()
> +        fakeroot_tests =3D d.getVar('FAKEROOT_QA').split()
>          if set(tests) & set(fakeroot_tests):
>              d.setVarFlag('do_package_qa', 'fakeroot', '1')
>              d.appendVarFlag('do_package_qa', 'depends', ' virtual/fakero=
ot-native:do_populate_sysroot')
>      else:
>          d.setVarFlag('do_package_qa', 'rdeptask', '')
>      for i in issues:
> -        package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set a=
s not being package specific, please fix this." % (d.getVar("FILE", True), =
i), d)
> -    qa_sane =3D d.getVar("QA_SANE", True)
> +        package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set a=
s not being package specific, please fix this." % (d.getVar("FILE"), i), d)
> +    qa_sane =3D d.getVar("QA_SANE")
>      if not qa_sane:
>          bb.fatal("Fatal QA errors found, failing task.")
>  }
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.=
bbclass
> index ea976c6..e09cdc4 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -19,7 +19,7 @@ valid_archs =3D "alpha cris ia64 \
>  def map_kernel_arch(a, d):
>      import re
> =20
> -    valid_archs =3D d.getVar('valid_archs', True).split()
> +    valid_archs =3D d.getVar('valid_archs').split()
> =20
>      if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
>      elif re.match('armeb$', a):                 return 'arm'
> @@ -34,7 +34,7 @@ def map_kernel_arch(a, d):
>      else:
>          bb.error("cannot map '%s' to a linux kernel architecture" % a)
> =20
> -export ARCH =3D "${@map_kernel_arch(d.getVar('TARGET_ARCH', True), d)}"
> +export ARCH =3D "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
> =20
>  def map_uboot_arch(a, d):
>      import re
> @@ -43,7 +43,7 @@ def map_uboot_arch(a, d):
>      elif re.match('i.86$', a): return 'x86'
>      return a
> =20
> -export UBOOT_ARCH =3D "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
> +export UBOOT_ARCH =3D "${@map_uboot_arch(d.getVar('ARCH'), d)}"
> =20
>  # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>  # specific options necessary for building the kernel and modules.
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
> index 8580247..2934b3a 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -1,13 +1,13 @@
>  inherit kernel-uboot uboot-sign
> =20
>  python __anonymous () {
> -    kerneltypes =3D d.getVar('KERNEL_IMAGETYPES', True) or ""
> +    kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
>      if 'fitImage' in kerneltypes.split():
> -        depends =3D d.getVar("DEPENDS", True)
> +        depends =3D d.getVar("DEPENDS")
>          depends =3D "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
> =20
> -        if d.getVar("UBOOT_ARCH", True) =3D=3D "x86":
> +        if d.getVar("UBOOT_ARCH") =3D=3D "x86":
>              replacementtype =3D "bzImage"
>          else:
>              replacementtype =3D "zImage"
> @@ -15,19 +15,19 @@ python __anonymous () {
>  	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
>  	# to kernel.bbclass . We have to override it, since we pack zImage
>  	# (at least for now) into the fitImage .
> -        typeformake =3D d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
> +        typeformake =3D d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
>          if 'fitImage' in typeformake.split():
>              d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('f=
itImage', replacementtype))
> =20
> -        image =3D d.getVar('INITRAMFS_IMAGE', True)
> +        image =3D d.getVar('INITRAMFS_IMAGE')
>          if image:
>              d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',=
 ' ${INITRAMFS_IMAGE}:do_image_complete')
> =20
>          # Verified boot will sign the fitImage and append the public key=
 to
>          # U-boot dtb. We ensure the U-Boot dtb is deployed before assemb=
ling
>          # the fitImage:
> -        if d.getVar('UBOOT_SIGN_ENABLE', True):
> -            uboot_pn =3D d.getVar('PREFERRED_PROVIDER_u-boot', True) or =
'u-boot'
> +        if d.getVar('UBOOT_SIGN_ENABLE'):
> +            uboot_pn =3D d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boo=
t'
>              d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_d=
eploy' % uboot_pn)
>  }
> =20
> diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.=
bbclass
> index f7dcc07..5d92f3b 100644
> --- a/meta/classes/kernel-grub.bbclass
> +++ b/meta/classes/kernel-grub.bbclass
> @@ -92,7 +92,7 @@ python __anonymous () {
>  	fi
>  '''
> =20
> -    imagetypes =3D d.getVar('KERNEL_IMAGETYPES', True)
> +    imagetypes =3D d.getVar('KERNEL_IMAGETYPES')
>      imagetypes =3D re.sub(r'\.gz$', '', imagetypes)
> =20
>      for type in imagetypes.split():
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index 08d2262..efe1b42 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -39,10 +39,10 @@ python split_kernel_module_packages () {
> =20
>      def extract_modinfo(file):
>          import tempfile, subprocess
> -        tempfile.tempdir =3D d.getVar("WORKDIR", True)
> +        tempfile.tempdir =3D d.getVar("WORKDIR")
>          tf =3D tempfile.mkstemp()
>          tmpfile =3D tf[1]
> -        cmd =3D "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOS=
T_PREFIX", True) or "", file, tmpfile)
> +        cmd =3D "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOS=
T_PREFIX") or "", file, tmpfile)
>          subprocess.call(cmd, shell=3DTrue)
>          f =3D open(tmpfile)
>          l =3D f.read().split("\000")
> @@ -60,12 +60,12 @@ python split_kernel_module_packages () {
>      def frob_metadata(file, pkg, pattern, format, basename):
>          vals =3D extract_modinfo(file)
> =20
> -        dvar =3D d.getVar('PKGD', True)
> +        dvar =3D d.getVar('PKGD')
> =20
>          # If autoloading is requested, output /etc/modules-load.d/<name>=
=2Econf and append
>          # appropriate modprobe commands to the postinst
> -        autoloadlist =3D (d.getVar("KERNEL_MODULE_AUTOLOAD", True) or ""=
).split()
> -        autoload =3D d.getVar('module_autoload_%s' % basename, True)
> +        autoloadlist =3D (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").spli=
t()
> +        autoload =3D d.getVar('module_autoload_%s' % basename)
>          if autoload and autoload =3D=3D basename:
>              bb.warn("module_autoload_%s was replaced by KERNEL_MODULE_AU=
TOLOAD for cases where basename =3D=3D module name, please drop it" % basen=
ame)
>          if autoload and basename not in autoloadlist:
> @@ -79,15 +79,15 @@ python split_kernel_module_packages () {
>              else:
>                  f.write('%s\n' % basename)
>              f.close()
> -            postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +            postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>              if not postinst:
>                  bb.fatal("pkg_postinst_%s not defined" % pkg)
> -            postinst +=3D d.getVar('autoload_postinst_fragment', True) %=
 (autoload or basename)
> +            postinst +=3D d.getVar('autoload_postinst_fragment') % (auto=
load or basename)
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
>          # Write out any modconf fragment
> -        modconflist =3D (d.getVar("KERNEL_MODULE_PROBECONF", True) or ""=
).split()
> -        modconf =3D d.getVar('module_conf_%s' % basename, True)
> +        modconflist =3D (d.getVar("KERNEL_MODULE_PROBECONF") or "").spli=
t()
> +        modconf =3D d.getVar('module_conf_%s' % basename)
>          if modconf and basename in modconflist:
>              name =3D '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
>              f =3D open(name, 'w')
> @@ -96,15 +96,15 @@ python split_kernel_module_packages () {
>          elif modconf:
>              bb.error("Please ensure module %s is listed in KERNEL_MODULE=
_PROBECONF since module_conf_%s is set" % (basename, basename))
> =20
> -        files =3D d.getVar('FILES_%s' % pkg, True)
> +        files =3D d.getVar('FILES_%s' % pkg)
>          files =3D "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.con=
f" % (files, basename, basename)
>          d.setVar('FILES_%s' % pkg, files)
> =20
>          if "description" in vals:
> -            old_desc =3D d.getVar('DESCRIPTION_' + pkg, True) or ""
> +            old_desc =3D d.getVar('DESCRIPTION_' + pkg) or ""
>              d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["descr=
iption"])
> =20
> -        rdepends =3D bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_'=
 + pkg, True) or "")
> +        rdepends =3D bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_'=
 + pkg) or "")
>          modinfo_deps =3D []
>          if "depends" in vals and vals["depends"] !=3D "":
>              for dep in vals["depends"].split(","):
> @@ -121,24 +121,24 @@ python split_kernel_module_packages () {
> =20
>      module_regex =3D '^(.*)\.k?o$'
> =20
> -    module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX', T=
rue)
> +    module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>      module_pattern =3D module_pattern_prefix + 'kernel-module-%s'
> =20
> -    postinst =3D d.getVar('pkg_postinst_modules', True)
> -    postrm =3D d.getVar('pkg_postrm_modules', True)
> +    postinst =3D d.getVar('pkg_postinst_modules')
> +    postrm =3D d.getVar('pkg_postrm_modules')
> =20
> -    modules =3D do_split_packages(d, root=3D'/lib/modules', file_regex=
=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel =
module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfro=
b_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL_VERSION", True)=
))
> +    modules =3D do_split_packages(d, root=3D'/lib/modules', file_regex=
=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel =
module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfro=
b_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL_VERSION")))
>      if modules:
> -        metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE', True)
> +        metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> =20
>      # If modules-load.d and modprobe.d are empty at this point, remove t=
hem to
>      # avoid warnings. removedirs only raises an OSError if an empty
>      # directory cannot be removed.
> -    dvar =3D d.getVar('PKGD', True)
> +    dvar =3D d.getVar('PKGD')
>      for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % =
(dvar), "%s/etc" % (dvar)]:
>          if len(os.listdir(dir)) =3D=3D 0:
>              os.rmdir(dir)
>  }
> =20
> -do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf_" + s, =
(d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()))}'
> +do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf_" + s, =
(d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uim=
age.bbclass
> index 340503a..7e7185f 100644
> --- a/meta/classes/kernel-uimage.bbclass
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -1,8 +1,8 @@
>  inherit kernel-uboot
> =20
>  python __anonymous () {
> -    if "uImage" in (d.getVar('KERNEL_IMAGETYPES', True) or "").split():
> -        depends =3D d.getVar("DEPENDS", True)
> +    if "uImage" in (d.getVar('KERNEL_IMAGETYPES') or "").split():
> +        depends =3D d.getVar("DEPENDS")
>          depends =3D "%s u-boot-mkimage-native" % depends
>          d.setVar("DEPENDS", depends)
> =20
> @@ -11,8 +11,8 @@ python __anonymous () {
>          # to build uImage using the kernel build system if and only if
>          # KEEPUIMAGE =3D=3D yes. Otherwise, we pack compressed vmlinux i=
nto
>          # the uImage .
> -        if d.getVar("KEEPUIMAGE", True) !=3D 'yes':
> -            typeformake =3D d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) =
or ""
> +        if d.getVar("KEEPUIMAGE") !=3D 'yes':
> +            typeformake =3D d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
>              if "uImage" in typeformake.split():
>                  d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replac=
e('uImage', 'vmlinux'))
>  }
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index 6160a29..6956761 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -284,7 +284,7 @@ python do_kernel_configcheck() {
>      if not os.path.exists(kmeta):
>          kmeta =3D "." + kmeta
> =20
> -    pathprefix =3D "export PATH=3D%s:%s; " % (d.getVar('PATH', True), "$=
{S}/scripts/util/")
> +    pathprefix =3D "export PATH=3D%s:%s; " % (d.getVar('PATH'), "${S}/sc=
ripts/util/")
> =20
>      cmd =3D d.expand("scc --configs -o ${S}/.kernel-meta")
>      ret, configs =3D oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 25a153c..8c18622 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -22,18 +22,18 @@ INITRAMFS_IMAGE_BUNDLE ?=3D ""
>  # number and cause kernel to be rebuilt. To avoid this, make
>  # KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
>  # LINUX_VERSION which is a constant.
> -KERNEL_VERSION_NAME =3D "${@d.getVar('KERNEL_VERSION', True) or ""}"
> +KERNEL_VERSION_NAME =3D "${@d.getVar('KERNEL_VERSION') or ""}"
>  KERNEL_VERSION_NAME[vardepvalue] =3D "${LINUX_VERSION}"
> -KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_name(d.getVar('KERNEL=
_VERSION', True))}"
> +KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_name(d.getVar('KERNEL=
_VERSION'))}"
>  KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
> =20
>  python __anonymous () {
>      import re
> =20
>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGET=
YPES
> -    type =3D d.getVar('KERNEL_IMAGETYPE', True) or ""
> -    alttype =3D d.getVar('KERNEL_ALT_IMAGETYPE', True) or ""
> -    types =3D d.getVar('KERNEL_IMAGETYPES', True) or ""
> +    type =3D d.getVar('KERNEL_IMAGETYPE') or ""
> +    alttype =3D d.getVar('KERNEL_ALT_IMAGETYPE') or ""
> +    types =3D d.getVar('KERNEL_IMAGETYPES') or ""
>      if type not in types.split():
>          types =3D (type + ' ' + types).strip()
>      if alttype not in types.split():
> @@ -56,15 +56,15 @@ python __anonymous () {
> =20
>          d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
> =20
> -        imagedest =3D d.getVar('KERNEL_IMAGEDEST', True)
> -        priority =3D d.getVar('KERNEL_PRIORITY', True)
> +        imagedest =3D d.getVar('KERNEL_IMAGEDEST')
> +        priority =3D d.getVar('KERNEL_PRIORITY')
>          postinst =3D '#!/bin/sh\n' + 'update-alternatives --install /' +=
 imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type +=
 '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>          d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
> =20
>          postrm =3D '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' =
+ type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
>          d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
> =20
> -    image =3D d.getVar('INITRAMFS_IMAGE', True)
> +    image =3D d.getVar('INITRAMFS_IMAGE')
>      if image:
>          d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_=
IMAGE}:do_image_complete')
> =20
> @@ -72,7 +72,7 @@ python __anonymous () {
>      #       The preferred method is to set INITRAMFS_IMAGE, because
>      #       this INITRAMFS_TASK has circular dependency problems
>      #       if the initramfs requires kernel modules
> -    image_task =3D d.getVar('INITRAMFS_TASK', True)
> +    image_task =3D d.getVar('INITRAMFS_TASK')
>      if image_task:
>          d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>  }
> @@ -101,15 +101,15 @@ inherit ${KERNEL_CLASSES}
>  do_unpack[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KE=
RNEL_BUILDDIR}"
>  do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KER=
NEL_BUILDDIR}"
>  base_do_unpack_append () {
> -    s =3D d.getVar("S", True)
> +    s =3D d.getVar("S")
>      if s[-1] =3D=3D '/':
>          # drop trailing slash, so that os.symlink(kernsrc, s) doesn't us=
e s as directory name and fail
>          s=3Ds[:-1]
> -    kernsrc =3D d.getVar("STAGING_KERNEL_DIR", True)
> +    kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
>      if s !=3D kernsrc:
>          bb.utils.mkdirhier(kernsrc)
>          bb.utils.remove(kernsrc, recurse=3DTrue)
> -        if d.getVar("EXTERNALSRC", True):
> +        if d.getVar("EXTERNALSRC"):
>              # With EXTERNALSRC S will not be wiped so we can symlink to =
it
>              os.symlink(s, kernsrc)
>          else:
> @@ -127,9 +127,9 @@ PACKAGES_DYNAMIC +=3D "^kernel-firmware-.*"
>  export OS =3D "${TARGET_OS}"
>  export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> =20
> -KERNEL_PRIORITY ?=3D "${@int(d.getVar('PV', True).split('-')[0].split('+=
')[0].split('.')[0]) * 10000 + \
> -                       int(d.getVar('PV', True).split('-')[0].split('+')=
[0].split('.')[1]) * 100 + \
> -                       int(d.getVar('PV', True).split('-')[0].split('+')=
[0].split('.')[-1])}"
> +KERNEL_PRIORITY ?=3D "${@int(d.getVar('PV').split('-')[0].split('+')[0].=
split('.')[0]) * 10000 + \
> +                       int(d.getVar('PV').split('-')[0].split('+')[0].sp=
lit('.')[1]) * 100 + \
> +                       int(d.getVar('PV').split('-')[0].split('+')[0].sp=
lit('.')[-1])}"
> =20
>  KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
> =20
> @@ -140,7 +140,7 @@ KERNEL_IMAGEDEST =3D "boot"
>  #
>  # configuration
>  #
> -export CMDLINE_CONSOLE =3D "console=3D${@d.getVar("KERNEL_CONSOLE", True=
) or "ttyS0"}"
> +export CMDLINE_CONSOLE =3D "console=3D${@d.getVar("KERNEL_CONSOLE") or "=
ttyS0"}"
> =20
>  KERNEL_VERSION =3D "${@get_kernelversion_headers('${B}')}"
> =20
> @@ -435,14 +435,14 @@ sysroot_stage_all () {
>  KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B} oldnoconfig=
 || yes '' | oe_runmake -C ${S} O=3D${B} oldconfig"
> =20
>  python check_oldest_kernel() {
> -    oldest_kernel =3D d.getVar('OLDEST_KERNEL', True)
> -    kernel_version =3D d.getVar('KERNEL_VERSION', True)
> -    tclibc =3D d.getVar('TCLIBC', True)
> +    oldest_kernel =3D d.getVar('OLDEST_KERNEL')
> +    kernel_version =3D d.getVar('KERNEL_VERSION')
> +    tclibc =3D d.getVar('TCLIBC')
>      if tclibc =3D=3D 'glibc':
>          kernel_version =3D kernel_version.split('-', 1)[0]
>          if oldest_kernel and kernel_version:
>              if bb.utils.vercmp_string(kernel_version, oldest_kernel) < 0:
> -                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of th=
e kernel you are building is "%s" - therefore %s as built may not be compat=
ible with this kernel. Either set OLDEST_KERNEL to an older version, or bui=
ld a newer kernel.' % (d.getVar('PN', True), oldest_kernel, kernel_version,=
 tclibc))
> +                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of th=
e kernel you are building is "%s" - therefore %s as built may not be compat=
ible with this kernel. Either set OLDEST_KERNEL to an older version, or bui=
ld a newer kernel.' % (d.getVar('PN'), oldest_kernel, kernel_version, tclib=
c))
>  }
> =20
>  check_oldest_kernel[vardepsexclude] +=3D "OLDEST_KERNEL KERNEL_VERSION"
> diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.=
bbclass
> index 11b0065..9ea2c03 100644
> --- a/meta/classes/libc-common.bbclass
> +++ b/meta/classes/libc-common.bbclass
> @@ -17,15 +17,15 @@ do_install() {
>  }
> =20
>  def get_libc_fpu_setting(bb, d):
> -    if d.getVar('TARGET_FPU', True) in [ 'soft', 'ppc-efd' ]:
> +    if d.getVar('TARGET_FPU') in [ 'soft', 'ppc-efd' ]:
>          return "--without-fp"
>      return ""
> =20
>  python populate_packages_prepend () {
> -    if d.getVar('DEBIAN_NAMES', True):
> -        pkgs =3D d.getVar('PACKAGES', True).split()
> -        bpn =3D d.getVar('BPN', True)
> -        prefix =3D d.getVar('MLPREFIX', True) or ""
> +    if d.getVar('DEBIAN_NAMES'):
> +        pkgs =3D d.getVar('PACKAGES').split()
> +        bpn =3D d.getVar('BPN')
> +        prefix =3D d.getVar('MLPREFIX') or ""
>          # Set the base package...
>          d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
>          libcprefix =3D prefix + bpn + '-'
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-packag=
e.bbclass
> index 2dc90c4..50a84b4 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -10,24 +10,24 @@
>  GLIBC_INTERNAL_USE_BINARY_LOCALE ?=3D "ondevice"
> =20
>  python __anonymous () {
> -    enabled =3D d.getVar("ENABLE_BINARY_LOCALE_GENERATION", True)
> +    enabled =3D d.getVar("ENABLE_BINARY_LOCALE_GENERATION")
> =20
> -    pn =3D d.getVar("PN", True)
> +    pn =3D d.getVar("PN")
>      if pn.endswith("-initial"):
>          enabled =3D False
> =20
>      if enabled and int(enabled):
>          import re
> =20
> -        target_arch =3D d.getVar("TARGET_ARCH", True)
> -        binary_arches =3D d.getVar("BINARY_LOCALE_ARCHES", True) or ""
> -        use_cross_localedef =3D d.getVar("LOCALE_GENERATION_WITH_CROSS-L=
OCALEDEF", True) or ""
> +        target_arch =3D d.getVar("TARGET_ARCH")
> +        binary_arches =3D d.getVar("BINARY_LOCALE_ARCHES") or ""
> +        use_cross_localedef =3D d.getVar("LOCALE_GENERATION_WITH_CROSS-L=
OCALEDEF") or ""
> =20
>          for regexp in binary_arches.split(" "):
>              r =3D re.compile(regexp)
> =20
>              if r.match(target_arch):
> -                depends =3D d.getVar("DEPENDS", True)
> +                depends =3D d.getVar("DEPENDS")
>                  if use_cross_localedef =3D=3D "1" :
>                      depends =3D "%s cross-localedef-native" % depends
>                  else:
> @@ -92,21 +92,21 @@ inherit qemu
> =20
>  python package_do_split_gconvs () {
>      import re
> -    if (d.getVar('PACKAGE_NO_GCONV', True) =3D=3D '1'):
> +    if (d.getVar('PACKAGE_NO_GCONV') =3D=3D '1'):
>          bb.note("package requested not splitting gconvs")
>          return
> =20
> -    if not d.getVar('PACKAGES', True):
> +    if not d.getVar('PACKAGES'):
>          return
> =20
> -    mlprefix =3D d.getVar("MLPREFIX", True) or ""
> +    mlprefix =3D d.getVar("MLPREFIX") or ""
> =20
> -    bpn =3D d.getVar('BPN', True)
> -    libdir =3D d.getVar('libdir', True)
> +    bpn =3D d.getVar('BPN')
> +    libdir =3D d.getVar('libdir')
>      if not libdir:
>          bb.error("libdir not defined")
>          return
> -    datadir =3D d.getVar('datadir', True)
> +    datadir =3D d.getVar('datadir')
>      if not datadir:
>          bb.error("datadir not defined")
>          return
> @@ -114,7 +114,7 @@ python package_do_split_gconvs () {
>      gconv_libdir =3D base_path_join(libdir, "gconv")
>      charmap_dir =3D base_path_join(datadir, "i18n", "charmaps")
>      locales_dir =3D base_path_join(datadir, "i18n", "locales")
> -    binary_locales_dir =3D d.getVar('localedir', True)
> +    binary_locales_dir =3D d.getVar('localedir')
> =20
>      def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
>          deps =3D []
> @@ -181,13 +181,13 @@ python package_do_split_gconvs () {
>          description=3D'locale definition for %s', hook=3Dcalc_locale_dep=
s, extra_depends=3D'')
>      d.setVar('PACKAGES', d.getVar('PACKAGES', False) + ' ' + d.getVar('M=
LPREFIX', False) + bpn + '-gconv')
> =20
> -    use_bin =3D d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", True)
> +    use_bin =3D d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE")
> =20
>      dot_re =3D re.compile("(.*)\.(.*)")
> =20
>      # Read in supported locales and associated encodings
>      supported =3D {}
> -    with open(base_path_join(d.getVar('WORKDIR', True), "SUPPORTED")) as=
 f:
> +    with open(base_path_join(d.getVar('WORKDIR'), "SUPPORTED")) as f:
>          for line in f.readlines():
>              try:
>                  locale, charset =3D line.rstrip().split()
> @@ -196,7 +196,7 @@ python package_do_split_gconvs () {
>              supported[locale] =3D charset
> =20
>      # GLIBC_GENERATE_LOCALES var specifies which locales to be generated=
=2E empty or "all" means all locales
> -    to_generate =3D d.getVar('GLIBC_GENERATE_LOCALES', True)
> +    to_generate =3D d.getVar('GLIBC_GENERATE_LOCALES')
>      if not to_generate or to_generate =3D=3D 'all':
>          to_generate =3D sorted(supported.keys())
>      else:
> @@ -213,9 +213,9 @@ python package_do_split_gconvs () {
>      def output_locale_source(name, pkgname, locale, encoding):
>          d.setVar('RDEPENDS_%s' % pkgname, '%slocaledef %s-localedata-%s =
%s-charmap-%s' % \
>          (mlprefix, mlprefix+bpn, legitimize_package_name(locale), mlpref=
ix+bpn, legitimize_package_name(encoding)))
> -        d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_post=
inst', True) \
> +        d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_post=
inst') \
>          % (locale, encoding, locale))
> -        d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm=
', True) % \
> +        d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm=
') % \
>          (locale, encoding, locale))
> =20
>      def output_locale_binary_rdepends(name, pkgname, locale, encoding):
> @@ -230,16 +230,16 @@ python package_do_split_gconvs () {
>      commands =3D {}
> =20
>      def output_locale_binary(name, pkgname, locale, encoding):
> -        treedir =3D base_path_join(d.getVar("WORKDIR", True), "locale-tr=
ee")
> -        ldlibdir =3D base_path_join(treedir, d.getVar("base_libdir", Tru=
e))
> -        path =3D d.getVar("PATH", True)
> +        treedir =3D base_path_join(d.getVar("WORKDIR"), "locale-tree")
> +        ldlibdir =3D base_path_join(treedir, d.getVar("base_libdir"))
> +        path =3D d.getVar("PATH")
>          i18npath =3D base_path_join(treedir, datadir, "i18n")
>          gconvpath =3D base_path_join(treedir, "iconvdata")
>          outputpath =3D base_path_join(treedir, binary_locales_dir)
> =20
> -        use_cross_localedef =3D d.getVar("LOCALE_GENERATION_WITH_CROSS-L=
OCALEDEF", True) or "0"
> +        use_cross_localedef =3D d.getVar("LOCALE_GENERATION_WITH_CROSS-L=
OCALEDEF") or "0"
>          if use_cross_localedef =3D=3D "1":
> -            target_arch =3D d.getVar('TARGET_ARCH', True)
> +            target_arch =3D d.getVar('TARGET_ARCH')
>              locale_arch_options =3D { \
>                  "arm":     " --uint32-align=3D4 --little-endian ", \
>                  "armeb":   " --uint32-align=3D4 --big-endian ",    \
> @@ -278,7 +278,7 @@ python package_do_split_gconvs () {
>                  --inputfile=3D%s/i18n/locales/%s --charmap=3D%s %s" \
>                  % (treedir, datadir, locale, encoding, name)
> =20
> -            qemu_options =3D d.getVar('QEMU_OPTIONS', True)
> +            qemu_options =3D d.getVar('QEMU_OPTIONS')
> =20
>              cmd =3D "PSEUDO_RELOADED=3DYES PATH=3D\"%s\" I18NPATH=3D\"%s=
\" %s -L %s \
>                  -E LD_LIBRARY_PATH=3D%s %s %s/bin/localedef %s" % \
> @@ -291,7 +291,7 @@ python package_do_split_gconvs () {
>      def output_locale(name, locale, encoding):
>          pkgname =3D d.getVar('MLPREFIX', False) + 'locale-base-' + legit=
imize_package_name(name)
>          d.setVar('ALLOW_EMPTY_%s' % pkgname, '1')
> -        d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES', Tr=
ue)))
> +        d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES')))
>          rprovides =3D ' %svirtual-locale-%s' % (mlprefix, legitimize_pac=
kage_name(name))
>          m =3D re.match("(.*)_(.*)", name)
>          if m:
> @@ -310,8 +310,8 @@ python package_do_split_gconvs () {
>          bb.note("preparing tree for binary locale generation")
>          bb.build.exec_func("do_prep_locale_tree", d)
> =20
> -    utf8_only =3D int(d.getVar('LOCALE_UTF8_ONLY', True) or 0)
> -    utf8_is_default =3D int(d.getVar('LOCALE_UTF8_IS_DEFAULT', True) or =
0)
> +    utf8_only =3D int(d.getVar('LOCALE_UTF8_ONLY') or 0)
> +    utf8_is_default =3D int(d.getVar('LOCALE_UTF8_IS_DEFAULT') or 0)
> =20
>      encodings =3D {}
>      for locale in to_generate:
> @@ -338,7 +338,7 @@ python package_do_split_gconvs () {
>                  output_locale('%s.%s' % (base, charset), base, charset)
> =20
>      if use_bin =3D=3D "compile":
> -        makefile =3D base_path_join(d.getVar("WORKDIR", True), "locale-t=
ree", "Makefile")
> +        makefile =3D base_path_join(d.getVar("WORKDIR"), "locale-tree", =
"Makefile")
>          m =3D open(makefile, "w")
>          m.write("all: %s\n\n" % " ".join(commands.keys()))
>          for cmd in commands:
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index afcfbfc..c5d1204 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -37,13 +37,13 @@ python license_create_manifest() {
>      import oe.packagedata
>      from oe.rootfs import image_list_installed_packages
> =20
> -    build_images_from_feeds =3D d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
> +    build_images_from_feeds =3D d.getVar('BUILD_IMAGES_FROM_FEEDS')
>      if build_images_from_feeds =3D=3D "1":
>          return 0
> =20
>      pkg_dic =3D {}
>      for pkg in sorted(image_list_installed_packages(d)):
> -        pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR', True),
> +        pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR'),
>                                  'runtime-reverse', pkg)
>          pkg_name =3D os.path.basename(os.readlink(pkg_info))
> =20
> @@ -52,15 +52,15 @@ python license_create_manifest() {
>              pkg_lic_name =3D "LICENSE_" + pkg_name
>              pkg_dic[pkg_name]["LICENSE"] =3D pkg_dic[pkg_name][pkg_lic_n=
ame]
> =20
> -    rootfs_license_manifest =3D os.path.join(d.getVar('LICENSE_DIRECTORY=
', True),
> -                        d.getVar('IMAGE_NAME', True), 'license.manifest')
> +    rootfs_license_manifest =3D os.path.join(d.getVar('LICENSE_DIRECTORY=
'),
> +                        d.getVar('IMAGE_NAME'), 'license.manifest')
>      write_license_files(d, rootfs_license_manifest, pkg_dic)
>  }
> =20
>  def write_license_files(d, license_manifest, pkg_dic):
>      import re
> =20
> -    bad_licenses =3D (d.getVar("INCOMPATIBLE_LICENSE", True) or "").spli=
t()
> +    bad_licenses =3D (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
>      bad_licenses =3D map(lambda l: canonical_license(d, l), bad_licenses)
>      bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
> =20
> @@ -72,7 +72,7 @@ def write_license_files(d, license_manifest, pkg_dic):
>                          oe.license.manifest_licenses(pkg_dic[pkg]["LICEN=
SE"],
>                          bad_licenses, canonical_license, d)
>                  except oe.license.LicenseError as exc:
> -                    bb.fatal('%s: %s' % (d.getVar('P', True), exc))
> +                    bb.fatal('%s: %s' % (d.getVar('P'), exc))
>              else:
>                  pkg_dic[pkg]["LICENSES"] =3D re.sub('[|&()*]', ' ', pkg_=
dic[pkg]["LICENSE"])
>                  pkg_dic[pkg]["LICENSES"] =3D re.sub('  *', ' ', pkg_dic[=
pkg]["LICENSES"])
> @@ -98,7 +98,7 @@ def write_license_files(d, license_manifest, pkg_dic):
>                  license_file.write("FILES: %s\n\n" % pkg_dic[pkg]["FILES=
"])
> =20
>              for lic in pkg_dic[pkg]["LICENSES"]:
> -                lic_file =3D os.path.join(d.getVar('LICENSE_DIRECTORY', =
True),
> +                lic_file =3D os.path.join(d.getVar('LICENSE_DIRECTORY'),
>                                          pkg_dic[pkg]["PN"], "generic_%s"=
 %=20
>                                          re.sub('\+', '', lic))
>                  # add explicity avoid of CLOSED license because isn't ge=
neric
> @@ -114,8 +114,8 @@ def write_license_files(d, license_manifest, pkg_dic):
>      # - Just copy the manifest
>      # - Copy the manifest and the license directories
>      # With both options set we see a .5 M increase in core-image-minimal
> -    copy_lic_manifest =3D d.getVar('COPY_LIC_MANIFEST', True)
> -    copy_lic_dirs =3D d.getVar('COPY_LIC_DIRS', True)
> +    copy_lic_manifest =3D d.getVar('COPY_LIC_MANIFEST')
> +    copy_lic_dirs =3D d.getVar('COPY_LIC_DIRS')
>      if copy_lic_manifest =3D=3D "1":
>          rootfs_license_dir =3D os.path.join(d.getVar('IMAGE_ROOTFS', 'Tr=
ue'),=20
>                                  'usr', 'share', 'common-licenses')
> @@ -129,7 +129,7 @@ def write_license_files(d, license_manifest, pkg_dic):
>              for pkg in sorted(pkg_dic):
>                  pkg_rootfs_license_dir =3D os.path.join(rootfs_license_d=
ir, pkg)
>                  bb.utils.mkdirhier(pkg_rootfs_license_dir)
> -                pkg_license_dir =3D os.path.join(d.getVar('LICENSE_DIREC=
TORY', True),
> +                pkg_license_dir =3D os.path.join(d.getVar('LICENSE_DIREC=
TORY'),
>                                              pkg_dic[pkg]["PN"])=20
>                  licenses =3D os.listdir(pkg_license_dir)
>                  for lic in licenses:
> @@ -166,7 +166,7 @@ def license_deployed_manifest(d):
> =20
>      dep_dic =3D {}
>      man_dic =3D {}
> -    lic_dir =3D d.getVar("LICENSE_DIRECTORY", True)
> +    lic_dir =3D d.getVar("LICENSE_DIRECTORY")
> =20
>      dep_dic =3D get_deployed_dependencies(d)
>      for dep in dep_dic.keys():
> @@ -181,8 +181,8 @@ def license_deployed_manifest(d):
>                  key,val =3D line.split(": ", 1)
>                  man_dic[dep][key] =3D val[:-1]
> =20
> -    lic_manifest_dir =3D os.path.join(d.getVar('LICENSE_DIRECTORY', True=
),
> -                                    d.getVar('IMAGE_NAME', True))
> +    lic_manifest_dir =3D os.path.join(d.getVar('LICENSE_DIRECTORY'),
> +                                    d.getVar('IMAGE_NAME'))
>      bb.utils.mkdirhier(lic_manifest_dir)
>      image_license_manifest =3D os.path.join(lic_manifest_dir, 'image_lic=
ense.manifest')
>      write_license_files(d, image_license_manifest, man_dic)
> @@ -202,7 +202,7 @@ def get_deployed_dependencies(d):
>      depends =3D list(set([dep[0] for dep
>                      in list(taskdata.values())
>                      if not dep[0].endswith("-native")]))
> -    extra_depends =3D d.getVar("EXTRA_IMAGEDEPENDS", True)
> +    extra_depends =3D d.getVar("EXTRA_IMAGEDEPENDS")
>      boot_depends =3D get_boot_dependencies(d)
>      depends.extend(extra_depends.split())
>      depends.extend(boot_depends)
> @@ -212,13 +212,13 @@ def get_deployed_dependencies(d):
>      # the SSTATE_MANIFESTS for "deploy" task.
>      # The manifest file name contains the arch. Because we are not runni=
ng
>      # in the recipe context it is necessary to check every arch used.
> -    sstate_manifest_dir =3D d.getVar("SSTATE_MANIFESTS", True)
> -    sstate_archs =3D d.getVar("SSTATE_ARCHS", True)
> -    extra_archs =3D d.getVar("PACKAGE_EXTRA_ARCHS", True)
> +    sstate_manifest_dir =3D d.getVar("SSTATE_MANIFESTS")
> +    sstate_archs =3D d.getVar("SSTATE_ARCHS")
> +    extra_archs =3D d.getVar("PACKAGE_EXTRA_ARCHS")
>      archs =3D list(set(("%s %s" % (sstate_archs, extra_archs)).split()))
>      for dep in depends:
>          # Some recipes have an arch on their own, so we try that first.
> -        special_arch =3D d.getVar("PACKAGE_ARCH_pn-%s" % dep, True)
> +        special_arch =3D d.getVar("PACKAGE_ARCH_pn-%s" % dep)
>          if special_arch:
>              sstate_manifest_file =3D os.path.join(sstate_manifest_dir,
>                      "manifest-%s-%s.deploy" % (special_arch, dep))
> @@ -254,7 +254,7 @@ def get_boot_dependencies(d):
>                  in boot_depends_string.split()
>                  if not dep.split(":")[0].endswith("-native")]
>      for dep in boot_depends:
> -        info_file =3D os.path.join(d.getVar("LICENSE_DIRECTORY", True),
> +        info_file =3D os.path.join(d.getVar("LICENSE_DIRECTORY"),
>                  dep, "recipeinfo")
>          # If the recipe and dependency name is the same
>          if os.path.exists(info_file):
> @@ -265,7 +265,7 @@ def get_boot_dependencies(d):
>                  # The fifth field contains what the task provides
>                  if dep in taskdep[4]:
>                      info_file =3D os.path.join(
> -                            d.getVar("LICENSE_DIRECTORY", True),
> +                            d.getVar("LICENSE_DIRECTORY"),
>                              taskdep[0], "recipeinfo")
>                      if os.path.exists(info_file):
>                          depends.append(taskdep[0])
> @@ -295,7 +295,7 @@ python do_populate_lic() {
>      lic_files_paths =3D find_license_files(d)
> =20
>      # The base directory we wrangle licenses to
> -    destdir =3D os.path.join(d.getVar('LICSSTATEDIR', True), d.getVar('P=
N', True))
> +    destdir =3D os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('PN'))
>      copy_license_files(lic_files_paths, destdir)
>      info =3D get_recipe_info(d)
>      with open(os.path.join(destdir, "recipeinfo"), "w") as f:
> @@ -306,11 +306,11 @@ python do_populate_lic() {
>  # it would be better to copy them in do_install_append, but find_license=
_filesa is python
>  python perform_packagecopy_prepend () {
>      enabled =3D oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
> -    if d.getVar('CLASSOVERRIDE', True) =3D=3D 'class-target' and enabled:
> +    if d.getVar('CLASSOVERRIDE') =3D=3D 'class-target' and enabled:
>          lic_files_paths =3D find_license_files(d)
> =20
>          # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot=
 be used to join D and LICENSE_FILES_DIRECTORY
> -        destdir =3D d.getVar('D', True) + os.path.join(d.getVar('LICENSE=
_FILES_DIRECTORY', True), d.getVar('PN', True))
> +        destdir =3D d.getVar('D') + os.path.join(d.getVar('LICENSE_FILES=
_DIRECTORY'), d.getVar('PN'))
>          copy_license_files(lic_files_paths, destdir)
>          add_package_and_files(d)
>  }
> @@ -318,15 +318,15 @@ perform_packagecopy[vardeps] +=3D "LICENSE_CREATE_P=
ACKAGE"
> =20
>  def get_recipe_info(d):
>      info =3D {}
> -    info["PV"] =3D d.getVar("PV", True)
> -    info["PR"] =3D d.getVar("PR", True)
> -    info["LICENSE"] =3D d.getVar("LICENSE", True)
> +    info["PV"] =3D d.getVar("PV")
> +    info["PR"] =3D d.getVar("PR")
> +    info["LICENSE"] =3D d.getVar("LICENSE")
>      return info
> =20
>  def add_package_and_files(d):
> -    packages =3D d.getVar('PACKAGES', True)
> -    files =3D d.getVar('LICENSE_FILES_DIRECTORY', True)
> -    pn =3D d.getVar('PN', True)
> +    packages =3D d.getVar('PACKAGES')
> +    files =3D d.getVar('LICENSE_FILES_DIRECTORY')
> +    pn =3D d.getVar('PN')
>      pn_lic =3D "%s%s" % (pn, d.getVar('LICENSE_PACKAGE_SUFFIX', False))
>      if pn_lic in packages:
>          bb.warn("%s package already existed in %s." % (pn_lic, pn))
> @@ -334,7 +334,7 @@ def add_package_and_files(d):
>          # first in PACKAGES to be sure that nothing else gets LICENSE_FI=
LES_DIRECTORY
>          d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
>          d.setVar('FILES_' + pn_lic, files)
> -        rrecommends_pn =3D d.getVar('RRECOMMENDS_' + pn, True)
> +        rrecommends_pn =3D d.getVar('RRECOMMENDS_' + pn)
>          if rrecommends_pn:
>              d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends=
_pn))
>          else:
> @@ -390,12 +390,12 @@ def find_license_files(d):
>      from collections import defaultdict, OrderedDict
> =20
>      # All the license files for the package
> -    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True) or ""
> -    pn =3D d.getVar('PN', True)
> +    lic_files =3D d.getVar('LIC_FILES_CHKSUM') or ""
> +    pn =3D d.getVar('PN')
>      # The license files are located in S/LIC_FILE_CHECKSUM.
> -    srcdir =3D d.getVar('S', True)
> +    srcdir =3D d.getVar('S')
>      # Directory we store the generic licenses as set in the distro confi=
guration
> -    generic_directory =3D d.getVar('COMMON_LICENSE_DIR', True)
> +    generic_directory =3D d.getVar('COMMON_LICENSE_DIR')
>      # List of basename, path tuples
>      lic_files_paths =3D []
>      # Entries from LIC_FILES_CHKSUM
> @@ -403,7 +403,7 @@ def find_license_files(d):
>      license_source_dirs =3D []
>      license_source_dirs.append(generic_directory)
>      try:
> -        additional_lic_dirs =3D d.getVar('LICENSE_PATH', True).split()
> +        additional_lic_dirs =3D d.getVar('LICENSE_PATH').split()
>          for lic_dir in additional_lic_dirs:
>              license_source_dirs.append(lic_dir)
>      except:
> @@ -473,18 +473,18 @@ def find_license_files(d):
>          try:
>              (type, host, path, user, pswd, parm) =3D bb.fetch.decodeurl(=
url)
>          except bb.fetch.MalformedUrl:
> -            bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s"=
 % (d.getVar('PF', True), url))
> +            bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s"=
 % (d.getVar('PF'), url))
>          # We want the license filename and path
>          chksum =3D parm['md5'] if 'md5' in parm else parm['sha256']
>          lic_chksums[path] =3D chksum
> =20
>      v =3D FindVisitor()
>      try:
> -        v.visit_string(d.getVar('LICENSE', True))
> +        v.visit_string(d.getVar('LICENSE'))
>      except oe.license.InvalidLicense as exc:
> -        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
> +        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
>      except SyntaxError:
> -        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('P=
F', True)))
> +        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('P=
F')))
> =20
>      # Add files from LIC_FILES_CHKSUM to list of license files
>      lic_chksum_paths =3D defaultdict(OrderedDict)
> @@ -542,7 +542,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
> =20
>  def incompatible_license_contains(license, truevalue, falsevalue, d):
>      license =3D canonical_license(d, license)
> -    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE', True) or "").spli=
t()
> +    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
>      bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
>      return truevalue if license in bad_licenses else falsevalue
> =20
> @@ -553,9 +553,9 @@ def incompatible_license(d, dont_want_licenses, packa=
ge=3DNone):
>      as canonical (SPDX) names.
>      """
>      import oe.license
> -    license =3D d.getVar("LICENSE_%s" % package, True) if package else N=
one
> +    license =3D d.getVar("LICENSE_%s" % package) if package else None
>      if not license:
> -        license =3D d.getVar('LICENSE', True)
> +        license =3D d.getVar('LICENSE')
> =20
>      # Handles an "or" or two license sets provided by
>      # flattened_licenses(), pick one that works if possible.
> @@ -566,7 +566,7 @@ def incompatible_license(d, dont_want_licenses, packa=
ge=3DNone):
>      try:
>          licenses =3D oe.license.flattened_licenses(license, choose_lic_s=
et)
>      except oe.license.LicenseError as exc:
> -        bb.fatal('%s: %s' % (d.getVar('P', True), exc))
> +        bb.fatal('%s: %s' % (d.getVar('P'), exc))
>      return any(not oe.license.license_ok(canonical_license(d, l), \
>  		dont_want_licenses) for l in licenses)
> =20
> @@ -614,16 +614,16 @@ def check_license_flags(d):
> =20
>      def all_license_flags_match(license_flags, whitelist):
>          """ Return first unmatched flag, None if all flags match """
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
>          split_whitelist =3D whitelist.split()
>          for flag in license_flags.split():
>              if not license_flag_matches(flag, split_whitelist, pn):
>                  return flag
>          return None
> =20
> -    license_flags =3D d.getVar('LICENSE_FLAGS', True)
> +    license_flags =3D d.getVar('LICENSE_FLAGS')
>      if license_flags:
> -        whitelist =3D d.getVar('LICENSE_FLAGS_WHITELIST', True)
> +        whitelist =3D d.getVar('LICENSE_FLAGS_WHITELIST')
>          if not whitelist:
>              return license_flags
>          unmatched_flag =3D all_license_flags_match(license_flags, whitel=
ist)
> @@ -637,8 +637,8 @@ def check_license_format(d):
>          Validate operators in LICENSES.
>          No spaces are allowed between LICENSES.
>      """
> -    pn =3D d.getVar('PN', True)
> -    licenses =3D d.getVar('LICENSE', True)
> +    pn =3D d.getVar('PN')
> +    licenses =3D d.getVar('LICENSE')
>      from oe.license import license_operator, license_operator_chars, lic=
ense_pattern
> =20
>      elements =3D list(filter(lambda x: x.strip(), license_operator.split=
(licenses)))
> diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-c=
ommon.bbclass
> index 734697f..27b137d 100644
> --- a/meta/classes/live-vm-common.bbclass
> +++ b/meta/classes/live-vm-common.bbclass
> @@ -4,11 +4,11 @@ def set_live_vm_vars(d, suffix):
>      vars =3D ['GRUB_CFG', 'SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
>      for var in vars:
>          var_with_suffix =3D var + '_' + suffix
> -        if d.getVar(var, True):
> +        if d.getVar(var):
>              bb.warn('Found potential conflicted var %s, please use %s ra=
ther than %s' % \
>                  (var, var_with_suffix, var))
> -        elif d.getVar(var_with_suffix, True):
> -            d.setVar(var, d.getVar(var_with_suffix, True))
> +        elif d.getVar(var_with_suffix):
> +            d.setVar(var, d.getVar(var_with_suffix))
> =20
> =20
>  EFI =3D "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
> @@ -25,7 +25,7 @@ def pcbios(d):
>      return pcbios
> =20
>  PCBIOS =3D "${@pcbios(d)}"
> -PCBIOS_CLASS =3D "${@['','syslinux'][d.getVar('PCBIOS', True) =3D=3D '1'=
]}"
> +PCBIOS_CLASS =3D "${@['','syslinux'][d.getVar('PCBIOS') =3D=3D '1']}"
> =20
>  inherit ${EFI_CLASS}
>  inherit ${PCBIOS_CLASS}
> diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_sc=
m.bbclass
> index 2e6fac2..fa791f0 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -26,7 +26,7 @@ def base_detect_branch(d):
>      return "<unknown>"
> =20
>  def base_get_scmbasepath(d):
> -    return os.path.join(d.getVar('COREBASE', True), 'meta')
> +    return os.path.join(d.getVar('COREBASE'), 'meta')
> =20
>  def base_get_metadata_monotone_branch(path, d):
>      monotone_branch =3D "<unknown>"
> diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migra=
te_localcount.bbclass
> index aa0df8b..810a541 100644
> --- a/meta/classes/migrate_localcount.bbclass
> +++ b/meta/classes/migrate_localcount.bbclass
> @@ -6,12 +6,12 @@ python migrate_localcount_handler () {
>      if not e.data:
>          return
> =20
> -    pv =3D e.data.getVar('PV', True)
> +    pv =3D e.data.getVar('PV')
>      if not 'AUTOINC' in pv:
>          return
> =20
>      localcounts =3D bb.persist_data.persist('BB_URI_LOCALCOUNT', e.data)
> -    pn =3D e.data.getVar('PN', True)
> +    pn =3D e.data.getVar('PN')
>      revs =3D localcounts.get_by_pattern('%%-%s_rev' % pn)
>      counts =3D localcounts.get_by_pattern('%%-%s_count' % pn)
>      if not revs or not counts:
> @@ -21,10 +21,10 @@ python migrate_localcount_handler () {
>          bb.warn("The number of revs and localcounts don't match in %s" %=
 pn)
>          return
> =20
> -    version =3D e.data.getVar('PRAUTOINX', True)
> +    version =3D e.data.getVar('PRAUTOINX')
>      srcrev =3D bb.fetch2.get_srcrev(e.data)
>      base_ver =3D 'AUTOINC-%s' % version[:version.find(srcrev)]
> -    pkgarch =3D e.data.getVar('PACKAGE_ARCH', True)
> +    pkgarch =3D e.data.getVar('PACKAGE_ARCH')
>      value =3D max(int(count) for count in counts)
> =20
>      if len(revs) =3D=3D 1:
> @@ -33,8 +33,8 @@ python migrate_localcount_handler () {
>      else:
>          value +=3D 1
> =20
> -    bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR', True))
> -    df =3D e.data.getVar('LOCALCOUNT_DUMPFILE', True)
> +    bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR'))
> +    df =3D e.data.getVar('LOCALCOUNT_DUMPFILE')
>      flock =3D bb.utils.lockfile("%s.lock" % df)
>      with open(df, 'a') as fd:
>          fd.write('PRAUTO$%s$%s$%s =3D "%s"\n' %
> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
> index 721c73f..6cd59af 100644
> --- a/meta/classes/mime.bbclass
> +++ b/meta/classes/mime.bbclass
> @@ -28,8 +28,8 @@ fi
> =20
>  python populate_packages_append () {
>      import re
> -    packages =3D d.getVar('PACKAGES', True).split()
> -    pkgdest =3D  d.getVar('PKGDEST', True)
> +    packages =3D d.getVar('PACKAGES').split()
> +    pkgdest =3D  d.getVar('PKGDEST')
> =20
>      for pkg in packages:
>          mime_dir =3D '%s/%s/usr/share/mime/packages' % (pkgdest, pkg)
> @@ -41,15 +41,15 @@ python populate_packages_append () {
>                      mimes.append(f)
>          if mimes:
>              bb.note("adding mime postinst and postrm scripts to %s" % pk=
g)
> -            postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +            postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>              if not postinst:
>                  postinst =3D '#!/bin/sh\n'
> -            postinst +=3D d.getVar('mime_postinst', True)
> +            postinst +=3D d.getVar('mime_postinst')
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> -            postrm =3D d.getVar('pkg_postrm_%s' % pkg, True)
> +            postrm =3D d.getVar('pkg_postrm_%s' % pkg)
>              if not postrm:
>                  postrm =3D '#!/bin/sh\n'
> -            postrm +=3D d.getVar('mime_postrm', True)
> +            postrm +=3D d.getVar('mime_postrm')
>              d.setVar('pkg_postrm_%s' % pkg, postrm)
>              bb.note("adding shared-mime-info-data dependency to %s" % pk=
g)
>              d.appendVar('RDEPENDS_' + pkg, " shared-mime-info-data")
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 68e3d34..95d42da 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -9,7 +9,7 @@ EXTRA_OEMAKE +=3D "KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
>  MODULES_INSTALL_TARGET ?=3D "modules_install"
> =20
>  python __anonymous () {
> -    depends =3D d.getVar('DEPENDS', True)
> +    depends =3D d.getVar('DEPENDS')
>      extra_symbols =3D []
>      for dep in depends.split():
>          if dep.startswith("kernel-module-"):
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index d5a3128..498f7f5 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -1,20 +1,20 @@
>  python multilib_virtclass_handler () {
> -    cls =3D e.data.getVar("BBEXTENDCURR", True)
> -    variant =3D e.data.getVar("BBEXTENDVARIANT", True)
> +    cls =3D e.data.getVar("BBEXTENDCURR")
> +    variant =3D e.data.getVar("BBEXTENDVARIANT")
>      if cls !=3D "multilib" or not variant:
>          return
> =20
> -    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DI=
R', True))
> +    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DI=
R'))
> =20
>      # There should only be one kernel in multilib configs
>      # We also skip multilib setup for module packages.
> -    provides =3D (e.data.getVar("PROVIDES", True) or "").split()
> +    provides =3D (e.data.getVar("PROVIDES") or "").split()
>      if "virtual/kernel" in provides or bb.data.inherits_class('module-ba=
se', e.data):
>          raise bb.parse.SkipPackage("We shouldn't have multilib variants =
for the kernel")
> =20
> -    save_var_name=3De.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
> +    save_var_name=3De.data.getVar("MULTILIB_SAVE_VARNAME") or ""
>      for name in save_var_name.split():
> -        val=3De.data.getVar(name, True)
> +        val=3De.data.getVar(name)
>          if val:
>              e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
> =20
> @@ -26,7 +26,7 @@ python multilib_virtclass_handler () {
>      if bb.data.inherits_class('image', e.data):
>          e.data.setVar("MLPREFIX", variant + "-")
>          e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
> -        e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROO=
T', True))
> +        e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROO=
T'))
>          target_vendor =3D e.data.getVar("TARGET_VENDOR_" + "virtclass-mu=
ltilib-" + variant, False)
>          if target_vendor:
>              e.data.setVar("TARGET_VENDOR", target_vendor)
> @@ -50,7 +50,7 @@ python multilib_virtclass_handler () {
> =20
> =20
>      # Expand this since this won't work correctly once we set a multilib=
 into place
> -    e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTI=
LIB_PACKAGE_ARCHS", True))
> +    e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTI=
LIB_PACKAGE_ARCHS"))
>  =20
>      override =3D ":virtclass-multilib-" + variant
> =20
> @@ -60,7 +60,7 @@ python multilib_virtclass_handler () {
> =20
>      # Expand the WHITELISTs with multilib prefix
>      for whitelist in ["WHITELIST_GPL-3.0", "LGPLv2_WHITELIST_GPL-3.0"]:
> -        pkgs =3D e.data.getVar(whitelist, True)
> +        pkgs =3D e.data.getVar(whitelist)
>          for pkg in pkgs.split():
>              pkgs +=3D " " + variant + "-" + pkg
>          e.data.setVar(whitelist, pkgs)
> @@ -78,7 +78,7 @@ multilib_virtclass_handler[eventmask] =3D "bb.event.Rec=
ipePreFinalise"
>  STAGINGCC_prepend =3D "${BBEXTENDVARIANT}-"
> =20
>  python __anonymous () {
> -    variant =3D d.getVar("BBEXTENDVARIANT", True)
> +    variant =3D d.getVar("BBEXTENDVARIANT")
> =20
>      import oe.classextend
> =20
> @@ -88,7 +88,7 @@ python __anonymous () {
>          clsextend.map_depends_variable("PACKAGE_INSTALL")
>          clsextend.map_depends_variable("LINGUAS_INSTALL")
>          clsextend.map_depends_variable("RDEPENDS")
> -        pinstall =3D d.getVar("LINGUAS_INSTALL", True) + " " + d.getVar(=
"PACKAGE_INSTALL", True)
> +        pinstall =3D d.getVar("LINGUAS_INSTALL") + " " + d.getVar("PACKA=
GE_INSTALL")
>          d.setVar("PACKAGE_INSTALL", pinstall)
>          d.setVar("LINGUAS_INSTALL", "")
>          # FIXME, we need to map this to something, not delete it!
> @@ -104,7 +104,7 @@ python __anonymous () {
>          return
> =20
>      clsextend.rename_packages()
> -    clsextend.rename_package_variables((d.getVar("PACKAGEVARS", True) or=
 "").split())
> +    clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").s=
plit())
> =20
>      clsextend.map_packagevars()
>      clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
> @@ -119,7 +119,7 @@ PACKAGEFUNCS_append =3D " do_package_qa_multilib"
>  python do_package_qa_multilib() {
> =20
>      def check_mlprefix(pkg, var, mlprefix):
> -        values =3D bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), =
True) or d.getVar(var, True) or "")
> +        values =3D bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), =
True) or d.getVar(var) or "")
>          candidates =3D []
>          for i in values:
>              if i.startswith('virtual/'):
> @@ -130,14 +130,14 @@ python do_package_qa_multilib() {
>                  candidates.append(i)
>          if len(candidates) > 0:
>              msg =3D "%s package %s - suspicious values '%s' in %s" \
> -                   % (d.getVar('PN', True), pkg, ' '.join(candidates), v=
ar)
> +                   % (d.getVar('PN'), pkg, ' '.join(candidates), var)
>              package_qa_handle_error("multilib", msg, d)
> =20
> -    ml =3D d.getVar('MLPREFIX', True)
> +    ml =3D d.getVar('MLPREFIX')
>      if not ml:
>          return
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> +    packages =3D d.getVar('PACKAGES')
>      for pkg in packages.split():
>          check_mlprefix(pkg, 'RDEPENDS', ml)
>          check_mlprefix(pkg, 'RPROVIDES', ml)
> diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib=
_global.bbclass
> index 11ae268..aba0371 100644
> --- a/meta/classes/multilib_global.bbclass
> +++ b/meta/classes/multilib_global.bbclass
> @@ -1,7 +1,7 @@
>  def preferred_ml_updates(d):
>      # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
>      # we need to mirror these variables in the multilib case;
> -    multilibs =3D d.getVar('MULTILIBS', True) or ""
> +    multilibs =3D d.getVar('MULTILIBS') or ""
>      if not multilibs:
>          return
> =20
> @@ -102,7 +102,7 @@ def preferred_ml_updates(d):
>          prov =3D prov.replace("virtual/", "")
>          return "virtual/" + prefix + "-" + prov
> =20
> -    mp =3D (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
> +    mp =3D (d.getVar("MULTI_PROVIDER_WHITELIST") or "").split()
>      extramp =3D []
>      for p in mp:
>          if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("=
nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
> @@ -111,14 +111,14 @@ def preferred_ml_updates(d):
>              extramp.append(translate_provide(pref, p))
>      d.setVar("MULTI_PROVIDER_WHITELIST", " ".join(mp + extramp))
> =20
> -    abisafe =3D (d.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").=
split()
> +    abisafe =3D (d.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
>      extras =3D []
>      for p in prefixes:
>          for a in abisafe:
>              extras.append(p + "-" + a)
>      d.appendVar("SIGGEN_EXCLUDERECIPES_ABISAFE", " " + " ".join(extras))
> =20
> -    siggen_exclude =3D (d.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True=
) or "").split()
> +    siggen_exclude =3D (d.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "=
").split()
>      extras =3D []
>      for p in prefixes:
>          for a in siggen_exclude:
> @@ -128,7 +128,7 @@ def preferred_ml_updates(d):
> =20
>  python multilib_virtclass_handler_vendor () {
>      if isinstance(e, bb.event.ConfigParsed):
> -        for v in e.data.getVar("MULTILIB_VARIANTS", True).split():
> +        for v in e.data.getVar("MULTILIB_VARIANTS").split():
>              if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + v, Fa=
lse) is None:
>                  e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e=
=2Edata.getVar("TARGET_VENDOR", False) + "ml" + v)
>          preferred_ml_updates(e.data)
> @@ -140,14 +140,14 @@ python multilib_virtclass_handler_global () {
>      if not e.data:
>          return
> =20
> -    variant =3D e.data.getVar("BBEXTENDVARIANT", True)
> +    variant =3D e.data.getVar("BBEXTENDVARIANT")
> =20
>      if isinstance(e, bb.event.RecipeParsed) and not variant:
>          if bb.data.inherits_class('kernel', e.data) or \
>              bb.data.inherits_class('module-base', e.data) or \
>              (bb.data.inherits_class('allarch', e.data) and\
>               not bb.data.inherits_class('packagegroup', e.data)):
> -            variants =3D (e.data.getVar("MULTILIB_VARIANTS", True) or ""=
).split()
> +            variants =3D (e.data.getVar("MULTILIB_VARIANTS") or "").spli=
t()
> =20
>              import oe.classextend
>              clsextends =3D []
> @@ -155,21 +155,21 @@ python multilib_virtclass_handler_global () {
>                  clsextends.append(oe.classextend.ClassExtender(variant, =
e.data))
> =20
>              # Process PROVIDES
> -            origprovs =3D provs =3D e.data.getVar("PROVIDES", True) or ""
> +            origprovs =3D provs =3D e.data.getVar("PROVIDES") or ""
>              for clsextend in clsextends:
>                  provs =3D provs + " " + clsextend.map_variable("PROVIDES=
", setvar=3DFalse)
>              e.data.setVar("PROVIDES", provs)
> =20
>              # Process RPROVIDES
> -            origrprovs =3D rprovs =3D e.data.getVar("RPROVIDES", True) o=
r ""
> +            origrprovs =3D rprovs =3D e.data.getVar("RPROVIDES") or ""
>              for clsextend in clsextends:
>                  rprovs =3D rprovs + " " + clsextend.map_variable("RPROVI=
DES", setvar=3DFalse)
>              if rprovs.strip():
>                  e.data.setVar("RPROVIDES", rprovs)
> =20
>  	    # Process RPROVIDES_${PN}...
> -            for pkg in (e.data.getVar("PACKAGES", True) or "").split():
> -                origrprovs =3D rprovs =3D e.data.getVar("RPROVIDES_%s" %=
 pkg, True) or ""
> +            for pkg in (e.data.getVar("PACKAGES") or "").split():
> +                origrprovs =3D rprovs =3D e.data.getVar("RPROVIDES_%s" %=
 pkg) or ""
>                  for clsextend in clsextends:
>                      rprovs =3D rprovs + " " + clsextend.map_variable("RP=
ROVIDES_%s" % pkg, setvar=3DFalse)
>                      rprovs =3D rprovs + " " + clsextend.extname + "-" + =
pkg
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index 143f8a9..5592e1d 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -116,18 +116,18 @@ MACHINEOVERRIDES =3D ""
>  PATH_prepend =3D "${COREBASE}/scripts/native-intercept:"
> =20
>  python native_virtclass_handler () {
> -    classextend =3D e.data.getVar('BBCLASSEXTEND', True) or ""
> +    classextend =3D e.data.getVar('BBCLASSEXTEND') or ""
>      if "native" not in classextend:
>          return
> =20
> -    pn =3D e.data.getVar("PN", True)
> +    pn =3D e.data.getVar("PN")
>      if not pn.endswith("-native"):
>          return
> =20
>      def map_dependencies(varname, d, suffix =3D ""):
>          if suffix:
>              varname =3D varname + "_" + suffix
> -        deps =3D d.getVar(varname, True)
> +        deps =3D d.getVar(varname)
>          if not deps:
>              return
>          deps =3D bb.utils.explode_deps(deps)
> @@ -146,14 +146,14 @@ python native_virtclass_handler () {
>      e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":vir=
tclass-native")
> =20
>      map_dependencies("DEPENDS", e.data)
> -    for pkg in [e.data.getVar("PN", True), "", "${PN}"]:
> +    for pkg in [e.data.getVar("PN"), "", "${PN}"]:
>          map_dependencies("RDEPENDS", e.data, pkg)
>          map_dependencies("RRECOMMENDS", e.data, pkg)
>          map_dependencies("RSUGGESTS", e.data, pkg)
>          map_dependencies("RPROVIDES", e.data, pkg)
>          map_dependencies("RREPLACES", e.data, pkg)
> =20
> -    provides =3D e.data.getVar("PROVIDES", True)
> +    provides =3D e.data.getVar("PROVIDES")
>      nprovides =3D []
>      for prov in provides.split():
>          if prov.find(pn) !=3D -1:
> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbcl=
ass
> index 31dde4a..2ac8fd8 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -64,17 +64,17 @@ export PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${libdi=
r}/pkgconfig"
>  export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
> =20
>  python nativesdk_virtclass_handler () {
> -    pn =3D e.data.getVar("PN", True)
> +    pn =3D e.data.getVar("PN")
>      if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
>          return
> =20
>      e.data.setVar("MLPREFIX", "nativesdk-")
> -    e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN", True).replace=
("-nativesdk", "").replace("nativesdk-", ""))
> +    e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nat=
ivesdk", "").replace("nativesdk-", ""))
>      e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":vir=
tclass-nativesdk")
>  }
> =20
>  python () {
> -    pn =3D d.getVar("PN", True)
> +    pn =3D d.getVar("PN")
>      if not pn.startswith("nativesdk-"):
>          return
> =20
> @@ -82,7 +82,7 @@ python () {
> =20
>      clsextend =3D oe.classextend.NativesdkClassExtender("nativesdk", d)
>      clsextend.rename_packages()
> -    clsextend.rename_package_variables((d.getVar("PACKAGEVARS", True) or=
 "").split())
> +    clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").s=
plit())
> =20
>      clsextend.map_depends_variable("DEPENDS")
>      clsextend.map_packagevars()
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 43228c5..1c778a7 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -13,7 +13,7 @@ def npm_oe_arch_map(target_arch, d):
>      elif re.match('arm64$', target_arch): return 'arm'
>      return target_arch
> =20
> -NPM_ARCH ?=3D "${@npm_oe_arch_map(d.getVar('TARGET_ARCH', True), d)}"
> +NPM_ARCH ?=3D "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
> =20
>  npm_do_compile() {
>  	# Copy in any additionally fetched modules
> @@ -59,7 +59,7 @@ python populate_packages_prepend () {
>              description =3D pdata.get('description', None)
>              if description:
>                  d.setVar('SUMMARY_%s' % expanded_pkgname, description.re=
place(u"\u2018", "'").replace(u"\u2019", "'"))
> -    d.appendVar('RDEPENDS_%s' % d.getVar('PN', True), ' %s' % ' '.join(p=
kgnames).replace('_', '-'))
> +    d.appendVar('RDEPENDS_%s' % d.getVar('PN'), ' %s' % ' '.join(pkgname=
s).replace('_', '-'))
>  }
> =20
>  FILES_${PN} +=3D " \
> diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
> index c4febc2..2589d340 100644
> --- a/meta/classes/oelint.bbclass
> +++ b/meta/classes/oelint.bbclass
> @@ -1,7 +1,7 @@
>  addtask lint before do_build
>  do_lint[nostamp] =3D "1"
>  python do_lint() {
> -    pkgname =3D d.getVar("PN", True)
> +    pkgname =3D d.getVar("PN")
> =20
>      ##############################
>      # Test that DESCRIPTION exists
> @@ -35,7 +35,7 @@ python do_lint() {
>      # Check that all patches have Signed-off-by and Upstream-Status
>      #
>      srcuri =3D d.getVar("SRC_URI", False).split()
> -    fpaths =3D (d.getVar('FILESPATH', True) or '').split(':')
> +    fpaths =3D (d.getVar('FILESPATH') or '').split(':')
> =20
>      def findPatch(patchname):
>          for dir in fpaths:
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a6f0a7a..2703465 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -120,7 +120,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
> =20
>      """
> =20
> -    dvar =3D d.getVar('PKGD', True)
> +    dvar =3D d.getVar('PKGD')
>      root =3D d.expand(root)
>      output_pattern =3D d.expand(output_pattern)
>      extra_depends =3D d.expand(extra_depends)
> @@ -130,7 +130,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
>      if not os.path.exists(dvar + root):
>          return []
> =20
> -    ml =3D d.getVar("MLPREFIX", True)
> +    ml =3D d.getVar("MLPREFIX")
>      if ml:
>          if not output_pattern.startswith(ml):
>              output_pattern =3D ml + output_pattern
> @@ -145,7 +145,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
>              extra_depends =3D " ".join(newdeps)
> =20
> =20
> -    packages =3D d.getVar('PACKAGES', True).split()
> +    packages =3D d.getVar('PACKAGES').split()
>      split_packages =3D set()
> =20
>      if postinst:
> @@ -163,7 +163,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
>                      objs.append(relpath)
> =20
>      if extra_depends =3D=3D None:
> -        extra_depends =3D d.getVar("PN", True)
> +        extra_depends =3D d.getVar("PN")
> =20
>      if not summary:
>          summary =3D description
> @@ -189,7 +189,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
>                  packages =3D [pkg] + packages
>              else:
>                  packages.append(pkg)
> -        oldfiles =3D d.getVar('FILES_' + pkg, True)
> +        oldfiles =3D d.getVar('FILES_' + pkg)
>          newfile =3D os.path.join(root, o)
>          # These names will be passed through glob() so if the filename a=
ctually
>          # contains * or ? (rare, but possible) we need to handle that sp=
ecially
> @@ -214,9 +214,9 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
>              d.setVar('FILES_' + pkg, oldfiles + " " + newfile)
>          if extra_depends !=3D '':
>              d.appendVar('RDEPENDS_' + pkg, ' ' + extra_depends)
> -        if not d.getVar('DESCRIPTION_' + pkg, True):
> +        if not d.getVar('DESCRIPTION_' + pkg):
>              d.setVar('DESCRIPTION_' + pkg, description % on)
> -        if not d.getVar('SUMMARY_' + pkg, True):
> +        if not d.getVar('SUMMARY_' + pkg):
>              d.setVar('SUMMARY_' + pkg, summary % on)
>          if postinst:
>              d.setVar('pkg_postinst_' + pkg, postinst)
> @@ -231,9 +231,9 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
>  PACKAGE_DEPENDS +=3D "file-native"
> =20
>  python () {
> -    if d.getVar('PACKAGES', True) !=3D '':
> +    if d.getVar('PACKAGES') !=3D '':
>          deps =3D ""
> -        for dep in (d.getVar('PACKAGE_DEPENDS', True) or "").split():
> +        for dep in (d.getVar('PACKAGE_DEPENDS') or "").split():
>              deps +=3D " %s:do_populate_sysroot" % dep
>          d.appendVarFlag('do_package', 'depends', deps)
> =20
> @@ -286,14 +286,14 @@ def files_from_filevars(filevars):
> =20
>  # Called in package_<rpm,ipk,deb>.bbclass to get the correct list of con=
figuration files
>  def get_conffiles(pkg, d):
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
>      root =3D os.path.join(pkgdest, pkg)
>      cwd =3D os.getcwd()
>      os.chdir(root)
> =20
> -    conffiles =3D d.getVar('CONFFILES_%s' % pkg, True);
> +    conffiles =3D d.getVar('CONFFILES_%s' % pkg);
>      if conffiles =3D=3D None:
> -        conffiles =3D d.getVar('CONFFILES', True)
> +        conffiles =3D d.getVar('CONFFILES')
>      if conffiles =3D=3D None:
>          conffiles =3D ""
>      conffiles =3D conffiles.split()
> @@ -318,7 +318,7 @@ def get_conffiles(pkg, d):
>      return conf_list
> =20
>  def checkbuildpath(file, d):
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
>      with open(file) as f:
>          file_content =3D f.read()
>          if tmpdir in file_content:
> @@ -335,8 +335,8 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sour=
cefile, d):
> =20
>      import stat
> =20
> -    dvar =3D d.getVar('PKGD', True)
> -    objcopy =3D d.getVar("OBJCOPY", True)
> +    dvar =3D d.getVar('PKGD')
> +    objcopy =3D d.getVar("OBJCOPY")
>      debugedit =3D d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
> =20
>      # We ignore kernel modules, we don't generate debug info files.
> @@ -382,11 +382,11 @@ def copydebugsources(debugsrcdir, d):
> =20
>      sourcefile =3D d.expand("${WORKDIR}/debugsources.list")
>      if debugsrcdir and os.path.isfile(sourcefile):
> -        dvar =3D d.getVar('PKGD', True)
> -        strip =3D d.getVar("STRIP", True)
> -        objcopy =3D d.getVar("OBJCOPY", True)
> +        dvar =3D d.getVar('PKGD')
> +        strip =3D d.getVar("STRIP")
> +        objcopy =3D d.getVar("OBJCOPY")
>          debugedit =3D d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debuged=
it")
> -        workdir =3D d.getVar("WORKDIR", True)
> +        workdir =3D d.getVar("WORKDIR")
>          workparentdir =3D os.path.dirname(os.path.dirname(workdir))
>          workbasedir =3D os.path.basename(os.path.dirname(workdir)) + "/"=
 + os.path.basename(workdir)
> =20
> @@ -468,20 +468,20 @@ def get_package_additional_metadata (pkg_type, d):
>          return "\n".join(metadata_fields).strip()
> =20
>  def runtime_mapping_rename (varname, pkg, d):
> -    #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
> +    #bb.note("%s before: %s" % (varname, d.getVar(varname)))
> =20
>      if bb.data.inherits_class('packagegroup', d):
>          return
> =20
>      new_depends =3D {}
> -    deps =3D bb.utils.explode_dep_versions2(d.getVar(varname, True) or "=
")
> +    deps =3D bb.utils.explode_dep_versions2(d.getVar(varname) or "")
>      for depend in deps:
>          new_depend =3D get_package_mapping(depend, pkg, d)
>          new_depends[new_depend] =3D deps[depend]
> =20
>      d.setVar(varname, bb.utils.join_deps(new_depends, commasep=3DFalse))
> =20
> -    #bb.note("%s after: %s" % (varname, d.getVar(varname, True)))
> +    #bb.note("%s after: %s" % (varname, d.getVar(varname)))
> =20
>  #
>  # Package functions suitable for inclusion in PACKAGEFUNCS
> @@ -492,34 +492,34 @@ python package_get_auto_pr() {
>      import re
> =20
>      # Support per recipe PRSERV_HOST
> -    pn =3D d.getVar('PN', True)
> -    host =3D d.getVar("PRSERV_HOST_" + pn, True)
> +    pn =3D d.getVar('PN')
> +    host =3D d.getVar("PRSERV_HOST_" + pn)
>      if not (host is None):
>          d.setVar("PRSERV_HOST", host)
> =20
> -    pkgv =3D d.getVar("PKGV", True)
> +    pkgv =3D d.getVar("PKGV")
> =20
>      # PR Server not active, handle AUTOINC
> -    if not d.getVar('PRSERV_HOST', True):
> +    if not d.getVar('PRSERV_HOST'):
>          if 'AUTOINC' in pkgv:
>              d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
>          return
> =20
>      auto_pr =3D None
> -    pv =3D d.getVar("PV", True)
> -    version =3D d.getVar("PRAUTOINX", True)
> -    pkgarch =3D d.getVar("PACKAGE_ARCH", True)
> -    checksum =3D d.getVar("BB_TASKHASH", True)
> +    pv =3D d.getVar("PV")
> +    version =3D d.getVar("PRAUTOINX")
> +    pkgarch =3D d.getVar("PACKAGE_ARCH")
> +    checksum =3D d.getVar("BB_TASKHASH")
> =20
> -    if d.getVar('PRSERV_LOCKDOWN', True):
> -        auto_pr =3D d.getVar('PRAUTO_' + version + '_' + pkgarch, True) =
or d.getVar('PRAUTO_' + version, True) or None
> +    if d.getVar('PRSERV_LOCKDOWN'):
> +        auto_pr =3D d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.g=
etVar('PRAUTO_' + version) or None
>          if auto_pr is None:
>              bb.fatal("Can NOT get PRAUTO from lockdown exported file")
>          d.setVar('PRAUTO',str(auto_pr))
>          return
> =20
>      try:
> -        conn =3D d.getVar("__PRSERV_CONN", True)
> +        conn =3D d.getVar("__PRSERV_CONN")
>          if conn is None:
>              conn =3D oe.prservice.prserv_make_conn(d)
>          if conn is not None:
> @@ -540,19 +540,19 @@ python package_get_auto_pr() {
>  LOCALEBASEPN ??=3D "${PN}"
> =20
>  python package_do_split_locales() {
> -    if (d.getVar('PACKAGE_NO_LOCALE', True) =3D=3D '1'):
> +    if (d.getVar('PACKAGE_NO_LOCALE') =3D=3D '1'):
>          bb.debug(1, "package requested not splitting locales")
>          return
> =20
> -    packages =3D (d.getVar('PACKAGES', True) or "").split()
> +    packages =3D (d.getVar('PACKAGES') or "").split()
> =20
> -    datadir =3D d.getVar('datadir', True)
> +    datadir =3D d.getVar('datadir')
>      if not datadir:
>          bb.note("datadir not defined")
>          return
> =20
> -    dvar =3D d.getVar('PKGD', True)
> -    pn =3D d.getVar('LOCALEBASEPN', True)
> +    dvar =3D d.getVar('PKGD')
> +    pn =3D d.getVar('LOCALEBASEPN')
> =20
>      if pn + '-locale' in packages:
>          packages.remove(pn + '-locale')
> @@ -565,10 +565,10 @@ python package_do_split_locales() {
> =20
>      locales =3D os.listdir(localedir)
> =20
> -    summary =3D d.getVar('SUMMARY', True) or pn
> -    description =3D d.getVar('DESCRIPTION', True) or ""
> -    locale_section =3D d.getVar('LOCALE_SECTION', True)
> -    mlprefix =3D d.getVar('MLPREFIX', True) or ""
> +    summary =3D d.getVar('SUMMARY') or pn
> +    description =3D d.getVar('DESCRIPTION') or ""
> +    locale_section =3D d.getVar('LOCALE_SECTION')
> +    mlprefix =3D d.getVar('MLPREFIX') or ""
>      for l in sorted(locales):
>          ln =3D legitimize_package_name(l)
>          pkg =3D pn + '-locale-' + ln
> @@ -589,14 +589,14 @@ python package_do_split_locales() {
>      # glibc-localedata-translit* won't install as a dependency
>      # for some other package which breaks meta-toolchain
>      # Probably breaks since virtual-locale- isn't provided anywhere
> -    #rdep =3D (d.getVar('RDEPENDS_%s' % pn, True) or "").split()
> +    #rdep =3D (d.getVar('RDEPENDS_%s' % pn) or "").split()
>      #rdep.append('%s-locale*' % pn)
>      #d.setVar('RDEPENDS_%s' % pn, ' '.join(rdep))
>  }
> =20
>  python perform_packagecopy () {
> -    dest =3D d.getVar('D', True)
> -    dvar =3D d.getVar('PKGD', True)
> +    dest =3D d.getVar('D')
> +    dvar =3D d.getVar('PKGD')
> =20
>      # Start by package population by taking a copy of the installed
>      # files to operate on
> @@ -730,8 +730,8 @@ python fixup_perms () {
>      # paths are resolved via BBPATH
>      def get_fs_perms_list(d):
>          str =3D ""
> -        bbpath =3D d.getVar('BBPATH', True)
> -        fs_perms_tables =3D d.getVar('FILESYSTEM_PERMS_TABLES', True)
> +        bbpath =3D d.getVar('BBPATH')
> +        fs_perms_tables =3D d.getVar('FILESYSTEM_PERMS_TABLES')
>          if not fs_perms_tables:
>              fs_perms_tables =3D 'files/fs-perms.txt'
>          for conf_file in fs_perms_tables.split():
> @@ -740,7 +740,7 @@ python fixup_perms () {
> =20
> =20
> =20
> -    dvar =3D d.getVar('PKGD', True)
> +    dvar =3D d.getVar('PKGD')
> =20
>      fs_perms_table =3D {}
>      fs_link_table =3D {}
> @@ -769,7 +769,7 @@ python fixup_perms () {
>                  'oldincludedir' ]
> =20
>      for path in target_path_vars:
> -        dir =3D d.getVar(path, True) or ""
> +        dir =3D d.getVar(path) or ""
>          if dir =3D=3D "":
>              continue
>          fs_perms_table[dir] =3D fs_perms_entry(bb.data.expand("%s 0755 r=
oot root false - - -" % (dir), d))
> @@ -854,20 +854,20 @@ python fixup_perms () {
>  python split_and_strip_files () {
>      import stat, errno
> =20
> -    dvar =3D d.getVar('PKGD', True)
> -    pn =3D d.getVar('PN', True)
> +    dvar =3D d.getVar('PKGD')
> +    pn =3D d.getVar('PN')
> =20
>      oldcwd =3D os.getcwd()
>      os.chdir(dvar)
> =20
>      # We default to '.debug' style
> -    if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) =3D=3D 'debug-file-di=
rectory':
> +    if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') =3D=3D 'debug-file-director=
y':
>          # Single debug-file-directory style debug info
>          debugappend =3D ".debug"
>          debugdir =3D ""
>          debuglibdir =3D "/usr/lib/debug"
>          debugsrcdir =3D "/usr/src/debug"
> -    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) =3D=3D 'debug-witho=
ut-src':
> +    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') =3D=3D 'debug-without-src=
':
>          # Original OE-core, a.k.a. ".debug", style debug info, but witho=
ut sources in /usr/src/debug
>          debugappend =3D ""
>          debugdir =3D "/.debug"
> @@ -918,10 +918,10 @@ python split_and_strip_files () {
>      symlinks =3D {}
>      kernmods =3D []
>      inodes =3D {}
> -    libdir =3D os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
> -    baselibdir =3D os.path.abspath(dvar + os.sep + d.getVar("base_libdir=
", True))
> -    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) !=3D '1' or \
> -            d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) !=3D '1'):
> +    libdir =3D os.path.abspath(dvar + os.sep + d.getVar("libdir"))
> +    baselibdir =3D os.path.abspath(dvar + os.sep + d.getVar("base_libdir=
"))
> +    if (d.getVar('INHIBIT_PACKAGE_STRIP') !=3D '1' or \
> +            d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') !=3D '1'):
>          for root, dirs, files in cpath.walk(dvar):
>              for f in files:
>                  file =3D os.path.join(root, f)
> @@ -962,7 +962,7 @@ python split_and_strip_files () {
>                      elf_file =3D isELF(file)
>                      if elf_file & 1:
>                          if elf_file & 2:
> -                            if 'already-stripped' in (d.getVar('INSANE_S=
KIP_' + pn, True) or "").split():
> +                            if 'already-stripped' in (d.getVar('INSANE_S=
KIP_' + pn) or "").split():
>                                  bb.note("Skipping file %s from %s for al=
ready-stripped QA test" % (file[len(dvar):], pn))
>                              else:
>                                  msg =3D "File '%s' from %s was already s=
tripped, this will prevent future debugging!" % (file[len(dvar):], pn)
> @@ -991,7 +991,7 @@ python split_and_strip_files () {
>      #
>      # First lets process debug splitting
>      #
> -    if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) !=3D '1'):
> +    if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') !=3D '1'):
>          for file in elffiles:
>              src =3D file[len(dvar):]
>              dest =3D debuglibdir + os.path.dirname(src) + debugdir + "/"=
 + os.path.basename(src) + debugappend
> @@ -1054,8 +1054,8 @@ python split_and_strip_files () {
>      #
>      # Now lets go back over things and strip them
>      #
> -    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) !=3D '1'):
> -        strip =3D d.getVar("STRIP", True)
> +    if (d.getVar('INHIBIT_PACKAGE_STRIP') !=3D '1'):
> +        strip =3D d.getVar("STRIP")
>          sfiles =3D []
>          for file in elffiles:
>              elf_file =3D int(elffiles[file])
> @@ -1075,16 +1075,16 @@ python split_and_strip_files () {
>  python populate_packages () {
>      import glob, re
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> -    outdir =3D d.getVar('DEPLOY_DIR', True)
> -    dvar =3D d.getVar('PKGD', True)
> -    packages =3D d.getVar('PACKAGES', True)
> -    pn =3D d.getVar('PN', True)
> +    workdir =3D d.getVar('WORKDIR')
> +    outdir =3D d.getVar('DEPLOY_DIR')
> +    dvar =3D d.getVar('PKGD')
> +    packages =3D d.getVar('PACKAGES')
> +    pn =3D d.getVar('PN')
> =20
>      bb.utils.mkdirhier(outdir)
>      os.chdir(dvar)
>     =20
> -    autodebug =3D not (d.getVar("NOAUTOPACKAGEDEBUG", True) or False)
> +    autodebug =3D not (d.getVar("NOAUTOPACKAGEDEBUG") or False)
> =20
>      # Sanity check PACKAGES for duplicates
>      # Sanity should be moved to sanity.bbclass once we have the infrastu=
cture
> @@ -1099,7 +1099,7 @@ python populate_packages () {
>          else:
>              package_list.append(pkg)
>      d.setVar('PACKAGES', ' '.join(package_list))
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
> =20
>      seen =3D []
> =20
> @@ -1120,7 +1120,7 @@ python populate_packages () {
>          root =3D os.path.join(pkgdest, pkg)
>          bb.utils.mkdirhier(root)
> =20
> -        filesvar =3D d.getVar('FILES_%s' % pkg, True) or ""
> +        filesvar =3D d.getVar('FILES_%s' % pkg) or ""
>          if "//" in filesvar:
>              msg =3D "FILES variable for package %s contains '//' which i=
s invalid. Attempting to fix this but you should correct the metadata.\n" %=
 pkg
>              package_qa_handle_error("files-invalid", msg, d)
> @@ -1188,7 +1188,7 @@ python populate_packages () {
>      # Handle LICENSE_EXCLUSION
>      package_list =3D []
>      for pkg in packages.split():
> -        if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
> +        if d.getVar('LICENSE_EXCLUSION-' + pkg):
>              msg =3D "%s has an incompatible license. Excluding from pack=
aging." % pkg
>              package_qa_handle_error("incompatible-license", msg, d)
>          else:
> @@ -1207,7 +1207,7 @@ python populate_packages () {
> =20
>      if unshipped !=3D []:
>          msg =3D pn + ": Files/directories were installed but not shipped=
 in any package:"
> -        if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn, True=
) or "").split():
> +        if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn) or "=
").split():
>              bb.note("Package %s skipping QA tests: installed-vs-shipped"=
 % pn)
>          else:
>              for f in unshipped:
> @@ -1220,7 +1220,7 @@ populate_packages[dirs] =3D "${D}"
> =20
>  python package_fixsymlinks () {
>      import errno
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
>      packages =3D d.getVar("PACKAGES", False).split()
> =20
>      dangling_links =3D {}
> @@ -1255,7 +1255,7 @@ python package_fixsymlinks () {
>                  bb.note("%s contains dangling symlink to %s" % (pkg, l))
> =20
>      for pkg in newrdepends:
> -        rdepends =3D bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_'=
 + pkg, True) or "")
> +        rdepends =3D bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_'=
 + pkg) or "")
>          for p in newrdepends[pkg]:
>              if p not in rdepends:
>                  rdepends[p] =3D []
> @@ -1309,9 +1309,9 @@ python emit_pkgdata() {
>                  with open(subdata_file, 'w') as fd:
>                      fd.write("PKG_%s: %s" % (ml_pkg, pkg))
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> -    pkgdest =3D d.getVar('PKGDEST', True)
> -    pkgdatadir =3D d.getVar('PKGDESTWORK', True)
> +    packages =3D d.getVar('PACKAGES')
> +    pkgdest =3D d.getVar('PKGDEST')
> +    pkgdatadir =3D d.getVar('PKGDESTWORK')
> =20
>      # Take shared lock since we're only reading, not writing
>      lf =3D bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
> @@ -1321,9 +1321,9 @@ python emit_pkgdata() {
>      f.write("PACKAGES: %s\n" % packages)
>      f.close()
> =20
> -    pn =3D d.getVar('PN', True)
> -    global_variants =3D (d.getVar('MULTILIB_GLOBAL_VARIANTS', True) or "=
").split()
> -    variants =3D (d.getVar('MULTILIB_VARIANTS', True) or "").split()
> +    pn =3D d.getVar('PN')
> +    global_variants =3D (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").spl=
it()
> +    variants =3D (d.getVar('MULTILIB_VARIANTS') or "").split()
> =20
>      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('mo=
dule-base', d):
>          write_extra_pkgs(variants, pn, packages, pkgdatadir)
> @@ -1331,10 +1331,10 @@ python emit_pkgdata() {
>      if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_cl=
ass('packagegroup', d)):
>          write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
> =20
>      for pkg in packages.split():
> -        pkgval =3D d.getVar('PKG_%s' % pkg, True)
> +        pkgval =3D d.getVar('PKG_%s' % pkg)
>          if pkgval is None:
>              pkgval =3D pkg
>              d.setVar('PKG_%s' % pkg, pkg)
> @@ -1377,11 +1377,11 @@ python emit_pkgdata() {
>          write_if_exists(sf, pkg, 'pkg_prerm')
>          write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
>          write_if_exists(sf, pkg, 'FILES_INFO')
> -        for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg, True) or "")=
=2Esplit():
> +        for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split=
():
>              write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
> =20
>          write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
> -        for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").=
split():
> +        for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split(=
):
>              write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
> =20
>          sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
> @@ -1394,9 +1394,9 @@ python emit_pkgdata() {
>                  bb.utils.mkdirhier(os.path.dirname(subdata_sym))
>                  oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, T=
rue)
> =20
> -        allow_empty =3D d.getVar('ALLOW_EMPTY_%s' % pkg, True)
> +        allow_empty =3D d.getVar('ALLOW_EMPTY_%s' % pkg)
>          if not allow_empty:
> -            allow_empty =3D d.getVar('ALLOW_EMPTY', True)
> +            allow_empty =3D d.getVar('ALLOW_EMPTY')
>          root =3D "%s/%s" % (pkgdest, pkg)
>          os.chdir(root)
>          g =3D glob('*')
> @@ -1435,19 +1435,19 @@ RPMDEPS =3D "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpm=
deps-oecore --macros ${STAGING_LI
>  #  FILERDEPENDS_filepath_pkg - per file dep
> =20
>  python package_do_filedeps() {
> -    if d.getVar('SKIP_FILEDEPS', True) =3D=3D '1':
> +    if d.getVar('SKIP_FILEDEPS') =3D=3D '1':
>          return
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> -    packages =3D d.getVar('PACKAGES', True)
> -    rpmdeps =3D d.getVar('RPMDEPS', True)
> +    pkgdest =3D d.getVar('PKGDEST')
> +    packages =3D d.getVar('PACKAGES')
> +    rpmdeps =3D d.getVar('RPMDEPS')
> =20
>      def chunks(files, n):
>          return [files[i:i+n] for i in range(0, len(files), n)]
> =20
>      pkglist =3D []
>      for pkg in packages.split():
> -        if d.getVar('SKIP_FILEDEPS_' + pkg, True) =3D=3D '1':
> +        if d.getVar('SKIP_FILEDEPS_' + pkg) =3D=3D '1':
>              continue
>          if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-lo=
cale-') !=3D -1 or pkg.find('-localedata-') !=3D -1 or pkg.find('-gconv-') =
!=3D -1 or pkg.find('-charmap-') !=3D -1 or pkg.startswith('kernel-module-'=
):
>              continue
> @@ -1496,22 +1496,22 @@ python package_do_shlibs() {
>          return
> =20
>      lib_re =3D re.compile("^.*\.so")
> -    libdir_re =3D re.compile(".*/%s$" % d.getVar('baselib', True))
> +    libdir_re =3D re.compile(".*/%s$" % d.getVar('baselib'))
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> -    targetos =3D d.getVar('TARGET_OS', True)
> +    packages =3D d.getVar('PACKAGES')
> +    targetos =3D d.getVar('TARGET_OS')
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
> =20
> -    ver =3D d.getVar('PKGV', True)
> +    ver =3D d.getVar('PKGV')
>      if not ver:
>          msg =3D "PKGV not defined"
>          package_qa_handle_error("pkgv-undefined", msg, d)
>          return
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
> =20
> -    shlibswork_dir =3D d.getVar('SHLIBSWORKDIR', True)
> +    shlibswork_dir =3D d.getVar('SHLIBSWORKDIR')
> =20
>      # Take shared lock since we're only reading, not writing
>      lf =3D bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
> @@ -1519,7 +1519,7 @@ python package_do_shlibs() {
>      def linux_so(file, needed, sonames, renames, pkgver):
>          needs_ldconfig =3D False
>          ldir =3D os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
> -        cmd =3D d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) +=
 " 2>/dev/null"
> +        cmd =3D d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/=
dev/null"
>          fd =3D os.popen(cmd)
>          lines =3D fd.readlines()
>          fd.close()
> @@ -1601,12 +1601,12 @@ python package_do_shlibs() {
>                  if name and name not in needed[pkg]:
>                       needed[pkg].append((name, file, []))
> =20
> -    if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) =3D=3D "1":
> +    if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS') =3D=3D "1":
>          snap_symlinks =3D True
>      else:
>          snap_symlinks =3D False
> =20
> -    if (d.getVar('USE_LDCONFIG', True) or "1") =3D=3D "1":
> +    if (d.getVar('USE_LDCONFIG') or "1") =3D=3D "1":
>          use_ldconfig =3D True
>      else:
>          use_ldconfig =3D False
> @@ -1615,14 +1615,14 @@ python package_do_shlibs() {
>      shlib_provider =3D oe.package.read_shlib_providers(d)
> =20
>      for pkg in packages.split():
> -        private_libs =3D d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getV=
ar('PRIVATE_LIBS', True) or ""
> +        private_libs =3D d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PR=
IVATE_LIBS') or ""
>          private_libs =3D private_libs.split()
>          needs_ldconfig =3D False
>          bb.debug(2, "calculating shlib provides for %s" % pkg)
> =20
> -        pkgver =3D d.getVar('PKGV_' + pkg, True)
> +        pkgver =3D d.getVar('PKGV_' + pkg)
>          if not pkgver:
> -            pkgver =3D d.getVar('PV_' + pkg, True)
> +            pkgver =3D d.getVar('PV_' + pkg)
>          if not pkgver:
>              pkgver =3D ver
> =20
> @@ -1659,18 +1659,18 @@ python package_do_shlibs() {
>              fd.close()
>          if needs_ldconfig and use_ldconfig:
>              bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
> -            postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +            postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>              if not postinst:
>                  postinst =3D '#!/bin/sh\n'
> -            postinst +=3D d.getVar('ldconfig_postinst_fragment', True)
> +            postinst +=3D d.getVar('ldconfig_postinst_fragment')
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
>          bb.debug(1, 'LIBNAMES: pkg %s sonames %s' % (pkg, sonames))
> =20
>      bb.utils.unlockfile(lf)
> =20
> -    assumed_libs =3D d.getVar('ASSUME_SHLIBS', True)
> +    assumed_libs =3D d.getVar('ASSUME_SHLIBS')
>      if assumed_libs:
> -        libdir =3D d.getVar("libdir", True)
> +        libdir =3D d.getVar("libdir")
>          for e in assumed_libs.split():
>              l, dep_pkg =3D e.split(":")
>              lib_ver =3D None
> @@ -1682,7 +1682,7 @@ python package_do_shlibs() {
>                  shlib_provider[l] =3D {}
>              shlib_provider[l][libdir] =3D (dep_pkg, lib_ver)
> =20
> -    libsearchpath =3D [d.getVar('libdir', True), d.getVar('base_libdir',=
 True)]
> +    libsearchpath =3D [d.getVar('libdir'), d.getVar('base_libdir')]
> =20
>      for pkg in packages.split():
>          bb.debug(2, "calculating shlib requirements for %s" % pkg)
> @@ -1736,12 +1736,12 @@ python package_do_shlibs() {
>  python package_do_pkgconfig () {
>      import re
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> -    workdir =3D d.getVar('WORKDIR', True)
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    packages =3D d.getVar('PACKAGES')
> +    workdir =3D d.getVar('WORKDIR')
> +    pkgdest =3D d.getVar('PKGDEST')
> =20
> -    shlibs_dirs =3D d.getVar('SHLIBSDIRS', True).split()
> -    shlibswork_dir =3D d.getVar('SHLIBSWORKDIR', True)
> +    shlibs_dirs =3D d.getVar('SHLIBSDIRS').split()
> +    shlibswork_dir =3D d.getVar('SHLIBSWORKDIR')
> =20
>      pc_re =3D re.compile('(.*)\.pc$')
>      var_re =3D re.compile('(.*)=3D(.*)')
> @@ -1826,7 +1826,7 @@ python package_do_pkgconfig () {
> =20
>  def read_libdep_files(d):
>      pkglibdeps =3D {}
> -    packages =3D d.getVar('PACKAGES', True).split()
> +    packages =3D d.getVar('PACKAGES').split()
>      for pkg in packages:
>          pkglibdeps[pkg] =3D {}
>          for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
> @@ -1846,9 +1846,9 @@ def read_libdep_files(d):
>  python read_shlibdeps () {
>      pkglibdeps =3D read_libdep_files(d)
> =20
> -    packages =3D d.getVar('PACKAGES', True).split()
> +    packages =3D d.getVar('PACKAGES').split()
>      for pkg in packages:
> -        rdepends =3D bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_'=
 + pkg, True) or "")
> +        rdepends =3D bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_'=
 + pkg) or "")
>          for dep in pkglibdeps[pkg]:
>              # Add the dep if it's not already there, or if no comparison=
 is set
>              if dep not in rdepends:
> @@ -1873,14 +1873,14 @@ python package_depchains() {
>      package.
>      """
> =20
> -    packages  =3D d.getVar('PACKAGES', True)
> -    postfixes =3D (d.getVar('DEPCHAIN_POST', True) or '').split()
> -    prefixes  =3D (d.getVar('DEPCHAIN_PRE', True) or '').split()
> +    packages  =3D d.getVar('PACKAGES')
> +    postfixes =3D (d.getVar('DEPCHAIN_POST') or '').split()
> +    prefixes  =3D (d.getVar('DEPCHAIN_PRE') or '').split()
> =20
>      def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):
> =20
>          #bb.note('depends for %s is %s' % (base, depends))
> -        rreclist =3D bb.utils.explode_dep_versions2(d.getVar('RRECOMMEND=
S_' + pkg, True) or "")
> +        rreclist =3D bb.utils.explode_dep_versions2(d.getVar('RRECOMMEND=
S_' + pkg) or "")
> =20
>          for depend in depends:
>              if depend.find('-native') !=3D -1 or depend.find('-cross') !=
=3D -1 or depend.startswith('virtual/'):
> @@ -1901,7 +1901,7 @@ python package_depchains() {
>      def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
> =20
>          #bb.note('rdepends for %s is %s' % (base, rdepends))
> -        rreclist =3D bb.utils.explode_dep_versions2(d.getVar('RRECOMMEND=
S_' + pkg, True) or "")
> +        rreclist =3D bb.utils.explode_dep_versions2(d.getVar('RRECOMMEND=
S_' + pkg) or "")
> =20
>          for depend in rdepends:
>              if depend.find('virtual-locale-') !=3D -1:
> @@ -1924,12 +1924,12 @@ python package_depchains() {
>              list.append(dep)
> =20
>      depends =3D []
> -    for dep in bb.utils.explode_deps(d.getVar('DEPENDS', True) or ""):
> +    for dep in bb.utils.explode_deps(d.getVar('DEPENDS') or ""):
>          add_dep(depends, dep)
> =20
>      rdepends =3D []
>      for pkg in packages.split():
> -        for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + pkg, Tru=
e) or ""):
> +        for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + pkg) or =
""):
>              add_dep(rdepends, dep)
> =20
>      #bb.note('rdepends is %s' % rdepends)
> @@ -1959,7 +1959,7 @@ python package_depchains() {
>          for pkg in pkglibdeps:
>              for k in pkglibdeps[pkg]:
>                  add_dep(pkglibdeplist, k)
> -        dbgdefaultdeps =3D ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) =
=3D=3D '1') or (bb.data.inherits_class('packagegroup', d)))
> +        dbgdefaultdeps =3D ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS') =3D=3D =
'1') or (bb.data.inherits_class('packagegroup', d)))
> =20
>      for suffix in pkgs:
>          for pkg in pkgs[suffix]:
> @@ -1976,7 +1976,7 @@ python package_depchains() {
>                  pkg_addrrecs(pkg, base, suffix, func, rdepends, d)
>              else:
>                  rdeps =3D []
> -                for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + =
base, True) or ""):
> +                for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + =
base) or ""):
>                      add_dep(rdeps, dep)
>                  pkg_addrrecs(pkg, base, suffix, func, rdeps, d)
>  }
> @@ -1987,8 +1987,8 @@ PACKAGEVARS =3D "FILES RDEPENDS RRECOMMENDS SUMMARY=
 DESCRIPTION RSUGGESTS RPROVIDE
> =20
>  def gen_packagevar(d):
>      ret =3D []
> -    pkgs =3D (d.getVar("PACKAGES", True) or "").split()
> -    vars =3D (d.getVar("PACKAGEVARS", True) or "").split()
> +    pkgs =3D (d.getVar("PACKAGES") or "").split()
> +    vars =3D (d.getVar("PACKAGEVARS") or "").split()
>      for p in pkgs:
>          for v in vars:
>              ret.append(v + "_" + p)
> @@ -2036,16 +2036,16 @@ python do_package () {
>      # Sanity test the setup
>      ####################################################################=
#######
> =20
> -    packages =3D (d.getVar('PACKAGES', True) or "").split()
> +    packages =3D (d.getVar('PACKAGES') or "").split()
>      if len(packages) < 1:
>          bb.debug(1, "No packages to build, skipping do_package")
>          return
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> -    outdir =3D d.getVar('DEPLOY_DIR', True)
> -    dest =3D d.getVar('D', True)
> -    dvar =3D d.getVar('PKGD', True)
> -    pn =3D d.getVar('PN', True)
> +    workdir =3D d.getVar('WORKDIR')
> +    outdir =3D d.getVar('DEPLOY_DIR')
> +    dest =3D d.getVar('D')
> +    dvar =3D d.getVar('PKGD')
> +    pn =3D d.getVar('PN')
> =20
>      if not workdir or not outdir or not dest or not dvar or not pn:
>          msg =3D "WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined=
, unable to package"
> @@ -2063,7 +2063,7 @@ python do_package () {
>      # code pre-expands some frequently used variables
> =20
>      def expandVar(x, d):
> -        d.setVar(x, d.getVar(x, True))
> +        d.setVar(x, d.getVar(x))
> =20
>      for x in 'PN', 'PV', 'BPN', 'TARGET_SYS', 'EXTENDPRAUTO':
>          expandVar(x, d)
> @@ -2072,7 +2072,7 @@ python do_package () {
>      # Setup PKGD (from D)
>      ####################################################################=
#######
> =20
> -    for f in (d.getVar('PACKAGEBUILDPKGD', True) or '').split():
> +    for f in (d.getVar('PACKAGEBUILDPKGD') or '').split():
>          bb.build.exec_func(f, d)
> =20
>      ####################################################################=
#######
> @@ -2081,7 +2081,7 @@ python do_package () {
> =20
>      cpath =3D oe.cachedpath.CachedPath()
> =20
> -    for f in (d.getVar('PACKAGESPLITFUNCS', True) or '').split():
> +    for f in (d.getVar('PACKAGESPLITFUNCS') or '').split():
>          bb.build.exec_func(f, d)
> =20
>      ####################################################################=
#######
> @@ -2091,18 +2091,18 @@ python do_package () {
>      # Build global list of files in each split package
>      global pkgfiles
>      pkgfiles =3D {}
> -    packages =3D d.getVar('PACKAGES', True).split()
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    packages =3D d.getVar('PACKAGES').split()
> +    pkgdest =3D d.getVar('PKGDEST')
>      for pkg in packages:
>          pkgfiles[pkg] =3D []
>          for walkroot, dirs, files in cpath.walk(pkgdest + "/" + pkg):
>              for file in files:
>                  pkgfiles[pkg].append(walkroot + os.sep + file)
> =20
> -    for f in (d.getVar('PACKAGEFUNCS', True) or '').split():
> +    for f in (d.getVar('PACKAGEFUNCS') or '').split():
>          bb.build.exec_func(f, d)
> =20
> -    qa_sane =3D d.getVar("QA_SANE", True)
> +    qa_sane =3D d.getVar("QA_SANE")
>      if not qa_sane:
>          bb.fatal("Fatal QA errors found, failing task.")
>  }
> @@ -2149,7 +2149,7 @@ def mapping_rename_hook(d):
>      Rewrite variables to account for package renaming in things
>      like debian.bbclass or manual PKG variable name changes
>      """
> -    pkg =3D d.getVar("PKG", True)
> +    pkg =3D d.getVar("PKG")
>      runtime_mapping_rename("RDEPENDS", pkg, d)
>      runtime_mapping_rename("RRECOMMENDS", pkg, d)
>      runtime_mapping_rename("RSUGGESTS", pkg, d)
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.=
bbclass
> index fb6034c..68eca61 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -6,14 +6,14 @@ inherit package
> =20
>  IMAGE_PKGTYPE ?=3D "deb"
> =20
> -DPKG_ARCH ?=3D "${@debian_arch_map(d.getVar('TARGET_ARCH', True), d.getV=
ar('TUNE_FEATURES', True))}"
> +DPKG_ARCH ?=3D "${@debian_arch_map(d.getVar('TARGET_ARCH'), d.getVar('TU=
NE_FEATURES'))}"
>  DPKG_ARCH[vardepvalue] =3D "${DPKG_ARCH}"
> =20
>  PKGWRITEDIRDEB =3D "${WORKDIR}/deploy-debs"
> =20
>  APTCONF_TARGET =3D "${WORKDIR}"
> =20
> -APT_ARGS =3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS", True) =3D=3D "1"]}"
> +APT_ARGS =3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
> =20
>  def debian_arch_map(arch, tune):
>      tune_features =3D tune.split()
> @@ -56,22 +56,22 @@ python do_package_deb () {
> =20
>      oldcwd =3D os.getcwd()
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      if not workdir:
>          bb.error("WORKDIR not defined, unable to package")
>          return
> =20
> -    outdir =3D d.getVar('PKGWRITEDIRDEB', True)
> +    outdir =3D d.getVar('PKGWRITEDIRDEB')
>      if not outdir:
>          bb.error("PKGWRITEDIRDEB not defined, unable to package")
>          return
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> +    packages =3D d.getVar('PACKAGES')
>      if not packages:
>          bb.debug(1, "PACKAGES not defined, nothing to package")
>          return
> =20
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
> =20
>      if os.access(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN=
"),os.R_OK):
>          os.unlink(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEA=
N"))
> @@ -80,7 +80,7 @@ python do_package_deb () {
>          bb.debug(1, "No packages; nothing to do")
>          return
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
> =20
>      def cleanupcontrol(root):
>          for p in ['CONTROL', 'DEBIAN']:
> @@ -96,7 +96,7 @@ python do_package_deb () {
> =20
>          localdata.setVar('ROOT', '')
>          localdata.setVar('ROOT_%s' % pkg, root)
> -        pkgname =3D localdata.getVar('PKG_%s' % pkg, True)
> +        pkgname =3D localdata.getVar('PKG_%s' % pkg)
>          if not pkgname:
>              pkgname =3D pkg
>          localdata.setVar('PKG', pkgname)
> @@ -106,7 +106,7 @@ python do_package_deb () {
>          bb.data.update_data(localdata)
>          basedir =3D os.path.join(os.path.dirname(root))
> =20
> -        pkgoutdir =3D os.path.join(outdir, localdata.getVar('PACKAGE_ARC=
H', True))
> +        pkgoutdir =3D os.path.join(outdir, localdata.getVar('PACKAGE_ARC=
H'))
>          bb.utils.mkdirhier(pkgoutdir)
> =20
>          os.chdir(root)
> @@ -114,7 +114,7 @@ python do_package_deb () {
>          from glob import glob
>          g =3D glob('*')
>          if not g and localdata.getVar('ALLOW_EMPTY', False) !=3D "1":
> -            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, lo=
caldata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
> +            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, lo=
caldata.getVar('PKGV'), localdata.getVar('PKGR')))
>              bb.utils.unlockfile(lf)
>              continue
> =20
> @@ -129,7 +129,7 @@ python do_package_deb () {
>              bb.fatal("unable to open control file for writing")
> =20
>          fields =3D []
> -        pe =3D d.getVar('PKGE', True)
> +        pe =3D d.getVar('PKGE')
>          if pe and int(pe) > 0:
>              fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR=
']])
>          else:
> @@ -141,7 +141,7 @@ python do_package_deb () {
>          fields.append(["Architecture: %s\n", ['DPKG_ARCH']])
>          fields.append(["OE: %s\n", ['PN']])
>          fields.append(["PackageArch: %s\n", ['PACKAGE_ARCH']])
> -        if d.getVar('HOMEPAGE', True):
> +        if d.getVar('HOMEPAGE'):
>              fields.append(["Homepage: %s\n", ['HOMEPAGE']])
> =20
>          # Package, Version, Maintainer, Description - mandatory
> @@ -151,10 +151,10 @@ python do_package_deb () {
>          def pullData(l, d):
>              l2 =3D []
>              for i in l:
> -                data =3D d.getVar(i, True)
> +                data =3D d.getVar(i)
>                  if data is None:
>                      raise KeyError(f)
> -                if i =3D=3D 'DPKG_ARCH' and d.getVar('PACKAGE_ARCH', Tru=
e) =3D=3D 'all':
> +                if i =3D=3D 'DPKG_ARCH' and d.getVar('PACKAGE_ARCH') =3D=
=3D 'all':
>                      data =3D 'all'
>                  elif i =3D=3D 'PACKAGE_ARCH' or i =3D=3D 'DPKG_ARCH':
>                     # The params in deb package control don't allow chara=
cter
> @@ -165,7 +165,7 @@ python do_package_deb () {
>              return l2
> =20
>          ctrlfile.write("Package: %s\n" % pkgname)
> -        if d.getVar('PACKAGE_ARCH', True) =3D=3D "all":
> +        if d.getVar('PACKAGE_ARCH') =3D=3D "all":
>              ctrlfile.write("Multi-Arch: foreign\n")
>          # check for required fields
>          try:
> @@ -175,9 +175,9 @@ python do_package_deb () {
>                           raise KeyError(f)
>                  # Special behavior for description...
>                  if 'DESCRIPTION' in fs:
> -                     summary =3D localdata.getVar('SUMMARY', True) or lo=
caldata.getVar('DESCRIPTION', True) or "."
> +                     summary =3D localdata.getVar('SUMMARY') or localdat=
a.getVar('DESCRIPTION') or "."
>                       ctrlfile.write('Description: %s\n' % summary)
> -                     description =3D localdata.getVar('DESCRIPTION', Tru=
e) or "."
> +                     description =3D localdata.getVar('DESCRIPTION') or =
"."
>                       description =3D textwrap.dedent(description).strip()
>                       if '\\n' in description:
>                           # Manually indent
> @@ -231,7 +231,7 @@ python do_package_deb () {
>                      elif (v or "").startswith("> "):
>                          var[dep][i] =3D var[dep][i].replace("> ", ">> ")
> =20
> -        rdepends =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS", True) or "")
> +        rdepends =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS") or "")
>          debian_cmp_remap(rdepends)
>          for dep in list(rdepends.keys()):
>                  if dep =3D=3D pkg:
> @@ -239,20 +239,20 @@ python do_package_deb () {
>                          continue
>                  if '*' in dep:
>                          del rdepends[dep]
> -        rrecommends =3D bb.utils.explode_dep_versions2(localdata.getVar(=
"RRECOMMENDS", True) or "")
> +        rrecommends =3D bb.utils.explode_dep_versions2(localdata.getVar(=
"RRECOMMENDS") or "")
>          debian_cmp_remap(rrecommends)
>          for dep in list(rrecommends.keys()):
>                  if '*' in dep:
>                          del rrecommends[dep]
> -        rsuggests =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
SUGGESTS", True) or "")
> +        rsuggests =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
SUGGESTS") or "")
>          debian_cmp_remap(rsuggests)
>          # Deliberately drop version information here, not wanted/support=
ed by deb
> -        rprovides =3D dict.fromkeys(bb.utils.explode_dep_versions2(local=
data.getVar("RPROVIDES", True) or ""), [])
> +        rprovides =3D dict.fromkeys(bb.utils.explode_dep_versions2(local=
data.getVar("RPROVIDES") or ""), [])
>          rprovides =3D collections.OrderedDict(sorted(rprovides.items(), =
key=3Dlambda x: x[0]))
>          debian_cmp_remap(rprovides)
> -        rreplaces =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
REPLACES", True) or "")
> +        rreplaces =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
REPLACES") or "")
>          debian_cmp_remap(rreplaces)
> -        rconflicts =3D bb.utils.explode_dep_versions2(localdata.getVar("=
RCONFLICTS", True) or "")
> +        rconflicts =3D bb.utils.explode_dep_versions2(localdata.getVar("=
RCONFLICTS") or "")
>          debian_cmp_remap(rconflicts)
>          if rdepends:
>              ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends=
))
> @@ -269,7 +269,7 @@ python do_package_deb () {
>          ctrlfile.close()
> =20
>          for script in ["preinst", "postinst", "prerm", "postrm"]:
> -            scriptvar =3D localdata.getVar('pkg_%s' % script, True)
> +            scriptvar =3D localdata.getVar('pkg_%s' % script)
>              if not scriptvar:
>                  continue
>              scriptvar =3D scriptvar.strip()
> @@ -308,7 +308,7 @@ python do_package_deb () {
>              conffiles.close()
> =20
>          os.chdir(basedir)
> -        ret =3D subprocess.call("PATH=3D\"%s\" dpkg-deb -b %s %s" % (loc=
aldata.getVar("PATH", True), root, pkgoutdir), shell=3DTrue)
> +        ret =3D subprocess.call("PATH=3D\"%s\" dpkg-deb -b %s %s" % (loc=
aldata.getVar("PATH"), root, pkgoutdir), shell=3DTrue)
>          if ret !=3D 0:
>              bb.utils.unlockfile(lf)
>              bb.fatal("dpkg-deb execution failed")
> @@ -328,7 +328,7 @@ do_package_write_deb[sstate-inputdirs] =3D "${PKGWRIT=
EDIRDEB}"
>  do_package_write_deb[sstate-outputdirs] =3D "${DEPLOY_DIR_DEB}"
> =20
>  python do_package_write_deb_setscene () {
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
> =20
>      if os.access(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN=
"),os.R_OK):
>          os.unlink(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEA=
N"))
> @@ -338,7 +338,7 @@ python do_package_write_deb_setscene () {
>  addtask do_package_write_deb_setscene
> =20
>  python () {
> -    if d.getVar('PACKAGES', True) !=3D '':
> +    if d.getVar('PACKAGES') !=3D '':
>          deps =3D ' dpkg-native:do_populate_sysroot virtual/fakeroot-nati=
ve:do_populate_sysroot'
>          d.appendVarFlag('do_package_write_deb', 'depends', deps)
>          d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.=
bbclass
> index eb00932..7018a60 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -11,8 +11,8 @@ PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>  OPKGBUILDCMD ??=3D "opkg-build"
> =20
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
> -OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS", True) =3D=3D "1"]}"
> -OPKG_ARGS +=3D "${@['', '--add-exclude ' + ' --add-exclude '.join((d.get=
Var('PACKAGE_EXCLUDE', True) or "").split())][(d.getVar("PACKAGE_EXCLUDE", =
True) or "") !=3D ""]}"
> +OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> +OPKG_ARGS +=3D "${@['', '--add-exclude ' + ' --add-exclude '.join((d.get=
Var('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "")=
 !=3D ""]}"
> =20
>  OPKGLIBDIR =3D "${localstatedir}/lib"
> =20
> @@ -24,15 +24,15 @@ python do_package_ipk () {
> =20
>      oldcwd =3D os.getcwd()
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> -    outdir =3D d.getVar('PKGWRITEDIRIPK', True)
> -    tmpdir =3D d.getVar('TMPDIR', True)
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    workdir =3D d.getVar('WORKDIR')
> +    outdir =3D d.getVar('PKGWRITEDIRIPK')
> +    tmpdir =3D d.getVar('TMPDIR')
> +    pkgdest =3D d.getVar('PKGDEST')
>      if not workdir or not outdir or not tmpdir:
>          bb.error("Variables incorrectly set, unable to package")
>          return
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> +    packages =3D d.getVar('PACKAGES')
>      if not packages or packages =3D=3D '':
>          bb.debug(1, "No packages; nothing to do")
>          return
> @@ -56,7 +56,7 @@ python do_package_ipk () {
> =20
>          localdata.setVar('ROOT', '')
>          localdata.setVar('ROOT_%s' % pkg, root)
> -        pkgname =3D localdata.getVar('PKG_%s' % pkg, True)
> +        pkgname =3D localdata.getVar('PKG_%s' % pkg)
>          if not pkgname:
>              pkgname =3D pkg
>          localdata.setVar('PKG', pkgname)
> @@ -65,7 +65,7 @@ python do_package_ipk () {
> =20
>          bb.data.update_data(localdata)
>          basedir =3D os.path.join(os.path.dirname(root))
> -        arch =3D localdata.getVar('PACKAGE_ARCH', True)
> +        arch =3D localdata.getVar('PACKAGE_ARCH')
> =20
>          if localdata.getVar('IPK_HIERARCHICAL_FEED', False) =3D=3D "1":
>              # Spread packages across subdirectories so each isn't too cr=
owded
> @@ -98,7 +98,7 @@ python do_package_ipk () {
>          from glob import glob
>          g =3D glob('*')
>          if not g and localdata.getVar('ALLOW_EMPTY', False) !=3D "1":
> -            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, lo=
caldata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
> +            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, lo=
caldata.getVar('PKGV'), localdata.getVar('PKGR')))
>              bb.utils.unlockfile(lf)
>              continue
> =20
> @@ -111,7 +111,7 @@ python do_package_ipk () {
>              bb.fatal("unable to open control file for writing")
> =20
>          fields =3D []
> -        pe =3D d.getVar('PKGE', True)
> +        pe =3D d.getVar('PKGE')
>          if pe and int(pe) > 0:
>              fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR=
']])
>          else:
> @@ -123,13 +123,13 @@ python do_package_ipk () {
>          fields.append(["License: %s\n", ['LICENSE']])
>          fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
>          fields.append(["OE: %s\n", ['PN']])
> -        if d.getVar('HOMEPAGE', True):
> +        if d.getVar('HOMEPAGE'):
>              fields.append(["Homepage: %s\n", ['HOMEPAGE']])
> =20
>          def pullData(l, d):
>              l2 =3D []
>              for i in l:
> -                l2.append(d.getVar(i, True))
> +                l2.append(d.getVar(i))
>              return l2
> =20
>          ctrlfile.write("Package: %s\n" % pkgname)
> @@ -141,9 +141,9 @@ python do_package_ipk () {
>                          raise KeyError(f)
>                  # Special behavior for description...
>                  if 'DESCRIPTION' in fs:
> -                    summary =3D localdata.getVar('SUMMARY', True) or loc=
aldata.getVar('DESCRIPTION', True) or "."
> +                    summary =3D localdata.getVar('SUMMARY') or localdata=
=2EgetVar('DESCRIPTION') or "."
>                      ctrlfile.write('Description: %s\n' % summary)
> -                    description =3D localdata.getVar('DESCRIPTION', True=
) or "."
> +                    description =3D localdata.getVar('DESCRIPTION') or "=
=2E"
>                      description =3D textwrap.dedent(description).strip()
>                      if '\\n' in description:
>                          # Manually indent
> @@ -185,19 +185,19 @@ python do_package_ipk () {
>                      elif (v or "").startswith("> "):
>                          var[dep][i] =3D var[dep][i].replace("> ", ">> ")
> =20
> -        rdepends =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS", True) or "")
> +        rdepends =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS") or "")
>          debian_cmp_remap(rdepends)
> -        rrecommends =3D bb.utils.explode_dep_versions2(localdata.getVar(=
"RRECOMMENDS", True) or "")
> +        rrecommends =3D bb.utils.explode_dep_versions2(localdata.getVar(=
"RRECOMMENDS") or "")
>          debian_cmp_remap(rrecommends)
> -        rsuggests =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
SUGGESTS", True) or "")
> +        rsuggests =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
SUGGESTS") or "")
>          debian_cmp_remap(rsuggests)
>          # Deliberately drop version information here, not wanted/support=
ed by ipk
> -        rprovides =3D dict.fromkeys(bb.utils.explode_dep_versions2(local=
data.getVar("RPROVIDES", True) or ""), [])
> +        rprovides =3D dict.fromkeys(bb.utils.explode_dep_versions2(local=
data.getVar("RPROVIDES") or ""), [])
>          rprovides =3D collections.OrderedDict(sorted(rprovides.items(), =
key=3Dlambda x: x[0]))
>          debian_cmp_remap(rprovides)
> -        rreplaces =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
REPLACES", True) or "")
> +        rreplaces =3D bb.utils.explode_dep_versions2(localdata.getVar("R=
REPLACES") or "")
>          debian_cmp_remap(rreplaces)
> -        rconflicts =3D bb.utils.explode_dep_versions2(localdata.getVar("=
RCONFLICTS", True) or "")
> +        rconflicts =3D bb.utils.explode_dep_versions2(localdata.getVar("=
RCONFLICTS") or "")
>          debian_cmp_remap(rconflicts)
> =20
>          if rdepends:
> @@ -212,14 +212,14 @@ python do_package_ipk () {
>              ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplac=
es))
>          if rconflicts:
>              ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconfl=
icts))
> -        src_uri =3D localdata.getVar("SRC_URI", True).strip() or "None"
> +        src_uri =3D localdata.getVar("SRC_URI").strip() or "None"
>          if src_uri:
>              src_uri =3D re.sub("\s+", " ", src_uri)
>              ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
>          ctrlfile.close()
> =20
>          for script in ["preinst", "postinst", "prerm", "postrm"]:
> -            scriptvar =3D localdata.getVar('pkg_%s' % script, True)
> +            scriptvar =3D localdata.getVar('pkg_%s' % script)
>              if not scriptvar:
>                  continue
>              try:
> @@ -244,15 +244,15 @@ python do_package_ipk () {
>              conffiles.close()
> =20
>          os.chdir(basedir)
> -        ret =3D subprocess.call("PATH=3D\"%s\" %s %s %s" % (localdata.ge=
tVar("PATH", True),
> -                                                          d.getVar("OPKG=
BUILDCMD", True), pkg, pkgoutdir), shell=3DTrue)
> +        ret =3D subprocess.call("PATH=3D\"%s\" %s %s %s" % (localdata.ge=
tVar("PATH"),
> +                                                          d.getVar("OPKG=
BUILDCMD"), pkg, pkgoutdir), shell=3DTrue)
>          if ret !=3D 0:
>              bb.utils.unlockfile(lf)
>              bb.fatal("opkg-build execution failed")
> =20
> -        if d.getVar('IPK_SIGN_PACKAGES', True) =3D=3D '1':
> -            ipkver =3D "%s-%s" % (d.getVar('PKGV', True), d.getVar('PKGR=
', True))
> -            ipk_to_sign =3D "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipk=
ver, d.getVar('PACKAGE_ARCH', True))
> +        if d.getVar('IPK_SIGN_PACKAGES') =3D=3D '1':
> +            ipkver =3D "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> +            ipk_to_sign =3D "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipk=
ver, d.getVar('PACKAGE_ARCH'))
>              sign_ipk(d, ipk_to_sign)
> =20
>          cleanupcontrol(root)
> @@ -268,7 +268,7 @@ do_package_write_ipk[sstate-inputdirs] =3D "${PKGWRIT=
EDIRIPK}"
>  do_package_write_ipk[sstate-outputdirs] =3D "${DEPLOY_DIR_IPK}"
> =20
>  python do_package_write_ipk_setscene () {
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
> =20
>      if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN=
"), os.R_OK):
>          os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEA=
N"))
> @@ -278,7 +278,7 @@ python do_package_write_ipk_setscene () {
>  addtask do_package_write_ipk_setscene
> =20
>  python () {
> -    if d.getVar('PACKAGES', True) !=3D '':
> +    if d.getVar('PACKAGES') !=3D '':
>          deps =3D ' opkg-utils-native:do_populate_sysroot virtual/fakeroo=
t-native:do_populate_sysroot'
>          d.appendVarFlag('do_package_write_ipk', 'depends', deps)
>          d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.=
bbclass
> index c431545..722c628 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -13,9 +13,9 @@ MERGEPERFILEDEPS =3D "1"
> =20
>  # Construct per file dependencies file
>  def write_rpm_perfiledata(srcname, d):
> -    workdir =3D d.getVar('WORKDIR', True)
> -    packages =3D d.getVar('PACKAGES', True)
> -    pkgd =3D d.getVar('PKGD', True)
> +    workdir =3D d.getVar('WORKDIR')
> +    packages =3D d.getVar('PACKAGES')
> +    pkgd =3D d.getVar('PKGD')
> =20
>      def dump_filerdeps(varname, outfile, d):
>          outfile.write("#!/usr/bin/env python\n\n")
> @@ -23,10 +23,10 @@ def write_rpm_perfiledata(srcname, d):
>          outfile.write('deps =3D {\n')
>          for pkg in packages.split():
>              dependsflist_key =3D 'FILE' + varname + 'FLIST' + "_" + pkg
> -            dependsflist =3D (d.getVar(dependsflist_key, True) or "")
> +            dependsflist =3D (d.getVar(dependsflist_key) or "")
>              for dfile in dependsflist.split():
>                  key =3D "FILE" + varname + "_" + dfile + "_" + pkg
> -                depends_dict =3D bb.utils.explode_dep_versions(d.getVar(=
key, True) or "")
> +                depends_dict =3D bb.utils.explode_dep_versions(d.getVar(=
key) or "")
>                  file =3D dfile.replace("@underscore@", "_")
>                  file =3D file.replace("@closebrace@", "]")
>                  file =3D file.replace("@openbrace@", "[")
> @@ -87,14 +87,14 @@ python write_specfile () {
>      # append information for logs and patches to %prep
>      def add_prep(d,spec_files_bottom):
>          if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) =3D=3D '1' and bb=
=2Edata.inherits_class('archiver', d):
> -            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', Tru=
e) )
> +            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN') )
>              spec_files_bottom.append('%s' % "echo \"include logs and pat=
ches, Please check them in SOURCES\"")
>              spec_files_bottom.append('')
> =20
>      # append the name of tarball to key word 'SOURCE' in xxx.spec.
>      def tail_source(d):
>          if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) =3D=3D '1' and bb=
=2Edata.inherits_class('archiver', d):
> -            ar_outdir =3D d.getVar('ARCHIVER_OUTDIR', True)
> +            ar_outdir =3D d.getVar('ARCHIVER_OUTDIR')
>              if not os.path.exists(ar_outdir):
>                  return
>              source_list =3D os.listdir(ar_outdir)
> @@ -110,7 +110,7 @@ python write_specfile () {
>      # We need a simple way to remove the MLPREFIX from the package name,
>      # and dependency information...
>      def strip_multilib(name, d):
> -        multilibs =3D d.getVar('MULTILIBS', True) or ""
> +        multilibs =3D d.getVar('MULTILIBS') or ""
>          for ext in multilibs.split():
>              eext =3D ext.split(':')
>              if len(eext) > 1 and eext[0] =3D=3D 'multilib' and name and =
name.find(eext[1] + '-') >=3D 0:
> @@ -124,7 +124,7 @@ python write_specfile () {
>              newdeps[strip_multilib(dep, d)] =3D depends[dep]
>          return bb.utils.join_deps(newdeps)
> =20
> -#        ml =3D d.getVar("MLPREFIX", True)
> +#        ml =3D d.getVar("MLPREFIX")
>  #        if ml and name and len(ml) !=3D 0 and name.find(ml) =3D=3D 0:
>  #            return ml.join(name.split(ml, 1)[1:])
>  #        return name
> @@ -144,7 +144,7 @@ python write_specfile () {
>      # after renaming we cannot look up the dependencies in the packageda=
ta
>      # store.
>      def translate_vers(varname, d):
> -        depends =3D d.getVar(varname, True)
> +        depends =3D d.getVar(varname)
>          if depends:
>              depends_dict =3D bb.utils.explode_dep_versions2(depends)
>              newdeps_dict =3D {}
> @@ -248,10 +248,10 @@ python write_specfile () {
>      def get_perfile(varname, pkg, d):
>          deps =3D []
>          dependsflist_key =3D 'FILE' + varname + 'FLIST' + "_" + pkg
> -        dependsflist =3D (d.getVar(dependsflist_key, True) or "")
> +        dependsflist =3D (d.getVar(dependsflist_key) or "")
>          for dfile in dependsflist.split():
>              key =3D "FILE" + varname + "_" + dfile + "_" + pkg
> -            depends =3D d.getVar(key, True)
> +            depends =3D d.getVar(key)
>              if depends:
>                  deps.append(depends)
>          return " ".join(deps)
> @@ -269,33 +269,33 @@ python write_specfile () {
>          else:
>              spec_preamble.append('%s' % textwrap.fill(dedent_text, width=
=3D75))
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> +    packages =3D d.getVar('PACKAGES')
>      if not packages or packages =3D=3D '':
>          bb.debug(1, "No packages; nothing to do")
>          return
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
>      if not pkgdest:
>          bb.fatal("No PKGDEST")
> =20
> -    outspecfile =3D d.getVar('OUTSPECFILE', True)
> +    outspecfile =3D d.getVar('OUTSPECFILE')
>      if not outspecfile:
>          bb.fatal("No OUTSPECFILE")
> =20
>      # Construct the SPEC file...
> -    srcname    =3D strip_multilib(d.getVar('PN', True), d)
> -    srcsummary =3D (d.getVar('SUMMARY', True) or d.getVar('DESCRIPTION',=
 True) or ".")
> -    srcversion =3D d.getVar('PKGV', True).replace('-', '+')
> -    srcrelease =3D d.getVar('PKGR', True)
> -    srcepoch   =3D (d.getVar('PKGE', True) or "")
> -    srclicense =3D d.getVar('LICENSE', True)
> -    srcsection =3D d.getVar('SECTION', True)
> -    srcmaintainer  =3D d.getVar('MAINTAINER', True)
> -    srchomepage    =3D d.getVar('HOMEPAGE', True)
> -    srcdescription =3D d.getVar('DESCRIPTION', True) or "."
> +    srcname    =3D strip_multilib(d.getVar('PN'), d)
> +    srcsummary =3D (d.getVar('SUMMARY') or d.getVar('DESCRIPTION') or ".=
")
> +    srcversion =3D d.getVar('PKGV').replace('-', '+')
> +    srcrelease =3D d.getVar('PKGR')
> +    srcepoch   =3D (d.getVar('PKGE') or "")
> +    srclicense =3D d.getVar('LICENSE')
> +    srcsection =3D d.getVar('SECTION')
> +    srcmaintainer  =3D d.getVar('MAINTAINER')
> +    srchomepage    =3D d.getVar('HOMEPAGE')
> +    srcdescription =3D d.getVar('DESCRIPTION') or "."
>      srccustomtagschunk =3D get_package_additional_metadata("rpm", d)
> =20
> -    srcdepends     =3D strip_multilib_deps(d.getVar('DEPENDS', True), d)
> +    srcdepends     =3D strip_multilib_deps(d.getVar('DEPENDS'), d)
>      srcrdepends    =3D []
>      srcrrecommends =3D []
>      srcrsuggests   =3D []
> @@ -318,8 +318,8 @@ python write_specfile () {
>      spec_files_top =3D []
>      spec_files_bottom =3D []
> =20
> -    perfiledeps =3D (d.getVar("MERGEPERFILEDEPS", True) or "0") =3D=3D "=
0"
> -    extra_pkgdata =3D (d.getVar("RPM_EXTRA_PKGDATA", True) or "0") =3D=
=3D "1"
> +    perfiledeps =3D (d.getVar("MERGEPERFILEDEPS") or "0") =3D=3D "0"
> +    extra_pkgdata =3D (d.getVar("RPM_EXTRA_PKGDATA") or "0") =3D=3D "1"
> =20
>      for pkg in packages.split():
>          localdata =3D bb.data.createCopy(d)
> @@ -328,7 +328,7 @@ python write_specfile () {
> =20
>          localdata.setVar('ROOT', '')
>          localdata.setVar('ROOT_%s' % pkg, root)
> -        pkgname =3D localdata.getVar('PKG_%s' % pkg, True)
> +        pkgname =3D localdata.getVar('PKG_%s' % pkg)
>          if not pkgname:
>              pkgname =3D pkg
>          localdata.setVar('PKG', pkgname)
> @@ -338,19 +338,19 @@ python write_specfile () {
>          bb.data.update_data(localdata)
> =20
>          conffiles =3D get_conffiles(pkg, d)
> -        dirfiles =3D localdata.getVar('DIRFILES', True)
> +        dirfiles =3D localdata.getVar('DIRFILES')
>          if dirfiles is not None:
>              dirfiles =3D dirfiles.split()
> =20
>          splitname    =3D strip_multilib(pkgname, d)
> =20
> -        splitsummary =3D (localdata.getVar('SUMMARY', True) or localdata=
=2EgetVar('DESCRIPTION', True) or ".")
> -        splitversion =3D (localdata.getVar('PKGV', True) or "").replace(=
'-', '+')
> -        splitrelease =3D (localdata.getVar('PKGR', True) or "")
> -        splitepoch   =3D (localdata.getVar('PKGE', True) or "")
> -        splitlicense =3D (localdata.getVar('LICENSE', True) or "")
> -        splitsection =3D (localdata.getVar('SECTION', True) or "")
> -        splitdescription =3D (localdata.getVar('DESCRIPTION', True) or "=
=2E")
> +        splitsummary =3D (localdata.getVar('SUMMARY') or localdata.getVa=
r('DESCRIPTION') or ".")
> +        splitversion =3D (localdata.getVar('PKGV') or "").replace('-', '=
+')
> +        splitrelease =3D (localdata.getVar('PKGR') or "")
> +        splitepoch   =3D (localdata.getVar('PKGE') or "")
> +        splitlicense =3D (localdata.getVar('LICENSE') or "")
> +        splitsection =3D (localdata.getVar('SECTION') or "")
> +        splitdescription =3D (localdata.getVar('DESCRIPTION') or ".")
>          splitcustomtagschunk =3D get_package_additional_metadata("rpm", =
localdata)
> =20
>          translate_vers('RDEPENDS', localdata)
> @@ -363,18 +363,18 @@ python write_specfile () {
>          # Map the dependencies into their final form
>          mapping_rename_hook(localdata)
> =20
> -        splitrdepends    =3D strip_multilib_deps(localdata.getVar('RDEPE=
NDS', True), d)
> -        splitrrecommends =3D strip_multilib_deps(localdata.getVar('RRECO=
MMENDS', True), d)
> -        splitrsuggests   =3D strip_multilib_deps(localdata.getVar('RSUGG=
ESTS', True), d)
> -        splitrprovides   =3D strip_multilib_deps(localdata.getVar('RPROV=
IDES', True), d)
> -        splitrreplaces   =3D strip_multilib_deps(localdata.getVar('RREPL=
ACES', True), d)
> -        splitrconflicts  =3D strip_multilib_deps(localdata.getVar('RCONF=
LICTS', True), d)
> +        splitrdepends    =3D strip_multilib_deps(localdata.getVar('RDEPE=
NDS'), d)
> +        splitrrecommends =3D strip_multilib_deps(localdata.getVar('RRECO=
MMENDS'), d)
> +        splitrsuggests   =3D strip_multilib_deps(localdata.getVar('RSUGG=
ESTS'), d)
> +        splitrprovides   =3D strip_multilib_deps(localdata.getVar('RPROV=
IDES'), d)
> +        splitrreplaces   =3D strip_multilib_deps(localdata.getVar('RREPL=
ACES'), d)
> +        splitrconflicts  =3D strip_multilib_deps(localdata.getVar('RCONF=
LICTS'), d)
>          splitrobsoletes  =3D []
> =20
> -        splitrpreinst  =3D localdata.getVar('pkg_preinst', True)
> -        splitrpostinst =3D localdata.getVar('pkg_postinst', True)
> -        splitrprerm    =3D localdata.getVar('pkg_prerm', True)
> -        splitrpostrm   =3D localdata.getVar('pkg_postrm', True)
> +        splitrpreinst  =3D localdata.getVar('pkg_preinst')
> +        splitrpostinst =3D localdata.getVar('pkg_postinst')
> +        splitrprerm    =3D localdata.getVar('pkg_prerm')
> +        splitrpostrm   =3D localdata.getVar('pkg_postrm')
> =20
> =20
>          if not perfiledeps:
> @@ -621,7 +621,7 @@ python write_specfile () {
> =20
>      # RPMSPEC_PREAMBLE is a way to add arbitrary text to the top
>      # of the generated spec file
> -    external_preamble =3D d.getVar("RPMSPEC_PREAMBLE", True)
> +    external_preamble =3D d.getVar("RPMSPEC_PREAMBLE")
>      if external_preamble:
>          specfile.write(external_preamble + "\n")
> =20
> @@ -652,20 +652,20 @@ python do_package_rpm () {
>      # We need a simple way to remove the MLPREFIX from the package name,
>      # and dependency information...
>      def strip_multilib(name, d):
> -        ml =3D d.getVar("MLPREFIX", True)
> +        ml =3D d.getVar("MLPREFIX")
>          if ml and name and len(ml) !=3D 0 and name.find(ml) >=3D 0:
>              return "".join(name.split(ml))
>          return name
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> -    tmpdir =3D d.getVar('TMPDIR', True)
> -    pkgd =3D d.getVar('PKGD', True)
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    workdir =3D d.getVar('WORKDIR')
> +    tmpdir =3D d.getVar('TMPDIR')
> +    pkgd =3D d.getVar('PKGD')
> +    pkgdest =3D d.getVar('PKGDEST')
>      if not workdir or not pkgd or not tmpdir:
>          bb.error("Variables incorrectly set, unable to package")
>          return
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> +    packages =3D d.getVar('PACKAGES')
>      if not packages or packages =3D=3D '':
>          bb.debug(1, "No packages; nothing to do")
>          return
> @@ -674,31 +674,31 @@ python do_package_rpm () {
>      # If the spec file already exist, and has not been stored into=20
>      # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
>      # so remove it before doing rpmbuild src.rpm.
> -    srcname    =3D strip_multilib(d.getVar('PN', True), d)
> +    srcname    =3D strip_multilib(d.getVar('PN'), d)
>      outspecfile =3D workdir + "/" + srcname + ".spec"
>      if os.path.isfile(outspecfile):
>          os.remove(outspecfile)
>      d.setVar('OUTSPECFILE', outspecfile)
>      bb.build.exec_func('write_specfile', d)
> =20
> -    perfiledeps =3D (d.getVar("MERGEPERFILEDEPS", True) or "0") =3D=3D "=
0"
> +    perfiledeps =3D (d.getVar("MERGEPERFILEDEPS") or "0") =3D=3D "0"
>      if perfiledeps:
>          outdepends, outprovides =3D write_rpm_perfiledata(srcname, d)
> =20
>      # Setup the rpmbuild arguments...
> -    rpmbuild =3D d.getVar('RPMBUILD', True)
> -    targetsys =3D d.getVar('TARGET_SYS', True)
> -    targetvendor =3D d.getVar('HOST_VENDOR', True)
> -    package_arch =3D (d.getVar('PACKAGE_ARCH', True) or "").replace("-",=
 "_")
> -    sdkpkgsuffix =3D (d.getVar('SDKPKGSUFFIX', True) or "nativesdk").rep=
lace("-", "_")
> +    rpmbuild =3D d.getVar('RPMBUILD')
> +    targetsys =3D d.getVar('TARGET_SYS')
> +    targetvendor =3D d.getVar('HOST_VENDOR')
> +    package_arch =3D (d.getVar('PACKAGE_ARCH') or "").replace("-", "_")
> +    sdkpkgsuffix =3D (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("=
-", "_")
>      if package_arch not in "all any noarch".split() and not package_arch=
=2Eendswith(sdkpkgsuffix):
> -        ml_prefix =3D (d.getVar('MLPREFIX', True) or "").replace("-", "_=
")
> +        ml_prefix =3D (d.getVar('MLPREFIX') or "").replace("-", "_")
>          d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
>      else:
>          d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
>      pkgwritedir =3D d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
>      d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
> -    bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR', True))
> +    bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR'))
>      pkgarch =3D d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS=
}')
>      magicfile =3D d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/=
magic.mgc')
>      bb.utils.mkdirhier(pkgwritedir)
> @@ -707,7 +707,7 @@ python do_package_rpm () {
>      cmd =3D rpmbuild
>      cmd =3D cmd + " --nodeps --short-circuit --target " + pkgarch + " --=
buildroot " + pkgd
>      cmd =3D cmd + " --define '_topdir " + workdir + "' --define '_rpmdir=
 " + pkgwritedir + "'"
> -    cmd =3D cmd + " --define '_builddir " + d.getVar('S', True) + "'"
> +    cmd =3D cmd + " --define '_builddir " + d.getVar('S') + "'"
>      cmd =3D cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RE=
LEASE}.%%{ARCH}.rpm'"
>      cmd =3D cmd + " --define '_use_internal_dependency_generator 0'"
>      if perfiledeps:
> @@ -721,8 +721,8 @@ python do_package_rpm () {
>      cmd =3D cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
>      cmd =3D cmd + " --define '_tmppath " + workdir + "'"
>      if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) =3D=3D '1' and bb.dat=
a.inherits_class('archiver', d):
> -        cmd =3D cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTD=
IR', True) + "'"
> -        cmdsrpm =3D cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_=
OUTDIR', True) + "'"
> +        cmd =3D cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTD=
IR') + "'"
> +        cmdsrpm =3D cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_=
OUTDIR') + "'"
>          cmdsrpm =3D cmdsrpm + " -bs " + outspecfile
>          # Build the .src.rpm
>          d.setVar('SBUILDSPEC', cmdsrpm + "\n")
> @@ -735,12 +735,12 @@ python do_package_rpm () {
>      d.setVarFlag('BUILDSPEC', 'func', '1')
>      bb.build.exec_func('BUILDSPEC', d)
> =20
> -    if d.getVar('RPM_SIGN_PACKAGES', True) =3D=3D '1':
> +    if d.getVar('RPM_SIGN_PACKAGES') =3D=3D '1':
>          bb.build.exec_func("sign_rpm", d)
>  }
> =20
>  python () {
> -    if d.getVar('PACKAGES', True) !=3D '':
> +    if d.getVar('PACKAGES') !=3D '':
>          deps =3D ' rpm-native:do_populate_sysroot virtual/fakeroot-nativ=
e:do_populate_sysroot'
>          d.appendVarFlag('do_package_write_rpm', 'depends', deps)
>          d.setVarFlag('do_package_write_rpm', 'fakeroot', '1')
> diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.=
bbclass
> index e217814..3ff8b8f 100644
> --- a/meta/classes/package_tar.bbclass
> +++ b/meta/classes/package_tar.bbclass
> @@ -7,27 +7,27 @@ python do_package_tar () {
> =20
>      oldcwd =3D os.getcwd()
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      if not workdir:
>          bb.error("WORKDIR not defined, unable to package")
>          return
> =20
> -    outdir =3D d.getVar('DEPLOY_DIR_TAR', True)
> +    outdir =3D d.getVar('DEPLOY_DIR_TAR')
>      if not outdir:
>          bb.error("DEPLOY_DIR_TAR not defined, unable to package")
>          return
> =20
> -    dvar =3D d.getVar('D', True)
> +    dvar =3D d.getVar('D')
>      if not dvar:
>          bb.error("D not defined, unable to package")
>          return
> =20
> -    packages =3D d.getVar('PACKAGES', True)
> +    packages =3D d.getVar('PACKAGES')
>      if not packages:
>          bb.debug(1, "PACKAGES not defined, nothing to package")
>          return
> =20
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pkgdest =3D d.getVar('PKGDEST')
> =20
>      bb.utils.mkdirhier(outdir)
>      bb.utils.mkdirhier(dvar)
> @@ -46,7 +46,7 @@ python do_package_tar () {
>          os.chdir(root)
>          dlist =3D os.listdir(root)
>          if not dlist:
> -            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, lo=
caldata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
> +            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, lo=
caldata.getVar('PKGV'), localdata.getVar('PKGR')))
>              continue
>          args =3D "tar -cz --exclude=3DCONTROL --exclude=3DDEBIAN -f".spl=
it()
>          ret =3D subprocess.call(args + [tarfn] + dlist)
> @@ -57,7 +57,7 @@ python do_package_tar () {
>  }
> =20
>  python () {
> -    if d.getVar('PACKAGES', True) !=3D '':
> +    if d.getVar('PACKAGES') !=3D '':
>          deps =3D (d.getVarFlag('do_package_write_tar', 'depends', True) =
or "").split()
>          deps.append('tar-native:do_populate_sysroot')
>          deps.append('virtual/fakeroot-native:do_populate_sysroot')
> diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.=
bbclass
> index 3397f1e..a903e5c 100644
> --- a/meta/classes/packagedata.bbclass
> +++ b/meta/classes/packagedata.bbclass
> @@ -2,10 +2,10 @@ python read_subpackage_metadata () {
>      import oe.packagedata
> =20
>      vars =3D {
> -        "PN" : d.getVar('PN', True),=20
> -        "PE" : d.getVar('PE', True),=20
> -        "PV" : d.getVar('PV', True),
> -        "PR" : d.getVar('PR', True),
> +        "PN" : d.getVar('PN'),=20
> +        "PE" : d.getVar('PE'),=20
> +        "PV" : d.getVar('PV'),
> +        "PR" : d.getVar('PR'),
>      }
> =20
>      data =3D oe.packagedata.read_pkgdata(vars["PN"], d)
> @@ -13,7 +13,7 @@ python read_subpackage_metadata () {
>      for key in data.keys():
>          d.setVar(key, data[key])
> =20
> -    for pkg in d.getVar('PACKAGES', True).split():
> +    for pkg in d.getVar('PACKAGES').split():
>          sdata =3D oe.packagedata.read_subpkgdata(pkg, d)
>          for key in sdata.keys():
>              if key in vars:
> diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/pa=
ckagefeed-stability.bbclass
> index aa01def..3a12807 100644
> --- a/meta/classes/packagefeed-stability.bbclass
> +++ b/meta/classes/packagefeed-stability.bbclass
> @@ -31,7 +31,7 @@ python() {
>      # This assumes that the package_write task is called package_write_<=
pkgtype>
>      # and that the directory in which packages should be written is
>      # pointed to by the variable DEPLOY_DIR_<PKGTYPE>
> -    for pkgclass in (d.getVar('PACKAGE_CLASSES', True) or '').split():
> +    for pkgclass in (d.getVar('PACKAGE_CLASSES') or '').split():
>          if pkgclass.startswith('package_'):
>              pkgtype =3D pkgclass.split('_', 1)[1]
>              pkgwritefunc =3D 'do_package_write_%s' % pkgtype
> @@ -71,7 +71,7 @@ python() {
>  # This isn't the real task function - it's a template that we use in the
>  # anonymous python code above
>  fakeroot python do_package_compare () {
> -    currenttask =3D d.getVar('BB_CURRENTTASK', True)
> +    currenttask =3D d.getVar('BB_CURRENTTASK')
>      pkgtype =3D currenttask.rsplit('_', 1)[1]
>      package_compare_impl(pkgtype, d)
>  }
> @@ -83,12 +83,12 @@ def package_compare_impl(pkgtype, d):
>      import subprocess
>      import oe.sstatesig
> =20
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      deploydir =3D d.getVar('DEPLOY_DIR_%s' % pkgtype.upper(), True)
>      prepath =3D deploydir + '-prediff/'
> =20
>      # Find out PKGR values are
> -    pkgdatadir =3D d.getVar('PKGDATA_DIR', True)
> +    pkgdatadir =3D d.getVar('PKGDATA_DIR')
>      packages =3D []
>      try:
>          with open(os.path.join(pkgdatadir, pn), 'r') as f:
> @@ -138,7 +138,7 @@ def package_compare_impl(pkgtype, d):
>      files =3D []
>      docopy =3D False
>      manifest, _ =3D oe.sstatesig.sstate_get_manifest_filename(pkgwriteta=
sk, d)
> -    mlprefix =3D d.getVar('MLPREFIX', True)
> +    mlprefix =3D d.getVar('MLPREFIX')
>      # Copy recipe's all packages if one of the packages are different to=
 make
>      # they have the same PR.
>      with open(manifest, 'r') as f:
> @@ -215,7 +215,7 @@ def package_compare_impl(pkgtype, d):
>                  # multilib), they're identical in theory, but sstate.bbc=
lass
>                  # copies it again, so keep align with that.
>                  if os.path.exists(destpath) and pkgtype =3D=3D 'rpm' \
> -                        and d.getVar('PACKAGE_ARCH', True) =3D=3D 'all':
> +                        and d.getVar('PACKAGE_ARCH') =3D=3D 'all':
>                      os.unlink(destpath)
>                  if (os.stat(srcpath).st_dev =3D=3D os.stat(destdir).st_d=
ev):
>                      # Use a hard link to save space
> @@ -229,7 +229,7 @@ def package_compare_impl(pkgtype, d):
>  do_cleansstate[postfuncs] +=3D "pfs_cleanpkgs"
>  python pfs_cleanpkgs () {
>      import errno
> -    for pkgclass in (d.getVar('PACKAGE_CLASSES', True) or '').split():
> +    for pkgclass in (d.getVar('PACKAGE_CLASSES') or '').split():
>          if pkgclass.startswith('package_'):
>              pkgtype =3D pkgclass.split('_', 1)[1]
>              deploydir =3D d.getVar('DEPLOY_DIR_%s' % pkgtype.upper(), Tr=
ue)
> diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegrou=
p.bbclass
> index 3928c8a..a60a52b 100644
> --- a/meta/classes/packagegroup.bbclass
> +++ b/meta/classes/packagegroup.bbclass
> @@ -16,15 +16,15 @@ PACKAGE_ARCH_EXPANDED :=3D "${PACKAGE_ARCH}"
> =20
>  LICENSE ?=3D "MIT"
> =20
> -inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED', True) =3D=
=3D 'all', 'allarch', '')}
> +inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') =3D=3D 'all=
', 'allarch', '')}
> =20
>  # This automatically adds -dbg and -dev flavours of all PACKAGES
>  # to the list. Their dependencies (RRECOMMENDS) are handled as usual
>  # by package_depchains in a following step.
>  # Also mark all packages as ALLOW_EMPTY
>  python () {
> -    packages =3D d.getVar('PACKAGES', True).split()
> -    if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY', True) !=3D '1':
> +    packages =3D d.getVar('PACKAGES').split()
> +    if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY') !=3D '1':
>          types =3D ['', '-dbg', '-dev']
>          if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
>              types.append('-ptest')
> @@ -49,7 +49,7 @@ do_install[noexec] =3D "1"
>  do_populate_sysroot[noexec] =3D "1"
> =20
>  python () {
> -    initman =3D d.getVar("VIRTUAL-RUNTIME_init_manager", True)
> +    initman =3D d.getVar("VIRTUAL-RUNTIME_init_manager")
>      if initman and initman in ['sysvinit', 'systemd'] and not bb.utils.c=
ontains('DISTRO_FEATURES', initman, True, False, d):
>          bb.fatal("Please ensure that your setting of VIRTUAL-RUNTIME_ini=
t_manager (%s) matches the entries enabled in DISTRO_FEATURES" % initman)
>  }
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 2c1f58c..cc27fd5 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -11,7 +11,7 @@ PATCH_GIT_USER_EMAIL ?=3D "oe.patch@oe"
>  inherit terminal
> =20
>  def src_patches(d, all=3DFalse, expand=3DTrue):
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      fetch =3D bb.fetch2.Fetch([], d)
>      patches =3D []
>      sources =3D []
> @@ -79,13 +79,13 @@ def should_apply(parm, d):
>      """Determine if we should apply the given patch"""
> =20
>      if "mindate" in parm or "maxdate" in parm:
> -        pn =3D d.getVar('PN', True)
> -        srcdate =3D d.getVar('SRCDATE_%s' % pn, True)
> +        pn =3D d.getVar('PN')
> +        srcdate =3D d.getVar('SRCDATE_%s' % pn)
>          if not srcdate:
> -            srcdate =3D d.getVar('SRCDATE', True)
> +            srcdate =3D d.getVar('SRCDATE')
> =20
>          if srcdate =3D=3D "now":
> -            srcdate =3D d.getVar('DATE', True)
> +            srcdate =3D d.getVar('DATE')
> =20
>          if "maxdate" in parm and parm["maxdate"] < srcdate:
>              return False, 'is outdated'
> @@ -95,22 +95,22 @@ def should_apply(parm, d):
> =20
> =20
>      if "minrev" in parm:
> -        srcrev =3D d.getVar('SRCREV', True)
> +        srcrev =3D d.getVar('SRCREV')
>          if srcrev and srcrev < parm["minrev"]:
>              return False, 'applies to later revisions'
> =20
>      if "maxrev" in parm:
> -        srcrev =3D d.getVar('SRCREV', True)
> +        srcrev =3D d.getVar('SRCREV')
>          if srcrev and srcrev > parm["maxrev"]:
>              return False, 'applies to earlier revisions'
> =20
>      if "rev" in parm:
> -        srcrev =3D d.getVar('SRCREV', True)
> +        srcrev =3D d.getVar('SRCREV')
>          if srcrev and parm["rev"] not in srcrev:
>              return False, "doesn't apply to revision"
> =20
>      if "notrev" in parm:
> -        srcrev =3D d.getVar('SRCREV', True)
> +        srcrev =3D d.getVar('SRCREV')
>          if srcrev and parm["notrev"] in srcrev:
>              return False, "doesn't apply to revision"
> =20
> @@ -127,20 +127,20 @@ python patch_do_patch() {
>          "git": oe.patch.GitApplyTree,
>      }
> =20
> -    cls =3D patchsetmap[d.getVar('PATCHTOOL', True) or 'quilt']
> +    cls =3D patchsetmap[d.getVar('PATCHTOOL') or 'quilt']
> =20
>      resolvermap =3D {
>          "noop": oe.patch.NOOPResolver,
>          "user": oe.patch.UserResolver,
>      }
> =20
> -    rcls =3D resolvermap[d.getVar('PATCHRESOLVE', True) or 'user']
> +    rcls =3D resolvermap[d.getVar('PATCHRESOLVE') or 'user']
> =20
>      classes =3D {}
> =20
> -    s =3D d.getVar('S', True)
> +    s =3D d.getVar('S')
> =20
> -    os.putenv('PATH', d.getVar('PATH', True))
> +    os.putenv('PATH', d.getVar('PATH'))
> =20
>      # We must use one TMPDIR per process so that the "patch" processes
>      # don't generate the same temp file name.
> diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.=
bbclass
> index 3f48a0f..63bf079 100644
> --- a/meta/classes/pixbufcache.bbclass
> +++ b/meta/classes/pixbufcache.bbclass
> @@ -28,20 +28,20 @@ fi
>  }
> =20
>  python populate_packages_append() {
> -    pixbuf_pkgs =3D d.getVar('PIXBUF_PACKAGES', True).split()
> +    pixbuf_pkgs =3D d.getVar('PIXBUF_PACKAGES').split()
> =20
>      for pkg in pixbuf_pkgs:
>          bb.note("adding pixbuf postinst and postrm scripts to %s" % pkg)
> -        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar=
('pkg_postinst', True)
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_=
postinst')
>          if not postinst:
>              postinst =3D '#!/bin/sh\n'
> -        postinst +=3D d.getVar('pixbufcache_common', True)
> +        postinst +=3D d.getVar('pixbufcache_common')
>          d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pk=
g_postrm', True)
> +        postrm =3D d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_post=
rm')
>          if not postrm:
>              postrm =3D '#!/bin/sh\n'
> -        postrm +=3D d.getVar('pixbufcache_common', True)
> +        postrm +=3D d.getVar('pixbufcache_common')
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> =20
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/popula=
te_sdk_base.bbclass
> index 220cde6..48bc395 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -11,7 +11,7 @@ COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest'
>  def complementary_globs(featurevar, d):
>      all_globs =3D d.getVarFlags('COMPLEMENTARY_GLOB')
>      globs =3D []
> -    features =3D set((d.getVar(featurevar, True) or '').split())
> +    features =3D set((d.getVar(featurevar) or '').split())
>      for name, glob in all_globs.items():
>          if name in features:
>              globs.append(glob)
> @@ -57,30 +57,30 @@ SDK_PRE_INSTALL_COMMAND ?=3D ""
>  SDK_POST_INSTALL_COMMAND ?=3D ""
>  SDK_RELOCATE_AFTER_INSTALL ?=3D "1"
> =20
> -SDKEXTPATH ?=3D "~/${@d.getVar('DISTRO', True)}_sdk"
> -SDK_TITLE ?=3D "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', T=
rue)} SDK"
> +SDKEXTPATH ?=3D "~/${@d.getVar('DISTRO')}_sdk"
> +SDK_TITLE ?=3D "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
> =20
>  SDK_TARGET_MANIFEST =3D "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.=
manifest"
>  SDK_HOST_MANIFEST =3D "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.mani=
fest"
>  python write_target_sdk_manifest () {
>      from oe.sdk import sdk_list_installed_packages
>      from oe.utils import format_pkg_list
> -    sdkmanifestdir =3D os.path.dirname(d.getVar("SDK_TARGET_MANIFEST", T=
rue))
> +    sdkmanifestdir =3D os.path.dirname(d.getVar("SDK_TARGET_MANIFEST"))
>      pkgs =3D sdk_list_installed_packages(d, True)
>      if not os.path.exists(sdkmanifestdir):
>          bb.utils.mkdirhier(sdkmanifestdir)
> -    with open(d.getVar('SDK_TARGET_MANIFEST', True), 'w') as output:
> +    with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
>          output.write(format_pkg_list(pkgs, 'ver'))
>  }
> =20
>  python write_host_sdk_manifest () {
>      from oe.sdk import sdk_list_installed_packages
>      from oe.utils import format_pkg_list
> -    sdkmanifestdir =3D os.path.dirname(d.getVar("SDK_HOST_MANIFEST", Tru=
e))
> +    sdkmanifestdir =3D os.path.dirname(d.getVar("SDK_HOST_MANIFEST"))
>      pkgs =3D sdk_list_installed_packages(d, False)
>      if not os.path.exists(sdkmanifestdir):
>          bb.utils.mkdirhier(sdkmanifestdir)
> -    with open(d.getVar('SDK_HOST_MANIFEST', True), 'w') as output:
> +    with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
>          output.write(format_pkg_list(pkgs, 'ver'))
>  }
> =20
> @@ -93,7 +93,7 @@ def populate_sdk_common(d):
>      from oe.sdk import populate_sdk
>      from oe.manifest import create_manifest, Manifest
> =20
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
>      runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
> =20
> @@ -101,13 +101,13 @@ def populate_sdk_common(d):
>      ld.setVar("PKGDATA_DIR", "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}=
${SDK_VENDOR}-${SDK_OS}/pkgdata")
>      runtime_mapping_rename("TOOLCHAIN_HOST_TASK", pn, ld)
>      runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, ld)
> -    d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK", Tru=
e))
> -    d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOS=
T_TASK_ATTEMPTONLY", True))
> +    d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK"))
> +    d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOS=
T_TASK_ATTEMPTONLY"))
>     =20
>      # create target/host SDK manifests
> -    create_manifest(d, manifest_dir=3Dd.getVar('SDK_DIR', True),
> +    create_manifest(d, manifest_dir=3Dd.getVar('SDK_DIR'),
>                      manifest_type=3DManifest.MANIFEST_TYPE_SDK_HOST)
> -    create_manifest(d, manifest_dir=3Dd.getVar('SDK_DIR', True),
> +    create_manifest(d, manifest_dir=3Dd.getVar('SDK_DIR'),
>                      manifest_type=3DManifest.MANIFEST_TYPE_SDK_TARGET)
> =20
>      populate_sdk(d)
> @@ -134,7 +134,7 @@ fakeroot create_sdk_files() {
>  python check_sdk_sysroots() {
>      # Fails build if there are broken or dangling symlinks in SDK sysroo=
ts
> =20
> -    if d.getVar('CHECK_SDK_SYSROOTS', True) !=3D '1':
> +    if d.getVar('CHECK_SDK_SYSROOTS') !=3D '1':
>          # disabled, bail out
>          return
> =20
> @@ -142,8 +142,8 @@ python check_sdk_sysroots() {
>          return os.path.abspath(path)
> =20
>      # Get scan root
> -    SCAN_ROOT =3D norm_path("%s/%s/sysroots/" % (d.getVar('SDK_OUTPUT', =
True),
> -                                               d.getVar('SDKPATH', True)=
))
> +    SCAN_ROOT =3D norm_path("%s/%s/sysroots/" % (d.getVar('SDK_OUTPUT'),
> +                                               d.getVar('SDKPATH')))
> =20
>      bb.note('Checking SDK sysroots at ' + SCAN_ROOT)
> =20
> @@ -218,7 +218,7 @@ EOF
>  		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
>  		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
>  		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
> -		-e 's#@SDK_TITLE@#${@d.getVar("SDK_TITLE", True).replace('&', '\&')}#g=
' \
> +		-e 's#@SDK_TITLE@#${@d.getVar("SDK_TITLE").replace('&', '\&')}#g' \
>  		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
>  		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
>  		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
> @@ -268,7 +268,7 @@ do_populate_sdk[file-checksums] +=3D "${COREBASE}/met=
a/files/toolchain-shar-reloca
>                                      ${COREBASE}/meta/files/toolchain-sha=
r-extract.sh:True"
> =20
>  do_populate_sdk[dirs] =3D "${PKGDATA_DIR} ${TOPDIR}"
> -do_populate_sdk[depends] +=3D "${@' '.join([x + ':do_populate_sysroot' f=
or x in d.getVar('SDK_DEPENDS', True).split()])}  ${@d.getVarFlag('do_rootf=
s', 'depends', False)}"
> -do_populate_sdk[rdepends] =3D "${@' '.join([x + ':do_populate_sysroot' f=
or x in d.getVar('SDK_RDEPENDS', True).split()])}"
> +do_populate_sdk[depends] +=3D "${@' '.join([x + ':do_populate_sysroot' f=
or x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'd=
epends', False)}"
> +do_populate_sdk[rdepends] =3D "${@' '.join([x + ':do_populate_sysroot' f=
or x in d.getVar('SDK_RDEPENDS').split()])}"
>  do_populate_sdk[recrdeptask] +=3D "do_packagedata do_package_write_rpm d=
o_package_write_ipk do_package_write_deb"
>  addtask populate_sdk
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populat=
e_sdk_ext.bbclass
> index 0e3656b..d3c3c49 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -21,7 +21,7 @@ SDK_EXT_task-populate-sdk-ext =3D "-ext"
>  # Options are full or minimal
>  SDK_EXT_TYPE ?=3D "full"
>  SDK_INCLUDE_PKGDATA ?=3D "0"
> -SDK_INCLUDE_TOOLCHAIN ?=3D "${@'1' if d.getVar('SDK_EXT_TYPE', True) =3D=
=3D 'full' else '0'}"
> +SDK_INCLUDE_TOOLCHAIN ?=3D "${@'1' if d.getVar('SDK_EXT_TYPE') =3D=3D 'f=
ull' else '0'}"
> =20
>  SDK_RECRDEP_TASKS ?=3D ""
> =20
> @@ -43,8 +43,8 @@ SDK_TARGETS ?=3D "${PN}"
> =20
>  def get_sdk_install_targets(d, images_only=3DFalse):
>      sdk_install_targets =3D ''
> -    if images_only or d.getVar('SDK_EXT_TYPE', True) !=3D 'minimal':
> -        sdk_install_targets =3D d.getVar('SDK_TARGETS', True)
> +    if images_only or d.getVar('SDK_EXT_TYPE') !=3D 'minimal':
> +        sdk_install_targets =3D d.getVar('SDK_TARGETS')
> =20
>          depd =3D d.getVar('BB_TASKDEPDATA', False)
>          for v in depd.values():
> @@ -53,9 +53,9 @@ def get_sdk_install_targets(d, images_only=3DFalse):
>                      sdk_install_targets +=3D ' {}'.format(v[0])
> =20
>      if not images_only:
> -        if d.getVar('SDK_INCLUDE_PKGDATA', True) =3D=3D '1':
> +        if d.getVar('SDK_INCLUDE_PKGDATA') =3D=3D '1':
>              sdk_install_targets +=3D ' meta-world-pkgdata:do_allpackaged=
ata'
> -        if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) =3D=3D '1':
> +        if d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=3D '1':
>              sdk_install_targets +=3D ' meta-extsdk-toolchain:do_populate=
_sysroot'
> =20
>      return sdk_install_targets
> @@ -83,7 +83,7 @@ TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext =3D "${TOOLC=
HAINEXT_OUTPUTNAME}"
>  SDK_EXT_TARGET_MANIFEST =3D "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.ta=
rget.manifest"
>  SDK_EXT_HOST_MANIFEST =3D "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host=
=2Emanifest"
> =20
> -SDK_TITLE_task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME', True) or=
 d.getVar('DISTRO', True)} Extensible SDK"
> +SDK_TITLE_task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME') or d.get=
Var('DISTRO')} Extensible SDK"
> =20
>  def clean_esdk_builddir(d, sdkbasepath):
>      """Clean up traces of the fake build for create_filtered_tasklist()"=
""
> @@ -110,14 +110,14 @@ def create_filtered_tasklist(d, sdkbasepath, taskli=
stfile, conf_initpath):
>      try:
>          with open(sdkbasepath + '/conf/local.conf', 'a') as f:
>              # Force the use of sstate from the build system
> -            f.write('\nSSTATE_DIR_forcevariable =3D "%s"\n' % d.getVar('=
SSTATE_DIR', True))
> +            f.write('\nSSTATE_DIR_forcevariable =3D "%s"\n' % d.getVar('=
SSTATE_DIR'))
>              f.write('SSTATE_MIRRORS_forcevariable =3D ""\n')
>              # Ensure TMPDIR is the default so that clean_esdk_builddir()=
 can delete it
>              f.write('TMPDIR_forcevariable =3D "${TOPDIR}/tmp"\n')
> =20
>          # Unfortunately the default SDKPATH (or even a custom value) may=
 contain characters that bitbake
>          # will not allow in its COREBASE path, so we need to rename the =
directory temporarily
> -        temp_sdkbasepath =3D d.getVar('SDK_OUTPUT', True) + '/tmp-rename=
d-sdk'
> +        temp_sdkbasepath =3D d.getVar('SDK_OUTPUT') + '/tmp-renamed-sdk'
>          # Delete any existing temp dir
>          try:
>              shutil.rmtree(temp_sdkbasepath)
> @@ -126,7 +126,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklist=
file, conf_initpath):
>          os.rename(sdkbasepath, temp_sdkbasepath)
>          try:
>              cmdprefix =3D '. %s .; ' % conf_initpath
> -            logfile =3D d.getVar('WORKDIR', True) + '/tasklist_bb_log.tx=
t'
> +            logfile =3D d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
>              try:
>                  oe.copy_buildsystem.check_sstate_task_list(d, get_sdk_in=
stall_targets(d), tasklistfile, cmdprefix=3Dcmdprefix, cwd=3Dtemp_sdkbasepa=
th, logfile=3Dlogfile)
>              except bb.process.ExecutionError as e:
> @@ -148,7 +148,7 @@ python copy_buildsystem () {
>      import glob
>      import oe.copy_buildsystem
> =20
> -    oe_init_env_script =3D d.getVar('OE_INIT_ENV_SCRIPT', True)
> +    oe_init_env_script =3D d.getVar('OE_INIT_ENV_SCRIPT')
> =20
>      conf_bbpath =3D ''
>      conf_initpath =3D ''
> @@ -156,10 +156,10 @@ python copy_buildsystem () {
> =20
>      # Copy in all metadata layers + bitbake (as repositories)
>      buildsystem =3D oe.copy_buildsystem.BuildSystem('extensible SDK', d)
> -    baseoutpath =3D d.getVar('SDK_OUTPUT', True) + '/' + d.getVar('SDKPA=
TH', True)
> +    baseoutpath =3D d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
> =20
>      # Determine if we're building a derivative extensible SDK (from devt=
ool build-sdk)
> -    derivative =3D (d.getVar('SDK_DERIVATIVE', True) or '') =3D=3D '1'
> +    derivative =3D (d.getVar('SDK_DERIVATIVE') or '') =3D=3D '1'
>      if derivative:
>          workspace_name =3D 'orig-workspace'
>      else:
> @@ -167,7 +167,7 @@ python copy_buildsystem () {
>      layers_copied =3D buildsystem.copy_bitbake_and_layers(baseoutpath + =
'/layers', workspace_name)
> =20
>      sdkbblayers =3D []
> -    corebase =3D os.path.basename(d.getVar('COREBASE', True))
> +    corebase =3D os.path.basename(d.getVar('COREBASE'))
>      for layer in layers_copied:
>          if corebase =3D=3D os.path.basename(layer):
>              conf_bbpath =3D os.path.join('layers', layer, 'bitbake')
> @@ -198,8 +198,8 @@ python copy_buildsystem () {
>      config.set('General', 'init_path', conf_initpath)
>      config.set('General', 'core_meta_subdir', core_meta_subdir)
>      config.add_section('SDK')
> -    config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS', True))
> -    updateurl =3D d.getVar('SDK_UPDATE_URL', True)
> +    config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS'))
> +    updateurl =3D d.getVar('SDK_UPDATE_URL')
>      if updateurl:
>          config.set('SDK', 'updateserver', updateurl)
>      bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf'))
> @@ -211,7 +211,7 @@ python copy_buildsystem () {
>          pass
> =20
>      # Create a layer for new recipes / appends
> -    bbpath =3D d.getVar('BBPATH', True)
> +    bbpath =3D d.getVar('BBPATH')
>      bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseout=
path, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'works=
pace')])
> =20
>      # Create bblayers.conf
> @@ -244,16 +244,16 @@ python copy_buildsystem () {
>      bb.utils.mkdirhier(uninative_outdir)
>      shutil.copy(uninative_file, uninative_outdir)
> =20
> -    env_whitelist =3D (d.getVar('BB_ENV_EXTRAWHITE', True) or '').split()
> +    env_whitelist =3D (d.getVar('BB_ENV_EXTRAWHITE') or '').split()
>      env_whitelist_values =3D {}
> =20
>      # Create local.conf
> -    builddir =3D d.getVar('TOPDIR', True)
> +    builddir =3D d.getVar('TOPDIR')
>      if derivative:
>          shutil.copyfile(builddir + '/conf/local.conf', baseoutpath + '/c=
onf/local.conf')
>      else:
> -        local_conf_whitelist =3D (d.getVar('SDK_LOCAL_CONF_WHITELIST', T=
rue) or '').split()
> -        local_conf_blacklist =3D (d.getVar('SDK_LOCAL_CONF_BLACKLIST', T=
rue) or '').split()
> +        local_conf_whitelist =3D (d.getVar('SDK_LOCAL_CONF_WHITELIST') o=
r '').split()
> +        local_conf_blacklist =3D (d.getVar('SDK_LOCAL_CONF_BLACKLIST') o=
r '').split()
>          def handle_var(varname, origvalue, op, newlines):
>              if varname in local_conf_blacklist or (origvalue.strip().sta=
rtswith('/') and not varname in local_conf_whitelist):
>                  newlines.append('# Removed original setting of %s\n' % v=
arname)
> @@ -281,7 +281,7 @@ python copy_buildsystem () {
>              f.write('DL_DIR =3D "${TOPDIR}/downloads"\n')
> =20
>              f.write('INHERIT +=3D "%s"\n' % 'uninative')
> -            f.write('UNINATIVE_CHECKSUM[%s] =3D "%s"\n\n' % (d.getVar('B=
UILD_ARCH', True), uninative_checksum))
> +            f.write('UNINATIVE_CHECKSUM[%s] =3D "%s"\n\n' % (d.getVar('B=
UILD_ARCH'), uninative_checksum))
>              f.write('CONF_VERSION =3D "%s"\n\n' % d.getVar('CONF_VERSION=
', False))
> =20
>              # Some classes are not suitable for SDK, remove them from IN=
HERIT
> @@ -315,7 +315,7 @@ python copy_buildsystem () {
> =20
>              # If you define a sdk_extraconf() function then it can conta=
in additional config
>              # (Though this is awkward; sdk-extra.conf should probably be=
 used instead)
> -            extraconf =3D (d.getVar('sdk_extraconf', True) or '').strip()
> +            extraconf =3D (d.getVar('sdk_extraconf') or '').strip()
>              if extraconf:
>                  # Strip off any leading / trailing spaces
>                  for line in extraconf.splitlines():
> @@ -348,7 +348,7 @@ python copy_buildsystem () {
>      # BB_ENV_EXTRAWHITE) are set in the SDK's configuration
>      extralines =3D []
>      for name, value in env_whitelist_values.items():
> -        actualvalue =3D d.getVar(name, True) or ''
> +        actualvalue =3D d.getVar(name) or ''
>          if value !=3D actualvalue:
>              extralines.append('%s =3D "%s"\n' % (name, actualvalue))
>      if extralines:
> @@ -361,7 +361,7 @@ python copy_buildsystem () {
> =20
>      # Filter the locked signatures file to just the sstate tasks we are =
interested in
>      excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue)
> -    sigfile =3D d.getVar('WORKDIR', True) + '/locked-sigs.inc'
> +    sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>      lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
>      oe.copy_buildsystem.prune_lockedsigs([],
>                                           excluded_targets.split(),
> @@ -373,36 +373,36 @@ python copy_buildsystem () {
>      # uninative.bbclass sets NATIVELSBSTRING to 'universal'
>      fixedlsbstring =3D 'universal'
> =20
> -    sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN', True) =
=3D=3D '1')
> -    sdk_ext_type =3D d.getVar('SDK_EXT_TYPE', True)
> +    sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=3D =
'1')
> +    sdk_ext_type =3D d.getVar('SDK_EXT_TYPE')
>      if sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or derivativ=
e:
>          # Create the filtered task list used to generate the sstate cach=
e shipped with the SDK
> -        tasklistfn =3D d.getVar('WORKDIR', True) + '/tasklist.txt'
> +        tasklistfn =3D d.getVar('WORKDIR') + '/tasklist.txt'
>          create_filtered_tasklist(d, baseoutpath, tasklistfn, conf_initpa=
th)
>      else:
>          tasklistfn =3D None
> =20
>      # Add packagedata if enabled
> -    if d.getVar('SDK_INCLUDE_PKGDATA', True) =3D=3D '1':
> -        lockedsigs_base =3D d.getVar('WORKDIR', True) + '/locked-sigs-ba=
se.inc'
> -        lockedsigs_copy =3D d.getVar('WORKDIR', True) + '/locked-sigs-co=
py.inc'
> +    if d.getVar('SDK_INCLUDE_PKGDATA') =3D=3D '1':
> +        lockedsigs_base =3D d.getVar('WORKDIR') + '/locked-sigs-base.inc'
> +        lockedsigs_copy =3D d.getVar('WORKDIR') + '/locked-sigs-copy.inc'
>          shutil.move(lockedsigs_pruned, lockedsigs_base)
>          oe.copy_buildsystem.merge_lockedsigs(['do_packagedata'],
>                                               lockedsigs_base,
> -                                             d.getVar('STAGING_DIR_HOST'=
, True) + '/world-pkgdata/locked-sigs-pkgdata.inc',
> +                                             d.getVar('STAGING_DIR_HOST'=
) + '/world-pkgdata/locked-sigs-pkgdata.inc',
>                                               lockedsigs_pruned,
>                                               lockedsigs_copy)
> =20
>      if sdk_include_toolchain:
> -        lockedsigs_base =3D d.getVar('WORKDIR', True) + '/locked-sigs-ba=
se2.inc'
> -        lockedsigs_toolchain =3D d.getVar('STAGING_DIR_HOST', True) + '/=
locked-sigs/locked-sigs-extsdk-toolchain.inc'
> +        lockedsigs_base =3D d.getVar('WORKDIR') + '/locked-sigs-base2.in=
c'
> +        lockedsigs_toolchain =3D d.getVar('STAGING_DIR_HOST') + '/locked=
-sigs/locked-sigs-extsdk-toolchain.inc'
>          shutil.move(lockedsigs_pruned, lockedsigs_base)
>          oe.copy_buildsystem.merge_lockedsigs([],
>                                               lockedsigs_base,
>                                               lockedsigs_toolchain,
>                                               lockedsigs_pruned)
>          oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_toolch=
ain,
> -                                                       d.getVar('SSTATE_=
DIR', True),
> +                                                       d.getVar('SSTATE_=
DIR'),
>                                                         sstate_out, d,
>                                                         fixedlsbstring,
>                                                         filterfile=3Dtask=
listfn)
> @@ -412,22 +412,22 @@ python copy_buildsystem () {
>              # Assume the user is not going to set up an additional sstate
>              # mirror, thus we need to copy the additional artifacts (from
>              # workspace recipes) into the derivative SDK
> -            lockedsigs_orig =3D d.getVar('TOPDIR', True) + '/conf/locked=
-sigs.inc'
> +            lockedsigs_orig =3D d.getVar('TOPDIR') + '/conf/locked-sigs.=
inc'
>              if os.path.exists(lockedsigs_orig):
> -                lockedsigs_extra =3D d.getVar('WORKDIR', True) + '/locke=
d-sigs-extra.inc'
> +                lockedsigs_extra =3D d.getVar('WORKDIR') + '/locked-sigs=
-extra.inc'
>                  oe.copy_buildsystem.merge_lockedsigs(None,
>                                                       lockedsigs_orig,
>                                                       lockedsigs_pruned,
>                                                       None,
>                                                       lockedsigs_extra)
>                  oe.copy_buildsystem.create_locked_sstate_cache(lockedsig=
s_extra,
> -                                                               d.getVar(=
'SSTATE_DIR', True),
> +                                                               d.getVar(=
'SSTATE_DIR'),
>                                                                 sstate_ou=
t, d,
>                                                                 fixedlsbs=
tring,
>                                                                 filterfil=
e=3Dtasklistfn)
>      else:
>          oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
> -                                                       d.getVar('SSTATE_=
DIR', True),
> +                                                       d.getVar('SSTATE_=
DIR'),
>                                                         sstate_out, d,
>                                                         fixedlsbstring,
>                                                         filterfile=3Dtask=
listfn)
> @@ -458,24 +458,24 @@ python copy_buildsystem () {
>  def get_current_buildtools(d):
>      """Get the file name of the current buildtools installer"""
>      import glob
> -    btfiles =3D glob.glob(os.path.join(d.getVar('SDK_DEPLOY', True), '*-=
buildtools-nativesdk-standalone-*.sh'))
> +    btfiles =3D glob.glob(os.path.join(d.getVar('SDK_DEPLOY'), '*-buildt=
ools-nativesdk-standalone-*.sh'))
>      btfiles.sort(key=3Dos.path.getctime)
>      return os.path.basename(btfiles[-1])
> =20
>  def get_sdk_required_utilities(buildtools_fn, d):
>      """Find required utilities that aren't provided by the buildtools"""
> -    sanity_required_utilities =3D (d.getVar('SANITY_REQUIRED_UTILITIES',=
 True) or '').split()
> +    sanity_required_utilities =3D (d.getVar('SANITY_REQUIRED_UTILITIES')=
 or '').split()
>      sanity_required_utilities.append(d.expand('${BUILD_PREFIX}gcc'))
>      sanity_required_utilities.append(d.expand('${BUILD_PREFIX}g++'))
> -    buildtools_installer =3D os.path.join(d.getVar('SDK_DEPLOY', True), =
buildtools_fn)
> +    buildtools_installer =3D os.path.join(d.getVar('SDK_DEPLOY'), buildt=
ools_fn)
>      filelist, _ =3D bb.process.run('%s -l' % buildtools_installer)
>      localdata =3D bb.data.createCopy(d)
>      localdata.setVar('SDKPATH', '.')
> -    sdkpathnative =3D localdata.getVar('SDKPATHNATIVE', True)
> -    sdkbindirs =3D [localdata.getVar('bindir_nativesdk', True),
> -                  localdata.getVar('sbindir_nativesdk', True),
> -                  localdata.getVar('base_bindir_nativesdk', True),
> -                  localdata.getVar('base_sbindir_nativesdk', True)]
> +    sdkpathnative =3D localdata.getVar('SDKPATHNATIVE')
> +    sdkbindirs =3D [localdata.getVar('bindir_nativesdk'),
> +                  localdata.getVar('sbindir_nativesdk'),
> +                  localdata.getVar('base_bindir_nativesdk'),
> +                  localdata.getVar('base_sbindir_nativesdk')]
>      for line in filelist.splitlines():
>          splitline =3D line.split()
>          if len(splitline) > 5:
> @@ -504,7 +504,7 @@ install_tools() {
>  	# (they get populated from sstate on installation)
>  	unfsd_path=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
>  	if [ "${SDK_INCLUDE_TOOLCHAIN}" =3D=3D "1" -a ! -e $unfsd_path ] ; then
> -		binrelpath=3D${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE',True)=
, d.getVar('TOPDIR', True))}
> +		binrelpath=3D${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE',True)=
, d.getVar('TOPDIR'))}
>  		lnr ${SDK_OUTPUT}/${SDKPATH}/$binrelpath/unfsd $unfsd_path
>  	fi
>  	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
> @@ -606,8 +606,8 @@ SDK_INSTALL_TARGETS =3D ""
>  fakeroot python do_populate_sdk_ext() {
>      # FIXME hopefully we can remove this restriction at some point, but =
uninative
>      # currently forces this upon us
> -    if d.getVar('SDK_ARCH', True) !=3D d.getVar('BUILD_ARCH', True):
> -        bb.fatal('The extensible SDK can currently only be built for the=
 same architecture as the machine being built on - SDK_ARCH is set to %s (l=
ikely via setting SDKMACHINE) which is different from the architecture of t=
he build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), =
d.getVar('BUILD_ARCH', True)))
> +    if d.getVar('SDK_ARCH') !=3D d.getVar('BUILD_ARCH'):
> +        bb.fatal('The extensible SDK can currently only be built for the=
 same architecture as the machine being built on - SDK_ARCH is set to %s (l=
ikely via setting SDKMACHINE) which is different from the architecture of t=
he build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH'), d.getV=
ar('BUILD_ARCH')))
> =20
>      if not bb.data.inherits_class('uninative', d):
>          bb.fatal('The extensible SDK requires uninative to be enabled. E=
nabling this is straightforward - just add the following to your configurat=
ion:\n\nrequire meta/conf/distro/include/yocto-uninative.inc\nINHERIT +=3D =
"uninative"\n')
> @@ -624,7 +624,7 @@ fakeroot python do_populate_sdk_ext() {
>  def get_ext_sdk_depends(d):
>      # Note: the deps varflag is a list not a string, so we need to speci=
fy expand=3DFalse
>      deps =3D d.getVarFlag('do_image_complete', 'deps', False)
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      deplist =3D ['%s:%s' % (pn, dep) for dep in deps]
>      for task in ['do_image_complete', 'do_rootfs', 'do_build']:
>          deplist.extend((d.getVarFlag(task, 'depends', True) or '').split=
())
> @@ -635,7 +635,7 @@ python do_sdk_depends() {
>      # dependencies we don't need to (e.g. buildtools-tarball) and bringi=
ng those
>      # into the SDK's sstate-cache
>      import oe.copy_buildsystem
> -    sigfile =3D d.getVar('WORKDIR', True) + '/locked-sigs.inc'
> +    sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>      oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
>  }
>  addtask sdk_depends
> @@ -656,10 +656,10 @@ do_populate_sdk_ext[dirs] =3D "${@d.getVarFlag('do_=
populate_sdk', 'dirs', False)}"
> =20
>  do_populate_sdk_ext[depends] =3D "${@d.getVarFlag('do_populate_sdk', 'de=
pends', False)} \
>                                  buildtools-tarball:do_populate_sdk unina=
tive-tarball:do_populate_sdk \
> -                                ${@'meta-world-pkgdata:do_collect_packag=
edata' if d.getVar('SDK_INCLUDE_PKGDATA', True) =3D=3D '1' else ''} \
> -                                ${@'meta-extsdk-toolchain:do_locked_sigs=
' if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) =3D=3D '1' else ''}"
> +                                ${@'meta-world-pkgdata:do_collect_packag=
edata' if d.getVar('SDK_INCLUDE_PKGDATA') =3D=3D '1' else ''} \
> +                                ${@'meta-extsdk-toolchain:do_locked_sigs=
' if d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=3D '1' else ''}"
> =20
> -do_populate_sdk_ext[rdepends] +=3D "${@' '.join([x + ':do_build' for x i=
n d.getVar('SDK_TARGETS', True).split()])}"
> +do_populate_sdk_ext[rdepends] +=3D "${@' '.join([x + ':do_build' for x i=
n d.getVar('SDK_TARGETS').split()])}"
> =20
>  # Make sure code changes can result in rebuild
>  do_populate_sdk_ext[vardeps] +=3D "copy_buildsystem \
> diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
> index 809ec10..6dcf99e 100644
> --- a/meta/classes/prexport.bbclass
> +++ b/meta/classes/prexport.bbclass
> @@ -15,7 +15,7 @@ python prexport_handler () {
>      if isinstance(e, bb.event.RecipeParsed):
>          import oe.prservice
>          #get all PR values for the current PRAUTOINX
> -        ver =3D e.data.getVar('PRSERV_DUMPOPT_VERSION', True)
> +        ver =3D e.data.getVar('PRSERV_DUMPOPT_VERSION')
>          ver =3D ver.replace('%','-')
>          retval =3D oe.prservice.prserv_dump_db(e.data)
>          if not retval:
> @@ -40,7 +40,7 @@ python prexport_handler () {
>          import oe.prservice
>          oe.prservice.prserv_check_avail(e.data)
>          #remove dumpfile
> -        bb.utils.remove(e.data.getVar('PRSERV_DUMPFILE', True))
> +        bb.utils.remove(e.data.getVar('PRSERV_DUMPFILE'))
>      elif isinstance(e, bb.event.ParseCompleted):
>          import oe.prservice
>          #dump meta info of tables
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index fa3561e..798d802 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -61,7 +61,7 @@ python () {
>          d.setVarFlag('do_install_ptest_base', 'fakeroot', '1')
> =20
>      # Remove all '*ptest_base' tasks when ptest is not enabled
> -    if not(d.getVar('PTEST_ENABLED', True) =3D=3D "1"):
> +    if not(d.getVar('PTEST_ENABLED') =3D=3D "1"):
>          for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'd=
o_install_ptest_base']:
>              bb.build.deltask(i, d)
>  }
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index f2d4d1c..6167582 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -4,12 +4,12 @@
>  #
> =20
>  def qemu_target_binary(data):
> -    package_arch =3D data.getVar("PACKAGE_ARCH", True)
> -    qemu_target_binary =3D (data.getVar("QEMU_TARGET_BINARY_%s" % packag=
e_arch, True) or "")
> +    package_arch =3D data.getVar("PACKAGE_ARCH")
> +    qemu_target_binary =3D (data.getVar("QEMU_TARGET_BINARY_%s" % packag=
e_arch) or "")
>      if qemu_target_binary:
>          return qemu_target_binary
> =20
> -    target_arch =3D data.getVar("TARGET_ARCH", True)
> +    target_arch =3D data.getVar("TARGET_ARCH")
>      if target_arch in ("i486", "i586", "i686"):
>          target_arch =3D "i386"
>      elif target_arch =3D=3D "powerpc":
> @@ -26,7 +26,7 @@ def qemu_wrapper_cmdline(data, rootfs_path, library_pat=
hs):
>      if qemu_binary =3D=3D "qemu-allarch":
>          qemu_binary =3D "qemuwrapper"
> =20
> -    qemu_options =3D data.getVar("QEMU_OPTIONS", True)   =20
> +    qemu_options =3D data.getVar("QEMU_OPTIONS")   =20
> =20
>      return "PSEUDO_UNLOAD=3D1 " + qemu_binary + " " + qemu_options + " -=
L " + rootfs_path\
>              + " -E LD_LIBRARY_PATH=3D" + ":".join(library_paths) + " "
> @@ -52,7 +52,7 @@ def qemu_run_binary(data, rootfs_path, binary):
>  # this dance). For others (e.g. arm) a -cpu option is not necessary, sin=
ce the
>  # qemu-arm default CPU supports all required architecture levels.
> =20
> -QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('PACKAGE_ARCH', True), True) or ""}"
> +QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('PACKAGE_ARCH'), True) or ""}"
>  QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> =20
>  QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index 39df3ad..54517bb 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -55,17 +55,17 @@ write_qemuboot_conf[vardeps] +=3D "${@' '.join(qemubo=
ot_vars(d))}"
>  python write_qemuboot_conf() {
>      import configparser
> =20
> -    qemuboot =3D "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', T=
rue), d.getVar('IMAGE_NAME', True))
> -    qemuboot_link =3D "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAG=
E', True), d.getVar('IMAGE_LINK_NAME', True))
> +    qemuboot =3D "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE'), =
d.getVar('IMAGE_NAME'))
> +    qemuboot_link =3D "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAG=
E'), d.getVar('IMAGE_LINK_NAME'))
>      cf =3D configparser.ConfigParser()
>      cf.add_section('config_bsp')
>      for k in qemuboot_vars(d):
> -        cf.set('config_bsp', k, '%s' % d.getVar(k, True))
> +        cf.set('config_bsp', k, '%s' % d.getVar(k))
> =20
>      # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a sym=
link
>      # to the kernel file, which hinders relocatability of the qb conf.
>      # Read the link and replace it with the full filename of the target.
> -    kernel_link =3D os.path.join(d.getVar('DEPLOY_DIR_IMAGE', True), d.g=
etVar('QB_DEFAULT_KERNEL', True))
> +    kernel_link =3D os.path.join(d.getVar('DEPLOY_DIR_IMAGE'), d.getVar(=
'QB_DEFAULT_KERNEL'))
>      kernel =3D os.path.realpath(kernel_link)
>      cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
> =20
> diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_san=
ity.bbclass
> index add34df..3b00b0e 100644
> --- a/meta/classes/recipe_sanity.bbclass
> +++ b/meta/classes/recipe_sanity.bbclass
> @@ -1,5 +1,5 @@
>  def __note(msg, d):
> -    bb.note("%s: recipe_sanity: %s" % (d.getVar("P", True), msg))
> +    bb.note("%s: recipe_sanity: %s" % (d.getVar("P"), msg))
> =20
>  __recipe_sanity_badruntimevars =3D "RDEPENDS RPROVIDES RRECOMMENDS RCONF=
LICTS"
>  def bad_runtime_vars(cfgdata, d):
> @@ -7,7 +7,7 @@ def bad_runtime_vars(cfgdata, d):
>              bb.data.inherits_class("cross", d):
>          return
> =20
> -    for var in d.getVar("__recipe_sanity_badruntimevars", True).split():
> +    for var in d.getVar("__recipe_sanity_badruntimevars").split():
>          val =3D d.getVar(var, False)
>          if val and val !=3D cfgdata.get(var):
>              __note("%s should be %s_${PN}" % (var, var), d)
> @@ -15,11 +15,11 @@ def bad_runtime_vars(cfgdata, d):
>  __recipe_sanity_reqvars =3D "DESCRIPTION"
>  __recipe_sanity_reqdiffvars =3D ""
>  def req_vars(cfgdata, d):
> -    for var in d.getVar("__recipe_sanity_reqvars", True).split():
> +    for var in d.getVar("__recipe_sanity_reqvars").split():
>          if not d.getVar(var, False):
>              __note("%s should be set" % var, d)
> =20
> -    for var in d.getVar("__recipe_sanity_reqdiffvars", True).split():
> +    for var in d.getVar("__recipe_sanity_reqdiffvars").split():
>          val =3D d.getVar(var, False)
>          cfgval =3D cfgdata.get(var)
> =20
> @@ -38,11 +38,11 @@ def var_renames_overwrite(cfgdata, d):
>  def incorrect_nonempty_PACKAGES(cfgdata, d):
>      if bb.data.inherits_class("native", d) or \
>              bb.data.inherits_class("cross", d):
> -        if d.getVar("PACKAGES", True):
> +        if d.getVar("PACKAGES"):
>              return True
> =20
>  def can_use_autotools_base(cfgdata, d):
> -    cfg =3D d.getVar("do_configure", True)
> +    cfg =3D d.getVar("do_configure")
>      if not bb.data.inherits_class("autotools", d):
>          return False
> =20
> @@ -61,7 +61,7 @@ def can_delete_FILESPATH(cfgdata, d):
>      expected =3D cfgdata.get("FILESPATH")
>      expectedpaths =3D d.expand(expected)
>      unexpanded =3D d.getVar("FILESPATH", False)
> -    filespath =3D d.getVar("FILESPATH", True).split(":")
> +    filespath =3D d.getVar("FILESPATH").split(":")
>      filespath =3D [os.path.normpath(f) for f in filespath if os.path.exi=
sts(f)]
>      for fp in filespath:
>          if not fp in expectedpaths:
> @@ -72,13 +72,13 @@ def can_delete_FILESPATH(cfgdata, d):
> =20
>  def can_delete_FILESDIR(cfgdata, d):
>      expected =3D cfgdata.get("FILESDIR")
> -    #expected =3D "${@bb.utils.which(d.getVar('FILESPATH', True), '.')}"
> +    #expected =3D "${@bb.utils.which(d.getVar('FILESPATH'), '.')}"
>      unexpanded =3D d.getVar("FILESDIR", False)
>      if unexpanded is None:
>          return False
> =20
> -    expanded =3D os.path.normpath(d.getVar("FILESDIR", True))
> -    filespath =3D d.getVar("FILESPATH", True).split(":")
> +    expanded =3D os.path.normpath(d.getVar("FILESDIR"))
> +    filespath =3D d.getVar("FILESPATH").split(":")
>      filespath =3D [os.path.normpath(f) for f in filespath if os.path.exi=
sts(f)]
> =20
>      return unexpanded !=3D expected and \
> @@ -96,7 +96,7 @@ def can_delete_others(p, cfgdata, d):
>              continue
> =20
>          try:
> -            expanded =3D d.getVar(k, True)
> +            expanded =3D d.getVar(k)
>              cfgexpanded =3D d.expand(cfgunexpanded)
>          except bb.fetch.ParameterError:
>              continue
> @@ -108,8 +108,8 @@ def can_delete_others(p, cfgdata, d):
>                         (p, cfgunexpanded, unexpanded, expanded))
> =20
>  python do_recipe_sanity () {
> -    p =3D d.getVar("P", True)
> -    p =3D "%s %s %s" % (d.getVar("PN", True), d.getVar("PV", True), d.ge=
tVar("PR", True))
> +    p =3D d.getVar("P")
> +    p =3D "%s %s %s" % (d.getVar("PN"), d.getVar("PV"), d.getVar("PR"))
> =20
>      sanitychecks =3D [
>          (can_delete_FILESDIR, "candidate for removal of FILESDIR"),
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-erro=
r.bbclass
> index 5bb231e..d6fdd36 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -10,7 +10,7 @@ ERR_REPORT_DIR ?=3D "${LOG_DIR}/error-report"
> =20
>  def errorreport_getdata(e):
>      import codecs
> -    logpath =3D e.data.getVar('ERR_REPORT_DIR', True)
> +    logpath =3D e.data.getVar('ERR_REPORT_DIR')
>      datafile =3D os.path.join(logpath, "error-report.txt")
>      with codecs.open(datafile, 'r', 'utf-8') as f:
>          data =3D f.read()
> @@ -19,7 +19,7 @@ def errorreport_getdata(e):
>  def errorreport_savedata(e, newdata, file):
>      import json
>      import codecs
> -    logpath =3D e.data.getVar('ERR_REPORT_DIR', True)
> +    logpath =3D e.data.getVar('ERR_REPORT_DIR')
>      datafile =3D os.path.join(logpath, file)
>      with codecs.open(datafile, 'w', 'utf-8') as f:
>          json.dump(newdata, f, indent=3D4, sort_keys=3DTrue)
> @@ -29,18 +29,18 @@ python errorreport_handler () {
>          import json
>          import codecs
> =20
> -        logpath =3D e.data.getVar('ERR_REPORT_DIR', True)
> +        logpath =3D e.data.getVar('ERR_REPORT_DIR')
>          datafile =3D os.path.join(logpath, "error-report.txt")
> =20
>          if isinstance(e, bb.event.BuildStarted):
>              bb.utils.mkdirhier(logpath)
>              data =3D {}
> -            machine =3D e.data.getVar("MACHINE", True)
> +            machine =3D e.data.getVar("MACHINE")
>              data['machine'] =3D machine
> -            data['build_sys'] =3D e.data.getVar("BUILD_SYS", True)
> -            data['nativelsb'] =3D e.data.getVar("NATIVELSBSTRING", True)
> -            data['distro'] =3D e.data.getVar("DISTRO", True)
> -            data['target_sys'] =3D e.data.getVar("TARGET_SYS", True)
> +            data['build_sys'] =3D e.data.getVar("BUILD_SYS")
> +            data['nativelsb'] =3D e.data.getVar("NATIVELSBSTRING")
> +            data['distro'] =3D e.data.getVar("DISTRO")
> +            data['target_sys'] =3D e.data.getVar("TARGET_SYS")
>              data['failures'] =3D []
>              data['component'] =3D " ".join(e.getPkgs())
>              data['branch_commit'] =3D str(base_detect_branch(e.data)) + =
": " + str(base_detect_revision(e.data))
> @@ -51,7 +51,7 @@ python errorreport_handler () {
>          elif isinstance(e, bb.build.TaskFailed):
>              task =3D e.task
>              taskdata=3D{}
> -            log =3D e.data.getVar('BB_LOGFILE', True)
> +            log =3D e.data.getVar('BB_LOGFILE')
>              taskdata['package'] =3D e.data.expand("${PF}")
>              taskdata['task'] =3D task
>              if log:
> @@ -61,7 +61,7 @@ python errorreport_handler () {
> =20
>                      # Replace host-specific paths so the logs are cleaner
>                      for d in ("TOPDIR", "TMPDIR"):
> -                        s =3D e.data.getVar(d, True)
> +                        s =3D e.data.getVar(d)
>                          if s:
>                              logdata =3D logdata.replace(s, d)
> =20
> @@ -92,7 +92,7 @@ python errorreport_handler () {
>              bb.utils.unlockfile(lock)
>              failures =3D jsondata['failures']
>              if(len(failures) > 0):
> -                filename =3D "error_report_" + e.data.getVar("BUILDNAME"=
, True)+".txt"
> +                filename =3D "error_report_" + e.data.getVar("BUILDNAME"=
)+".txt"
>                  datafile =3D errorreport_savedata(e, jsondata, filename)
>                  bb.note("The errors for this build are stored in %s\nYou=
 can send the errors to a reports server by running:\n  send-error-report %=
s [-s server]" % (datafile, datafile))
>                  bb.note("The contents of these logs will be posted in pu=
blic if you use the above command with the default server. Please ensure yo=
u remove any identifying or proprietary information when prompted before se=
nding.")
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 64b6981..72018f5 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -119,10 +119,10 @@ rm_work_rootfs[cleandirs] =3D "${WORKDIR}/rootfs"
> =20
>  python () {
>      if bb.data.inherits_class('kernel', d):
> -        d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN", True))
> +        d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
>      # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
> -    excludes =3D (d.getVar("RM_WORK_EXCLUDE", True) or "").split()
> -    pn =3D d.getVar("PN", True)
> +    excludes =3D (d.getVar("RM_WORK_EXCLUDE") or "").split()
> +    pn =3D d.getVar("PN")
>      if pn in excludes:
>          d.delVarFlag('rm_work_rootfs', 'cleandirs')
>          d.delVarFlag('rm_work_populatesdk', 'cleandirs')
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/root=
fs-postcommands.bbclass
> index 0c7ceea..8d48a2d 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -217,9 +217,9 @@ python write_image_manifest () {
>      from oe.rootfs import image_list_installed_packages
>      from oe.utils import format_pkg_list
> =20
> -    deploy_dir =3D d.getVar('IMGDEPLOYDIR', True)
> -    link_name =3D d.getVar('IMAGE_LINK_NAME', True)
> -    manifest_name =3D d.getVar('IMAGE_MANIFEST', True)
> +    deploy_dir =3D d.getVar('IMGDEPLOYDIR')
> +    link_name =3D d.getVar('IMAGE_LINK_NAME')
> +    manifest_name =3D d.getVar('IMAGE_MANIFEST')
> =20
>      if not manifest_name:
>          return
> diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bb=
class
> index f79fca6..e8facd4 100644
> --- a/meta/classes/rootfs_deb.bbclass
> +++ b/meta/classes/rootfs_deb.bbclass
> @@ -14,7 +14,7 @@ do_rootfs[lockfiles] +=3D "${DEPLOY_DIR_DEB}/deb.lock"
>  do_populate_sdk[lockfiles] +=3D "${DEPLOY_DIR_DEB}/deb.lock"
> =20
>  python rootfs_deb_bad_recommendations() {
> -    if d.getVar("BAD_RECOMMENDATIONS", True):
> +    if d.getVar("BAD_RECOMMENDATIONS"):
>          bb.warn("Debian package install does not support BAD_RECOMMENDAT=
IONS")
>  }
>  do_rootfs[prefuncs] +=3D "rootfs_deb_bad_recommendations"
> @@ -25,7 +25,7 @@ opkglibdir =3D "${localstatedir}/lib/opkg"
> =20
>  python () {
>      # Map TARGET_ARCH to Debian's ideas about architectures
> -    darch =3D d.getVar('SDK_ARCH', True)
> +    darch =3D d.getVar('SDK_ARCH')
>      if darch in ["x86", "i486", "i586", "i686", "pentium"]:
>           d.setVar('DEB_SDK_ARCH', 'i386')
>      elif darch =3D=3D "x86_64":
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bb=
class
> index d5c38fe..8c60398 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -27,7 +27,7 @@ MULTILIBRE_ALLOW_REP =3D "${OPKGLIBDIR}/opkg|/usr/lib/o=
pkg"
> =20
>  python () {
> =20
> -    if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
> +    if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
>          flags =3D d.getVarFlag('do_rootfs', 'recrdeptask', True)
>          flags =3D flags.replace("do_package_write_ipk", "")
>          flags =3D flags.replace("do_deploy", "")
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bb=
class
> index 37730a7..20beb7c 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -25,7 +25,7 @@ do_rootfs[recrdeptask] +=3D "do_package_write_rpm"
>  do_rootfs[vardeps] +=3D "PACKAGE_FEED_URIS"
> =20
>  python () {
> -    if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
> +    if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
>          flags =3D d.getVarFlag('do_rootfs', 'recrdeptask', True)
>          flags =3D flags.replace("do_package_write_rpm", "")
>          flags =3D flags.replace("do_deploy", "")
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 921b248..9674ae9 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -6,7 +6,7 @@ SANITY_REQUIRED_UTILITIES ?=3D "patch diffstat makeinfo g=
it bzip2 tar \
>      gzip gawk chrpath wget cpio perl file"
> =20
>  def bblayers_conf_file(d):
> -    return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
> +    return os.path.join(d.getVar('TOPDIR'), 'conf/bblayers.conf')
> =20
>  def sanity_conf_read(fn):
>      with open(fn, 'r') as f:
> @@ -39,8 +39,8 @@ SANITY_DIFF_TOOL ?=3D "meld"
>  SANITY_LOCALCONF_SAMPLE ?=3D "${COREBASE}/meta*/conf/local.conf.sample"
>  python oecore_update_localconf() {
>      # Check we are using a valid local.conf
> -    current_conf  =3D d.getVar('CONF_VERSION', True)
> -    conf_version =3D  d.getVar('LOCALCONF_VERSION', True)
> +    current_conf  =3D d.getVar('CONF_VERSION')
> +    conf_version =3D  d.getVar('LOCALCONF_VERSION')
> =20
>      failmsg =3D """Your version of local.conf was generated from an olde=
r/newer version of=20
>  local.conf.sample and there have been updates made to this file. Please =
compare the two=20
> @@ -59,8 +59,8 @@ is a good way to visualise the changes."""
>  SANITY_SITECONF_SAMPLE ?=3D "${COREBASE}/meta*/conf/site.conf.sample"
>  python oecore_update_siteconf() {
>      # If we have a site.conf, check it's valid
> -    current_sconf =3D d.getVar('SCONF_VERSION', True)
> -    sconf_version =3D d.getVar('SITE_CONF_VERSION', True)
> +    current_sconf =3D d.getVar('SCONF_VERSION')
> +    sconf_version =3D d.getVar('SITE_CONF_VERSION')
> =20
>      failmsg =3D """Your version of site.conf was generated from an older=
 version of=20
>  site.conf.sample and there have been updates made to this file. Please c=
ompare the two=20
> @@ -80,8 +80,8 @@ SANITY_BBLAYERCONF_SAMPLE ?=3D "${COREBASE}/meta*/conf/=
bblayers.conf.sample"
>  python oecore_update_bblayers() {
>      # bblayers.conf is out of date, so see if we can resolve that
> =20
> -    current_lconf =3D int(d.getVar('LCONF_VERSION', True))
> -    lconf_version =3D int(d.getVar('LAYER_CONF_VERSION', True))
> +    current_lconf =3D int(d.getVar('LCONF_VERSION'))
> +    lconf_version =3D int(d.getVar('LAYER_CONF_VERSION'))
> =20
>      failmsg =3D """Your version of bblayers.conf has the wrong LCONF_VER=
SION (has ${LCONF_VERSION}, expecting ${LAYER_CONF_VERSION}).
>  Please compare your file against bblayers.conf.sample and merge any chan=
ges before continuing.
> @@ -141,7 +141,7 @@ is a good way to visualise the changes."""
>          # Handle rename of meta-yocto -> meta-poky
>          # This marks the start of separate version numbers but code is n=
eeded in OE-Core
>          # for the migration, one last time.
> -        layers =3D d.getVar('BBLAYERS', True).split()
> +        layers =3D d.getVar('BBLAYERS').split()
>          layers =3D [ os.path.basename(path) for path in layers ]
>          if 'meta-yocto' in layers:
>              found =3D False
> @@ -172,7 +172,7 @@ is a good way to visualise the changes."""
>  }
> =20
>  def raise_sanity_error(msg, d, network_error=3DFalse):
> -    if d.getVar("SANITY_USE_EVENTS", True) =3D=3D "1":
> +    if d.getVar("SANITY_USE_EVENTS") =3D=3D "1":
>          try:
>              bb.event.fire(bb.event.SanityCheckFailed(msg, network_error)=
, d)
>          except TypeError:
> @@ -198,7 +198,7 @@ def check_toolchain_tune_args(data, tune, multilib, e=
rrs):
>      return found_errors
> =20
>  def check_toolchain_args_present(data, tune, multilib, tune_errors, whic=
h):
> -    args_set =3D (data.getVar("TUNE_%s" % which, True) or "").split()
> +    args_set =3D (data.getVar("TUNE_%s" % which) or "").split()
>      args_wanted =3D (data.getVar("TUNEABI_REQUIRED_%s_tune-%s" % (which,=
 tune), True) or "").split()
>      args_missing =3D []
> =20
> @@ -228,7 +228,7 @@ def check_toolchain_tune(data, tune, multilib):
>          localdata.setVar("OVERRIDES", overrides)
>      bb.data.update_data(localdata)
>      bb.debug(2, "Sanity-checking tuning '%s' (%s) features:" % (tune, mu=
ltilib))
> -    features =3D (localdata.getVar("TUNE_FEATURES_tune-%s" % tune, True)=
 or "").split()
> +    features =3D (localdata.getVar("TUNE_FEATURES_tune-%s" % tune) or ""=
).split()
>      if not features:
>          return "Tuning '%s' has no defined features, and cannot be used.=
" % tune
>      valid_tunes =3D localdata.getVarFlags('TUNEVALID') or {}
> @@ -248,9 +248,9 @@ def check_toolchain_tune(data, tune, multilib):
>              bb.debug(2, "  %s: %s" % (feature, valid_tunes[feature]))
>          else:
>              tune_errors.append("Feature '%s' is not defined." % feature)
> -    whitelist =3D localdata.getVar("TUNEABI_WHITELIST", True)
> +    whitelist =3D localdata.getVar("TUNEABI_WHITELIST")
>      if whitelist:
> -        tuneabi =3D localdata.getVar("TUNEABI_tune-%s" % tune, True)
> +        tuneabi =3D localdata.getVar("TUNEABI_tune-%s" % tune)
>          if not tuneabi:
>              tuneabi =3D tune
>          if True not in [x in whitelist.split() for x in tuneabi.split()]:
> @@ -264,13 +264,13 @@ def check_toolchain_tune(data, tune, multilib):
> =20
>  def check_toolchain(data):
>      tune_error_set =3D []
> -    deftune =3D data.getVar("DEFAULTTUNE", True)
> +    deftune =3D data.getVar("DEFAULTTUNE")
>      tune_errors =3D check_toolchain_tune(data, deftune, 'default')
>      if tune_errors:
>          tune_error_set.append(tune_errors)
> =20
> -    multilibs =3D (data.getVar("MULTILIB_VARIANTS", True) or "").split()
> -    global_multilibs =3D (data.getVar("MULTILIB_GLOBAL_VARIANTS", True) =
or "").split()
> +    multilibs =3D (data.getVar("MULTILIB_VARIANTS") or "").split()
> +    global_multilibs =3D (data.getVar("MULTILIB_GLOBAL_VARIANTS") or "")=
=2Esplit()
> =20
>      if multilibs:
>          seen_libs =3D []
> @@ -282,7 +282,7 @@ def check_toolchain(data):
>                  seen_libs.append(lib)
>              if not lib in global_multilibs:
>                  tune_error_set.append("Multilib %s is not present in MUL=
TILIB_GLOBAL_VARIANTS" % lib)
> -            tune =3D data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % l=
ib, True)
> +            tune =3D data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % l=
ib)
>              if tune in seen_tunes:
>                  tune_error_set.append("The tuning '%s' appears in more t=
han one multilib." % tune)
>              else:
> @@ -360,10 +360,10 @@ def check_connectivity(d):
>      # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
>      # using the same syntax as for SRC_URI. If the variable is not set
>      # the check is skipped
> -    test_uris =3D (d.getVar('CONNECTIVITY_CHECK_URIS', True) or "").spli=
t()
> +    test_uris =3D (d.getVar('CONNECTIVITY_CHECK_URIS') or "").split()
>      retval =3D ""
> =20
> -    bbn =3D d.getVar('BB_NO_NETWORK', True)
> +    bbn =3D d.getVar('BB_NO_NETWORK')
>      if bbn not in (None, '0', '1'):
>          return 'BB_NO_NETWORK should be "0" or "1", but it is "%s"' % bbn
> =20
> @@ -382,7 +382,7 @@ def check_connectivity(d):
>          except Exception as err:
>              # Allow the message to be configured so that users can be
>              # pointed to a support mechanism.
> -            msg =3D data.getVar('CONNECTIVITY_CHECK_MSG', True) or ""
> +            msg =3D data.getVar('CONNECTIVITY_CHECK_MSG') or ""
>              if len(msg) =3D=3D 0:
>                  msg =3D "%s.\n" % err
>                  msg +=3D "    Please ensure your host's network is confi=
gured correctly,\n"
> @@ -395,7 +395,7 @@ def check_connectivity(d):
>  def check_supported_distro(sanity_data):
>      from fnmatch import fnmatch
> =20
> -    tested_distros =3D sanity_data.getVar('SANITY_TESTED_DISTROS', True)
> +    tested_distros =3D sanity_data.getVar('SANITY_TESTED_DISTROS')
>      if not tested_distros:
>          return
> =20
> @@ -418,17 +418,17 @@ def check_sanity_validmachine(sanity_data):
>      messages =3D ""
> =20
>      # Check TUNE_ARCH is set
> -    if sanity_data.getVar('TUNE_ARCH', True) =3D=3D 'INVALID':
> +    if sanity_data.getVar('TUNE_ARCH') =3D=3D 'INVALID':
>          messages =3D messages + 'TUNE_ARCH is unset. Please ensure your =
MACHINE configuration includes a valid tune configuration file which will s=
et this correctly.\n'
> =20
>      # Check TARGET_OS is set
> -    if sanity_data.getVar('TARGET_OS', True) =3D=3D 'INVALID':
> +    if sanity_data.getVar('TARGET_OS') =3D=3D 'INVALID':
>          messages =3D messages + 'Please set TARGET_OS directly, or choos=
e a MACHINE or DISTRO that does so.\n'
> =20
>      # Check that we don't have duplicate entries in PACKAGE_ARCHS & that=
 TUNE_PKGARCH is in PACKAGE_ARCHS
> -    pkgarchs =3D sanity_data.getVar('PACKAGE_ARCHS', True)
> -    tunepkg =3D sanity_data.getVar('TUNE_PKGARCH', True)
> -    defaulttune =3D sanity_data.getVar('DEFAULTTUNE', True)
> +    pkgarchs =3D sanity_data.getVar('PACKAGE_ARCHS')
> +    tunepkg =3D sanity_data.getVar('TUNE_PKGARCH')
> +    defaulttune =3D sanity_data.getVar('DEFAULTTUNE')
>      tunefound =3D False
>      seen =3D {}
>      dups =3D []
> @@ -476,7 +476,7 @@ def check_gcc_march(sanity_data):
>                  result =3D True;
> =20
>          if not result:
> -            build_arch =3D sanity_data.getVar('BUILD_ARCH', True)
> +            build_arch =3D sanity_data.getVar('BUILD_ARCH')
>              status,res =3D oe.utils.getstatusoutput(sanity_data.expand("=
${BUILD_CC} -march=3D%s gcc_test.c -o gcc_test" % build_arch))
>              if status =3D=3D 0:
>                  message =3D "BUILD_CFLAGS_append =3D \" -march=3D%s\"" %=
 build_arch
> @@ -564,11 +564,11 @@ def check_perl_modules(sanity_data):
>      return None
> =20
>  def sanity_check_conffiles(d):
> -    funcs =3D d.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
> +    funcs =3D d.getVar('BBLAYERS_CONF_UPDATE_FUNCS').split()
>      for func in funcs:
>          conffile, current_version, required_version, func =3D func.split=
(":")
> -        if check_conf_exists(conffile, d) and d.getVar(current_version, =
True) is not None and \
> -                d.getVar(current_version, True) !=3D d.getVar(required_v=
ersion, True):
> +        if check_conf_exists(conffile, d) and d.getVar(current_version) =
is not None and \
> +                d.getVar(current_version) !=3D d.getVar(required_version=
):
>              try:
>                  bb.build.exec_func(func, d, pythonexception=3DTrue)
>              except NotImplementedError as e:
> @@ -581,8 +581,8 @@ def sanity_handle_abichanges(status, d):
>      #
>      import subprocess
> =20
> -    current_abi =3D d.getVar('OELAYOUT_ABI', True)
> -    abifile =3D d.getVar('SANITY_ABIFILE', True)
> +    current_abi =3D d.getVar('OELAYOUT_ABI')
> +    abifile =3D d.getVar('SANITY_ABIFILE')
>      if os.path.exists(abifile):
>          with open(abifile, "r") as f:
>              abi =3D f.read().strip()
> @@ -677,12 +677,12 @@ def check_sanity_version_change(status, d):
>          missing =3D missing + "GNU make,"
> =20
>      if not check_app_exists('${BUILD_CC}', d):
> -        missing =3D missing + "C Compiler (%s)," % d.getVar("BUILD_CC", =
True)
> +        missing =3D missing + "C Compiler (%s)," % d.getVar("BUILD_CC")
> =20
>      if not check_app_exists('${BUILD_CXX}', d):
> -        missing =3D missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX=
", True)
> +        missing =3D missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX=
")
> =20
> -    required_utilities =3D d.getVar('SANITY_REQUIRED_UTILITIES', True)
> +    required_utilities =3D d.getVar('SANITY_REQUIRED_UTILITIES')
> =20
>      for util in required_utilities.split():
>          if not check_app_exists(util, d):
> @@ -692,7 +692,7 @@ def check_sanity_version_change(status, d):
>          missing =3D missing.rstrip(',')
>          status.addresult("Please install the following missing utilities=
: %s\n" % missing)
> =20
> -    assume_provided =3D d.getVar('ASSUME_PROVIDED', True).split()
> +    assume_provided =3D d.getVar('ASSUME_PROVIDED').split()
>      # Check user doesn't have ASSUME_PROVIDED =3D instead of +=3D in loc=
al.conf
>      if "diffstat-native" not in assume_provided:
>          status.addresult('Please use ASSUME_PROVIDED +=3D, not ASSUME_PR=
OVIDED =3D in your local.conf\n')
> @@ -715,7 +715,7 @@ def check_sanity_version_change(status, d):
>          status.addresult("        __sync_bool_compare_and_swap (&atomic,=
 2, 3);\n")
> =20
>      # Check that TMPDIR isn't on a filesystem with limited filename leng=
th (eg. eCryptFS)
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
>      status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
>      tmpdirmode =3D os.stat(tmpdir).st_mode
>      if (tmpdirmode & stat.S_ISGID):
> @@ -739,7 +739,7 @@ def check_sanity_version_change(status, d):
>      if netcheck:
>          status.network_error =3D True
> =20
> -    nolibs =3D d.getVar('NO32LIBS', True)
> +    nolibs =3D d.getVar('NO32LIBS')
>      if not nolibs:
>          lib32path =3D '/lib'
>          if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os=
=2Epath.islink('/lib') ):
> @@ -748,7 +748,7 @@ def check_sanity_version_change(status, d):
>          if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.ex=
ists('/usr/include/gnu/stubs-32.h'):
>              status.addresult("You have a 32-bit libc, but no 32-bit head=
ers.  You must install the 32-bit libc headers.\n")
> =20
> -    bbpaths =3D d.getVar('BBPATH', True).split(":")
> +    bbpaths =3D d.getVar('BBPATH').split(":")
>      if ("." in bbpaths or "./" in bbpaths or "" in bbpaths):
>          status.addresult("BBPATH references the current directory, eithe=
r through "    \
>                  "an empty entry, a './' or a '.'.\n\t This is unsafe and=
 means your "\
> @@ -758,7 +758,7 @@ def check_sanity_version_change(status, d):
>                  "references.\n" \
>                  "Parsed BBPATH is" + str(bbpaths));
> =20
> -    oes_bb_conf =3D d.getVar( 'OES_BITBAKE_CONF', True)
> +    oes_bb_conf =3D d.getVar( 'OES_BITBAKE_CONF')
>      if not oes_bb_conf:
>          status.addresult('You are not using the OpenEmbedded version of =
conf/bitbake.conf. This means your environment is misconfigured, in particu=
lar check BBPATH.\n')
> =20
> @@ -793,26 +793,26 @@ def check_sanity_everybuild(status, d):
> =20
>      # Check the bitbake version meets minimum requirements
>      from distutils.version import LooseVersion
> -    minversion =3D d.getVar('BB_MIN_VERSION', True)
> +    minversion =3D d.getVar('BB_MIN_VERSION')
>      if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
>          status.addresult('Bitbake version %s is required and version %s =
was found\n' % (minversion, bb.__version__))
> =20
>      sanity_check_locale(d)
> =20
> -    paths =3D d.getVar('PATH', True).split(":")
> +    paths =3D d.getVar('PATH').split(":")
>      if "." in paths or "./" in paths or "" in paths:
>          status.addresult("PATH contains '.', './' or '' (empty element),=
 which will break the build, please remove this.\nParsed PATH is " + str(pa=
ths) + "\n")
> =20
>      # Check that the DISTRO is valid, if set
>      # need to take into account DISTRO renaming DISTRO
> -    distro =3D d.getVar('DISTRO', True)
> +    distro =3D d.getVar('DISTRO')
>      if distro and distro !=3D "nodistro":
>          if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or c=
heck_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
> -            status.addresult("DISTRO '%s' not found. Please set a valid =
DISTRO in your local.conf\n" % d.getVar("DISTRO", True))
> +            status.addresult("DISTRO '%s' not found. Please set a valid =
DISTRO in your local.conf\n" % d.getVar("DISTRO"))
> =20
>      # Check that DL_DIR is set, exists and is writable. In theory, we sh=
ould never even hit the check if DL_DIR isn't=20
>      # set, since so much relies on it being set.
> -    dldir =3D d.getVar('DL_DIR', True)
> +    dldir =3D d.getVar('DL_DIR')
>      if not dldir:
>          status.addresult("DL_DIR is not set. Your environment is misconf=
igured, check that DL_DIR is set, and if the directory exists, that it is w=
ritable. \n")
>      if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
> @@ -821,7 +821,7 @@ def check_sanity_everybuild(status, d):
> =20
>      # Check that the MACHINE is valid, if it is set
>      machinevalid =3D True
> -    if d.getVar('MACHINE', True):
> +    if d.getVar('MACHINE'):
>          if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
>              status.addresult('Please set a valid MACHINE in your local.c=
onf or environment\n')
>              machinevalid =3D False
> @@ -834,7 +834,7 @@ def check_sanity_everybuild(status, d):
>          status.addresult(check_toolchain(d))
> =20
>      # Check that the SDKMACHINE is valid, if it is set
> -    if d.getVar('SDKMACHINE', True):
> +    if d.getVar('SDKMACHINE'):
>          if not check_conf_exists("conf/machine-sdk/${SDKMACHINE}.conf", =
d):
>              status.addresult('Specified SDKMACHINE value is not valid\n')
>          elif d.getVar('SDK_ARCH', False) =3D=3D "${BUILD_ARCH}":
> @@ -847,7 +847,7 @@ def check_sanity_everybuild(status, d):
>          status.addresult("Please use a umask which allows a+rx and u+rwx=
\n")
>      os.umask(omask)
> =20
> -    if d.getVar('TARGET_ARCH', True) =3D=3D "arm":
> +    if d.getVar('TARGET_ARCH') =3D=3D "arm":
>          # This path is no longer user-readable in modern (very recent) L=
inux
>          try:
>              if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> @@ -860,7 +860,7 @@ def check_sanity_everybuild(status, d):
>          except:
>              pass
> =20
> -    oeroot =3D d.getVar('COREBASE', True)
> +    oeroot =3D d.getVar('COREBASE')
>      if oeroot.find('+') !=3D -1:
>          status.addresult("Error, you have an invalid character (+) in yo=
ur COREBASE directory path. Please move the installation to a directory whi=
ch doesn't include any + characters.")
>      if oeroot.find('@') !=3D -1:
> @@ -875,7 +875,7 @@ def check_sanity_everybuild(status, d):
>                   'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
>                   'bzr', 'cvs', 'npm', 'sftp', 'ssh']
>      for mirror_var in mirror_vars:
> -        mirrors =3D (d.getVar(mirror_var, True) or '').replace('\\n', '\=
n').split('\n')
> +        mirrors =3D (d.getVar(mirror_var) or '').replace('\\n', '\n').sp=
lit('\n')
>          for mirror_entry in mirrors:
>              mirror_entry =3D mirror_entry.strip()
>              if not mirror_entry:
> @@ -914,7 +914,7 @@ def check_sanity_everybuild(status, d):
>                      check_symlink(mirror_base, d)
> =20
>      # Check that TMPDIR hasn't changed location since the last time we w=
ere run
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
>      checkfile =3D os.path.join(tmpdir, "saved_tmpdir")
>      if os.path.exists(checkfile):
>          with open(checkfile, "r") as f:
> @@ -951,8 +951,8 @@ def check_sanity(sanity_data):
> =20
>      status =3D SanityStatus()
> =20
> -    tmpdir =3D sanity_data.getVar('TMPDIR', True)
> -    sstate_dir =3D sanity_data.getVar('SSTATE_DIR', True)
> +    tmpdir =3D sanity_data.getVar('TMPDIR')
> +    sstate_dir =3D sanity_data.getVar('SSTATE_DIR')
> =20
>      check_symlink(sstate_dir, sanity_data)
> =20
> @@ -976,7 +976,7 @@ def check_sanity(sanity_data):
> =20
>      check_sanity_everybuild(status, sanity_data)
>     =20
> -    sanity_version =3D int(sanity_data.getVar('SANITY_VERSION', True) or=
 1)
> +    sanity_version =3D int(sanity_data.getVar('SANITY_VERSION') or 1)
>      network_error =3D False
>      # NATIVELSBSTRING var may have been overridden with "universal", so
>      # get actual host distribution id and version
> diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
> index a481f6d..e5057b7 100644
> --- a/meta/classes/sign_ipk.bbclass
> +++ b/meta/classes/sign_ipk.bbclass
> @@ -29,10 +29,10 @@ IPK_GPG_SIGNATURE_TYPE ?=3D 'ASC'
>  python () {
>      # Check configuration
>      for var in ('IPK_GPG_NAME', 'IPK_GPG_PASSPHRASE_FILE'):
> -        if not d.getVar(var, True):
> +        if not d.getVar(var):
>              raise_sanity_error("You need to define %s in the config" % v=
ar, d)
> =20
> -    sigtype =3D d.getVar("IPK_GPG_SIGNATURE_TYPE", True)
> +    sigtype =3D d.getVar("IPK_GPG_SIGNATURE_TYPE")
>      if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
>          raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), u=
se either ASC or BIN" % sigtype)
>  }
> @@ -42,11 +42,11 @@ def sign_ipk(d, ipk_to_sign):
> =20
>      bb.debug(1, 'Signing ipk: %s' % ipk_to_sign)
> =20
> -    signer =3D get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
> -    sig_type =3D d.getVar('IPK_GPG_SIGNATURE_TYPE', True)
> +    signer =3D get_signer(d, d.getVar('IPK_GPG_BACKEND'))
> +    sig_type =3D d.getVar('IPK_GPG_SIGNATURE_TYPE')
>      is_ascii_sig =3D (sig_type.upper() !=3D "BIN")
> =20
>      signer.detach_sign(ipk_to_sign,
> -                       d.getVar('IPK_GPG_NAME', True),
> -                       d.getVar('IPK_GPG_PASSPHRASE_FILE', True),
> +                       d.getVar('IPK_GPG_NAME'),
> +                       d.getVar('IPK_GPG_PASSPHRASE_FILE'),
>                         armor=3Dis_ascii_sig)
> diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_p=
ackage_feed.bbclass
> index 31a6e9b..71df03b 100644
> --- a/meta/classes/sign_package_feed.bbclass
> +++ b/meta/classes/sign_package_feed.bbclass
> @@ -31,10 +31,10 @@ PACKAGE_FEED_GPG_SIGNATURE_TYPE ?=3D 'ASC'
>  python () {
>      # Check sanity of configuration
>      for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FI=
LE'):
> -        if not d.getVar(var, True):
> +        if not d.getVar(var):
>              raise_sanity_error("You need to define %s in the config" % v=
ar, d)
> =20
> -    sigtype =3D d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE", True)
> +    sigtype =3D d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE")
>      if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
>          raise_sanity_error("Bad value for PACKAGE_FEED_GPG_SIGNATURE_TYP=
E (%s), use either ASC or BIN" % sigtype)
>  }
> diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
> index a8ea75f..2a08020 100644
> --- a/meta/classes/sign_rpm.bbclass
> +++ b/meta/classes/sign_rpm.bbclass
> @@ -22,11 +22,11 @@ RPM_GPG_BACKEND ?=3D 'local'
> =20
> =20
>  python () {
> -    if d.getVar('RPM_GPG_PASSPHRASE_FILE', True):
> +    if d.getVar('RPM_GPG_PASSPHRASE_FILE'):
>          raise_sanity_error('RPM_GPG_PASSPHRASE_FILE is replaced by RPM_G=
PG_PASSPHRASE', d)
>      # Check configuration
>      for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE'):
> -        if not d.getVar(var, True):
> +        if not d.getVar(var):
>              raise_sanity_error("You need to define %s in the config" % v=
ar, d)
> =20
>      # Set the expected location of the public key
> @@ -41,12 +41,12 @@ python sign_rpm () {
>      import glob
>      from oe.gpg_sign import get_signer
> =20
> -    signer =3D get_signer(d, d.getVar('RPM_GPG_BACKEND', True))
> -    rpms =3D glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
> +    signer =3D get_signer(d, d.getVar('RPM_GPG_BACKEND'))
> +    rpms =3D glob.glob(d.getVar('RPM_PKGWRITEDIR') + '/*')
> =20
>      signer.sign_rpms(rpms,
> -                     d.getVar('RPM_GPG_NAME', True),
> -                     d.getVar('RPM_GPG_PASSPHRASE', True))
> +                     d.getVar('RPM_GPG_NAME'),
> +                     d.getVar('RPM_GPG_PASSPHRASE'))
>  }
> =20
>  do_package_index[depends] +=3D "signing-keys:do_deploy"
> diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bb=
class
> index 45dce48..9d51a02 100644
> --- a/meta/classes/siteconfig.bbclass
> +++ b/meta/classes/siteconfig.bbclass
> @@ -2,7 +2,7 @@ python siteconfig_do_siteconfig () {
>  	shared_state =3D sstate_state_fromvars(d)
>  	if shared_state['task'] !=3D 'populate_sysroot':
>  		return
> -	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME', True), 'site=
_config')):
> +	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME'), 'site_confi=
g')):
>  		bb.debug(1, "No site_config directory, skipping do_siteconfig")
>  		return
>  	bb.build.exec_func('do_siteconfig_gencache', d)
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
> index 6eca004..abb194f 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -113,14 +113,14 @@ def siteinfo_data(d):
> =20
>      # Add in any extra user supplied data which may come from a BSP laye=
r, removing the
>      # need to always change this class directly
> -    extra_siteinfo =3D (d.getVar("SITEINFO_EXTRA_DATAFUNCS", True) or ""=
).split()
> +    extra_siteinfo =3D (d.getVar("SITEINFO_EXTRA_DATAFUNCS") or "").spli=
t()
>      for m in extra_siteinfo:
>          call =3D m + "(archinfo, osinfo, targetinfo, d)"
>          locs =3D { "archinfo" : archinfo, "osinfo" : osinfo, "targetinfo=
" : targetinfo, "d" : d}
>          archinfo, osinfo, targetinfo =3D bb.utils.better_eval(call, locs)
> =20
> -    hostarch =3D d.getVar("HOST_ARCH", True)
> -    hostos =3D d.getVar("HOST_OS", True)
> +    hostarch =3D d.getVar("HOST_ARCH")
> +    hostos =3D d.getVar("HOST_OS")
>      target =3D "%s-%s" % (hostarch, hostos)
> =20
>      sitedata =3D []
> @@ -144,7 +144,7 @@ python () {
>          d.setVar("SITEINFO_ENDIANNESS", "be")
>      else:
>          bb.error("Unable to determine endianness for architecture '%s'" %
> -                 d.getVar("HOST_ARCH", True))
> +                 d.getVar("HOST_ARCH"))
>          bb.fatal("Please add your architecture to siteinfo.bbclass")
> =20
>      if "bit-32" in sitedata:
> @@ -153,14 +153,14 @@ python () {
>          d.setVar("SITEINFO_BITS", "64")
>      else:
>          bb.error("Unable to determine bit size for architecture '%s'" %
> -                 d.getVar("HOST_ARCH", True))
> +                 d.getVar("HOST_ARCH"))
>          bb.fatal("Please add your architecture to siteinfo.bbclass")
>  }
> =20
>  def siteinfo_get_files(d, aclocalcache =3D False):
>      sitedata =3D siteinfo_data(d)
>      sitefiles =3D ""
> -    for path in d.getVar("BBPATH", True).split(":"):
> +    for path in d.getVar("BBPATH").split(":"):
>          for element in sitedata:
>              filename =3D os.path.join(path, "site", element)
>              if os.path.exists(filename):
> @@ -177,7 +177,7 @@ def siteinfo_get_files(d, aclocalcache =3D False):
>      # issues and the directory being created/removed whilst this code ex=
ecutes. This can happen
>      # when a multilib recipe is parsed along with its base variant which=
 may be running at the time
>      # causing rare but nasty failures
> -    path_siteconfig =3D d.getVar('ACLOCALDIR', True)
> +    path_siteconfig =3D d.getVar('ACLOCALDIR')
>      if path_siteconfig and os.path.isdir(path_siteconfig):
>          for i in os.listdir(path_siteconfig):
>              if not i.endswith("_config"):
> diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
> index 89394d3..c5f544d 100644
> --- a/meta/classes/spdx.bbclass
> +++ b/meta/classes/spdx.bbclass
> @@ -26,20 +26,20 @@ python do_spdx () {
>      import json, shutil
> =20
>      info =3D {}=20
> -    info['workdir'] =3D d.getVar('WORKDIR', True)
> -    info['sourcedir'] =3D d.getVar('SPDX_S', True)
> -    info['pn'] =3D d.getVar('PN', True)
> -    info['pv'] =3D d.getVar('PV', True)
> -    info['spdx_version'] =3D d.getVar('SPDX_VERSION', True)
> -    info['data_license'] =3D d.getVar('DATA_LICENSE', True)
> -
> -    sstatedir =3D d.getVar('SPDXSSTATEDIR', True)
> +    info['workdir'] =3D d.getVar('WORKDIR')
> +    info['sourcedir'] =3D d.getVar('SPDX_S')
> +    info['pn'] =3D d.getVar('PN')
> +    info['pv'] =3D d.getVar('PV')
> +    info['spdx_version'] =3D d.getVar('SPDX_VERSION')
> +    info['data_license'] =3D d.getVar('DATA_LICENSE')
> +
> +    sstatedir =3D d.getVar('SPDXSSTATEDIR')
>      sstatefile =3D os.path.join(sstatedir, info['pn'] + info['pv'] + ".s=
pdx")
> =20
> -    manifest_dir =3D d.getVar('SPDX_MANIFEST_DIR', True)
> +    manifest_dir =3D d.getVar('SPDX_MANIFEST_DIR')
>      info['outfile'] =3D os.path.join(manifest_dir, info['pn'] + ".spdx" )
> =20
> -    info['spdx_temp_dir'] =3D d.getVar('SPDX_TEMP_DIR', True)
> +    info['spdx_temp_dir'] =3D d.getVar('SPDX_TEMP_DIR')
>      info['tar_file'] =3D os.path.join(info['workdir'], info['pn'] + ".ta=
r.gz" )
> =20
>      # Make sure important dirs exist
> @@ -74,9 +74,9 @@ python do_spdx () {
>          foss_license_info =3D cached_spdx['Licenses']
>      else:
>          ## setup fossology command
> -        foss_server =3D d.getVar('FOSS_SERVER', True)
> -        foss_flags =3D d.getVar('FOSS_WGET_FLAGS', True)
> -        foss_full_spdx =3D d.getVar('FOSS_FULL_SPDX', True) =3D=3D "true=
" or False
> +        foss_server =3D d.getVar('FOSS_SERVER')
> +        foss_flags =3D d.getVar('FOSS_WGET_FLAGS')
> +        foss_full_spdx =3D d.getVar('FOSS_FULL_SPDX') =3D=3D "true" or F=
alse
>          foss_command =3D "wget %s --post-file=3D%s %s"\
>              % (foss_flags, info['tar_file'], foss_server)
>         =20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 8643f3d..546e276 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -11,7 +11,7 @@ def generate_sstatefn(spec, hash, d):
>  SSTATE_PKGARCH    =3D "${PACKAGE_ARCH}"
>  SSTATE_PKGSPEC    =3D "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TA=
RGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
>  SSTATE_SWSPEC     =3D "sstate:${PN}::${PV}:${PR}::${SSTATE_VERSION}:"
> -SSTATE_PKGNAME    =3D "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar(=
'SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
> +SSTATE_PKGNAME    =3D "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar(=
'SSTATE_PKGSPEC'), d.getVar('BB_TASKHASH'), d)}"
>  SSTATE_PKG        =3D "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>  SSTATE_EXTRAPATH   =3D ""
>  SSTATE_EXTRAPATHWILDCARD =3D ""
> @@ -34,7 +34,7 @@ SSTATE_DUPWHITELIST +=3D "${DEPLOY_DIR_SRC}"
>  SSTATE_DUPWHITELIST +=3D "${DEPLOY_DIR}/sdk/README_-_DO_NOT_DELETE_FILES=
_IN_THIS_DIRECTORY.txt"
> =20
>  SSTATE_SCAN_FILES ?=3D "*.la *-config *_config"
> -SSTATE_SCAN_CMD ?=3D 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name =
\"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
> +SSTATE_SCAN_CMD ?=3D 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name =
\"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
> =20
>  BB_HASHFILENAME =3D "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
> =20
> @@ -84,7 +84,7 @@ python () {
>          d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))
>      elif bb.data.inherits_class('cross-canadian', d):
>          d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}=
"))
> -    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH=
", True) =3D=3D "all":
> +    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH=
") =3D=3D "all":
>          d.setVar('SSTATE_PKGARCH', "allarch")
>      else:
>          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
> @@ -100,7 +100,7 @@ python () {
>          scan_cmd =3D "grep -Irl ${STAGING_DIR} ${SSTATE_BUILDDIR}"
>          d.setVar('SSTATE_SCAN_CMD', scan_cmd)
> =20
> -    unique_tasks =3D sorted(set((d.getVar('SSTATETASKS', True) or "").sp=
lit()))
> +    unique_tasks =3D sorted(set((d.getVar('SSTATETASKS') or "").split()))
>      d.setVar('SSTATETASKS', " ".join(unique_tasks))
>      for task in unique_tasks:
>          d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
> @@ -118,7 +118,7 @@ def sstate_init(task, d):
> =20
>  def sstate_state_fromvars(d, task =3D None):
>      if task is None:
> -        task =3D d.getVar('BB_CURRENTTASK', True)
> +        task =3D d.getVar('BB_CURRENTTASK')
>          if not task:
>              bb.fatal("sstate code running without task context?!")
>          task =3D task.replace("_setscene", "")
> @@ -200,7 +200,7 @@ def sstate_install(ss, d):
>                  shareddirs.append(dstdir)
> =20
>      # Check the file list for conflicts against files which already exist
> -    whitelist =3D (d.getVar("SSTATE_DUPWHITELIST", True) or "").split()
> +    whitelist =3D (d.getVar("SSTATE_DUPWHITELIST") or "").split()
>      match =3D []
>      for f in sharedfiles:
>          if os.path.exists(f):
> @@ -239,7 +239,7 @@ def sstate_install(ss, d):
>            "things (e.g. bluez 4 and bluez 5 and the correct solution for=
 that would " \
>            "be to resolve the conflict. If in doubt, please ask on the ma=
iling list, " \
>            "sharing the error and filelist above." % \
> -          (d.getVar('PN', True), "\n ".join(match)))
> +          (d.getVar('PN'), "\n ".join(match)))
>          bb.fatal("If the above message is too much, the simpler version =
is you're advised to wipe out tmp and rebuild (reusing sstate is fine). Tha=
t will likely fix things in most (but not all) cases.")
> =20
>      # Write out the manifest
> @@ -260,7 +260,7 @@ def sstate_install(ss, d):
> =20
>      i =3D d2.expand("${SSTATE_MANIFESTS}/index-${SSTATE_MANMACH}")
>      l =3D bb.utils.lockfile(i + ".lock")
> -    filedata =3D d.getVar("STAMP", True) + " " + d2.getVar("SSTATE_MANFI=
LEPREFIX", True) + " " + d.getVar("WORKDIR", True) + "\n"
> +    filedata =3D d.getVar("STAMP") + " " + d2.getVar("SSTATE_MANFILEPREF=
IX") + " " + d.getVar("WORKDIR") + "\n"
>      manifests =3D []
>      if os.path.exists(i):
>          with open(i, "r") as f:
> @@ -275,7 +275,7 @@ def sstate_install(ss, d):
>          if os.path.exists(state[1]):
>              oe.path.copyhardlinktree(state[1], state[2])
> =20
> -    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split(=
):
> +    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
>          # All hooks should run in the SSTATE_INSTDIR
>          bb.build.exec_func(postinst, d, (sstateinst,))
> =20
> @@ -298,8 +298,8 @@ def sstate_installpkg(ss, d):
>          oe.path.remove(dir)
> =20
>      sstateinst =3D d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
> -    sstatefetch =3D d.getVar('SSTATE_PKGNAME', True) + '_' + ss['task'] =
+ ".tgz"
> -    sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['task'] + ".tg=
z"
> +    sstatefetch =3D d.getVar('SSTATE_PKGNAME') + '_' + ss['task'] + ".tg=
z"
> +    sstatepkg =3D d.getVar('SSTATE_PKG') + '_' + ss['task'] + ".tgz"
> =20
>      if not os.path.exists(sstatepkg):
>          pstaging_fetch(sstatefetch, sstatepkg, d)
> @@ -313,12 +313,12 @@ def sstate_installpkg(ss, d):
>      d.setVar('SSTATE_INSTDIR', sstateinst)
>      d.setVar('SSTATE_PKG', sstatepkg)
> =20
> -    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
> +    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
>          signer =3D get_signer(d, 'local')
>          if not signer.verify(sstatepkg + '.sig'):
>              bb.warn("Cannot verify signature on sstate package %s" % sst=
atepkg)
> =20
> -    for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['ss=
tate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').spl=
it():
> +    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_u=
npack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS') or '').split():
>          # All hooks should run in the SSTATE_INSTDIR
>          bb.build.exec_func(f, d, (sstateinst,))
> =20
> @@ -328,7 +328,7 @@ def sstate_installpkg(ss, d):
>      sstate_install(ss, d)
> =20
>      for plain in ss['plaindirs']:
> -        workdir =3D d.getVar('WORKDIR', True)
> +        workdir =3D d.getVar('WORKDIR')
>          src =3D sstateinst + "/" + plain.replace(workdir, '')
>          dest =3D plain
>          bb.utils.mkdirhier(src)
> @@ -344,12 +344,12 @@ python sstate_hardcode_path_unpack () {
>      # sstate_hardcode_path(d)
>      import subprocess
> =20
> -    sstateinst =3D d.getVar('SSTATE_INSTDIR', True)
> +    sstateinst =3D d.getVar('SSTATE_INSTDIR')
>      fixmefn =3D  sstateinst + "fixmepath"
>      if os.path.isfile(fixmefn):
> -        staging =3D d.getVar('STAGING_DIR', True)
> -        staging_target =3D d.getVar('STAGING_DIR_TARGET', True)
> -        staging_host =3D d.getVar('STAGING_DIR_HOST', True)
> +        staging =3D d.getVar('STAGING_DIR')
> +        staging_target =3D d.getVar('STAGING_DIR_TARGET')
> +        staging_host =3D d.getVar('STAGING_DIR_HOST')
> =20
>          if bb.data.inherits_class('native', d) or bb.data.inherits_class=
('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inheri=
ts_class('cross-canadian', d):
>              sstate_sed_cmd =3D "sed -i -e 's:FIXMESTAGINGDIR:%s:g'" % (s=
taging)
> @@ -358,9 +358,9 @@ python sstate_hardcode_path_unpack () {
>          else:
>              sstate_sed_cmd =3D "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" =
% (staging_host)
> =20
> -        extra_staging_fixmes =3D d.getVar('EXTRA_STAGING_FIXMES', True) =
or ''
> +        extra_staging_fixmes =3D d.getVar('EXTRA_STAGING_FIXMES') or ''
>          for fixmevar in extra_staging_fixmes.split():
> -            fixme_path =3D d.getVar(fixmevar, True)
> +            fixme_path =3D d.getVar(fixmevar)
>              sstate_sed_cmd +=3D " -e 's:FIXME_%s:%s:g'" % (fixmevar, fix=
me_path)
> =20
>          # Add sstateinst to each filename in fixmepath, use xargs to eff=
iciently call sed
> @@ -377,12 +377,12 @@ python sstate_hardcode_path_unpack () {
>  def sstate_clean_cachefile(ss, d):
>      import oe.path
> =20
> -    sstatepkgfile =3D d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['tas=
k'] + ".tgz*"
> +    sstatepkgfile =3D d.getVar('SSTATE_PATHSPEC') + "*_" + ss['task'] + =
".tgz*"
>      bb.note("Removing %s" % sstatepkgfile)
>      oe.path.remove(sstatepkgfile)
> =20
>  def sstate_clean_cachefiles(d):
> -    for task in (d.getVar('SSTATETASKS', True) or "").split():
> +    for task in (d.getVar('SSTATETASKS') or "").split():
>          ld =3D d.createCopy()
>          ss =3D sstate_state_fromvars(ld, task)
>          sstate_clean_cachefile(ss, ld)
> @@ -424,7 +424,7 @@ def sstate_clean(ss, d):
>      import glob
> =20
>      d2 =3D d.createCopy()
> -    stamp_clean =3D d.getVar("STAMPCLEAN", True)
> +    stamp_clean =3D d.getVar("STAMPCLEAN")
>      extrainf =3D d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', Tr=
ue)
>      if extrainf:
>          d2.setVar("SSTATE_MANMACH", extrainf)
> @@ -467,7 +467,7 @@ def sstate_clean(ss, d):
>              oe.path.remove(stfile)
> =20
>      # Removes the users/groups created by the package
> -    for cleanfunc in (d.getVar('SSTATECLEANFUNCS', True) or '').split():
> +    for cleanfunc in (d.getVar('SSTATECLEANFUNCS') or '').split():
>          bb.build.exec_func(cleanfunc, d)
> =20
>  sstate_clean[vardepsexclude] =3D "SSTATE_MANFILEPREFIX"
> @@ -475,13 +475,13 @@ sstate_clean[vardepsexclude] =3D "SSTATE_MANFILEPRE=
FIX"
>  CLEANFUNCS +=3D "sstate_cleanall"
> =20
>  python sstate_cleanall() {
> -    bb.note("Removing shared state for package %s" % d.getVar('PN', True=
))
> +    bb.note("Removing shared state for package %s" % d.getVar('PN'))
> =20
> -    manifest_dir =3D d.getVar('SSTATE_MANIFESTS', True)
> +    manifest_dir =3D d.getVar('SSTATE_MANIFESTS')
>      if not os.path.exists(manifest_dir):
>          return
> =20
> -    tasks =3D d.getVar('SSTATETASKS', True).split()
> +    tasks =3D d.getVar('SSTATETASKS').split()
>      for name in tasks:
>          ld =3D d.createCopy()
>          shared_state =3D sstate_state_fromvars(ld, name)
> @@ -497,10 +497,10 @@ python sstate_hardcode_path () {
>      # Note: the logic in this function needs to match the reverse logic
>      # in sstate_installpkg(ss, d)
> =20
> -    staging =3D d.getVar('STAGING_DIR', True)
> -    staging_target =3D d.getVar('STAGING_DIR_TARGET', True)
> -    staging_host =3D d.getVar('STAGING_DIR_HOST', True)
> -    sstate_builddir =3D d.getVar('SSTATE_BUILDDIR', True)
> +    staging =3D d.getVar('STAGING_DIR')
> +    staging_target =3D d.getVar('STAGING_DIR_TARGET')
> +    staging_host =3D d.getVar('STAGING_DIR_HOST')
> +    sstate_builddir =3D d.getVar('SSTATE_BUILDDIR')
> =20
>      if bb.data.inherits_class('native', d) or bb.data.inherits_class('na=
tivesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_c=
lass('cross-canadian', d):
>          sstate_grep_cmd =3D "grep -l -e '%s'" % (staging)
> @@ -512,14 +512,14 @@ python sstate_hardcode_path () {
>          sstate_grep_cmd =3D "grep -l -e '%s'" % (staging_host)
>          sstate_sed_cmd =3D "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (s=
taging_host)
> =20
> -    extra_staging_fixmes =3D d.getVar('EXTRA_STAGING_FIXMES', True) or ''
> +    extra_staging_fixmes =3D d.getVar('EXTRA_STAGING_FIXMES') or ''
>      for fixmevar in extra_staging_fixmes.split():
> -        fixme_path =3D d.getVar(fixmevar, True)
> +        fixme_path =3D d.getVar(fixmevar)
>          sstate_sed_cmd +=3D " -e 's:%s:FIXME_%s:g'" % (fixme_path, fixme=
var)
> =20
>      fixmefn =3D  sstate_builddir + "fixmepath"
> =20
> -    sstate_scan_cmd =3D d.getVar('SSTATE_SCAN_CMD', True)
> +    sstate_scan_cmd =3D d.getVar('SSTATE_SCAN_CMD')
>      sstate_filelist_cmd =3D "tee %s" % (fixmefn)
> =20
>      # fixmepath file needs relative paths, drop sstate_builddir prefix
> @@ -568,17 +568,17 @@ def sstate_package(ss, d):
>          os.remove(path)
>          os.symlink(base, path)
> =20
> -    tmpdir =3D d.getVar('TMPDIR', True)
> +    tmpdir =3D d.getVar('TMPDIR')
> =20
>      sstatebuild =3D d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
> -    sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_'+ ss['task'] + ".tgz"
> +    sstatepkg =3D d.getVar('SSTATE_PKG') + '_'+ ss['task'] + ".tgz"
>      bb.utils.remove(sstatebuild, recurse=3DTrue)
>      bb.utils.mkdirhier(sstatebuild)
>      bb.utils.mkdirhier(os.path.dirname(sstatepkg))
>      for state in ss['dirs']:
>          if not os.path.exists(state[1]):
>              continue
> -        if d.getVar('SSTATE_SKIP_CREATION', True) =3D=3D '1':
> +        if d.getVar('SSTATE_SKIP_CREATION') =3D=3D '1':
>              continue
>          srcbase =3D state[0].rstrip("/").rsplit('/', 1)[0]
>          for walkroot, dirs, files in os.walk(state[1]):
> @@ -593,7 +593,7 @@ def sstate_package(ss, d):
>          bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1],=
 sstatebuild + state[0]))
>          oe.path.copyhardlinktree(state[1], sstatebuild + state[0])
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      for plain in ss['plaindirs']:
>          pdir =3D plain.replace(workdir, sstatebuild)
>          bb.utils.mkdirhier(plain)
> @@ -603,9 +603,9 @@ def sstate_package(ss, d):
>      d.setVar('SSTATE_BUILDDIR', sstatebuild)
>      d.setVar('SSTATE_PKG', sstatepkg)
> =20
> -    for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + \
> +    for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
>               ['sstate_create_package', 'sstate_sign_package'] + \
> -             (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
> +             (d.getVar('SSTATEPOSTCREATEFUNCS') or '').split():
>          # All hooks should run in SSTATE_BUILDDIR.
>          bb.build.exec_func(f, d, (sstatebuild,))
> =20
> @@ -617,7 +617,7 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
>      import bb.fetch2
> =20
>      # Only try and fetch if the user has configured a mirror
> -    mirrors =3D d.getVar('SSTATE_MIRRORS', True)
> +    mirrors =3D d.getVar('SSTATE_MIRRORS')
>      if not mirrors:
>          return
> =20
> @@ -635,14 +635,14 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
> =20
>      # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWO=
RK,
>      # we'll want to allow network access for the current set of fetches.
> -    if localdata.getVar('BB_NO_NETWORK', True) =3D=3D "1" and localdata.=
getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) =3D=3D "1":
> +    if localdata.getVar('BB_NO_NETWORK') =3D=3D "1" and localdata.getVar=
('SSTATE_MIRROR_ALLOW_NETWORK') =3D=3D "1":
>          localdata.delVar('BB_NO_NETWORK')
> =20
>      # Try a fetch from the sstate mirror, if it fails just return and
>      # we will build the package
>      uris =3D ['file://{0};downloadfilename=3D{0}'.format(sstatefetch),
>              'file://{0}.siginfo;downloadfilename=3D{0}.siginfo'.format(s=
statefetch)]
> -    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
> +    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
>          uris +=3D ['file://{0}.sig;downloadfilename=3D{0}.sig'.format(ss=
tatefetch)]
> =20
>      for srcuri in uris:
> @@ -671,7 +671,7 @@ python sstate_task_postfunc () {
> =20
>      sstate_install(shared_state, d)
>      for intercept in shared_state['interceptfuncs']:
> -        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True),))
> +        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR"),))
>      omask =3D os.umask(0o002)
>      if omask !=3D 0o002:
>         bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omas=
k)
> @@ -709,13 +709,13 @@ sstate_create_package () {
>  python sstate_sign_package () {
>      from oe.gpg_sign import get_signer
> =20
> -    if d.getVar('SSTATE_SIG_KEY', True):
> +    if d.getVar('SSTATE_SIG_KEY'):
>          signer =3D get_signer(d, 'local')
> -        sstate_pkg =3D d.getVar('SSTATE_PKG', True)
> +        sstate_pkg =3D d.getVar('SSTATE_PKG')
>          if os.path.exists(sstate_pkg + '.sig'):
>              os.unlink(sstate_pkg + '.sig')
>          signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY', False)=
, None,
> -                           d.getVar('SSTATE_SIG_PASSPHRASE', True), armo=
r=3DFalse)
> +                           d.getVar('SSTATE_SIG_PASSPHRASE'), armor=3DFa=
lse)
>  }
> =20
>  #
> @@ -746,7 +746,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d, siginfo=3DFalse):
>          splithashfn =3D sq_hashfn[task].split(" ")
>          spec =3D splithashfn[1]
>          if splithashfn[0] =3D=3D "True":
> -            extrapath =3D d.getVar("NATIVELSBSTRING", True) + "/"
> +            extrapath =3D d.getVar("NATIVELSBSTRING") + "/"
>          else:
>              extrapath =3D ""
> =20
> @@ -785,7 +785,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d, siginfo=3DFalse):
>              missed.append(task)
>              bb.debug(2, "SState: Looked for but didn't find file %s" % s=
statefile)
> =20
> -    mirrors =3D d.getVar("SSTATE_MIRRORS", True)
> +    mirrors =3D d.getVar("SSTATE_MIRRORS")
>      if mirrors:
>          # Copy the data object and override DL_DIR and SRC_URI
>          localdata =3D bb.data.createCopy(d)
> @@ -801,7 +801,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d, siginfo=3DFalse):
> =20
>          # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_N=
ETWORK,
>          # we'll want to allow network access for the current set of fetc=
hes.
> -        if localdata.getVar('BB_NO_NETWORK', True) =3D=3D "1" and locald=
ata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) =3D=3D "1":
> +        if localdata.getVar('BB_NO_NETWORK') =3D=3D "1" and localdata.ge=
tVar('SSTATE_MIRROR_ALLOW_NETWORK') =3D=3D "1":
>              localdata.delVar('BB_NO_NETWORK')
> =20
>          whitelist =3D bb.runqueue.get_setscene_enforce_whitelist(d)
> @@ -868,7 +868,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d, siginfo=3DFalse):
>              if whitelist and missing:
>                  bb.fatal('Required artifacts were unavailable - exiting')
> =20
> -    inheritlist =3D d.getVar("INHERIT", True)
> +    inheritlist =3D d.getVar("INHERIT")
>      if "toaster" in inheritlist:
>          evdata =3D {'missed': [], 'found': []};
>          for task in missed:
> @@ -977,15 +977,15 @@ sstate_eventhandler[eventmask] =3D "bb.build.TaskSu=
cceeded"
>  python sstate_eventhandler() {
>      d =3D e.data
>      # When we write an sstate package we rewrite the SSTATE_PKG
> -    spkg =3D d.getVar('SSTATE_PKG', True)
> +    spkg =3D d.getVar('SSTATE_PKG')
>      if not spkg.endswith(".tgz"):
> -        taskname =3D d.getVar("BB_RUNTASK", True)[3:]
> -        spec =3D d.getVar('SSTATE_PKGSPEC', True)
> -        swspec =3D d.getVar('SSTATE_SWSPEC', True)
> +        taskname =3D d.getVar("BB_RUNTASK")[3:]
> +        spec =3D d.getVar('SSTATE_PKGSPEC')
> +        swspec =3D d.getVar('SSTATE_SWSPEC')
>          if taskname in ["fetch", "unpack", "patch", "populate_lic", "pre=
configure"] and swspec:
>              d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
>              d.setVar("SSTATE_EXTRAPATH", "")
> -        sstatepkg =3D d.getVar('SSTATE_PKG', True)
> +        sstatepkg =3D d.getVar('SSTATE_PKG')
>          bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".s=
iginfo", d)
>  }
> =20
> @@ -1004,7 +1004,7 @@ python sstate_eventhandler2() {
>      stamps =3D e.stamps.values()
>      removeworkdir =3D (d.getVar("SSTATE_PRUNE_OBSOLETEWORKDIR", False) =
=3D=3D "1")
>      seen =3D []
> -    for a in d.getVar("SSTATE_ARCHS", True).split():
> +    for a in d.getVar("SSTATE_ARCHS").split():
>          toremove =3D []
>          i =3D d.expand("${SSTATE_MANIFESTS}/index-" + a)
>          if not os.path.exists(i):
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index a0b09a0..f95fc24 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -69,8 +69,8 @@ sysroot_stage_all() {
>  python sysroot_strip () {
>      import stat, errno
> =20
> -    dvar =3D d.getVar('SYSROOT_DESTDIR', True)
> -    pn =3D d.getVar('PN', True)
> +    dvar =3D d.getVar('SYSROOT_DESTDIR')
> +    pn =3D d.getVar('PN')
> =20
>      os.chdir(dvar)
> =20
> @@ -103,9 +103,9 @@ python sysroot_strip () {
> =20
>      elffiles =3D {}
>      inodes =3D {}
> -    libdir =3D os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
> -    baselibdir =3D os.path.abspath(dvar + os.sep + d.getVar("base_libdir=
", True))
> -    if (d.getVar('INHIBIT_SYSROOT_STRIP', True) !=3D '1'):
> +    libdir =3D os.path.abspath(dvar + os.sep + d.getVar("libdir"))
> +    baselibdir =3D os.path.abspath(dvar + os.sep + d.getVar("base_libdir=
"))
> +    if (d.getVar('INHIBIT_SYSROOT_STRIP') !=3D '1'):
>          #
>          # First lets figure out all of the files we may have to process
>          #
> @@ -136,7 +136,7 @@ python sysroot_strip () {
>                      elf_file =3D isELF(file)
>                      if elf_file & 1:
>                          if elf_file & 2:
> -                            if 'already-stripped' in (d.getVar('INSANE_S=
KIP_' + pn, True) or "").split():
> +                            if 'already-stripped' in (d.getVar('INSANE_S=
KIP_' + pn) or "").split():
>                                  bb.note("Skipping file %s from %s for al=
ready-stripped QA test" % (file[len(dvar):], pn))
>                              else:
>                                  bb.warn("File '%s' from %s was already s=
tripped, this will prevent future debugging!" % (file[len(dvar):], pn))
> @@ -154,7 +154,7 @@ python sysroot_strip () {
>          #
>          # Now strip them (in parallel)
>          #
> -        strip =3D d.getVar("STRIP", True)
> +        strip =3D d.getVar("STRIP")
>          sfiles =3D []
>          for file in elffiles:
>              elf_file =3D int(elffiles[file])
> @@ -212,13 +212,13 @@ def sysroot_checkhashes(covered, tasknames, fnids, =
fns, d, invalidtasks =3D None):
>  python do_populate_sysroot () {
>      bb.build.exec_func("sysroot_stage_all", d)
>      bb.build.exec_func("sysroot_strip", d)
> -    for f in (d.getVar('SYSROOT_PREPROCESS_FUNCS', True) or '').split():
> +    for f in (d.getVar('SYSROOT_PREPROCESS_FUNCS') or '').split():
>          bb.build.exec_func(f, d)
> -    pn =3D d.getVar("PN", True)
> -    multiprov =3D d.getVar("MULTI_PROVIDER_WHITELIST", True).split()
> +    pn =3D d.getVar("PN")
> +    multiprov =3D d.getVar("MULTI_PROVIDER_WHITELIST").split()
>      provdir =3D d.expand("${SYSROOT_DESTDIR}${base_prefix}/sysroot-provi=
ders/")
>      bb.utils.mkdirhier(provdir)
> -    for p in d.getVar("PROVIDES", True).split():
> +    for p in d.getVar("PROVIDES").split():
>          if p in multiprov:
>              continue
>          p =3D p.replace("/", "_")
> diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
> index 7778fd7..d8859b3 100644
> --- a/meta/classes/syslinux.bbclass
> +++ b/meta/classes/syslinux.bbclass
> @@ -84,12 +84,12 @@ python build_syslinux_cfg () {
>      import copy
>      import sys
> =20
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      if not workdir:
>          bb.error("WORKDIR not defined, unable to package")
>          return
>         =20
> -    labels =3D d.getVar('LABELS', True)
> +    labels =3D d.getVar('LABELS')
>      if not labels:
>          bb.debug(1, "LABELS not defined, nothing to do")
>          return
> @@ -98,7 +98,7 @@ python build_syslinux_cfg () {
>          bb.debug(1, "No labels, nothing to do")
>          return
> =20
> -    cfile =3D d.getVar('SYSLINUX_CFG', True)
> +    cfile =3D d.getVar('SYSLINUX_CFG')
>      if not cfile:
>          bb.fatal('Unable to read SYSLINUX_CFG')
> =20
> @@ -109,39 +109,39 @@ python build_syslinux_cfg () {
> =20
>      cfgfile.write('# Automatically created by OE\n')
> =20
> -    opts =3D d.getVar('SYSLINUX_OPTS', True)
> +    opts =3D d.getVar('SYSLINUX_OPTS')
> =20
>      if opts:
>          for opt in opts.split(';'):
>              cfgfile.write('%s\n' % opt)
> =20
> -    allowoptions =3D d.getVar('SYSLINUX_ALLOWOPTIONS', True)
> +    allowoptions =3D d.getVar('SYSLINUX_ALLOWOPTIONS')
>      if allowoptions:
>          cfgfile.write('ALLOWOPTIONS %s\n' % allowoptions)
>      else:
>          cfgfile.write('ALLOWOPTIONS 1\n')
> =20
> -    syslinux_default_console =3D d.getVar('SYSLINUX_DEFAULT_CONSOLE', Tr=
ue)
> -    syslinux_serial_tty =3D d.getVar('SYSLINUX_SERIAL_TTY', True)
> -    syslinux_serial =3D d.getVar('SYSLINUX_SERIAL', True)
> +    syslinux_default_console =3D d.getVar('SYSLINUX_DEFAULT_CONSOLE')
> +    syslinux_serial_tty =3D d.getVar('SYSLINUX_SERIAL_TTY')
> +    syslinux_serial =3D d.getVar('SYSLINUX_SERIAL')
>      if syslinux_serial:
>          cfgfile.write('SERIAL %s\n' % syslinux_serial)
> =20
> -    menu =3D (d.getVar('AUTO_SYSLINUXMENU', True) =3D=3D "1")
> +    menu =3D (d.getVar('AUTO_SYSLINUXMENU') =3D=3D "1")
> =20
>      if menu and syslinux_serial:
>          cfgfile.write('DEFAULT Graphics console %s\n' % (labels.split()[=
0]))
>      else:
>          cfgfile.write('DEFAULT %s\n' % (labels.split()[0]))
> =20
> -    timeout =3D d.getVar('SYSLINUX_TIMEOUT', True)
> +    timeout =3D d.getVar('SYSLINUX_TIMEOUT')
> =20
>      if timeout:
>          cfgfile.write('TIMEOUT %s\n' % timeout)
>      else:
>          cfgfile.write('TIMEOUT 50\n')
> =20
> -    prompt =3D d.getVar('SYSLINUX_PROMPT', True)
> +    prompt =3D d.getVar('SYSLINUX_PROMPT')
>      if prompt:
>          cfgfile.write('PROMPT %s\n' % prompt)
>      else:
> @@ -151,14 +151,14 @@ python build_syslinux_cfg () {
>          cfgfile.write('ui vesamenu.c32\n')
>          cfgfile.write('menu title Select kernel options and boot kernel\=
n')
>          cfgfile.write('menu tabmsg Press [Tab] to edit, [Return] to sele=
ct\n')
> -        splash =3D d.getVar('SYSLINUX_SPLASH', True)
> +        splash =3D d.getVar('SYSLINUX_SPLASH')
>          if splash:
>              cfgfile.write('menu background splash.lss\n')
>     =20
>      for label in labels.split():
>          localdata =3D bb.data.createCopy(d)
> =20
> -        overrides =3D localdata.getVar('OVERRIDES', True)
> +        overrides =3D localdata.getVar('OVERRIDES')
>          if not overrides:
>              bb.fatal('OVERRIDES not defined')
> =20
> @@ -170,19 +170,19 @@ python build_syslinux_cfg () {
>              btypes =3D [ [ "Graphics console ", syslinux_default_console=
  ],
>                  [ "Serial console ", syslinux_serial_tty ] ]
> =20
> -        root=3D d.getVar('SYSLINUX_ROOT', True)
> +        root=3D d.getVar('SYSLINUX_ROOT')
>          if not root:
>              bb.fatal('SYSLINUX_ROOT not defined')
> =20
>          for btype in btypes:
>              cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], l=
abel))
> =20
> -            exargs =3D d.getVar('SYSLINUX_KERNEL_ARGS', True)
> +            exargs =3D d.getVar('SYSLINUX_KERNEL_ARGS')
>              if exargs:
>                  btype[1] +=3D " " + exargs
> =20
> -            append =3D localdata.getVar('APPEND', True)
> -            initrd =3D localdata.getVar('INITRD', True)
> +            append =3D localdata.getVar('APPEND')
> +            initrd =3D localdata.getVar('INITRD')
> =20
>              append =3D root + " " + append
>              cfgfile.write('APPEND ')
> diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boo=
t.bbclass
> index 05244c7..60729a7 100644
> --- a/meta/classes/systemd-boot.bbclass
> +++ b/meta/classes/systemd-boot.bbclass
> @@ -63,8 +63,8 @@ efi_hddimg_populate() {
>  }
> =20
>  python build_efi_cfg() {
> -    s =3D d.getVar("S", True)
> -    labels =3D d.getVar('LABELS', True)
> +    s =3D d.getVar("S")
> +    labels =3D d.getVar('LABELS')
>      if not labels:
>          bb.debug(1, "LABELS not defined, nothing to do")
>          return
> @@ -73,7 +73,7 @@ python build_efi_cfg() {
>          bb.debug(1, "No labels, nothing to do")
>          return
> =20
> -    cfile =3D d.getVar('SYSTEMD_BOOT_CFG', True)
> +    cfile =3D d.getVar('SYSTEMD_BOOT_CFG')
>      try:
>           cfgfile =3D open(cfile, 'w')
>      except OSError:
> @@ -81,7 +81,7 @@ python build_efi_cfg() {
> =20
>      cfgfile.write('# Automatically created by OE\n')
>      cfgfile.write('default %s\n' % (labels.split()[0]))
> -    timeout =3D d.getVar('SYSTEMD_BOOT_TIMEOUT', True)
> +    timeout =3D d.getVar('SYSTEMD_BOOT_TIMEOUT')
>      if timeout:
>          cfgfile.write('timeout %s\n' % timeout)
>      else:
> @@ -91,7 +91,7 @@ python build_efi_cfg() {
>      for label in labels.split():
>          localdata =3D d.createCopy()
> =20
> -        overrides =3D localdata.getVar('OVERRIDES', True)
> +        overrides =3D localdata.getVar('OVERRIDES')
>          if not overrides:
>              bb.fatal('OVERRIDES not defined')
> =20
> @@ -107,8 +107,8 @@ python build_efi_cfg() {
>          entrycfg.write('title %s\n' % label)
>          entrycfg.write('linux /vmlinuz\n')
> =20
> -        append =3D localdata.getVar('APPEND', True)
> -        initrd =3D localdata.getVar('INITRD', True)
> +        append =3D localdata.getVar('APPEND')
> +        initrd =3D localdata.getVar('INITRD')
> =20
>          if initrd:
>              entrycfg.write('initrd /initrd\n')
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 7e51ed6..d50141d 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -71,12 +71,12 @@ python systemd_populate_packages() {
>      def get_package_var(d, var, pkg):
>          val =3D (d.getVar('%s_%s' % (var, pkg), True) or "").strip()
>          if val =3D=3D "":
> -            val =3D (d.getVar(var, True) or "").strip()
> +            val =3D (d.getVar(var) or "").strip()
>          return val
> =20
>      # Check if systemd-packages already included in PACKAGES
>      def systemd_check_package(pkg_systemd):
> -        packages =3D d.getVar('PACKAGES', True)
> +        packages =3D d.getVar('PACKAGES')
>          if not pkg_systemd in packages.split():
>              bb.error('%s does not appear in package list, please add it'=
 % pkg_systemd)
> =20
> @@ -90,23 +90,23 @@ python systemd_populate_packages() {
>          localdata.prependVar("OVERRIDES", pkg + ":")
>          bb.data.update_data(localdata)
> =20
> -        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>          if not postinst:
>              postinst =3D '#!/bin/sh\n'
> -        postinst +=3D localdata.getVar('systemd_postinst', True)
> +        postinst +=3D localdata.getVar('systemd_postinst')
>          d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -        prerm =3D d.getVar('pkg_prerm_%s' % pkg, True)
> +        prerm =3D d.getVar('pkg_prerm_%s' % pkg)
>          if not prerm:
>              prerm =3D '#!/bin/sh\n'
> -        prerm +=3D localdata.getVar('systemd_prerm', True)
> +        prerm +=3D localdata.getVar('systemd_prerm')
>          d.setVar('pkg_prerm_%s' % pkg, prerm)
> =20
> =20
>      # Add files to FILES_*-systemd if existent and not already done
>      def systemd_append_file(pkg_systemd, file_append):
>          appended =3D False
> -        if os.path.exists(oe.path.join(d.getVar("D", True), file_append)=
):
> +        if os.path.exists(oe.path.join(d.getVar("D"), file_append)):
>              var_name =3D "FILES_" + pkg_systemd
>              files =3D d.getVar(var_name, False) or ""
>              if file_append not in files.split():
> @@ -118,7 +118,7 @@ python systemd_populate_packages() {
>      def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
>          # avoid infinite recursion
>          if systemd_append_file(pkg_systemd, oe.path.join(path, service)):
> -            fullpath =3D oe.path.join(d.getVar("D", True), path, service)
> +            fullpath =3D oe.path.join(d.getVar("D"), path, service)
>              if service.find('.service') !=3D -1:
>                  # for *.service add *@.service
>                  service_base =3D service.replace('.service', '')
> @@ -141,9 +141,9 @@ python systemd_populate_packages() {
> =20
>      # Check service-files and call systemd_add_files_and_parse for each =
entry
>      def systemd_check_services():
> -        searchpaths =3D [oe.path.join(d.getVar("sysconfdir", True), "sys=
temd", "system"),]
> -        searchpaths.append(d.getVar("systemd_system_unitdir", True))
> -        systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', True)
> +        searchpaths =3D [oe.path.join(d.getVar("sysconfdir"), "systemd",=
 "system"),]
> +        searchpaths.append(d.getVar("systemd_system_unitdir"))
> +        systemd_packages =3D d.getVar('SYSTEMD_PACKAGES')
> =20
>          keys =3D 'Also'
>          # scan for all in SYSTEMD_SERVICE[]
> @@ -158,11 +158,11 @@ python systemd_populate_packages() {
>                      base =3D re.sub('@[^.]+.', '@.', service)
> =20
>                  for path in searchpaths:
> -                    if os.path.exists(oe.path.join(d.getVar("D", True), =
path, service)):
> +                    if os.path.exists(oe.path.join(d.getVar("D"), path, =
service)):
>                          path_found =3D path
>                          break
>                      elif base is not None:
> -                        if os.path.exists(oe.path.join(d.getVar("D", Tru=
e), path, base)):
> +                        if os.path.exists(oe.path.join(d.getVar("D"), pa=
th, base)):
>                              path_found =3D path
>                              break
> =20
> @@ -172,10 +172,10 @@ python systemd_populate_packages() {
>                      bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist=
" % (pkg_systemd, service))
> =20
>      # Run all modifications once when creating package
> -    if os.path.exists(d.getVar("D", True)):
> -        for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
> +    if os.path.exists(d.getVar("D")):
> +        for pkg in d.getVar('SYSTEMD_PACKAGES').split():
>              systemd_check_package(pkg)
> -            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
> +            if d.getVar('SYSTEMD_SERVICE_' + pkg):
>                  systemd_generate_package_scripts(pkg)
>          systemd_check_services()
>  }
> @@ -185,7 +185,7 @@ PACKAGESPLITFUNCS_prepend =3D "systemd_populate_packa=
ges "
>  python rm_systemd_unitdir (){
>      import shutil
>      if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, =
d):
> -        systemd_unitdir =3D oe.path.join(d.getVar("D", True), d.getVar('=
systemd_unitdir', True))
> +        systemd_unitdir =3D oe.path.join(d.getVar("D"), d.getVar('system=
d_unitdir'))
>          if os.path.exists(systemd_unitdir):
>              shutil.rmtree(systemd_unitdir)
>          systemd_libdir =3D os.path.dirname(systemd_unitdir)
> @@ -196,12 +196,12 @@ do_install[postfuncs] +=3D "rm_systemd_unitdir "
> =20
>  python rm_sysvinit_initddir (){
>      import shutil
> -    sysv_initddir =3D oe.path.join(d.getVar("D", True), (d.getVar('INIT_=
D_DIR', True) or "/etc/init.d"))
> +    sysv_initddir =3D oe.path.join(d.getVar("D"), (d.getVar('INIT_D_DIR'=
) or "/etc/init.d"))
> =20
>      if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) a=
nd \
>          not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False=
, d) and \
>          os.path.exists(sysv_initddir):
> -        systemd_system_unitdir =3D oe.path.join(d.getVar("D", True), d.g=
etVar('systemd_system_unitdir', True))
> +        systemd_system_unitdir =3D oe.path.join(d.getVar("D"), d.getVar(=
'systemd_system_unitdir'))
> =20
>          # If systemd_system_unitdir contains anything, delete sysv_initd=
dir
>          if (os.path.exists(systemd_system_unitdir) and os.listdir(system=
d_system_unitdir)):
> diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
> index cd8d124..5db013f 100644
> --- a/meta/classes/terminal.bbclass
> +++ b/meta/classes/terminal.bbclass
> @@ -19,9 +19,9 @@ def emit_terminal_func(command, envdata, d):
>      envdata.setVar(cmd_func, 'exec ' + command)
>      envdata.setVarFlag(cmd_func, 'func', '1')
> =20
> -    runfmt =3D d.getVar('BB_RUNFMT', True) or "run.{func}.{pid}"
> +    runfmt =3D d.getVar('BB_RUNFMT') or "run.{func}.{pid}"
>      runfile =3D runfmt.format(func=3Dcmd_func, task=3Dcmd_func, taskfunc=
=3Dcmd_func, pid=3Dos.getpid())
> -    runfile =3D os.path.join(d.getVar('T', True), runfile)
> +    runfile =3D os.path.join(d.getVar('T'), runfile)
>      bb.utils.mkdirhier(os.path.dirname(runfile))
> =20
>      with open(runfile, 'w') as script:
> @@ -44,7 +44,7 @@ def oe_terminal(command, title, d):
>          envdata.setVarFlag(v, 'export', '1')
> =20
>      for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
> -        value =3D d.getVar(export, True)
> +        value =3D d.getVar(export)
>          if value is not None:
>              os.environ[export] =3D str(value)
>              envdata.setVar(export, str(value))
> @@ -60,7 +60,7 @@ def oe_terminal(command, title, d):
>      for key in origbbenv:
>          if key in envdata:
>              continue
> -        value =3D origbbenv.getVar(key, True)
> +        value =3D origbbenv.getVar(key)
>          if value is not None:
>              os.environ[key] =3D str(value)
>              envdata.setVar(key, str(value))
> diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bb=
class
> index 5147020..3f7b2de 100644
> --- a/meta/classes/testexport.bbclass
> +++ b/meta/classes/testexport.bbclass
> @@ -49,19 +49,19 @@ def exportTests(d,tc):
>      import re
>      import oe.path
> =20
> -    exportpath =3D d.getVar("TEST_EXPORT_DIR", True)
> +    exportpath =3D d.getVar("TEST_EXPORT_DIR")
> =20
>      savedata =3D {}
>      savedata["d"] =3D {}
>      savedata["target"] =3D {}
> -    savedata["target"]["ip"] =3D tc.target.ip or d.getVar("TEST_TARGET_I=
P", True)
> -    savedata["target"]["server_ip"] =3D tc.target.server_ip or d.getVar(=
"TEST_SERVER_IP", True)
> +    savedata["target"]["ip"] =3D tc.target.ip or d.getVar("TEST_TARGET_I=
P")
> +    savedata["target"]["server_ip"] =3D tc.target.server_ip or d.getVar(=
"TEST_SERVER_IP")
> =20
>      keys =3D [ key for key in d.keys() if not key.startswith("_") and no=
t key.startswith("BB") \
>              and not key.startswith("B_pn") and not key.startswith("do_")=
 and not d.getVarFlag(key, "func", True)]
>      for key in keys:
>          try:
> -            savedata["d"][key] =3D d.getVar(key, True)
> +            savedata["d"][key] =3D d.getVar(key)
>          except bb.data_smart.ExpansionError:
>              # we don't care about those anyway
>              pass
> @@ -71,7 +71,7 @@ def exportTests(d,tc):
>              json.dump(savedata, f, skipkeys=3DTrue, indent=3D4, sort_key=
s=3DTrue)
> =20
>      # Replace absolute path with relative in the file
> -    exclude_path =3D os.path.join(d.getVar("COREBASE", True),'meta','lib=
','oeqa')
> +    exclude_path =3D os.path.join(d.getVar("COREBASE"),'meta','lib','oeq=
a')
>      f1 =3D open(json_file,'r').read()
>      f2 =3D open(json_file,'w')
>      m =3D f1.replace(exclude_path,'oeqa')
> @@ -90,7 +90,7 @@ def exportTests(d,tc):
>      bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
>      bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
>      # copy test modules, this should cover tests in other layers too
> -    bbpath =3D d.getVar("BBPATH", True).split(':')
> +    bbpath =3D d.getVar("BBPATH").split(':')
>      for t in tc.testslist:
>          isfolder =3D False
>          if re.search("\w+\.\w+\.test_\S+", t):
> @@ -111,7 +111,7 @@ def exportTests(d,tc):
>              if os.path.isfile(json_file):
>                  shutil.copy2(json_file, os.path.join(exportpath, "oeqa/r=
untime"))
>      # Get meta layer
> -    for layer in d.getVar("BBLAYERS", True).split():
> +    for layer in d.getVar("BBLAYERS").split():
>          if os.path.basename(layer) =3D=3D "meta":
>              meta_layer =3D layer
>              break
> @@ -130,28 +130,28 @@ def exportTests(d,tc):
>              shutil.copy2(os.path.join(root, f), os.path.join(exportpath,=
 "oeqa/runtime/files"))
> =20
>      # Create tar file for common parts of testexport
> -    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR", T=
rue))
> +    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
> =20
>      # Copy packages needed for runtime testing
> -    test_pkg_dir =3D d.getVar("TEST_NEEDED_PACKAGES_DIR", True)
> +    test_pkg_dir =3D d.getVar("TEST_NEEDED_PACKAGES_DIR")
>      if os.listdir(test_pkg_dir):
> -        export_pkg_dir =3D os.path.join(d.getVar("TEST_EXPORT_DIR", True=
), "packages")
> +        export_pkg_dir =3D os.path.join(d.getVar("TEST_EXPORT_DIR"), "pa=
ckages")
>          oe.path.copytree(test_pkg_dir, export_pkg_dir)
>          # Create tar file for packages needed by the DUT
> -        create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MA=
CHINE", True), export_pkg_dir)
> +        create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MA=
CHINE"), export_pkg_dir)
> =20
>      # Copy SDK
> -    if d.getVar("TEST_EXPORT_SDK_ENABLED", True) =3D=3D "1":
> -        sdk_deploy =3D d.getVar("SDK_DEPLOY", True)
> -        tarball_name =3D "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME", True)
> +    if d.getVar("TEST_EXPORT_SDK_ENABLED") =3D=3D "1":
> +        sdk_deploy =3D d.getVar("SDK_DEPLOY")
> +        tarball_name =3D "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME")
>          tarball_path =3D os.path.join(sdk_deploy, tarball_name)
> -        export_sdk_dir =3D os.path.join(d.getVar("TEST_EXPORT_DIR", True=
),
> -                                      d.getVar("TEST_EXPORT_SDK_DIR", Tr=
ue))
> +        export_sdk_dir =3D os.path.join(d.getVar("TEST_EXPORT_DIR"),
> +                                      d.getVar("TEST_EXPORT_SDK_DIR"))
>          bb.utils.mkdirhier(export_sdk_dir)
>          shutil.copy2(tarball_path, export_sdk_dir)
> =20
>          # Create tar file for the sdk
> -        create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARC=
H", True), export_sdk_dir)
> +        create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARC=
H"), export_sdk_dir)
> =20
>      bb.plain("Exported tests to: %s" % exportpath)
> =20
> @@ -161,8 +161,8 @@ def testexport_main(d):
>      from oeqa.utils.dump import get_host_dumper
> =20
>      test_create_extract_dirs(d)
> -    export_dir =3D d.getVar("TEST_EXPORT_DIR", True)
> -    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
> +    export_dir =3D d.getVar("TEST_EXPORT_DIR")
> +    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
>      bb.utils.remove(export_dir, recurse=3DTrue)
>      bb.utils.mkdirhier(export_dir)
> =20
> @@ -188,7 +188,7 @@ def create_tarball(d, tar_name, src_dir):
> =20
>      import tarfile
> =20
> -    tar_path =3D os.path.join(d.getVar("TEST_EXPORT_DIR", True), tar_nam=
e)
> +    tar_path =3D os.path.join(d.getVar("TEST_EXPORT_DIR"), tar_name)
>      current_dir =3D os.getcwd()
>      src_dir =3D src_dir.rstrip('/')
>      dir_name =3D os.path.dirname(src_dir)
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
> index 6b6781d..770ec80 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -130,8 +130,8 @@ def testimage_main(d):
>      from oeqa.targetcontrol import get_target_controller
>      from oeqa.utils.dump import get_host_dumper
> =20
> -    pn =3D d.getVar("PN", True)
> -    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
> +    pn =3D d.getVar("PN")
> +    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
>      test_create_extract_dirs(d)
> =20
>      # we need the host dumper in test context
> @@ -176,10 +176,10 @@ def testimage_main(d):
>          target.stop()
> =20
>  def test_create_extract_dirs(d):
> -    install_path =3D d.getVar("TEST_INSTALL_TMP_DIR", True)
> -    package_path =3D d.getVar("TEST_PACKAGED_DIR", True)
> -    extracted_path =3D d.getVar("TEST_EXTRACTED_DIR", True)
> -    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
> +    install_path =3D d.getVar("TEST_INSTALL_TMP_DIR")
> +    package_path =3D d.getVar("TEST_PACKAGED_DIR")
> +    extracted_path =3D d.getVar("TEST_EXTRACTED_DIR")
> +    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
>      bb.utils.remove(package_path, recurse=3DTrue)
>      bb.utils.mkdirhier(install_path)
>      bb.utils.mkdirhier(package_path)
> diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
> index 06b4c50..063b908 100644
> --- a/meta/classes/testsdk.bbclass
> +++ b/meta/classes/testsdk.bbclass
> @@ -54,8 +54,8 @@ def testsdk_main(d):
>      import subprocess
>      from oeqa.oetest import SDKTestContext
> =20
> -    pn =3D d.getVar("PN", True)
> -    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
> +    pn =3D d.getVar("PN")
> +    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
> =20
>      tcname =3D d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
>      if not os.path.exists(tcname):
> @@ -100,12 +100,12 @@ def testsdkext_main(d):
> =20
>      # extensible sdk can be contaminated if native programs are
>      # in PATH, i.e. use perl-native instead of eSDK one.
> -    paths_to_avoid =3D [d.getVar('STAGING_DIR', True),
> -                      d.getVar('BASE_WORKDIR', True)]
> +    paths_to_avoid =3D [d.getVar('STAGING_DIR'),
> +                      d.getVar('BASE_WORKDIR')]
>      os.environ['PATH'] =3D avoid_paths_in_environ(paths_to_avoid)
> =20
> -    pn =3D d.getVar("PN", True)
> -    bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
> +    pn =3D d.getVar("PN")
> +    bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR"))
> =20
>      tcname =3D d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
>      if not os.path.exists(tcname):
> diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclien=
t.bbclass
> index 917b74d..706a392 100644
> --- a/meta/classes/tinderclient.bbclass
> +++ b/meta/classes/tinderclient.bbclass
> @@ -55,22 +55,22 @@ def tinder_format_http_post(d,status,log):
> =20
>      # the variables we will need to send on this form post
>      variables =3D  {
> -        "tree"         : d.getVar('TINDER_TREE', True),
> -        "machine_name" : d.getVar('TINDER_MACHINE', True),
> +        "tree"         : d.getVar('TINDER_TREE'),
> +        "machine_name" : d.getVar('TINDER_MACHINE'),
>          "os"           : os.uname()[0],
>          "os_version"   : os.uname()[2],
>          "compiler"     : "gcc",
> -        "clobber"      : d.getVar('TINDER_CLOBBER', True) or "0",
> -        "srcdate"      : d.getVar('SRCDATE', True),
> -        "PN"           : d.getVar('PN', True),
> -        "PV"           : d.getVar('PV', True),
> -        "PR"           : d.getVar('PR', True),
> -        "FILE"         : d.getVar('FILE', True) or "N/A",
> -        "TARGETARCH"   : d.getVar('TARGET_ARCH', True),
> -        "TARGETFPU"    : d.getVar('TARGET_FPU', True) or "Unknown",
> -        "TARGETOS"     : d.getVar('TARGET_OS', True) or "Unknown",
> -        "MACHINE"      : d.getVar('MACHINE', True) or "Unknown",
> -        "DISTRO"       : d.getVar('DISTRO', True) or "Unknown",
> +        "clobber"      : d.getVar('TINDER_CLOBBER') or "0",
> +        "srcdate"      : d.getVar('SRCDATE'),
> +        "PN"           : d.getVar('PN'),
> +        "PV"           : d.getVar('PV'),
> +        "PR"           : d.getVar('PR'),
> +        "FILE"         : d.getVar('FILE') or "N/A",
> +        "TARGETARCH"   : d.getVar('TARGET_ARCH'),
> +        "TARGETFPU"    : d.getVar('TARGET_FPU') or "Unknown",
> +        "TARGETOS"     : d.getVar('TARGET_OS') or "Unknown",
> +        "MACHINE"      : d.getVar('MACHINE') or "Unknown",
> +        "DISTRO"       : d.getVar('DISTRO') or "Unknown",
>          "zecke-rocks"  : "sure",
>      }
> =20
> @@ -127,7 +127,7 @@ def tinder_build_start(d):
> =20
>      # now we will need to save the machine number
>      # we will override any previous numbers
> -    f =3D open(d.getVar('TMPDIR', True)+"/tinder-machine.id", 'w')
> +    f =3D open(d.getVar('TMPDIR')+"/tinder-machine.id", 'w')
>      f.write(report)
> =20
> =20
> @@ -137,8 +137,8 @@ def tinder_send_http(d, status, _log):
>      """
> =20
>      # get the body and type
> -    server =3D d.getVar('TINDER_HOST', True)
> -    url    =3D d.getVar('TINDER_URL', True)
> +    server =3D d.getVar('TINDER_HOST')
> +    url    =3D d.getVar('TINDER_URL')
> =20
>      selector =3D url + "/xml/build_status.pl"
> =20
> @@ -278,7 +278,7 @@ def tinder_do_tinder_report(event):
> =20
>          try:
>              # truncate the tinder log file
> -            f =3D open(event.data.getVar('TINDER_LOG', True), 'w')
> +            f =3D open(event.data.getVar('TINDER_LOG'), 'w')
>              f.write("")
>              f.close()
>          except:
> @@ -287,7 +287,7 @@ def tinder_do_tinder_report(event):
>          try:
>              # write a status to the file. This is needed for the -k opti=
on
>              # of BitBake
> -            g =3D open(event.data.getVar('TMPDIR', True)+"/tinder-status=
", 'w')
> +            g =3D open(event.data.getVar('TMPDIR')+"/tinder-status", 'w')
>              g.write("")
>              g.close()
>          except IOError:
> @@ -296,10 +296,10 @@ def tinder_do_tinder_report(event):
>      # Append the Task-Log (compile,configure...) to the log file
>      # we will send to the server
>      if name =3D=3D "TaskSucceeded" or name =3D=3D "TaskFailed":
> -        log_file =3D glob.glob("%s/log.%s.*" % (event.data.getVar('T', T=
rue), event.task))
> +        log_file =3D glob.glob("%s/log.%s.*" % (event.data.getVar('T'), =
event.task))
> =20
>          if len(log_file) !=3D 0:
> -            to_file  =3D event.data.getVar('TINDER_LOG', True)
> +            to_file  =3D event.data.getVar('TINDER_LOG')
>              log     +=3D "".join(open(log_file[0], 'r').readlines())
> =20
>      # set the right 'HEADER'/Summary for the TinderBox
> @@ -310,16 +310,16 @@ def tinder_do_tinder_report(event):
>      elif name =3D=3D "TaskFailed":
>          log +=3D "<--- TINDERBOX Task %s failed (FAILURE)\n" % event.task
>      elif name =3D=3D "PkgStarted":
> -        log +=3D "---> TINDERBOX Package %s started\n" % event.data.getV=
ar('PF', True)
> +        log +=3D "---> TINDERBOX Package %s started\n" % event.data.getV=
ar('PF')
>      elif name =3D=3D "PkgSucceeded":
> -        log +=3D "<--- TINDERBOX Package %s done (SUCCESS)\n" % event.da=
ta.getVar('PF', True)
> +        log +=3D "<--- TINDERBOX Package %s done (SUCCESS)\n" % event.da=
ta.getVar('PF')
>      elif name =3D=3D "PkgFailed":
> -        if not event.data.getVar('TINDER_AUTOBUILD', True) =3D=3D "0":
> +        if not event.data.getVar('TINDER_AUTOBUILD') =3D=3D "0":
>              build.exec_task('do_clean', event.data)
> -        log +=3D "<--- TINDERBOX Package %s failed (FAILURE)\n" % event.=
data.getVar('PF', True)
> +        log +=3D "<--- TINDERBOX Package %s failed (FAILURE)\n" % event.=
data.getVar('PF')
>          status =3D 200
>          # remember the failure for the -k case
> -        h =3D open(event.data.getVar('TMPDIR', True)+"/tinder-status", '=
w')
> +        h =3D open(event.data.getVar('TMPDIR')+"/tinder-status", 'w')
>          h.write("200")
>      elif name =3D=3D "BuildCompleted":
>          log +=3D "Build Completed\n"
> @@ -342,7 +342,7 @@ def tinder_do_tinder_report(event):
>          log +=3D "Error:Was Runtime: %d\n" % event.isRuntime()
>          status =3D 200
>          # remember the failure for the -k case
> -        h =3D open(event.data.getVar('TMPDIR', True)+"/tinder-status", '=
w')
> +        h =3D open(event.data.getVar('TMPDIR')+"/tinder-status", 'w')
>          h.write("200")
> =20
>      # now post the log
> @@ -360,7 +360,7 @@ python tinderclient_eventhandler() {
>      if e.data is None or bb.event.getName(e) =3D=3D "MsgNote":
>          return
> =20
> -    do_tinder_report =3D e.data.getVar('TINDER_REPORT', True)
> +    do_tinder_report =3D e.data.getVar('TINDER_REPORT')
>      if do_tinder_report and do_tinder_report =3D=3D "1":
>          tinder_do_tinder_report(e)
> =20
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index 4bddf34..4ea2056 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> @@ -80,7 +80,7 @@ python toaster_layerinfo_dumpdata() {
>          return layer_info
> =20
> =20
> -    bblayers =3D e.data.getVar("BBLAYERS", True)
> +    bblayers =3D e.data.getVar("BBLAYERS")
> =20
>      llayerinfo =3D {}
> =20
> @@ -119,10 +119,10 @@ python toaster_package_dumpdata() {
>      """
> =20
>      # No need to try and dumpdata if the recipe isn't generating packages
> -    if not d.getVar('PACKAGES', True):
> +    if not d.getVar('PACKAGES'):
>          return
> =20
> -    pkgdatadir =3D d.getVar('PKGDESTWORK', True)
> +    pkgdatadir =3D d.getVar('PKGDESTWORK')
>      lpkgdata =3D {}
>      datadir =3D os.path.join(pkgdatadir, 'runtime')
> =20
> @@ -142,7 +142,7 @@ python toaster_artifact_dumpdata() {
>      """
> =20
>      event_data =3D {
> -      "TOOLCHAIN_OUTPUTNAME": d.getVar("TOOLCHAIN_OUTPUTNAME", True)
> +      "TOOLCHAIN_OUTPUTNAME": d.getVar("TOOLCHAIN_OUTPUTNAME")
>      }
> =20
>      bb.event.fire(bb.event.MetadataEvent("SDKArtifactInfo", event_data),=
 d)
> @@ -157,9 +157,9 @@ python toaster_collect_task_stats() {
>      import bb.utils
>      import os
> =20
> -    toaster_statlist_file =3D os.path.join(e.data.getVar('BUILDSTATS_BAS=
E', True), "toasterstatlist")
> +    toaster_statlist_file =3D os.path.join(e.data.getVar('BUILDSTATS_BAS=
E'), "toasterstatlist")
> =20
> -    if not e.data.getVar('BUILDSTATS_BASE', True):
> +    if not e.data.getVar('BUILDSTATS_BASE'):
>          return  # if we don't have buildstats, we cannot collect stats
> =20
>      def stat_to_float(value):
> @@ -246,7 +246,7 @@ python toaster_buildhistory_dump() {
>      import re
>      BUILDHISTORY_DIR =3D e.data.expand("${TOPDIR}/buildhistory")
>      BUILDHISTORY_DIR_IMAGE_BASE =3D e.data.expand("%s/images/${MACHINE_A=
RCH}/${TCLIBC}/"% BUILDHISTORY_DIR)
> -    pkgdata_dir =3D e.data.getVar("PKGDATA_DIR", True)
> +    pkgdata_dir =3D e.data.getVar("PKGDATA_DIR")
> =20
> =20
>      # scan the build targets for this build
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolch=
ain-scripts.bbclass
> index 0e11f2d..44b4e24 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -139,9 +139,9 @@ toolchain_create_sdk_siteconfig[vardepsexclude] =3D "=
TOOLCHAIN_CONFIGSITE_SYSROOTC
>  python __anonymous () {
>      import oe.classextend
>      deps =3D ""
> -    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "")=
=2Esplit():
> +    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split=
():
>          deps +=3D " %s:do_populate_sysroot" % dep
> -        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split=
():
> +        for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
>              clsextend =3D oe.classextend.ClassExtender(variant, d)
>              newdep =3D clsextend.extend_name(dep)
>              deps +=3D " %s:do_populate_sysroot" % newdep
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-confi=
g.bbclass
> index 3f760f2..10013b7 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -14,19 +14,19 @@
>  UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
> =20
>  python () {
> -    ubootmachine =3D d.getVar("UBOOT_MACHINE", True)
> +    ubootmachine =3D d.getVar("UBOOT_MACHINE")
>      ubootconfigflags =3D d.getVarFlags('UBOOT_CONFIG')
> -    ubootbinary =3D d.getVar('UBOOT_BINARY', True)
> -    ubootbinaries =3D d.getVar('UBOOT_BINARIES', True)
> +    ubootbinary =3D d.getVar('UBOOT_BINARY')
> +    ubootbinaries =3D d.getVar('UBOOT_BINARIES')
>      # The "doc" varflag is special, we don't want to see it here
>      ubootconfigflags.pop('doc', None)
> =20
>      if not ubootmachine and not ubootconfigflags:
> -        PN =3D d.getVar("PN", True)
> -        FILE =3D os.path.basename(d.getVar("FILE", True))
> +        PN =3D d.getVar("PN")
> +        FILE =3D os.path.basename(d.getVar("FILE"))
>          bb.debug(1, "To build %s, see %s for instructions on \
>                   setting up your machine config" % (PN, FILE))
> -        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG=
 must be set in the %s machine configuration." % d.getVar("MACHINE", True))
> +        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG=
 must be set in the %s machine configuration." % d.getVar("MACHINE"))
> =20
>      if ubootmachine and ubootconfigflags:
>          raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBO=
OT_CONFIG at the same time.")
> @@ -37,7 +37,7 @@ python () {
>      if not ubootconfigflags:
>          return
> =20
> -    ubootconfig =3D (d.getVar('UBOOT_CONFIG', True) or "").split()
> +    ubootconfig =3D (d.getVar('UBOOT_CONFIG') or "").split()
>      if len(ubootconfig) > 0:
>          for config in ubootconfig:
>              for f, v in ubootconfigflags.items():
> diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/ub=
oot-extlinux-config.bbclass
> index df91386..ec5fffb 100644
> --- a/meta/classes/uboot-extlinux-config.bbclass
> +++ b/meta/classes/uboot-extlinux-config.bbclass
> @@ -58,20 +58,20 @@ UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??=3D "${DISTRO=
_NAME}"
>  UBOOT_EXTLINUX_CONFIG =3D "${B}/extlinux.conf"
> =20
>  python create_extlinux_config() {
> -    if d.getVar("UBOOT_EXTLINUX", True) !=3D "1":
> +    if d.getVar("UBOOT_EXTLINUX") !=3D "1":
>        return
> =20
> -    if not d.getVar('WORKDIR', True):
> +    if not d.getVar('WORKDIR'):
>          bb.error("WORKDIR not defined, unable to package")
> =20
> -    labels =3D d.getVar('UBOOT_EXTLINUX_LABELS', True)
> +    labels =3D d.getVar('UBOOT_EXTLINUX_LABELS')
>      if not labels:
>          bb.fatal("UBOOT_EXTLINUX_LABELS not defined, nothing to do")
> =20
>      if not labels.strip():
>          bb.fatal("No labels, nothing to do")
> =20
> -    cfile =3D d.getVar('UBOOT_EXTLINUX_CONFIG', True)
> +    cfile =3D d.getVar('UBOOT_EXTLINUX_CONFIG')
>      if not cfile:
>          bb.fatal('Unable to read UBOOT_EXTLINUX_CONFIG')
> =20
> @@ -85,34 +85,34 @@ python create_extlinux_config() {
>              for label in labels.split():
>                  localdata =3D bb.data.createCopy(d)
> =20
> -                overrides =3D localdata.getVar('OVERRIDES', True)
> +                overrides =3D localdata.getVar('OVERRIDES')
>                  if not overrides:
>                      bb.fatal('OVERRIDES not defined')
> =20
>                  localdata.setVar('OVERRIDES', label + ':' + overrides)
>                  bb.data.update_data(localdata)
> =20
> -                extlinux_console =3D localdata.getVar('UBOOT_EXTLINUX_CO=
NSOLE', True)
> +                extlinux_console =3D localdata.getVar('UBOOT_EXTLINUX_CO=
NSOLE')
> =20
> -                menu_description =3D localdata.getVar('UBOOT_EXTLINUX_ME=
NU_DESCRIPTION', True)
> +                menu_description =3D localdata.getVar('UBOOT_EXTLINUX_ME=
NU_DESCRIPTION')
>                  if not menu_description:
>                      menu_description =3D label
> =20
> -                root =3D localdata.getVar('UBOOT_EXTLINUX_ROOT', True)
> +                root =3D localdata.getVar('UBOOT_EXTLINUX_ROOT')
>                  if not root:
>                      bb.fatal('UBOOT_EXTLINUX_ROOT not defined')
> =20
> -                kernel_image =3D localdata.getVar('UBOOT_EXTLINUX_KERNEL=
_IMAGE', True)
> -                fdtdir =3D localdata.getVar('UBOOT_EXTLINUX_FDTDIR', Tru=
e)
> +                kernel_image =3D localdata.getVar('UBOOT_EXTLINUX_KERNEL=
_IMAGE')
> +                fdtdir =3D localdata.getVar('UBOOT_EXTLINUX_FDTDIR')
>                  if fdtdir:
>                      cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n'=
 %
>                                   (menu_description, kernel_image, fdtdir=
))
>                  else:
>                      cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_desc=
ription, kernel_image))
> =20
> -                kernel_args =3D localdata.getVar('UBOOT_EXTLINUX_KERNEL_=
ARGS', True)
> +                kernel_args =3D localdata.getVar('UBOOT_EXTLINUX_KERNEL_=
ARGS')
> =20
> -                initrd =3D localdata.getVar('UBOOT_EXTLINUX_INITRD', Tru=
e)
> +                initrd =3D localdata.getVar('UBOOT_EXTLINUX_INITRD')
>                  if initrd:
>                      cfgfile.write('\tINITRD %s\n'% initrd)
> =20
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bb=
class
> index cef26b1..65a8c49 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -80,9 +80,9 @@ do_concat_dtb () {
>  }
> =20
>  python () {
> -	uboot_pn =3D d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
> -	if d.getVar('UBOOT_SIGN_ENABLE', True) =3D=3D '1' and d.getVar('PN', Tr=
ue) =3D=3D uboot_pn:
> -		kernel_pn =3D d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
> +	uboot_pn =3D d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
> +	if d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1' and d.getVar('PN') =3D=3D u=
boot_pn:
> +		kernel_pn =3D d.getVar('PREFERRED_PROVIDER_virtual/kernel')
> =20
>  		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
>  		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbcl=
ass
> index 89cec07..7dab1e8 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -30,11 +30,11 @@ python uninative_event_fetchloader() {
>      loader isn't already present.
>      """
> =20
> -    chksum =3D d.getVarFlag("UNINATIVE_CHECKSUM", d.getVar("BUILD_ARCH",=
 True), True)
> +    chksum =3D d.getVarFlag("UNINATIVE_CHECKSUM", d.getVar("BUILD_ARCH")=
, True)
>      if not chksum:
> -        bb.fatal("Uninative selected but not configured correctly, pleas=
e set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH", True))
> +        bb.fatal("Uninative selected but not configured correctly, pleas=
e set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH"))
> =20
> -    loader =3D d.getVar("UNINATIVE_LOADER", True)
> +    loader =3D d.getVar("UNINATIVE_LOADER")
>      loaderchksum =3D loader + ".chksum"
>      if os.path.exists(loader) and os.path.exists(loaderchksum):
>          with open(loaderchksum, "r") as f:
> @@ -47,13 +47,13 @@ python uninative_event_fetchloader() {
>          # Save and restore cwd as Fetch.download() does a chdir()
>          olddir =3D os.getcwd()
> =20
> -        tarball =3D d.getVar("UNINATIVE_TARBALL", True)
> -        tarballdir =3D os.path.join(d.getVar("UNINATIVE_DLDIR", True), c=
hksum)
> +        tarball =3D d.getVar("UNINATIVE_TARBALL")
> +        tarballdir =3D os.path.join(d.getVar("UNINATIVE_DLDIR"), chksum)
>          tarballpath =3D os.path.join(tarballdir, tarball)
> =20
>          if not os.path.exists(tarballpath):
>              bb.utils.mkdirhier(tarballdir)
> -            if d.getVar("UNINATIVE_URL", True) =3D=3D "unset":
> +            if d.getVar("UNINATIVE_URL") =3D=3D "unset":
>                  bb.fatal("Uninative selected but not configured, please =
set UNINATIVE_URL")
> =20
>              localdata =3D bb.data.createCopy(d)
> @@ -96,7 +96,7 @@ python uninative_event_enable() {
>  }
> =20
>  def enable_uninative(d):
> -    loader =3D d.getVar("UNINATIVE_LOADER", True)
> +    loader =3D d.getVar("UNINATIVE_LOADER")
>      if os.path.exists(loader):
>          bb.debug(2, "Enabling uninative")
>          d.setVar("NATIVELSBSTRING", "universal")
> @@ -111,7 +111,7 @@ python uninative_changeinterp () {
>      if not (bb.data.inherits_class('native', d) or bb.data.inherits_clas=
s('crosssdk', d) or bb.data.inherits_class('cross', d)):
>          return
> =20
> -    sstateinst =3D d.getVar('SSTATE_INSTDIR', True)
> +    sstateinst =3D d.getVar('SSTATE_INSTDIR')
>      for walkroot, dirs, files in os.walk(sstateinst):
>          for file in files:
>              if file.endswith(".so") or ".so." in file:
> @@ -132,7 +132,7 @@ python uninative_changeinterp () {
> =20
>              try:
>                  subprocess.check_output(("patchelf-uninative", "--set-in=
terpreter",
> -                                         d.getVar("UNINATIVE_LOADER", Tr=
ue), f),
> +                                         d.getVar("UNINATIVE_LOADER"), f=
),
>                                          stderr=3Dsubprocess.STDOUT)
>              except subprocess.CalledProcessError as e:
>                  bb.fatal("'%s' failed with exit code %d and the followin=
g output:\n%s" %
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/upda=
te-alternatives.bbclass
> index 1fdd681..65da9da 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -66,8 +66,8 @@ ALTERNATIVE_PRIORITY =3D "10"
>  UPDALTVARS  =3D "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET AL=
TERNATIVE_PRIORITY"
> =20
>  def gen_updatealternativesvardeps(d):
> -    pkgs =3D (d.getVar("PACKAGES", True) or "").split()
> -    vars =3D (d.getVar("UPDALTVARS", True) or "").split()
> +    pkgs =3D (d.getVar("PACKAGES") or "").split()
> +    vars =3D (d.getVar("UPDALTVARS") or "").split()
> =20
>      # First compute them for non_pkg versions
>      for v in vars:
> @@ -84,7 +84,7 @@ def gen_updatealternativesvardeps(d):
>                  d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d=
=2EgetVarFlag('%s_%s' % (v,p), flag, False)))
> =20
>  def ua_extend_depends(d):
> -    if not 'virtual/update-alternatives' in d.getVar('PROVIDES', True):
> +    if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
>          d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
> =20
>  python __anonymous() {
> @@ -103,8 +103,8 @@ python __anonymous() {
> =20
>  def gen_updatealternativesvars(d):
>      ret =3D []
> -    pkgs =3D (d.getVar("PACKAGES", True) or "").split()
> -    vars =3D (d.getVar("UPDALTVARS", True) or "").split()
> +    pkgs =3D (d.getVar("PACKAGES") or "").split()
> +    vars =3D (d.getVar("UPDALTVARS") or "").split()
> =20
>      for v in vars:
>          ret.append(v + "_VARDEPS")
> @@ -123,23 +123,23 @@ populate_packages[vardeps] +=3D "${UPDALTVARS} ${@g=
en_updatealternativesvars(d)}"
>  # place.
>  python perform_packagecopy_append () {
>      # Check for deprecated usage...
> -    pn =3D d.getVar('BPN', True)
> -    if d.getVar('ALTERNATIVE_LINKS', True) !=3D None:
> +    pn =3D d.getVar('BPN')
> +    if d.getVar('ALTERNATIVE_LINKS') !=3D None:
>          bb.fatal('%s: Use of ALTERNATIVE_LINKS/ALTERNATIVE_PATH/ALTERNAT=
IVE_NAME is no longer supported, please convert to the updated syntax, see =
update-alternatives.bbclass for more info.' % pn)
> =20
>      # Do actual update alternatives processing
> -    pkgdest =3D d.getVar('PKGD', True)
> -    for pkg in (d.getVar('PACKAGES', True) or "").split():
> +    pkgdest =3D d.getVar('PKGD')
> +    for pkg in (d.getVar('PACKAGES') or "").split():
>          # If the src =3D=3D dest, we know we need to rename the dest by =
appending ${BPN}
>          link_rename =3D {}
> -        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").s=
plit():
> +        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
>              alt_link     =3D d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_n=
ame, True)
>              if not alt_link:
> -                alt_link =3D "%s/%s" % (d.getVar('bindir', True), alt_na=
me)
> +                alt_link =3D "%s/%s" % (d.getVar('bindir'), alt_name)
>                  d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
> =20
>              alt_target   =3D d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg,=
 alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
> -            alt_target   =3D alt_target or d.getVar('ALTERNATIVE_TARGET_=
%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
> +            alt_target   =3D alt_target or d.getVar('ALTERNATIVE_TARGET_=
%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
>              # Sometimes alt_target is specified as relative to the link =
name.
>              alt_target   =3D os.path.join(os.path.dirname(alt_link), alt=
_target)
> =20
> @@ -189,23 +189,23 @@ python perform_packagecopy_append () {
>  PACKAGESPLITFUNCS_prepend =3D "populate_packages_updatealternatives "
> =20
>  python populate_packages_updatealternatives () {
> -    pn =3D d.getVar('BPN', True)
> +    pn =3D d.getVar('BPN')
> =20
>      # Do actual update alternatives processing
> -    pkgdest =3D d.getVar('PKGD', True)
> -    for pkg in (d.getVar('PACKAGES', True) or "").split():
> +    pkgdest =3D d.getVar('PKGD')
> +    for pkg in (d.getVar('PACKAGES') or "").split():
>          # Create post install/removal scripts
>          alt_setup_links =3D ""
>          alt_remove_links =3D ""
> -        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").s=
plit():
> +        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
>              alt_link     =3D d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_n=
ame, True)
>              alt_target   =3D d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg,=
 alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
> -            alt_target   =3D alt_target or d.getVar('ALTERNATIVE_TARGET_=
%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
> +            alt_target   =3D alt_target or d.getVar('ALTERNATIVE_TARGET_=
%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
>              # Sometimes alt_target is specified as relative to the link =
name.
>              alt_target   =3D os.path.join(os.path.dirname(alt_link), alt=
_target)
> =20
>              alt_priority =3D d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pk=
g,  alt_name, True) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name, True)
> -            alt_priority =3D alt_priority or d.getVar('ALTERNATIVE_PRIOR=
ITY_%s' % pkg, True) or d.getVar('ALTERNATIVE_PRIORITY', True)
> +            alt_priority =3D alt_priority or d.getVar('ALTERNATIVE_PRIOR=
ITY_%s' % pkg) or d.getVar('ALTERNATIVE_PRIORITY')
> =20
>              # This shouldn't trigger, as it should have been resolved ea=
rlier!
>              if alt_link =3D=3D alt_target:
> @@ -224,32 +224,32 @@ python populate_packages_updatealternatives () {
> =20
>          if alt_setup_links:
>              # RDEPENDS setup
> -            provider =3D d.getVar('VIRTUAL-RUNTIME_update-alternatives',=
 True)
> +            provider =3D d.getVar('VIRTUAL-RUNTIME_update-alternatives')
>              if provider:
>                  #bb.note('adding runtime requirement for update-alternat=
ives for %s' % pkg)
>                  d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFI=
X', False) + provider)
> =20
>              bb.note('adding update-alternatives calls to postinst/prerm =
for %s' % pkg)
>              bb.note('%s' % alt_setup_links)
> -            postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or '#!/=
bin/sh\n'
> +            postinst =3D d.getVar('pkg_postinst_%s' % pkg) or '#!/bin/sh=
\n'
>              postinst +=3D alt_setup_links
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
>              bb.note('%s' % alt_remove_links)
> -            prerm =3D d.getVar('pkg_prerm_%s' % pkg, True) or '#!/bin/sh=
\n'
> +            prerm =3D d.getVar('pkg_prerm_%s' % pkg) or '#!/bin/sh\n'
>              prerm +=3D alt_remove_links
>              d.setVar('pkg_prerm_%s' % pkg, prerm)
>  }
> =20
>  python package_do_filedeps_append () {
> -    pn =3D d.getVar('BPN', True)
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    pn =3D d.getVar('BPN')
> +    pkgdest =3D d.getVar('PKGDEST')
> =20
>      for pkg in packages.split():
> -        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").s=
plit():
> +        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
>              alt_link     =3D d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_n=
ame, True)
>              alt_target   =3D d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg,=
 alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
> -            alt_target   =3D alt_target or d.getVar('ALTERNATIVE_TARGET_=
%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
> +            alt_target   =3D alt_target or d.getVar('ALTERNATIVE_TARGET_=
%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
> =20
>              if alt_link =3D=3D alt_target:
>                  bb.warn('%s: alt_link =3D=3D alt_target: %s =3D=3D %s' %=
 (pn, alt_link, alt_target))
> @@ -261,7 +261,7 @@ python package_do_filedeps_append () {
>              # Add file provide
>              trans_target =3D oe.package.file_translate(alt_target)
>              d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " "=
 + alt_link)
> -            if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % p=
kg, True) or ""):
> +            if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % p=
kg) or ""):
>                  d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_t=
arget)
>  }
> =20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.=
bbclass
> index 321924b..eafd036 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -80,52 +80,52 @@ python populate_packages_updatercd () {
>              return
>          statement =3D "grep -q -w '/etc/init.d/functions' %s" % path
>          if subprocess.call(statement, shell=3DTrue) =3D=3D 0:
> -            mlprefix =3D d.getVar('MLPREFIX', True) or ""
> +            mlprefix =3D d.getVar('MLPREFIX') or ""
>              d.appendVar('RDEPENDS_' + pkg, ' %sinitscripts-functions' % =
(mlprefix))
> =20
>      def update_rcd_package(pkg):
>          bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/=
postrm for %s' % pkg)
> =20
>          localdata =3D bb.data.createCopy(d)
> -        overrides =3D localdata.getVar("OVERRIDES", True)
> +        overrides =3D localdata.getVar("OVERRIDES")
>          localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
>          bb.data.update_data(localdata)
> =20
>          update_rcd_auto_depend(pkg)
> =20
> -        preinst =3D d.getVar('pkg_preinst_%s' % pkg, True)
> +        preinst =3D d.getVar('pkg_preinst_%s' % pkg)
>          if not preinst:
>              preinst =3D '#!/bin/sh\n'
> -        preinst +=3D localdata.getVar('updatercd_preinst', True)
> +        preinst +=3D localdata.getVar('updatercd_preinst')
>          d.setVar('pkg_preinst_%s' % pkg, preinst)
> =20
> -        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>          if not postinst:
>              postinst =3D '#!/bin/sh\n'
> -        postinst +=3D localdata.getVar('updatercd_postinst', True)
> +        postinst +=3D localdata.getVar('updatercd_postinst')
>          d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -        prerm =3D d.getVar('pkg_prerm_%s' % pkg, True)
> +        prerm =3D d.getVar('pkg_prerm_%s' % pkg)
>          if not prerm:
>              prerm =3D '#!/bin/sh\n'
> -        prerm +=3D localdata.getVar('updatercd_prerm', True)
> +        prerm +=3D localdata.getVar('updatercd_prerm')
>          d.setVar('pkg_prerm_%s' % pkg, prerm)
> =20
> -        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True)
> +        postrm =3D d.getVar('pkg_postrm_%s' % pkg)
>          if not postrm:
>                  postrm =3D '#!/bin/sh\n'
> -        postrm +=3D localdata.getVar('updatercd_postrm', True)
> +        postrm +=3D localdata.getVar('updatercd_postrm')
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
> =20
>          d.appendVar('RRECOMMENDS_' + pkg, " ${MLPREFIX}${UPDATERCD}")
> =20
>      # Check that this class isn't being inhibited (generally, by
>      # systemd.bbclass) before doing any work.
> -    if not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
> -        pkgs =3D d.getVar('INITSCRIPT_PACKAGES', True)
> +    if not d.getVar("INHIBIT_UPDATERCD_BBCLASS"):
> +        pkgs =3D d.getVar('INITSCRIPT_PACKAGES')
>          if pkgs =3D=3D None:
> -            pkgs =3D d.getVar('UPDATERCPN', True)
> -            packages =3D (d.getVar('PACKAGES', True) or "").split()
> +            pkgs =3D d.getVar('UPDATERCPN')
> +            packages =3D (d.getVar('PACKAGES') or "").split()
>              if not pkgs in packages and packages !=3D []:
>                  pkgs =3D packages[0]
>          for pkg in pkgs.split():
> diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/userad=
d-staticids.bbclass
> index 4162774..94bcbaa 100644
> --- a/meta/classes/useradd-staticids.bbclass
> +++ b/meta/classes/useradd-staticids.bbclass
> @@ -8,11 +8,11 @@ def update_useradd_static_config(d):
> =20
>      class myArgumentParser( argparse.ArgumentParser ):
>          def _print_message(self, message, file=3DNone):
> -            bb.warn("%s - %s: %s" % (d.getVar('PN', True), pkg, message))
> +            bb.warn("%s - %s: %s" % (d.getVar('PN'), pkg, message))
> =20
>          # This should never be called...
>          def exit(self, status=3D0, message=3DNone):
> -            message =3D message or ("%s - %s: useradd.bbclass: Argument =
parsing exited" % (d.getVar('PN', True), pkg))
> +            message =3D message or ("%s - %s: useradd.bbclass: Argument =
parsing exited" % (d.getVar('PN'), pkg))
>              error(message)
> =20
>          def error(self, message):
> @@ -52,10 +52,10 @@ def update_useradd_static_config(d):
> =20
>      def handle_missing_id(id, type, pkg):
>          # For backwards compatibility we accept "1" in addition to "erro=
r"
> -        if d.getVar('USERADD_ERROR_DYNAMIC', True) =3D=3D 'error' or d.g=
etVar('USERADD_ERROR_DYNAMIC', True) =3D=3D '1':
> -            raise NotImplementedError("%s - %s: %sname %s does not have =
a static ID defined. Skipping it." % (d.getVar('PN', True), pkg, type, id))
> -        elif d.getVar('USERADD_ERROR_DYNAMIC', True) =3D=3D 'warn':
> -            bb.warn("%s - %s: %sname %s does not have a static ID define=
d." % (d.getVar('PN', True), pkg, type, id))
> +        if d.getVar('USERADD_ERROR_DYNAMIC') =3D=3D 'error' or d.getVar(=
'USERADD_ERROR_DYNAMIC') =3D=3D '1':
> +            raise NotImplementedError("%s - %s: %sname %s does not have =
a static ID defined. Skipping it." % (d.getVar('PN'), pkg, type, id))
> +        elif d.getVar('USERADD_ERROR_DYNAMIC') =3D=3D 'warn':
> +            bb.warn("%s - %s: %sname %s does not have a static ID define=
d." % (d.getVar('PN'), pkg, type, id))
> =20
>      # We parse and rewrite the useradd components
>      def rewrite_useradd(params):
> @@ -89,8 +89,8 @@ def update_useradd_static_config(d):
>          # paths are resolved via BBPATH
>          def get_passwd_list(d):
>              str =3D ""
> -            bbpath =3D d.getVar('BBPATH', True)
> -            passwd_tables =3D d.getVar('USERADD_UID_TABLES', True)
> +            bbpath =3D d.getVar('BBPATH')
> +            passwd_tables =3D d.getVar('USERADD_UID_TABLES')
>              if not passwd_tables:
>                  passwd_tables =3D 'files/passwd'
>              for conf_file in passwd_tables.split():
> @@ -106,7 +106,7 @@ def update_useradd_static_config(d):
>              try:
>                  uaargs =3D parser.parse_args(re.split('''[ \t]+(?=3D(?:[=
^'"]|'[^']*'|"[^"]*")*$)''', param))
>              except:
> -                bb.fatal("%s: Unable to parse arguments for USERADD_PARA=
M_%s: '%s'" % (d.getVar('PN', True), pkg, param))
> +                bb.fatal("%s: Unable to parse arguments for USERADD_PARA=
M_%s: '%s'" % (d.getVar('PN'), pkg, param))
> =20
>              # Read all passwd files specified in USERADD_UID_TABLES or f=
iles/passwd
>              # Use the standard passwd layout:
> @@ -130,7 +130,7 @@ def update_useradd_static_config(d):
>              field =3D users[uaargs.LOGIN]
> =20
>              if uaargs.uid and field[2] and (uaargs.uid !=3D field[2]):
> -                bb.warn("%s: Changing username %s's uid from (%s) to (%s=
), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaar=
gs.uid, field[2]))
> +                bb.warn("%s: Changing username %s's uid from (%s) to (%s=
), verify configuration files!" % (d.getVar('PN'), uaargs.LOGIN, uaargs.uid=
, field[2]))
>              uaargs.uid =3D field[2] or uaargs.uid
> =20
>              # Determine the possible groupname
> @@ -158,12 +158,12 @@ def update_useradd_static_config(d):
>                      # We want to add a group, but we don't know it's nam=
e... so we can't add the group...
>                      # We have to assume the group has previously been ad=
ded or we'll fail on the adduser...
>                      # Note: specifying the actual gid is very rare in OE=
, usually the group name is specified.
> -                    bb.warn("%s: Changing gid for login %s to %s, verify=
 configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupi=
d))
> +                    bb.warn("%s: Changing gid for login %s to %s, verify=
 configuration files!" % (d.getVar('PN'), uaargs.LOGIN, uaargs.groupid))
> =20
>                  uaargs.gid =3D uaargs.groupid
>                  uaargs.user_group =3D None
>                  if newgroup:
> -                    groupadd =3D d.getVar("GROUPADD_PARAM_%s" % pkg, Tru=
e)
> +                    groupadd =3D d.getVar("GROUPADD_PARAM_%s" % pkg)
>                      if groupadd:
>                          d.setVar("GROUPADD_PARAM_%s" % pkg, "%s; %s" % (=
groupadd, newgroup))
>                      else:
> @@ -223,8 +223,8 @@ def update_useradd_static_config(d):
>          # paths are resolved via BBPATH
>          def get_group_list(d):
>              str =3D ""
> -            bbpath =3D d.getVar('BBPATH', True)
> -            group_tables =3D d.getVar('USERADD_GID_TABLES', True)
> +            bbpath =3D d.getVar('BBPATH')
> +            group_tables =3D d.getVar('USERADD_GID_TABLES')
>              if not group_tables:
>                  group_tables =3D 'files/group'
>              for conf_file in group_tables.split():
> @@ -241,7 +241,7 @@ def update_useradd_static_config(d):
>                  # If we're processing multiple lines, we could have left=
 over values here...
>                  gaargs =3D parser.parse_args(re.split('''[ \t]+(?=3D(?:[=
^'"]|'[^']*'|"[^"]*")*$)''', param))
>              except:
> -                bb.fatal("%s: Unable to parse arguments for GROUPADD_PAR=
AM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
> +                bb.fatal("%s: Unable to parse arguments for GROUPADD_PAR=
AM_%s: '%s'" % (d.getVar('PN'), pkg, param))
> =20
>              # Read all group files specified in USERADD_GID_TABLES or fi=
les/group
>              # Use the standard group layout:
> @@ -264,7 +264,7 @@ def update_useradd_static_config(d):
> =20
>              if field[2]:
>                  if gaargs.gid and (gaargs.gid !=3D field[2]):
> -                    bb.warn("%s: Changing groupname %s's gid from (%s) t=
o (%s), verify configuration files!" % (d.getVar('PN', True), gaargs.GROUP,=
 gaargs.gid, field[2]))
> +                    bb.warn("%s: Changing groupname %s's gid from (%s) t=
o (%s), verify configuration files!" % (d.getVar('PN'), gaargs.GROUP, gaarg=
s.gid, field[2]))
>                  gaargs.gid =3D field[2]
> =20
>              if not gaargs.gid or not gaargs.gid.isdigit():
> @@ -288,32 +288,32 @@ def update_useradd_static_config(d):
>      # the files listed in USERADD_UID/GID_TABLES. We need to tell bitbake
>      # about that explicitly to trigger re-parsing and thus re-execution =
of
>      # this code when the files change.
> -    bbpath =3D d.getVar('BBPATH', True)
> +    bbpath =3D d.getVar('BBPATH')
>      for varname, default in (('USERADD_UID_TABLES', 'files/passwd'),
>                               ('USERADD_GID_TABLES', 'files/group')):
> -        tables =3D d.getVar(varname, True)
> +        tables =3D d.getVar(varname)
>          if not tables:
>              tables =3D default
>          for conf_file in tables.split():
>              bb.parse.mark_dependency(d, bb.utils.which(bbpath, conf_file=
))
> =20
>      # Load and process the users and groups, rewriting the adduser/addgr=
oup params
> -    useradd_packages =3D d.getVar('USERADD_PACKAGES', True)
> +    useradd_packages =3D d.getVar('USERADD_PACKAGES')
> =20
>      for pkg in useradd_packages.split():
>          # Groupmems doesn't have anything we might want to change, so si=
mply validating
>          # is a bit of a waste -- only process useradd/groupadd
> -        useradd_param =3D d.getVar('USERADD_PARAM_%s' % pkg, True)
> +        useradd_param =3D d.getVar('USERADD_PARAM_%s' % pkg)
>          if useradd_param:
>              #bb.warn("Before: 'USERADD_PARAM_%s' - '%s'" % (pkg, useradd=
_param))
>              d.setVar('USERADD_PARAM_%s' % pkg, rewrite_useradd(useradd_p=
aram))
> -            #bb.warn("After:  'USERADD_PARAM_%s' - '%s'" % (pkg, d.getVa=
r('USERADD_PARAM_%s' % pkg, True)))
> +            #bb.warn("After:  'USERADD_PARAM_%s' - '%s'" % (pkg, d.getVa=
r('USERADD_PARAM_%s' % pkg)))
> =20
> -        groupadd_param =3D d.getVar('GROUPADD_PARAM_%s' % pkg, True)
> +        groupadd_param =3D d.getVar('GROUPADD_PARAM_%s' % pkg)
>          if groupadd_param:
>              #bb.warn("Before: 'GROUPADD_PARAM_%s' - '%s'" % (pkg, groupa=
dd_param))
>              d.setVar('GROUPADD_PARAM_%s' % pkg, rewrite_groupadd(groupad=
d_param))
> -            #bb.warn("After:  'GROUPADD_PARAM_%s' - '%s'" % (pkg, d.getV=
ar('GROUPADD_PARAM_%s' % pkg, True)))
> +            #bb.warn("After:  'GROUPADD_PARAM_%s' - '%s'" % (pkg, d.getV=
ar('GROUPADD_PARAM_%s' % pkg)))
> =20
> =20
> =20
> @@ -323,6 +323,6 @@ python __anonymous() {
>          try:
>              update_useradd_static_config(d)
>          except NotImplementedError as f:
> -            bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN', True)=
, f))
> +            bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN'), f))
>              raise bb.parse.SkipPackage(f)
>  }
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 3cff08e..fd59969 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -168,13 +168,13 @@ USERADDSETSCENEDEPS =3D ""
> =20
>  # Recipe parse-time sanity checks
>  def update_useradd_after_parse(d):
> -    useradd_packages =3D d.getVar('USERADD_PACKAGES', True)
> +    useradd_packages =3D d.getVar('USERADD_PACKAGES')
> =20
>      if not useradd_packages:
>          bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" =
% d.getVar('FILE', False))
> =20
>      for pkg in useradd_packages.split():
> -        if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar=
('GROUPADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPMEMS_PARAM_%s' % p=
kg, True):
> +        if not d.getVar('USERADD_PARAM_%s' % pkg) and not d.getVar('GROU=
PADD_PARAM_%s' % pkg) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg):
>              bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM,=
 GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', Fals=
e), pkg))
> =20
>  python __anonymous() {
> @@ -191,9 +191,9 @@ def get_all_cmd_params(d, cmd_type):
>      param_type =3D cmd_type.upper() + "_PARAM_%s"
>      params =3D []
> =20
> -    useradd_packages =3D d.getVar('USERADD_PACKAGES', True) or ""
> +    useradd_packages =3D d.getVar('USERADD_PACKAGES') or ""
>      for pkg in useradd_packages.split():
> -        param =3D d.getVar(param_type % pkg, True)
> +        param =3D d.getVar(param_type % pkg)
>          if param:
>              params.append(param.rstrip(" ;"))
> =20
> @@ -209,20 +209,20 @@ fakeroot python populate_packages_prepend () {
>          required to execute on the target. Not doing so may cause
>          useradd preinst to be invoked twice, causing unwanted warnings.
>          """
> -        preinst =3D d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('=
pkg_preinst', True)
> +        preinst =3D d.getVar('pkg_preinst_%s' % pkg) or d.getVar('pkg_pr=
einst')
>          if not preinst:
>              preinst =3D '#!/bin/sh\n'
>          preinst +=3D 'bbnote () {\n\techo "NOTE: $*"\n}\n'
>          preinst +=3D 'bbwarn () {\n\techo "WARNING: $*"\n}\n'
>          preinst +=3D 'bbfatal () {\n\techo "ERROR: $*"\n\texit 1\n}\n'
> -        preinst +=3D 'perform_groupadd () {\n%s}\n' % d.getVar('perform_=
groupadd', True)
> -        preinst +=3D 'perform_useradd () {\n%s}\n' % d.getVar('perform_u=
seradd', True)
> -        preinst +=3D 'perform_groupmems () {\n%s}\n' % d.getVar('perform=
_groupmems', True)
> -        preinst +=3D d.getVar('useradd_preinst', True)
> +        preinst +=3D 'perform_groupadd () {\n%s}\n' % d.getVar('perform_=
groupadd')
> +        preinst +=3D 'perform_useradd () {\n%s}\n' % d.getVar('perform_u=
seradd')
> +        preinst +=3D 'perform_groupmems () {\n%s}\n' % d.getVar('perform=
_groupmems')
> +        preinst +=3D d.getVar('useradd_preinst')
>          d.setVar('pkg_preinst_%s' % pkg, preinst)
> =20
>          # RDEPENDS setup
> -        rdepends =3D d.getVar("RDEPENDS_%s" % pkg, True) or ""
> +        rdepends =3D d.getVar("RDEPENDS_%s" % pkg) or ""
>          rdepends +=3D ' ' + d.getVar('MLPREFIX', False) + 'base-passwd'
>          rdepends +=3D ' ' + d.getVar('MLPREFIX', False) + 'shadow'
>          # base-files is where the default /etc/skel is packaged
> @@ -233,7 +233,7 @@ fakeroot python populate_packages_prepend () {
>      # to packages specified by USERADD_PACKAGES
>      if not bb.data.inherits_class('nativesdk', d) \
>          and not bb.data.inherits_class('native', d):
> -        useradd_packages =3D d.getVar('USERADD_PACKAGES', True) or ""
> +        useradd_packages =3D d.getVar('USERADD_PACKAGES') or ""
>          for pkg in useradd_packages.split():
>              update_useradd_package(pkg)
>  }
> diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-ta=
sks.bbclass
> index 7ba56e2..68e8217 100644
> --- a/meta/classes/utility-tasks.bbclass
> +++ b/meta/classes/utility-tasks.bbclass
> @@ -32,14 +32,14 @@ python do_clean() {
>      bb.note("Removing " + dir)
>      oe.path.remove(dir)
> =20
> -    for f in (d.getVar('CLEANFUNCS', True) or '').split():
> +    for f in (d.getVar('CLEANFUNCS') or '').split():
>          bb.build.exec_func(f, d)
>  }
> =20
>  addtask checkuri
>  do_checkuri[nostamp] =3D "1"
>  python do_checkuri() {
> -    src_uri =3D (d.getVar('SRC_URI', True) or "").split()
> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
>      if len(src_uri) =3D=3D 0:
>          return
> =20
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index dbb5e4c..640daed 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -41,9 +41,9 @@ def oe_filter_out(f, str, d):
> =20
>  def machine_paths(d):
>      """List any existing machine specific filespath directories"""
> -    machine =3D d.getVar("MACHINE", True)
> -    filespathpkg =3D d.getVar("FILESPATHPKG", True).split(":")
> -    for basepath in d.getVar("FILESPATHBASE", True).split(":"):
> +    machine =3D d.getVar("MACHINE")
> +    filespathpkg =3D d.getVar("FILESPATHPKG").split(":")
> +    for basepath in d.getVar("FILESPATHBASE").split(":"):
>          for pkgpath in filespathpkg:
>              machinepath =3D os.path.join(basepath, pkgpath, machine)
>              if os.path.isdir(machinepath):
> @@ -52,7 +52,7 @@ def machine_paths(d):
>  def is_machine_specific(d):
>      """Determine whether the current recipe is machine specific"""
>      machinepaths =3D set(machine_paths(d))
> -    srcuri =3D d.getVar("SRC_URI", True).split()
> +    srcuri =3D d.getVar("SRC_URI").split()
>      for url in srcuri:
>          fetcher =3D bb.fetch2.Fetch([srcuri], d)
>          if url.startswith("file://"):
> @@ -315,14 +315,14 @@ def explode_deps(s):
> =20
>  def base_set_filespath(path, d):
>      filespath =3D []
> -    extrapaths =3D (d.getVar("FILESEXTRAPATHS", True) or "")
> +    extrapaths =3D (d.getVar("FILESEXTRAPATHS") or "")
>      # Remove default flag which was used for checking
>      extrapaths =3D extrapaths.replace("__default:", "")
>      # Don't prepend empty strings to the path list
>      if extrapaths !=3D "":
>          path =3D extrapaths.split(":") + path
>      # The ":" ensures we have an 'empty' override
> -    overrides =3D (":" + (d.getVar("FILESOVERRIDES", True) or "")).split=
(":")
> +    overrides =3D (":" + (d.getVar("FILESOVERRIDES") or "")).split(":")
>      overrides.reverse()
>      for o in overrides:
>          for p in path:
> @@ -333,7 +333,7 @@ def base_set_filespath(path, d):
>  def extend_variants(d, var, extend, delim=3D':'):
>      """Return a string of all bb class extend variants for the given ext=
end"""
>      variants =3D []
> -    whole =3D d.getVar(var, True) or ""
> +    whole =3D d.getVar(var) or ""
>      for ext in whole.split():
>          eext =3D ext.split(delim)
>          if len(eext) > 1 and eext[0] =3D=3D extend:
> @@ -341,7 +341,7 @@ def extend_variants(d, var, extend, delim=3D':'):
>      return " ".join(variants)
> =20
>  def multilib_pkg_extend(d, pkg):
> -    variants =3D (d.getVar("MULTILIB_VARIANTS", True) or "").split()
> +    variants =3D (d.getVar("MULTILIB_VARIANTS") or "").split()
>      if not variants:
>          return pkg
>      pkgs =3D pkg
> @@ -352,21 +352,21 @@ def multilib_pkg_extend(d, pkg):
>  def all_multilib_tune_values(d, var, unique =3D True, need_split =3D Tru=
e, delim =3D ' '):
>      """Return a string of all ${var} in all multilib tune configuration"=
""
>      values =3D []
> -    value =3D d.getVar(var, True) or ""
> +    value =3D d.getVar(var) or ""
>      if value !=3D "":
>          if need_split:
>              for item in value.split(delim):
>                  values.append(item)
>          else:
>              values.append(value)
> -    variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""
> +    variants =3D d.getVar("MULTILIB_VARIANTS") or ""
>      for item in variants.split():
>          localdata =3D bb.data.createCopy(d)
>          overrides =3D localdata.getVar("OVERRIDES", False) + ":virtclass=
-multilib-" + item
>          localdata.setVar("OVERRIDES", overrides)
>          localdata.setVar("MLPREFIX", item + "-")
>          bb.data.update_data(localdata)
> -        value =3D localdata.getVar(var, True) or ""
> +        value =3D localdata.getVar(var) or ""
>          if value !=3D "":
>              if need_split:
>                  for item in value.split(delim):
> @@ -402,21 +402,21 @@ def all_multilib_tune_list(vars, d):
>              newoverrides.append(o)
>      localdata.setVar("OVERRIDES", ":".join(newoverrides))
>      localdata.setVar("MLPREFIX", "")
> -    origdefault =3D localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL", Tr=
ue)
> +    origdefault =3D localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
>      if origdefault:
>          localdata.setVar("DEFAULTTUNE", origdefault)
>      bb.data.update_data(localdata)
>      values['ml'] =3D ['']
>      for v in vars:
> -        values[v].append(localdata.getVar(v, True))
> -    variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""
> +        values[v].append(localdata.getVar(v))
> +    variants =3D d.getVar("MULTILIB_VARIANTS") or ""
>      for item in variants.split():
>          localdata =3D bb.data.createCopy(d)
>          overrides =3D localdata.getVar("OVERRIDES", False) + ":virtclass=
-multilib-" + item
>          localdata.setVar("OVERRIDES", overrides)
>          localdata.setVar("MLPREFIX", item + "-")
>          bb.data.update_data(localdata)
> -        values[v].append(localdata.getVar(v, True))
> +        values[v].append(localdata.getVar(v))
>          values['ml'].append(item)
>      return values
> =20
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index 5e55833..95f5240 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -2,7 +2,7 @@
>  DISABLE_STATIC =3D ""
> =20
>  def get_waf_parallel_make(d):
> -    pm =3D d.getVar('PARALLEL_MAKE', True)
> +    pm =3D d.getVar('PARALLEL_MAKE')
>      if pm:
>          # look for '-j' and throw other options (e.g. '-l') away
>          # because they might have different meaning in bjam
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1472e8f..aee9919 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -123,7 +123,7 @@ SDKUSE_NLS ??=3D "yes"
>  TARGET_ARCH =3D "${TUNE_ARCH}"
>  TARGET_OS =3D "linux${LIBCEXTENSION}${ABIEXTENSION}"
>  TARGET_VENDOR =3D "-oe"
> -TARGET_SYS =3D "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET=
_OS', True), ''][d.getVar('TARGET_OS', True) =3D=3D ('' or 'custom')]}"
> +TARGET_SYS =3D "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET=
_OS'), ''][d.getVar('TARGET_OS') =3D=3D ('' or 'custom')]}"
>  TARGET_PREFIX =3D "${TARGET_SYS}-"
>  TARGET_CC_ARCH =3D "${TUNE_CCARGS}"
>  TARGET_LD_ARCH =3D "${TUNE_LDARGS}"
> @@ -132,7 +132,7 @@ TARGET_AS_ARCH =3D "${TUNE_ASARGS}"
>  SDKMACHINE ??=3D "x86_64"
>  SDK_OS =3D "${BUILD_OS}"
>  SDK_VENDOR =3D "-oesdk"
> -SDK_SYS =3D "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', True),=
 ''][d.getVar('SDK_OS', True) =3D=3D ('' or 'custom')]}"
> +SDK_SYS =3D "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS'), ''][d=
=2EgetVar('SDK_OS') =3D=3D ('' or 'custom')]}"
>  SDK_PREFIX =3D "${SDK_SYS}-"
>  SDK_CC_ARCH =3D "${BUILD_CC_ARCH}"
>  SDKPKGSUFFIX =3D "nativesdk"
> @@ -142,7 +142,7 @@ SDK_AS_ARCH =3D "${BUILD_AS_ARCH}"
> =20
>  TUNE_PKGARCH ??=3D ""
>  PACKAGE_ARCH ??=3D "${TUNE_PKGARCH}"
> -MACHINE_ARCH =3D "${@[d.getVar('TUNE_PKGARCH', True), d.getVar('MACHINE'=
, True)][bool(d.getVar('MACHINE', True))].replace('-', '_')}"
> +MACHINE_ARCH =3D "${@[d.getVar('TUNE_PKGARCH'), d.getVar('MACHINE')][boo=
l(d.getVar('MACHINE'))].replace('-', '_')}"
>  PACKAGE_EXTRA_ARCHS ??=3D "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
>  PACKAGE_ARCHS =3D "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
>  # MACHINE_ARCH shouldn't be included here as a variable dependency
> @@ -197,24 +197,24 @@ PV =3D "${@bb.parse.BBHandler.vars_from_file(d.getV=
ar('FILE', False),d)[1] or '1.0
>  PR =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[=
2] or 'r0'}"
>  PE =3D ""
>  PF =3D "${PN}-${EXTENDPE}${PV}-${PR}"
> -EXTENDPE =3D "${@['','${PE}_'][int(d.getVar('PE', True) or 0) > 0]}"
> +EXTENDPE =3D "${@['','${PE}_'][int(d.getVar('PE') or 0) > 0]}"
>  P =3D "${PN}-${PV}"
> =20
>  PRAUTO =3D ""
> -EXTENDPRAUTO =3D "${@['.${PRAUTO}', ''][not d.getVar('PRAUTO', True)]}"
> +EXTENDPRAUTO =3D "${@['.${PRAUTO}', ''][not d.getVar('PRAUTO')]}"
>  PRAUTOINX =3D "${PF}"
> =20
>  PKGV ?=3D "${PV}"
>  PKGR ?=3D "${PR}${EXTENDPRAUTO}"
> -PKGE ?=3D "${@['','${PE}'][int(d.getVar('PE', True) or 0) > 0]}"
> -EXTENDPKGEVER =3D "${@['','${PKGE}:'][d.getVar('PKGE', True).strip() !=
=3D '']}"
> +PKGE ?=3D "${@['','${PE}'][int(d.getVar('PE') or 0) > 0]}"
> +EXTENDPKGEVER =3D "${@['','${PKGE}:'][d.getVar('PKGE').strip() !=3D '']}"
>  EXTENDPKGV ?=3D "${EXTENDPKGEVER}${PKGV}-${PKGR}"
> =20
>  # Base package name
>  # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-ini=
tial"
>  # otherwise it is the same as PN and P
>  SPECIAL_PKGSUFFIX =3D "-native -cross -initial -intermediate -crosssdk -=
cross-canadian"
> -BPN =3D "${@base_prune_suffix(d.getVar('PN', True), d.getVar('SPECIAL_PK=
GSUFFIX', True).split(), d)}"
> +BPN =3D "${@base_prune_suffix(d.getVar('PN'), d.getVar('SPECIAL_PKGSUFFI=
X').split(), d)}"
>  BP =3D "${BPN}-${PV}"
> =20
>  # Package info.
> @@ -330,7 +330,7 @@ FILESEXTRAPATHS ?=3D "__default:"
>  ##################################################################
> =20
>  TMPDIR ?=3D "${TOPDIR}/tmp"
> -CACHE =3D "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE', True))][=
bool(d.getVar('MACHINE', True))]}${@['', '/' + str(d.getVar('SDKMACHINE', T=
rue))][bool(d.getVar('SDKMACHINE', True))]}"
> +CACHE =3D "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE'))][bool(d=
=2EgetVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.ge=
tVar('SDKMACHINE'))]}"
>  # The persistent cache should be shared by all builds
>  PERSISTENT_DIR =3D "${TOPDIR}/cache"
>  LOG_DIR =3D "${TMPDIR}/log"
> @@ -455,7 +455,7 @@ export PATH
>  CCACHE ??=3D ""
>  # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
>  # of ccache some distributions (e.g., Fedora 17).
> -export CCACHE_DISABLE ??=3D "${@[0,1][d.getVar('CCACHE', True) =3D=3D ''=
]}"
> +export CCACHE_DISABLE ??=3D "${@[0,1][d.getVar('CCACHE') =3D=3D '']}"
>  # ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
>  # autogen sets HOME=3D/dev/null so in certain situations builds can fail.
>  # Explicitly export CCACHE_DIR until we can assume ccache >3.1.10 on the=
 host.
> @@ -535,7 +535,7 @@ LINKER_HASH_STYLE ??=3D "gnu"
>  # mips does not support GNU hash style therefore we override
>  LINKER_HASH_STYLE_mipsarch =3D "sysv"
> =20
> -TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=3Dgnu',''][d.getVar('=
LINKER_HASH_STYLE', True) !=3D 'gnu']}"
> +TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=3Dgnu',''][d.getVar('=
LINKER_HASH_STYLE') !=3D 'gnu']}"
> =20
>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
>  export TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
> @@ -561,7 +561,7 @@ DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types $=
{DEBUG_PREFIX_MAP}"
>  # Disabled until the option works properly -feliminate-dwarf2-dups
>  FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
>  DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
> -SELECTED_OPTIMIZATION =3D "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTI=
MIZATION'][d.getVar('DEBUG_BUILD', True) =3D=3D '1'], True)}"
> +SELECTED_OPTIMIZATION =3D "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTI=
MIZATION'][d.getVar('DEBUG_BUILD') =3D=3D '1'], True)}"
>  SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATIO=
N"
>  BUILD_OPTIMIZATION =3D "-O2 -pipe"
> =20
> @@ -687,7 +687,7 @@ DISTRO_NAME ??=3D "OpenEmbedded"
>  OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:=
pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevaria=
ble"
>  OVERRIDES[vardepsexclude] =3D "MACHINEOVERRIDES"
>  CLASSOVERRIDE ?=3D "class-target"
> -DISTROOVERRIDES ?=3D "${@d.getVar('DISTRO', True) or ''}"
> +DISTROOVERRIDES ?=3D "${@d.getVar('DISTRO') or ''}"
>  MACHINEOVERRIDES ?=3D "${MACHINE}"
>  MACHINEOVERRIDES[vardepsexclude] =3D "MACHINE"
> =20
> @@ -773,7 +773,7 @@ COMBINED_FEATURES =3D "${@oe.utils.set_intersect('DIS=
TRO_FEATURES', 'MACHINE_FEATU
>  COMBINED_FEATURES[vardeps] +=3D "DISTRO_FEATURES MACHINE_FEATURES"
> =20
>  SERIAL_CONSOLE ??=3D ""
> -SERIAL_CONSOLES ??=3D "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', =
';')}"
> +SERIAL_CONSOLES ??=3D "${@d.getVar('SERIAL_CONSOLE').replace(' ', ';')}"
> =20
>  NO_RECOMMENDATIONS ?=3D ""
>  BAD_RECOMMENDATIONS ?=3D ""
> @@ -797,7 +797,7 @@ DISTRO[unexport] =3D "1"
>  SHELL[unexport] =3D "1"
> =20
>  # Used by canadian-cross to handle string conversions on TARGET_ARCH whe=
re needed
> -TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARCH', True).replace("=
_", "-")}"
> +TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARCH').replace("_", "-=
")}"
> =20
>  # Complete output from bitbake
>  BB_CONSOLELOG ?=3D "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
> index 71c65b1..16e1391 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -13,7 +13,7 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
>  TCLIBCAPPEND ?=3D "-${TCLIBC}"
>  TMPDIR .=3D "${TCLIBCAPPEND}"
> =20
> -CACHE =3D "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar=
('MACHINE', True))][bool(d.getVar('MACHINE', True))]}${@['', '/' + str(d.ge=
tVar('SDKMACHINE', True))][bool(d.getVar('SDKMACHINE', True))]}"
> +CACHE =3D "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar=
('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMAC=
HINE'))][bool(d.getVar('SDKMACHINE'))]}"
> =20
>  USER_CLASSES ?=3D ""
>  PACKAGE_CLASSES ?=3D "package_ipk"
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro=
/include/tclibc-glibc.inc
> index 649918f..ad8000f 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -2,7 +2,7 @@
>  # glibc specific configuration
>  #
> =20
> -LIBCEXTENSION =3D "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or ''=
) !=3D '']}"
> +LIBCEXTENSION =3D "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') !=3D=
 '']}"
> =20
>  # Add glibc overrides to the overrides for glibc.
>  LIBCOVERRIDE =3D ":libc-glibc"
> @@ -34,7 +34,7 @@ LIBC_LOCALE_DEPENDENCIES =3D "\
>  	glibc-gconv-iso8859-15"
> =20
>  def get_libc_locales_dependencies(d):
> -    if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split=
() :
> -        return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
> +    if 'libc-locales' in (d.getVar('DISTRO_FEATURES') or '').split() :
> +        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
>      else:
>          return ''
> diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machi=
ne/include/arm/arch-arm.inc
> index 2e3127c..99625d8 100644
> --- a/meta/conf/machine/include/arm/arch-arm.inc
> +++ b/meta/conf/machine/include/arm/arch-arm.inc
> @@ -13,4 +13,4 @@ TUNE_PKGARCH =3D "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMP=
KGSFX_DSP}${ARMPKGSFX_EABI}
> =20
>  ABIEXTENSION =3D "eabi"
> =20
> -TARGET_FPU =3D "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
> +TARGET_FPU =3D "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/mac=
hine/include/arm/arch-arm64.inc
> index 9440698..1bc3039 100644
> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> @@ -28,7 +28,7 @@ TARGET_FPU_64 =3D ""
>  TUNE_ARCH_32 =3D "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'ar=
meb', 'arm', d)}"
>  TUNE_PKGARCH_32 =3D "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${AR=
MPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
>  ABIEXTENSION_32 =3D "eabi"
> -TARGET_FPU_32 =3D "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
> +TARGET_FPU_32 =3D "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
> =20
>  TUNE_ARCH =3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_=
ARCH_64}', '${TUNE_ARCH_32}' ,d)}"
>  TUNE_PKGARCH =3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TU=
NE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/c=
onf/machine/include/arm/feature-arm-thumb.inc
> index 1faebf7..6d4747b 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -1,5 +1,5 @@
>  TUNEVALID[thumb] =3D "Use thumb instructions instead of ARM"
> -ARM_THUMB_OPT =3D "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET', T=
rue) =3D=3D 'thumb']}"
> +ARM_THUMB_OPT =3D "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET') =
=3D=3D 'thumb']}"
>  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  '=
t',  '', d)}"
>  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv5',  '=
t',  '', d)}"
>  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  '=
t',  '', d)}"
> @@ -15,19 +15,19 @@ ARM_M_OPT =3D "${@bb.utils.contains('TUNE_FEATURES', =
'arm', '${ARM_THUMB_OPT}', 't
>  python () {
>      if bb.utils.contains('TUNE_FEATURES', 'thumb', False, True, d):
>          return
> -    selected =3D d.getVar('ARM_INSTRUCTION_SET', True)
> +    selected =3D d.getVar('ARM_INSTRUCTION_SET')
>      if selected =3D=3D None:
>          return
> -    used =3D d.getVar('ARM_M_OPT', True)
> +    used =3D d.getVar('ARM_M_OPT')
>      if selected !=3D used:
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
>          bb.warn("Recipe '%s' selects ARM_INSTRUCTION_SET to be '%s', but=
 tune configuration overrides it to '%s'" % (pn, selected, used))
>  }
> =20
>  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${A=
RM_M_OPT}', '', d)}"
> =20
>  # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set A=
RM_M_OPT to thumb
> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${=
ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT', True) =3D=3D 'thumb' el=
se ''}"
> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${=
ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') =3D=3D 'thumb' else ''}"
> =20
>  # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
>  TARGET_CC_KERNEL_ARCH +=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb=
', '-mno-thumb-interwork -marm', '', d)}"
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/con=
f/machine/include/arm/feature-arm-vfp.inc
> index 9ef31e7..667b609 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -5,10 +5,10 @@
>  TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
>  TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vf=
p', '', d)}"
> =20
> -TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s ' % d.getVar('TUNE_CCARGS_MFPU', Tr=
ue).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else ''}"
> -ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True=
).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_M=
FPU', True) !=3D '') else ''}"
> +TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s ' % d.getVar('TUNE_CCARGS_MFPU').sp=
lit()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
> +ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU').spli=
t()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU') =
!=3D '') else ''}"
> =20
>  TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call conventi=
on, requires VFP."
> -TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES', 'callconv=
ention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) !=
=3D '') else '' }"
> -TUNE_CCARGS   .=3D "${@ ' -mfloat-abi=3D${TUNE_CCARGS_MFLOAT}' if (d.get=
Var('TUNE_CCARGS_MFLOAT', True) !=3D '')     else ''}"
> -ARMPKGSFX_EABI =3D "${@ 'hf'                                 if (d.getVa=
r('TUNE_CCARGS_MFLOAT', True) =3D=3D 'hard') else ''}"
> +TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES', 'callconv=
ention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') !=3D ''=
) else '' }"
> +TUNE_CCARGS   .=3D "${@ ' -mfloat-abi=3D${TUNE_CCARGS_MFLOAT}' if (d.get=
Var('TUNE_CCARGS_MFLOAT') !=3D '')     else ''}"
> +ARMPKGSFX_EABI =3D "${@ 'hf'                                 if (d.getVa=
r('TUNE_CCARGS_MFLOAT') =3D=3D 'hard') else ''}"
> diff --git a/meta/conf/machine/include/mips/feature-mips-mips16e.inc b/me=
ta/conf/machine/include/mips/feature-mips-mips16e.inc
> index 05011de..101d533 100644
> --- a/meta/conf/machine/include/mips/feature-mips-mips16e.inc
> +++ b/meta/conf/machine/include/mips/feature-mips-mips16e.inc
> @@ -1,8 +1,8 @@
>  TUNEVALID[mips16e] =3D "Build target packages with MIPS16e ASE instructi=
ons"
> -MIPS_MIPS16E_OPT =3D "${@['mno-mips16', 'mips16'][d.getVar('MIPS_INSTRUC=
TION_SET', True) =3D=3D 'mips16e']}"
> +MIPS_MIPS16E_OPT =3D "${@['mno-mips16', 'mips16'][d.getVar('MIPS_INSTRUC=
TION_SET') =3D=3D 'mips16e']}"
>  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ' -${=
MIPS_MIPS16E_OPT}', '', d)}"
> =20
> -MIPSPKGSFX_MIPS16E .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips16e'=
, '-m16', '', d) if d.getVar('MIPS_MIPS16E_OPT', True) =3D=3D 'mips16' else=
 ''}"
> +MIPSPKGSFX_MIPS16E .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips16e'=
, '-m16', '', d) if d.getVar('MIPS_MIPS16E_OPT') =3D=3D 'mips16' else ''}"
> =20
>  # Whether to compile with code to allow interworking between the two
>  # instruction sets. This allows mips16e code to be executed on a primari=
ly
> @@ -14,4 +14,4 @@ TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES',=
 'mips16e', ' ${MIPS16_TUNE
>  OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ':mips1=
6e', '', d)}"
> =20
>  # show status (if compiling in MIPS16e mode)
> -BUILDCFG_VARS +=3D "${@['', 'MIPS_INSTRUCTION_SET'][d.getVar('MIPS_INSTR=
UCTION_SET', True) =3D=3D 'mips16e']}"
> +BUILDCFG_VARS +=3D "${@['', 'MIPS_INSTRUCTION_SET'][d.getVar('MIPS_INSTR=
UCTION_SET') =3D=3D 'mips16e']}"
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index 1403a03..ce97d5d 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -1,5 +1,5 @@
> =20
> -baselib =3D "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', Tru=
e) or 'INVALID'), True) or d.getVar('BASELIB', True)}"
> +baselib =3D "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE') or =
'INVALID'), True) or d.getVar('BASELIB')}"
> =20
>  MULTILIB_VARIANTS =3D "${@extend_variants(d,'MULTILIBS','multilib')}"
>  MULTILIB_SAVE_VARNAME =3D "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VEN=
DOR"
> diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
> index 4c8a000..d2eeaf0 100644
> --- a/meta/lib/oe/classextend.py
> +++ b/meta/lib/oe/classextend.py
> @@ -25,7 +25,7 @@ class ClassExtender(object):
>          return name
> =20
>      def map_variable(self, varname, setvar =3D True):
> -        var =3D self.d.getVar(varname, True)
> +        var =3D self.d.getVar(varname)
>          if not var:
>              return ""
>          var =3D var.split()
> @@ -38,7 +38,7 @@ class ClassExtender(object):
>          return newdata
> =20
>      def map_regexp_variable(self, varname, setvar =3D True):
> -        var =3D self.d.getVar(varname, True)
> +        var =3D self.d.getVar(varname)
>          if not var:
>              return ""
>          var =3D var.split()
> @@ -60,7 +60,7 @@ class ClassExtender(object):
>              return dep
>          else:
>              # Do not extend for that already have multilib prefix
> -            var =3D self.d.getVar("MULTILIB_VARIANTS", True)
> +            var =3D self.d.getVar("MULTILIB_VARIANTS")
>              if var:
>                  var =3D var.split()
>                  for v in var:
> @@ -74,7 +74,7 @@ class ClassExtender(object):
>              varname =3D varname + "_" + suffix
>          orig =3D self.d.getVar("EXTENDPKGV", False)
>          self.d.setVar("EXTENDPKGV", "EXTENDPKGV")
> -        deps =3D self.d.getVar(varname, True)
> +        deps =3D self.d.getVar(varname)
>          if not deps:
>              self.d.setVar("EXTENDPKGV", orig)
>              return
> @@ -87,7 +87,7 @@ class ClassExtender(object):
>          self.d.setVar("EXTENDPKGV", orig)
> =20
>      def map_packagevars(self):
> -        for pkg in (self.d.getVar("PACKAGES", True).split() + [""]):
> +        for pkg in (self.d.getVar("PACKAGES").split() + [""]):
>              self.map_depends_variable("RDEPENDS", pkg)
>              self.map_depends_variable("RRECOMMENDS", pkg)
>              self.map_depends_variable("RSUGGESTS", pkg)
> @@ -97,7 +97,7 @@ class ClassExtender(object):
>              self.map_depends_variable("PKG", pkg)
> =20
>      def rename_packages(self):
> -        for pkg in (self.d.getVar("PACKAGES", True) or "").split():
> +        for pkg in (self.d.getVar("PACKAGES") or "").split():
>              if pkg.startswith(self.extname):
>                 self.pkgs_mapping.append([pkg.split(self.extname + "-")[1=
], pkg])
>                 continue
> diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsyst=
em.py
> index 29ac6d4..a372904 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -21,8 +21,8 @@ class BuildSystem(object):
>      def __init__(self, context, d):
>          self.d =3D d
>          self.context =3D context
> -        self.layerdirs =3D [os.path.abspath(pth) for pth in d.getVar('BB=
LAYERS', True).split()]
> -        self.layers_exclude =3D (d.getVar('SDK_LAYERS_EXCLUDE', True) or=
 "").split()
> +        self.layerdirs =3D [os.path.abspath(pth) for pth in d.getVar('BB=
LAYERS').split()]
> +        self.layers_exclude =3D (d.getVar('SDK_LAYERS_EXCLUDE') or "").s=
plit()
> =20
>      def copy_bitbake_and_layers(self, destdir, workspace_name=3DNone):
>          # Copy in all metadata layers + bitbake (as repositories)
> @@ -30,7 +30,7 @@ class BuildSystem(object):
>          bb.utils.mkdirhier(destdir)
>          layers =3D list(self.layerdirs)
> =20
> -        corebase =3D os.path.abspath(self.d.getVar('COREBASE', True))
> +        corebase =3D os.path.abspath(self.d.getVar('COREBASE'))
>          layers.append(corebase)
> =20
>          # Exclude layers
> @@ -46,7 +46,7 @@ class BuildSystem(object):
>                  extranum +=3D 1
>                  workspace_newname =3D '%s-%d' % (workspace_name, extranu=
m)
> =20
> -        corebase_files =3D self.d.getVar('COREBASE_FILES', True).split()
> +        corebase_files =3D self.d.getVar('COREBASE_FILES').split()
>          corebase_files =3D [corebase + '/' +x for x in corebase_files]
>          # Make sure bitbake goes in
>          bitbake_dir =3D bb.__file__.rsplit('/', 3)[0]
> @@ -100,7 +100,7 @@ class BuildSystem(object):
>                  # Drop all bbappends except the one for the image the SD=
K is being built for
>                  # (because of externalsrc, the workspace bbappends will =
interfere with the
>                  # locked signatures if present, and we don't need them a=
nyway)
> -                image_bbappend =3D os.path.splitext(os.path.basename(sel=
f.d.getVar('FILE', True)))[0] + '.bbappend'
> +                image_bbappend =3D os.path.splitext(os.path.basename(sel=
f.d.getVar('FILE')))[0] + '.bbappend'
>                  appenddir =3D os.path.join(layerdestpath, 'appends')
>                  if os.path.isdir(appenddir):
>                      for fn in os.listdir(appenddir):
> @@ -208,7 +208,7 @@ def create_locked_sstate_cache(lockedsigs, input_ssta=
te_cache, output_sstate_cac
>      import shutil
>      bb.note('Generating sstate-cache...')
> =20
> -    nativelsbstring =3D d.getVar('NATIVELSBSTRING', True)
> +    nativelsbstring =3D d.getVar('NATIVELSBSTRING')
>      bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, i=
nput_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
>      if fixedlsbstring and nativelsbstring !=3D fixedlsbstring:
>          nativedir =3D output_sstate_cache + '/' + nativelsbstring
> diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
> index ee48950..032f68a 100644
> --- a/meta/lib/oe/data.py
> +++ b/meta/lib/oe/data.py
> @@ -12,6 +12,6 @@ def typed_value(key, d):
>          flags =3D {}
> =20
>      try:
> -        return oe.maketype.create(d.getVar(key, True) or '', var_type, *=
*flags)
> +        return oe.maketype.create(d.getVar(key) or '', var_type, **flags)
>      except (TypeError, ValueError) as exc:
>          bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
> diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
> index c666ddc..f54f4bb 100644
> --- a/meta/lib/oe/distro_check.py
> +++ b/meta/lib/oe/distro_check.py
> @@ -224,37 +224,37 @@ def compare_in_distro_packages_list(distro_check_di=
r, d):
>      localdata =3D bb.data.createCopy(d)
>      pkglst_dir =3D os.path.join(distro_check_dir, "package_lists")
>      matching_distros =3D []
> -    pn =3D recipe_name =3D d.getVar('PN', True)
> +    pn =3D recipe_name =3D d.getVar('PN')
>      bb.note("Checking: %s" % pn)
> =20
>      if pn.find("-native") !=3D -1:
>          pnstripped =3D pn.split("-native")
> -        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.ge=
tVar('OVERRIDES', True))
> +        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.ge=
tVar('OVERRIDES'))
>          bb.data.update_data(localdata)
>          recipe_name =3D pnstripped[0]
> =20
>      if pn.startswith("nativesdk-"):
>          pnstripped =3D pn.split("nativesdk-")
> -        localdata.setVar('OVERRIDES', "pn-" + pnstripped[1] + ":" + d.ge=
tVar('OVERRIDES', True))
> +        localdata.setVar('OVERRIDES', "pn-" + pnstripped[1] + ":" + d.ge=
tVar('OVERRIDES'))
>          bb.data.update_data(localdata)
>          recipe_name =3D pnstripped[1]
> =20
>      if pn.find("-cross") !=3D -1:
>          pnstripped =3D pn.split("-cross")
> -        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.ge=
tVar('OVERRIDES', True))
> +        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.ge=
tVar('OVERRIDES'))
>          bb.data.update_data(localdata)
>          recipe_name =3D pnstripped[0]
> =20
>      if pn.find("-initial") !=3D -1:
>          pnstripped =3D pn.split("-initial")
> -        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.ge=
tVar('OVERRIDES', True))
> +        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.ge=
tVar('OVERRIDES'))
>          bb.data.update_data(localdata)
>          recipe_name =3D pnstripped[0]
> =20
>      bb.note("Recipe: %s" % recipe_name)
> =20
>      distro_exceptions =3D dict({"OE-Core":'OE-Core', "OpenedHand":'Opene=
dHand', "Intel":'Intel', "Upstream":'Upstream', "Windriver":'Windriver', "O=
SPDT":'OSPDT Approved', "Poky":'poky'})
> -    tmp =3D localdata.getVar('DISTRO_PN_ALIAS', True) or ""
> +    tmp =3D localdata.getVar('DISTRO_PN_ALIAS') or ""
>      for str in tmp.split():
>          if str and str.find("=3D") =3D=3D -1 and distro_exceptions[str]:
>              matching_distros.append(str)
> @@ -286,10 +286,10 @@ def compare_in_distro_packages_list(distro_check_di=
r, d):
>      return matching_distros
> =20
>  def create_log_file(d, logname):
> -    logpath =3D d.getVar('LOG_DIR', True)
> +    logpath =3D d.getVar('LOG_DIR')
>      bb.utils.mkdirhier(logpath)
>      logfn, logsuffix =3D os.path.splitext(logname)
> -    logfile =3D os.path.join(logpath, "%s.%s%s" % (logfn, d.getVar('DATE=
TIME', True), logsuffix))
> +    logfile =3D os.path.join(logpath, "%s.%s%s" % (logfn, d.getVar('DATE=
TIME'), logsuffix))
>      if not os.path.exists(logfile):
>              slogfile =3D os.path.join(logpath, logname)
>              if os.path.exists(slogfile):
> @@ -301,8 +301,8 @@ def create_log_file(d, logname):
> =20
> =20
>  def save_distro_check_result(result, datetime, result_file, d):
> -    pn =3D d.getVar('PN', True)
> -    logdir =3D d.getVar('LOG_DIR', True)
> +    pn =3D d.getVar('PN')
> +    logdir =3D d.getVar('LOG_DIR')
>      if not logdir:
>          bb.error("LOG_DIR variable is not defined, can't write the distr=
o_check results")
>          return
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 38eb0cb..dcd1990 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -7,9 +7,9 @@ import oe.utils
>  class LocalSigner(object):
>      """Class for handling local (on the build host) signing"""
>      def __init__(self, d):
> -        self.gpg_bin =3D d.getVar('GPG_BIN', True) or \
> +        self.gpg_bin =3D d.getVar('GPG_BIN') or \
>                    bb.utils.which(os.getenv('PATH'), 'gpg')
> -        self.gpg_path =3D d.getVar('GPG_PATH', True)
> +        self.gpg_path =3D d.getVar('GPG_PATH')
>          self.rpm_bin =3D bb.utils.which(os.getenv('PATH'), "rpm")
> =20
>      def export_pubkey(self, output_file, keyid, armor=3DTrue):
> diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
> index 95f8eb2..6ec9b1a 100644
> --- a/meta/lib/oe/manifest.py
> +++ b/meta/lib/oe/manifest.py
> @@ -59,9 +59,9 @@ class Manifest(object, metaclass=3DABCMeta):
> =20
>          if manifest_dir is None:
>              if manifest_type !=3D self.MANIFEST_TYPE_IMAGE:
> -                self.manifest_dir =3D self.d.getVar('SDK_DIR', True)
> +                self.manifest_dir =3D self.d.getVar('SDK_DIR')
>              else:
> -                self.manifest_dir =3D self.d.getVar('WORKDIR', True)
> +                self.manifest_dir =3D self.d.getVar('WORKDIR')
>          else:
>              self.manifest_dir =3D manifest_dir
> =20
> @@ -82,7 +82,7 @@ class Manifest(object, metaclass=3DABCMeta):
>      This will be used for testing until the class is implemented properl=
y!
>      """
>      def _create_dummy_initial(self):
> -        image_rootfs =3D self.d.getVar('IMAGE_ROOTFS', True)
> +        image_rootfs =3D self.d.getVar('IMAGE_ROOTFS')
>          pkg_list =3D dict()
>          if image_rootfs.find("core-image-sato-sdk") > 0:
>              pkg_list[self.PKG_TYPE_MUST_INSTALL] =3D \
> @@ -195,7 +195,7 @@ class RpmManifest(Manifest):
>          for pkg in pkg_list.split():
>              pkg_type =3D self.PKG_TYPE_MUST_INSTALL
> =20
> -            ml_variants =3D self.d.getVar('MULTILIB_VARIANTS', True).spl=
it()
> +            ml_variants =3D self.d.getVar('MULTILIB_VARIANTS').split()
> =20
>              for ml_variant in ml_variants:
>                  if pkg.startswith(ml_variant + '-'):
> @@ -216,13 +216,13 @@ class RpmManifest(Manifest):
> =20
>              for var in self.var_maps[self.manifest_type]:
>                  if var in self.vars_to_split:
> -                    split_pkgs =3D self._split_multilib(self.d.getVar(va=
r, True))
> +                    split_pkgs =3D self._split_multilib(self.d.getVar(va=
r))
>                      if split_pkgs is not None:
>                          pkgs =3D dict(list(pkgs.items()) + list(split_pk=
gs.items()))
>                  else:
> -                    pkg_list =3D self.d.getVar(var, True)
> +                    pkg_list =3D self.d.getVar(var)
>                      if pkg_list is not None:
> -                        pkgs[self.var_maps[self.manifest_type][var]] =3D=
 self.d.getVar(var, True)
> +                        pkgs[self.var_maps[self.manifest_type][var]] =3D=
 self.d.getVar(var)
> =20
>              for pkg_type in pkgs:
>                  for pkg in pkgs[pkg_type].split():
> @@ -245,7 +245,7 @@ class OpkgManifest(Manifest):
>          for pkg in pkg_list.split():
>              pkg_type =3D self.PKG_TYPE_MUST_INSTALL
> =20
> -            ml_variants =3D self.d.getVar('MULTILIB_VARIANTS', True).spl=
it()
> +            ml_variants =3D self.d.getVar('MULTILIB_VARIANTS').split()
> =20
>              for ml_variant in ml_variants:
>                  if pkg.startswith(ml_variant + '-'):
> @@ -266,13 +266,13 @@ class OpkgManifest(Manifest):
> =20
>              for var in self.var_maps[self.manifest_type]:
>                  if var in self.vars_to_split:
> -                    split_pkgs =3D self._split_multilib(self.d.getVar(va=
r, True))
> +                    split_pkgs =3D self._split_multilib(self.d.getVar(va=
r))
>                      if split_pkgs is not None:
>                          pkgs =3D dict(list(pkgs.items()) + list(split_pk=
gs.items()))
>                  else:
> -                    pkg_list =3D self.d.getVar(var, True)
> +                    pkg_list =3D self.d.getVar(var)
>                      if pkg_list is not None:
> -                        pkgs[self.var_maps[self.manifest_type][var]] =3D=
 self.d.getVar(var, True)
> +                        pkgs[self.var_maps[self.manifest_type][var]] =3D=
 self.d.getVar(var)
> =20
>              for pkg_type in pkgs:
>                  for pkg in pkgs[pkg_type].split():
> @@ -310,7 +310,7 @@ class DpkgManifest(Manifest):
>              manifest.write(self.initial_manifest_file_header)
> =20
>              for var in self.var_maps[self.manifest_type]:
> -                pkg_list =3D self.d.getVar(var, True)
> +                pkg_list =3D self.d.getVar(var)
> =20
>                  if pkg_list is None:
>                      continue
> @@ -332,7 +332,7 @@ def create_manifest(d, final_manifest=3DFalse, manife=
st_dir=3DNone,
>                      'ipk': OpkgManifest,
>                      'deb': DpkgManifest}
> =20
> -    manifest =3D manifest_map[d.getVar('IMAGE_PKGTYPE', True)](d, manife=
st_dir, manifest_type)
> +    manifest =3D manifest_map[d.getVar('IMAGE_PKGTYPE')](d, manifest_dir=
, manifest_type)
> =20
>      if final_manifest:
>          manifest.create_final()
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 02642f2..6c719b0 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -103,7 +103,7 @@ def read_shlib_providers(d):
>      import re
> =20
>      shlib_provider =3D {}
> -    shlibs_dirs =3D d.getVar('SHLIBSDIRS', True).split()
> +    shlibs_dirs =3D d.getVar('SHLIBSDIRS').split()
>      list_re =3D re.compile('^(.*)\.list$')
>      # Go from least to most specific since the last one found wins
>      for dir in reversed(shlibs_dirs):
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
=2Epy
> index 7ba2e4d..02882fa 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -107,16 +107,16 @@ class RpmIndexer(Indexer):
>          target_os =3D collections.OrderedDict()
> =20
>          if arch_var is not None and os_var is not None:
> -            package_archs['default'] =3D self.d.getVar(arch_var, True).s=
plit()
> +            package_archs['default'] =3D self.d.getVar(arch_var).split()
>              package_archs['default'].reverse()
> -            target_os['default'] =3D self.d.getVar(os_var, True).strip()
> +            target_os['default'] =3D self.d.getVar(os_var).strip()
>          else:
> -            package_archs['default'] =3D self.d.getVar("PACKAGE_ARCHS", =
True).split()
> +            package_archs['default'] =3D self.d.getVar("PACKAGE_ARCHS").=
split()
>              # arch order is reversed.  This ensures the -best- match is
>              # listed first!
>              package_archs['default'].reverse()
> -            target_os['default'] =3D self.d.getVar("TARGET_OS", True).st=
rip()
> -            multilibs =3D self.d.getVar('MULTILIBS', True) or ""
> +            target_os['default'] =3D self.d.getVar("TARGET_OS").strip()
> +            multilibs =3D self.d.getVar('MULTILIBS') or ""
>              for ext in multilibs.split():
>                  eext =3D ext.split(':')
>                  if len(eext) > 1 and eext[0] =3D=3D 'multilib':
> @@ -150,8 +150,8 @@ class RpmIndexer(Indexer):
>          return (ml_prefix_list, target_os)
> =20
>      def write_index(self):
> -        sdk_pkg_archs =3D (self.d.getVar('SDK_PACKAGE_ARCHS', True) or "=
").replace('-', '_').split()
> -        all_mlb_pkg_archs =3D (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS=
', True) or "").replace('-', '_').split()
> +        sdk_pkg_archs =3D (self.d.getVar('SDK_PACKAGE_ARCHS') or "").rep=
lace('-', '_').split()
> +        all_mlb_pkg_archs =3D (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS=
') or "").replace('-', '_').split()
> =20
>          mlb_prefix_list =3D self.get_ml_prefix_and_os_list()[0]
> =20
> @@ -165,15 +165,15 @@ class RpmIndexer(Indexer):
>          archs =3D archs.union(set(sdk_pkg_archs))
> =20
>          rpm_createrepo =3D bb.utils.which(os.getenv('PATH'), "createrepo=
")
> -        if self.d.getVar('PACKAGE_FEED_SIGN', True) =3D=3D '1':
> -            signer =3D get_signer(self.d, self.d.getVar('PACKAGE_FEED_GP=
G_BACKEND', True))
> +        if self.d.getVar('PACKAGE_FEED_SIGN') =3D=3D '1':
> +            signer =3D get_signer(self.d, self.d.getVar('PACKAGE_FEED_GP=
G_BACKEND'))
>          else:
>              signer =3D None
>          index_cmds =3D []
>          repomd_files =3D []
>          rpm_dirs_found =3D False
>          for arch in archs:
> -            dbpath =3D os.path.join(self.d.getVar('WORKDIR', True), 'rpm=
db', arch)
> +            dbpath =3D os.path.join(self.d.getVar('WORKDIR'), 'rpmdb', a=
rch)
>              if os.path.exists(dbpath):
>                  bb.utils.remove(dbpath, True)
>              arch_dir =3D os.path.join(self.deploy_dir, arch)
> @@ -197,11 +197,11 @@ class RpmIndexer(Indexer):
>          # Sign repomd
>          if signer:
>              for repomd in repomd_files:
> -                feed_sig_type =3D self.d.getVar('PACKAGE_FEED_GPG_SIGNAT=
URE_TYPE', True)
> +                feed_sig_type =3D self.d.getVar('PACKAGE_FEED_GPG_SIGNAT=
URE_TYPE')
>                  is_ascii_sig =3D (feed_sig_type.upper() !=3D "BIN")
>                  signer.detach_sign(repomd,
> -                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'=
, True),
> -                                   self.d.getVar('PACKAGE_FEED_GPG_PASSP=
HRASE_FILE', True),
> +                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'=
),
> +                                   self.d.getVar('PACKAGE_FEED_GPG_PASSP=
HRASE_FILE'),
>                                     armor=3Dis_ascii_sig)
> =20
> =20
> @@ -212,8 +212,8 @@ class OpkgIndexer(Indexer):
>                       "MULTILIB_ARCHS"]
> =20
>          opkg_index_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg-make-=
index")
> -        if self.d.getVar('PACKAGE_FEED_SIGN', True) =3D=3D '1':
> -            signer =3D get_signer(self.d, self.d.getVar('PACKAGE_FEED_GP=
G_BACKEND', True))
> +        if self.d.getVar('PACKAGE_FEED_SIGN') =3D=3D '1':
> +            signer =3D get_signer(self.d, self.d.getVar('PACKAGE_FEED_GP=
G_BACKEND'))
>          else:
>              signer =3D None
> =20
> @@ -223,7 +223,7 @@ class OpkgIndexer(Indexer):
>          index_cmds =3D set()
>          index_sign_files =3D set()
>          for arch_var in arch_vars:
> -            archs =3D self.d.getVar(arch_var, True)
> +            archs =3D self.d.getVar(arch_var)
>              if archs is None:
>                  continue
> =20
> @@ -251,12 +251,12 @@ class OpkgIndexer(Indexer):
>              bb.fatal('%s' % ('\n'.join(result)))
> =20
>          if signer:
> -            feed_sig_type =3D self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_=
TYPE', True)
> +            feed_sig_type =3D self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_=
TYPE')
>              is_ascii_sig =3D (feed_sig_type.upper() !=3D "BIN")
>              for f in index_sign_files:
>                  signer.detach_sign(f,
> -                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'=
, True),
> -                                   self.d.getVar('PACKAGE_FEED_GPG_PASSP=
HRASE_FILE', True),
> +                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'=
),
> +                                   self.d.getVar('PACKAGE_FEED_GPG_PASSP=
HRASE_FILE'),
>                                     armor=3Dis_ascii_sig)
> =20
> =20
> @@ -290,16 +290,16 @@ class DpkgIndexer(Indexer):
> =20
>          os.environ['APT_CONFIG'] =3D self.apt_conf_file
> =20
> -        pkg_archs =3D self.d.getVar('PACKAGE_ARCHS', True)
> +        pkg_archs =3D self.d.getVar('PACKAGE_ARCHS')
>          if pkg_archs is not None:
>              arch_list =3D pkg_archs.split()
> -        sdk_pkg_archs =3D self.d.getVar('SDK_PACKAGE_ARCHS', True)
> +        sdk_pkg_archs =3D self.d.getVar('SDK_PACKAGE_ARCHS')
>          if sdk_pkg_archs is not None:
>              for a in sdk_pkg_archs.split():
>                  if a not in pkg_archs:
>                      arch_list.append(a)
> =20
> -        all_mlb_pkg_arch_list =3D (self.d.getVar('ALL_MULTILIB_PACKAGE_A=
RCHS', True) or "").split()
> +        all_mlb_pkg_arch_list =3D (self.d.getVar('ALL_MULTILIB_PACKAGE_A=
RCHS') or "").split()
>          arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch =
not in arch_list)
> =20
>          apt_ftparchive =3D bb.utils.which(os.getenv('PATH'), "apt-ftparc=
hive")
> @@ -332,7 +332,7 @@ class DpkgIndexer(Indexer):
>          result =3D oe.utils.multiprocess_exec(index_cmds, create_index)
>          if result:
>              bb.fatal('%s' % ('\n'.join(result)))
> -        if self.d.getVar('PACKAGE_FEED_SIGN', True) =3D=3D '1':
> +        if self.d.getVar('PACKAGE_FEED_SIGN') =3D=3D '1':
>              raise NotImplementedError('Package feed signing not implemen=
td for dpkg')
> =20
> =20
> @@ -387,7 +387,7 @@ class RpmPkgsList(PkgsList):
> =20
>                      # Workaround for bug 3565. Simply look to see if we
>                      # know of a package with that name, if not try again!
> -                    filename =3D os.path.join(self.d.getVar('PKGDATA_DIR=
', True),
> +                    filename =3D os.path.join(self.d.getVar('PKGDATA_DIR=
'),
>                                              'runtime-reverse',
>                                              new_pkg)
>                      if os.path.exists(filename):
> @@ -466,7 +466,7 @@ class OpkgPkgsList(PkgsList):
> =20
>          self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg")
>          self.opkg_args =3D "-f %s -o %s " % (config_file, rootfs_dir)
> -        self.opkg_args +=3D self.d.getVar("OPKG_ARGS", True)
> +        self.opkg_args +=3D self.d.getVar("OPKG_ARGS")
> =20
>      def list_pkgs(self, format=3DNone):
>          cmd =3D "%s %s status" % (self.opkg_cmd, self.opkg_args)
> @@ -514,9 +514,9 @@ class PackageManager(object, metaclass=3DABCMeta):
>          self.d =3D d
>          self.deploy_dir =3D None
>          self.deploy_lock =3D None
> -        self.feed_uris =3D self.d.getVar('PACKAGE_FEED_URIS', True) or ""
> -        self.feed_base_paths =3D self.d.getVar('PACKAGE_FEED_BASE_PATHS'=
, True) or ""
> -        self.feed_archs =3D self.d.getVar('PACKAGE_FEED_ARCHS', True)
> +        self.feed_uris =3D self.d.getVar('PACKAGE_FEED_URIS') or ""
> +        self.feed_base_paths =3D self.d.getVar('PACKAGE_FEED_BASE_PATHS'=
) or ""
> +        self.feed_archs =3D self.d.getVar('PACKAGE_FEED_ARCHS')
> =20
>      """
>      Update the package manager package database.
> @@ -570,7 +570,7 @@ class PackageManager(object, metaclass=3DABCMeta):
>      def install_complementary(self, globs=3DNone):
>          # we need to write the list of installed packages to a file beca=
use the
>          # oe-pkgdata-util reads it from a file
> -        installed_pkgs_file =3D os.path.join(self.d.getVar('WORKDIR', Tr=
ue),
> +        installed_pkgs_file =3D os.path.join(self.d.getVar('WORKDIR'),
>                                             "installed_pkgs.txt")
>          with open(installed_pkgs_file, "w+") as installed_pkgs:
>              pkgs =3D self.list_installed()
> @@ -578,10 +578,10 @@ class PackageManager(object, metaclass=3DABCMeta):
>              installed_pkgs.write(output)
> =20
>          if globs is None:
> -            globs =3D self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY', True)
> +            globs =3D self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY')
>              split_linguas =3D set()
> =20
> -            for translation in self.d.getVar('IMAGE_LINGUAS', True).spli=
t():
> +            for translation in self.d.getVar('IMAGE_LINGUAS').split():
>                  split_linguas.add(translation)
>                  split_linguas.add(translation.split('-')[0])
> =20
> @@ -594,9 +594,9 @@ class PackageManager(object, metaclass=3DABCMeta):
>              return
> =20
>          cmd =3D [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
> -               "-p", self.d.getVar('PKGDATA_DIR', True), "glob", install=
ed_pkgs_file,
> +               "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkg=
s_file,
>                 globs]
> -        exclude =3D self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY', True)
> +        exclude =3D self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
>          if exclude:
>              cmd.extend(['--exclude=3D' + '|'.join(exclude.split())])
>          try:
> @@ -661,7 +661,7 @@ class RpmPM(PackageManager):
>          self.task_name =3D task_name
>          self.providename =3D providename
>          self.fullpkglist =3D list()
> -        self.deploy_dir =3D self.d.getVar('DEPLOY_DIR_RPM', True)
> +        self.deploy_dir =3D self.d.getVar('DEPLOY_DIR_RPM')
>          self.etcrpm_dir =3D os.path.join(self.target_rootfs, "etc/rpm")
>          self.install_dir_name =3D "oe_install"
>          self.install_dir_path =3D os.path.join(self.target_rootfs, self.=
install_dir_name)
> @@ -671,7 +671,7 @@ class RpmPM(PackageManager):
>          # 1 =3D --log-level=3Dinfo (includes information about executing=
 scriptlets and their output)
>          # 2 =3D --log-level=3Ddebug
>          # 3 =3D --log-level=3Ddebug plus dumps of scriplet content and c=
ommand invocation
> -        self.debug_level =3D int(d.getVar('ROOTFS_RPM_DEBUG', True) or "=
0")
> +        self.debug_level =3D int(d.getVar('ROOTFS_RPM_DEBUG') or "0")
>          self.smart_opt =3D "--log-level=3D%s --data-dir=3D%s" % \
>                           ("warning" if self.debug_level =3D=3D 0 else
>                            "info" if self.debug_level =3D=3D 1 else
> @@ -686,7 +686,7 @@ class RpmPM(PackageManager):
>          if not os.path.exists(self.d.expand('${T}/saved')):
>              bb.utils.mkdirhier(self.d.expand('${T}/saved'))
> =20
> -        packageindex_dir =3D os.path.join(self.d.getVar('WORKDIR', True)=
, 'rpms')
> +        packageindex_dir =3D os.path.join(self.d.getVar('WORKDIR'), 'rpm=
s')
>          self.indexer =3D RpmIndexer(self.d, packageindex_dir)
>          self.pkgs_list =3D RpmPkgsList(self.d, self.target_rootfs, arch_=
var, os_var)
> =20
> @@ -704,7 +704,7 @@ class RpmPM(PackageManager):
>              # List must be prefered to least preferred order
>              default_platform_extra =3D list()
>              platform_extra =3D list()
> -            bbextendvariant =3D self.d.getVar('BBEXTENDVARIANT', True) o=
r ""
> +            bbextendvariant =3D self.d.getVar('BBEXTENDVARIANT') or ""
>              for mlib in self.ml_os_list:
>                  for arch in self.ml_prefix_list[mlib]:
>                      plt =3D arch.replace('-', '_') + '-.*-' + self.ml_os=
_list[mlib]
> @@ -752,7 +752,7 @@ class RpmPM(PackageManager):
>      Create configs for rpm and smart, and multilib is supported
>      '''
>      def create_configs(self):
> -        target_arch =3D self.d.getVar('TARGET_ARCH', True)
> +        target_arch =3D self.d.getVar('TARGET_ARCH')
>          platform =3D '%s%s-%s' % (target_arch.replace('-', '_'),
>                                  self.target_vendor,
>                                  self.ml_os_list['default'])
> @@ -760,7 +760,7 @@ class RpmPM(PackageManager):
>          # List must be prefered to least preferred order
>          default_platform_extra =3D list()
>          platform_extra =3D list()
> -        bbextendvariant =3D self.d.getVar('BBEXTENDVARIANT', True) or ""
> +        bbextendvariant =3D self.d.getVar('BBEXTENDVARIANT') or ""
>          for mlib in self.ml_os_list:
>              for arch in self.ml_prefix_list[mlib]:
>                  plt =3D arch.replace('-', '_') + '-.*-' + self.ml_os_lis=
t[mlib]
> @@ -840,7 +840,7 @@ class RpmPM(PackageManager):
>                      if not new_pkg:
>                          # Failed to translate, package not found!
>                          err_msg =3D '%s not found in the %s feeds (%s) i=
n %s.' % \
> -                                  (pkg, mlib, " ".join(feed_archs), self=
=2Ed.getVar('DEPLOY_DIR_RPM', True))
> +                                  (pkg, mlib, " ".join(feed_archs), self=
=2Ed.getVar('DEPLOY_DIR_RPM'))
>                          if not attempt_only:
>                              bb.error(err_msg)
>                              bb.fatal("This is often caused by an empty p=
ackage declared " \
> @@ -859,7 +859,7 @@ class RpmPM(PackageManager):
>                  new_pkg =3D self._search_pkg_name_in_feeds(pkg, default_=
archs)
>                  if not new_pkg:
>                      err_msg =3D '%s not found in the feeds (%s) in %s.' =
% \
> -                                  (pkg, " ".join(default_archs), self.d.=
getVar('DEPLOY_DIR_RPM', True))
> +                                  (pkg, " ".join(default_archs), self.d.=
getVar('DEPLOY_DIR_RPM'))
>                      if not attempt_only:
>                          bb.error(err_msg)
>                          bb.fatal("This is often caused by an empty packa=
ge declared " \
> @@ -886,7 +886,7 @@ class RpmPM(PackageManager):
> =20
>          channel_priority =3D 5
>          platform_dir =3D os.path.join(self.etcrpm_dir, "platform")
> -        sdkos =3D self.d.getVar("SDK_OS", True)
> +        sdkos =3D self.d.getVar("SDK_OS")
>          with open(platform_dir, "w+") as platform_fd:
>              platform_fd.write(platform + '\n')
>              for pt in platform_extra:
> @@ -958,8 +958,8 @@ class RpmPM(PackageManager):
>              bb.fatal("Create rpm database failed. Command '%s' "
>                       "returned %d:\n%s" % (cmd, e.returncode, e.output.d=
ecode("utf-8")))
>          # Import GPG key to RPM database of the target system
> -        if self.d.getVar('RPM_SIGN_PACKAGES', True) =3D=3D '1':
> -            pubkey_path =3D self.d.getVar('RPM_GPG_PUBKEY', True)
> +        if self.d.getVar('RPM_SIGN_PACKAGES') =3D=3D '1':
> +            pubkey_path =3D self.d.getVar('RPM_GPG_PUBKEY')
>              cmd =3D "%s --root %s --dbpath /var/lib/rpm --import %s > /d=
ev/null" % (
>                    self.rpm_cmd, self.target_rootfs, pubkey_path)
>              subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, she=
ll=3DTrue)
> @@ -971,10 +971,10 @@ class RpmPM(PackageManager):
>          self._invoke_smart('config --set rpm-root=3D%s' % self.target_ro=
otfs)
>          self._invoke_smart('config --set rpm-dbpath=3D/var/lib/rpm')
>          self._invoke_smart('config --set rpm-extra-macros._var=3D%s' %
> -                           self.d.getVar('localstatedir', True))
> +                           self.d.getVar('localstatedir'))
>          cmd =3D "config --set rpm-extra-macros._tmppath=3D/%s/tmp" % (se=
lf.install_dir_name)
> =20
> -        prefer_color =3D self.d.getVar('RPM_PREFER_ELF_ARCH', True)
> +        prefer_color =3D self.d.getVar('RPM_PREFER_ELF_ARCH')
>          if prefer_color:
>              if prefer_color not in ['0', '1', '2', '4']:
>                  bb.fatal("Invalid RPM_PREFER_ELF_ARCH: %s, it should be =
one of:\n"
> @@ -982,7 +982,7 @@ class RpmPM(PackageManager):
>                          "\t2: ELF64 wins\n"
>                          "\t4: ELF64 N32 wins (mips64 or mips64el only)" %
>                          prefer_color)
> -            if prefer_color =3D=3D "4" and self.d.getVar("TUNE_ARCH", Tr=
ue) not in \
> +            if prefer_color =3D=3D "4" and self.d.getVar("TUNE_ARCH") no=
t in \
>                                      ['mips64', 'mips64el']:
>                  bb.fatal("RPM_PREFER_ELF_ARCH =3D \"4\" is for mips64 or=
 mips64el "
>                           "only.")
> @@ -995,17 +995,17 @@ class RpmPM(PackageManager):
>          # Write common configuration for host and target usage
>          self._invoke_smart('config --set rpm-nolinktos=3D1')
>          self._invoke_smart('config --set rpm-noparentdirs=3D1')
> -        check_signature =3D self.d.getVar('RPM_CHECK_SIGNATURES', True)
> +        check_signature =3D self.d.getVar('RPM_CHECK_SIGNATURES')
>          if check_signature and check_signature.strip() =3D=3D "0":
>              self._invoke_smart('config --set rpm-check-signatures=3Dfals=
e')
> -        for i in self.d.getVar('BAD_RECOMMENDATIONS', True).split():
> +        for i in self.d.getVar('BAD_RECOMMENDATIONS').split():
>              self._invoke_smart('flag --set ignore-recommends %s' % i)
> =20
>          # Do the following configurations here, to avoid them being
>          # saved for field upgrade
> -        if self.d.getVar('NO_RECOMMENDATIONS', True).strip() =3D=3D "1":
> +        if self.d.getVar('NO_RECOMMENDATIONS').strip() =3D=3D "1":
>              self._invoke_smart('config --set ignore-all-recommends=3D1')
> -        pkg_exclude =3D self.d.getVar('PACKAGE_EXCLUDE', True) or ""
> +        pkg_exclude =3D self.d.getVar('PACKAGE_EXCLUDE') or ""
>          for i in pkg_exclude.split():
>              self._invoke_smart('flag --set exclude-packages %s' % i)
> =20
> @@ -1016,13 +1016,13 @@ class RpmPM(PackageManager):
>          ch_already_added =3D []
>          for canonical_arch in platform_extra:
>              arch =3D canonical_arch.split('-')[0]
> -            arch_channel =3D os.path.join(self.d.getVar('WORKDIR', True)=
, 'rpms', arch)
> +            arch_channel =3D os.path.join(self.d.getVar('WORKDIR'), 'rpm=
s', arch)
>              oe.path.remove(arch_channel)
>              deploy_arch_dir =3D os.path.join(self.deploy_dir, arch)
>              if not os.path.exists(deploy_arch_dir):
>                      continue
> =20
> -            lockfilename =3D self.d.getVar('DEPLOY_DIR_RPM', True) + "/r=
pm.lock"
> +            lockfilename =3D self.d.getVar('DEPLOY_DIR_RPM') + "/rpm.loc=
k"
>              lf =3D bb.utils.lockfile(lockfilename, False)
>              oe.path.copyhardlinktree(deploy_arch_dir, arch_channel)
>              bb.utils.unlockfile(lf)
> @@ -1093,7 +1093,7 @@ class RpmPM(PackageManager):
>              "fi\n"
> =20
>          intercept_dir =3D self.d.expand('${WORKDIR}/intercept_scripts')
> -        native_root =3D self.d.getVar('STAGING_DIR_NATIVE', True)
> +        native_root =3D self.d.getVar('STAGING_DIR_NATIVE')
>          scriptlet_content =3D SCRIPTLET_FORMAT % (os.environ['PATH'],
>                                                  self.target_rootfs,
>                                                  intercept_dir,
> @@ -1167,7 +1167,7 @@ class RpmPM(PackageManager):
>              ml_pkgs =3D []
>              non_ml_pkgs =3D pkgs[:]
>              for pkg in pkgs:
> -                for mlib in (self.d.getVar("MULTILIB_VARIANTS", True) or=
 "").split():
> +                for mlib in (self.d.getVar("MULTILIB_VARIANTS") or "").s=
plit():
>                      if pkg.startswith(mlib + '-'):
>                          ml_pkgs.append(pkg)
>                          non_ml_pkgs.remove(pkg)
> @@ -1181,7 +1181,7 @@ class RpmPM(PackageManager):
>                  # correctly.
>                  pkgs_new =3D []
>                  for pkg in non_ml_pkgs:
> -                    for mlib in (self.d.getVar("MULTILIB_VARIANTS", True=
) or "").split():
> +                    for mlib in (self.d.getVar("MULTILIB_VARIANTS") or "=
").split():
>                          mlib_pkg =3D mlib + "-" + pkg
>                          if mlib_pkg in ml_pkgs:
>                              pkgs_new.append(pkg)
> @@ -1406,7 +1406,7 @@ class RpmPM(PackageManager):
> =20
>          self._invoke_smart('config --set rpm-nolinktos=3D1')
>          self._invoke_smart('config --set rpm-noparentdirs=3D1')
> -        for i in self.d.getVar('BAD_RECOMMENDATIONS', True).split():
> +        for i in self.d.getVar('BAD_RECOMMENDATIONS').split():
>              self._invoke_smart('flag --set ignore-recommends %s' % i)
>          self._invoke_smart('channel --add rpmsys type=3Drpm-sys -y')
> =20
> @@ -1580,13 +1580,13 @@ class OpkgPM(OpkgDpkgPM):
>          self.pkg_archs =3D archs
>          self.task_name =3D task_name
> =20
> -        self.deploy_dir =3D self.d.getVar("DEPLOY_DIR_IPK", True)
> +        self.deploy_dir =3D self.d.getVar("DEPLOY_DIR_IPK")
>          self.deploy_lock_file =3D os.path.join(self.deploy_dir, "deploy.=
lock")
>          self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg")
>          self.opkg_args =3D "--volatile-cache -f %s -t %s -o %s " % (self=
=2Econfig_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
> -        self.opkg_args +=3D self.d.getVar("OPKG_ARGS", True)
> +        self.opkg_args +=3D self.d.getVar("OPKG_ARGS")
> =20
> -        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR', True)
> +        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')
>          if opkg_lib_dir[0] =3D=3D "/":
>              opkg_lib_dir =3D opkg_lib_dir[1:]
> =20
> @@ -1598,7 +1598,7 @@ class OpkgPM(OpkgDpkgPM):
>          if not os.path.exists(self.d.expand('${T}/saved')):
>              bb.utils.mkdirhier(self.d.expand('${T}/saved'))
> =20
> -        self.from_feeds =3D (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', Tr=
ue) or "") =3D=3D "1"
> +        self.from_feeds =3D (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or=
 "") =3D=3D "1"
>          if self.from_feeds:
>              self._create_custom_config()
>          else:
> @@ -1643,7 +1643,7 @@ class OpkgPM(OpkgDpkgPM):
>                  config_file.write("arch %s %d\n" % (arch, priority))
>                  priority +=3D 5
> =20
> -            for line in (self.d.getVar('IPK_FEED_URIS', True) or "").spl=
it():
> +            for line in (self.d.getVar('IPK_FEED_URIS') or "").split():
>                  feed_match =3D re.match("^[ \t]*(.*)##([^ \t]*)[ \t]*$",=
 line)
> =20
>                  if feed_match is not None:
> @@ -1660,17 +1660,17 @@ class OpkgPM(OpkgDpkgPM):
>              specified as compatible for the current machine.
>              NOTE: Development-helper feature, NOT a full-fledged feed.
>              """
> -            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") !=
=3D "":
> +            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") !=3D "":
>                  for arch in self.pkg_archs.split():
>                      cfg_file_name =3D os.path.join(self.target_rootfs,
> -                                                 self.d.getVar("sysconfd=
ir", True),
> +                                                 self.d.getVar("sysconfd=
ir"),
>                                                   "opkg",
>                                                   "local-%s-feed.conf" % =
arch)
> =20
>                      with open(cfg_file_name, "w+") as cfg_file:
>                          cfg_file.write("src/gz local-%s %s/%s" %
>                                         (arch,
> -                                        self.d.getVar('FEED_DEPLOYDIR_BA=
SE_URI', True),
> +                                        self.d.getVar('FEED_DEPLOYDIR_BA=
SE_URI'),
>                                          arch))
> =20
>                          if self.opkg_dir !=3D '/var/lib/opkg':
> @@ -1679,8 +1679,8 @@ class OpkgPM(OpkgDpkgPM):
>                              # the default value of "/var/lib" as defined=
 in opkg:
>                              # libopkg/opkg_conf.h:#define OPKG_CONF_DEFA=
ULT_INFO_DIR      "/var/lib/opkg/info"
>                              # libopkg/opkg_conf.h:#define OPKG_CONF_DEFA=
ULT_STATUS_FILE   "/var/lib/opkg/status"
> -                            cfg_file.write("option info_dir     %s\n" % =
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
> -                            cfg_file.write("option status_file  %s\n" % =
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
> +                            cfg_file.write("option info_dir     %s\n" % =
os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
> +                            cfg_file.write("option status_file  %s\n" % =
os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
> =20
> =20
>      def _create_config(self):
> @@ -1704,8 +1704,8 @@ class OpkgPM(OpkgDpkgPM):
>                  # the default value of "/var/lib" as defined in opkg:
>                  # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR=
      "/var/lib/opkg/info"
>                  # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_F=
ILE   "/var/lib/opkg/status"
> -                config_file.write("option info_dir     %s\n" % os.path.j=
oin(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
> -                config_file.write("option status_file  %s\n" % os.path.j=
oin(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
> +                config_file.write("option info_dir     %s\n" % os.path.j=
oin(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
> +                config_file.write("option status_file  %s\n" % os.path.j=
oin(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
> =20
>      def insert_feeds_uris(self):
>          if self.feed_uris =3D=3D "":
> @@ -1760,9 +1760,9 @@ class OpkgPM(OpkgDpkgPM):
>          os.environ['OFFLINE_ROOT'] =3D self.target_rootfs
>          os.environ['IPKG_OFFLINE_ROOT'] =3D self.target_rootfs
>          os.environ['OPKG_OFFLINE_ROOT'] =3D self.target_rootfs
> -        os.environ['INTERCEPT_DIR'] =3D os.path.join(self.d.getVar('WORK=
DIR', True),
> +        os.environ['INTERCEPT_DIR'] =3D os.path.join(self.d.getVar('WORK=
DIR'),
>                                                     "intercept_scripts")
> -        os.environ['NATIVE_ROOT'] =3D self.d.getVar('STAGING_DIR_NATIVE'=
, True)
> +        os.environ['NATIVE_ROOT'] =3D self.d.getVar('STAGING_DIR_NATIVE')
> =20
>          try:
>              bb.note("Installing the following packages: %s" % ' '.join(p=
kgs))
> @@ -1813,7 +1813,7 @@ class OpkgPM(OpkgDpkgPM):
>          return OpkgPkgsList(self.d, self.target_rootfs, self.config_file=
).list_pkgs()
> =20
>      def handle_bad_recommendations(self):
> -        bad_recommendations =3D self.d.getVar("BAD_RECOMMENDATIONS", Tru=
e) or ""
> +        bad_recommendations =3D self.d.getVar("BAD_RECOMMENDATIONS") or =
""
>          if bad_recommendations.strip() =3D=3D "":
>              return
> =20
> @@ -1864,7 +1864,7 @@ class OpkgPM(OpkgDpkgPM):
>          bb.utils.mkdirhier(temp_opkg_dir)
> =20
>          opkg_args =3D "-f %s -o %s " % (self.config_file, temp_rootfs)
> -        opkg_args +=3D self.d.getVar("OPKG_ARGS", True)
> +        opkg_args +=3D self.d.getVar("OPKG_ARGS")
> =20
>          cmd =3D "%s %s update" % (self.opkg_cmd, opkg_args)
>          try:
> @@ -1940,7 +1940,7 @@ class DpkgPM(OpkgDpkgPM):
>      def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=
=3DNone):
>          super(DpkgPM, self).__init__(d)
>          self.target_rootfs =3D target_rootfs
> -        self.deploy_dir =3D self.d.getVar('DEPLOY_DIR_DEB', True)
> +        self.deploy_dir =3D self.d.getVar('DEPLOY_DIR_DEB')
>          if apt_conf_dir is None:
>              self.apt_conf_dir =3D self.d.expand("${APTCONF_TARGET}/apt")
>          else:
> @@ -1949,10 +1949,10 @@ class DpkgPM(OpkgDpkgPM):
>          self.apt_get_cmd =3D bb.utils.which(os.getenv('PATH'), "apt-get")
>          self.apt_cache_cmd =3D bb.utils.which(os.getenv('PATH'), "apt-ca=
che")
> =20
> -        self.apt_args =3D d.getVar("APT_ARGS", True)
> +        self.apt_args =3D d.getVar("APT_ARGS")
> =20
>          self.all_arch_list =3D archs.split()
> -        all_mlb_pkg_arch_list =3D (self.d.getVar('ALL_MULTILIB_PACKAGE_A=
RCHS', True) or "").split()
> +        all_mlb_pkg_arch_list =3D (self.d.getVar('ALL_MULTILIB_PACKAGE_A=
RCHS') or "").split()
>          self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list=
 if arch not in self.all_arch_list)
> =20
>          self._create_configs(archs, base_archs)
> @@ -2013,9 +2013,9 @@ class DpkgPM(OpkgDpkgPM):
>          os.environ['OFFLINE_ROOT'] =3D self.target_rootfs
>          os.environ['IPKG_OFFLINE_ROOT'] =3D self.target_rootfs
>          os.environ['OPKG_OFFLINE_ROOT'] =3D self.target_rootfs
> -        os.environ['INTERCEPT_DIR'] =3D os.path.join(self.d.getVar('WORK=
DIR', True),
> +        os.environ['INTERCEPT_DIR'] =3D os.path.join(self.d.getVar('WORK=
DIR'),
>                                                     "intercept_scripts")
> -        os.environ['NATIVE_ROOT'] =3D self.d.getVar('STAGING_DIR_NATIVE'=
, True)
> +        os.environ['NATIVE_ROOT'] =3D self.d.getVar('STAGING_DIR_NATIVE')
> =20
>          failed_pkgs =3D []
>          for pkg_name in installed_pkgs:
> @@ -2166,7 +2166,7 @@ class DpkgPM(OpkgDpkgPM):
> =20
>                  priority +=3D 5
> =20
> -            pkg_exclude =3D self.d.getVar('PACKAGE_EXCLUDE', True) or ""
> +            pkg_exclude =3D self.d.getVar('PACKAGE_EXCLUDE') or ""
>              for pkg in pkg_exclude.split():
>                  prefs_file.write(
>                      "Package: %s\n"
> @@ -2181,14 +2181,14 @@ class DpkgPM(OpkgDpkgPM):
>                                     os.path.join(self.deploy_dir, arch))
> =20
>          base_arch_list =3D base_archs.split()
> -        multilib_variants =3D self.d.getVar("MULTILIB_VARIANTS", True);
> +        multilib_variants =3D self.d.getVar("MULTILIB_VARIANTS");
>          for variant in multilib_variants.split():
>              localdata =3D bb.data.createCopy(self.d)
>              variant_tune =3D localdata.getVar("DEFAULTTUNE_virtclass-mul=
tilib-" + variant, False)
> -            orig_arch =3D localdata.getVar("DPKG_ARCH", True)
> +            orig_arch =3D localdata.getVar("DPKG_ARCH")
>              localdata.setVar("DEFAULTTUNE", variant_tune)
>              bb.data.update_data(localdata)
> -            variant_arch =3D localdata.getVar("DPKG_ARCH", True)
> +            variant_arch =3D localdata.getVar("DPKG_ARCH")
>              if variant_arch not in base_arch_list:
>                  base_arch_list.append(variant_arch)
> =20
> @@ -2219,7 +2219,7 @@ class DpkgPM(OpkgDpkgPM):
> =20
>      def remove_packaging_data(self):
>          bb.utils.remove(os.path.join(self.target_rootfs,
> -                                     self.d.getVar('opkglibdir', True)),=
 True)
> +                                     self.d.getVar('opkglibdir')), True)
>          bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
> =20
>      def fix_broken_dependencies(self):
> @@ -2267,12 +2267,12 @@ class DpkgPM(OpkgDpkgPM):
>          return tmp_dir
> =20
>  def generate_index_files(d):
> -    classes =3D d.getVar('PACKAGE_CLASSES', True).replace("package_", ""=
).split()
> +    classes =3D d.getVar('PACKAGE_CLASSES').replace("package_", "").spli=
t()
> =20
>      indexer_map =3D {
> -        "rpm": (RpmIndexer, d.getVar('DEPLOY_DIR_RPM', True)),
> -        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK', True)),
> -        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB', True))
> +        "rpm": (RpmIndexer, d.getVar('DEPLOY_DIR_RPM')),
> +        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
> +        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
>      }
> =20
>      result =3D None
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index 21d4de9..32e5c82 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -57,7 +57,7 @@ def read_subpkgdata_dict(pkg, d):
>  def _pkgmap(d):
>      """Return a dictionary mapping package to recipe name."""
> =20
> -    pkgdatadir =3D d.getVar("PKGDATA_DIR", True)
> +    pkgdatadir =3D d.getVar("PKGDATA_DIR")
> =20
>      pkgmap =3D {}
>      try:
> diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
> index 9781927..d68e5d3 100644
> --- a/meta/lib/oe/packagegroup.py
> +++ b/meta/lib/oe/packagegroup.py
> @@ -1,7 +1,7 @@
>  import itertools
> =20
>  def is_optional(feature, d):
> -    packages =3D d.getVar("FEATURE_PACKAGES_%s" % feature, True)
> +    packages =3D d.getVar("FEATURE_PACKAGES_%s" % feature)
>      if packages:
>          return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optio=
nal", True))
>      else:
> @@ -9,9 +9,9 @@ def is_optional(feature, d):
> =20
>  def packages(features, d):
>      for feature in features:
> -        packages =3D d.getVar("FEATURE_PACKAGES_%s" % feature, True)
> +        packages =3D d.getVar("FEATURE_PACKAGES_%s" % feature)
>          if not packages:
> -            packages =3D d.getVar("PACKAGE_GROUP_%s" % feature, True)
> +            packages =3D d.getVar("PACKAGE_GROUP_%s" % feature)
>          for pkg in (packages or "").split():
>              yield pkg
> =20
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index dbefd28..0f9e728 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -281,8 +281,8 @@ class GitApplyTree(PatchTree):
> =20
>      def __init__(self, dir, d):
>          PatchTree.__init__(self, dir, d)
> -        self.commituser =3D d.getVar('PATCH_GIT_USER_NAME', True)
> -        self.commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL', True)
> +        self.commituser =3D d.getVar('PATCH_GIT_USER_NAME')
> +        self.commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL')
> =20
>      @staticmethod
>      def extractPatchHeader(patchfile):
> @@ -371,8 +371,8 @@ class GitApplyTree(PatchTree):
>      @staticmethod
>      def gitCommandUserOptions(cmd, commituser=3DNone, commitemail=3DNone=
, d=3DNone):
>          if d:
> -            commituser =3D d.getVar('PATCH_GIT_USER_NAME', True)
> -            commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL', True)
> +            commituser =3D d.getVar('PATCH_GIT_USER_NAME')
> +            commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL')
>          if commituser:
>              cmd +=3D ['-c', 'user.name=3D"%s"' % commituser]
>          if commitemail:
> @@ -551,7 +551,7 @@ class GitApplyTree(PatchTree):
> =20
>  class QuiltTree(PatchSet):
>      def _runcmd(self, args, run =3D True):
> -        quiltrc =3D self.d.getVar('QUILTRCFILE', True)
> +        quiltrc =3D self.d.getVar('QUILTRCFILE')
>          if not run:
>              return ["quilt"] + ["--quiltrc"] + [quiltrc] + args
>          runcmd(["quilt"] + ["--quiltrc"] + [quiltrc] + args, self.dir)
> @@ -727,7 +727,7 @@ class UserResolver(Resolver):
>              # Patch application failed
>              patchcmd =3D self.patchset.Push(True, False, False)
> =20
> -            t =3D self.patchset.d.getVar('T', True)
> +            t =3D self.patchset.d.getVar('T')
>              if not t:
>                  bb.msg.fatal("Build", "T not set")
>              bb.utils.mkdirhier(t)
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index f73fd4a..804ecd5 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -52,7 +52,7 @@ def make_relative_symlink(path):
> =20
>  def format_display(path, metadata):
>      """ Prepare a path for display to the user. """
> -    rel =3D relative(metadata.getVar("TOPDIR", True), path)
> +    rel =3D relative(metadata.getVar("TOPDIR"), path)
>      if len(rel) > len(path):
>          return path
>      else:
> diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
> index 0054f95..32dfc15 100644
> --- a/meta/lib/oe/prservice.py
> +++ b/meta/lib/oe/prservice.py
> @@ -1,7 +1,7 @@
> =20
>  def prserv_make_conn(d, check =3D False):
>      import prserv.serv
> -    host_params =3D list([_f for _f in (d.getVar("PRSERV_HOST", True) or=
 '').split(':') if _f])
> +    host_params =3D list([_f for _f in (d.getVar("PRSERV_HOST") or '').s=
plit(':') if _f])
>      try:
>          conn =3D None
>          conn =3D prserv.serv.PRServerConnection(host_params[0], int(host=
_params[1]))
> @@ -15,11 +15,11 @@ def prserv_make_conn(d, check =3D False):
>      return conn
> =20
>  def prserv_dump_db(d):
> -    if not d.getVar('PRSERV_HOST', True):
> +    if not d.getVar('PRSERV_HOST'):
>          bb.error("Not using network based PR service")
>          return None
> =20
> -    conn =3D d.getVar("__PRSERV_CONN", True)
> +    conn =3D d.getVar("__PRSERV_CONN")
>      if conn is None:
>          conn =3D prserv_make_conn(d)
>          if conn is None:
> @@ -27,18 +27,18 @@ def prserv_dump_db(d):
>              return None
> =20
>      #dump db
> -    opt_version =3D d.getVar('PRSERV_DUMPOPT_VERSION', True)
> -    opt_pkgarch =3D d.getVar('PRSERV_DUMPOPT_PKGARCH', True)
> -    opt_checksum =3D d.getVar('PRSERV_DUMPOPT_CHECKSUM', True)
> -    opt_col =3D ("1" =3D=3D d.getVar('PRSERV_DUMPOPT_COL', True))
> +    opt_version =3D d.getVar('PRSERV_DUMPOPT_VERSION')
> +    opt_pkgarch =3D d.getVar('PRSERV_DUMPOPT_PKGARCH')
> +    opt_checksum =3D d.getVar('PRSERV_DUMPOPT_CHECKSUM')
> +    opt_col =3D ("1" =3D=3D d.getVar('PRSERV_DUMPOPT_COL'))
>      return conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
> =20
>  def prserv_import_db(d, filter_version=3DNone, filter_pkgarch=3DNone, fi=
lter_checksum=3DNone):
> -    if not d.getVar('PRSERV_HOST', True):
> +    if not d.getVar('PRSERV_HOST'):
>          bb.error("Not using network based PR service")
>          return None
> =20
> -    conn =3D d.getVar("__PRSERV_CONN", True)
> +    conn =3D d.getVar("__PRSERV_CONN")
>      if conn is None:
>          conn =3D prserv_make_conn(d)
>          if conn is None:
> @@ -58,7 +58,7 @@ def prserv_import_db(d, filter_version=3DNone, filter_p=
kgarch=3DNone, filter_checksu
>                 (filter_checksum and filter_checksum !=3D checksum):
>                 continue
>              try:
> -                value =3D int(d.getVar(remain + '$' + version + '$' + pk=
garch + '$' + checksum, True))
> +                value =3D int(d.getVar(remain + '$' + version + '$' + pk=
garch + '$' + checksum))
>              except BaseException as exc:
>                  bb.debug("Not valid value of %s:%s" % (v,str(exc)))
>                  continue
> @@ -72,8 +72,8 @@ def prserv_import_db(d, filter_version=3DNone, filter_p=
kgarch=3DNone, filter_checksu
>  def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=3DFalse):
>      import bb.utils
>      #initilize the output file
> -    bb.utils.mkdirhier(d.getVar('PRSERV_DUMPDIR', True))
> -    df =3D d.getVar('PRSERV_DUMPFILE', True)
> +    bb.utils.mkdirhier(d.getVar('PRSERV_DUMPDIR'))
> +    df =3D d.getVar('PRSERV_DUMPFILE')
>      #write data
>      lf =3D bb.utils.lockfile("%s.lock" % df)
>      f =3D open(df, "a")
> @@ -114,7 +114,7 @@ def prserv_export_tofile(d, metainfo, datainfo, lockd=
own, nomax=3DFalse):
>      bb.utils.unlockfile(lf)
> =20
>  def prserv_check_avail(d):
> -    host_params =3D list([_f for _f in (d.getVar("PRSERV_HOST", True) or=
 '').split(':') if _f])
> +    host_params =3D list([_f for _f in (d.getVar("PRSERV_HOST") or '').s=
plit(':') if _f])
>      try:
>          if len(host_params) !=3D 2:
>              raise TypeError
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index 22d76dc..3231e60 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -129,11 +129,11 @@ class ELFFile:
>          if cmd in self.objdump_output:
>              return self.objdump_output[cmd]
> =20
> -        objdump =3D d.getVar('OBJDUMP', True)
> +        objdump =3D d.getVar('OBJDUMP')
> =20
>          env =3D os.environ.copy()
>          env["LC_ALL"] =3D "C"
> -        env["PATH"] =3D d.getVar('PATH', True)
> +        env["PATH"] =3D d.getVar('PATH')
> =20
>          try:
>              bb.note("%s %s %s" % (objdump, cmd, self.name))
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index 1589feb..4c27c3b 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -359,16 +359,16 @@ def copy_recipe_files(d, tgt_dir, whole_dir=3DFalse=
, download=3DTrue):
> =20
>      # FIXME need a warning if the unexpanded SRC_URI value contains vari=
able references
> =20
> -    uris =3D (d.getVar('SRC_URI', True) or "").split()
> +    uris =3D (d.getVar('SRC_URI') or "").split()
>      fetch =3D bb.fetch2.Fetch(uris, d)
>      if download:
>          fetch.download()
> =20
>      # Copy local files to target directory and gather any remote files
> -    bb_dir =3D os.path.dirname(d.getVar('FILE', True)) + os.sep
> +    bb_dir =3D os.path.dirname(d.getVar('FILE')) + os.sep
>      remotes =3D []
>      copied =3D []
> -    includes =3D [path for path in d.getVar('BBINCLUDED', True).split() =
if
> +    includes =3D [path for path in d.getVar('BBINCLUDED').split() if
>                  path.startswith(bb_dir) and os.path.exists(path)]
>      for path in fetch.localpaths() + includes:
>          # Only import files that are under the meta directory
> @@ -391,7 +391,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=3DFalse, =
download=3DTrue):
> =20
>  def get_recipe_local_files(d, patches=3DFalse, archives=3DFalse):
>      """Get a list of local files in SRC_URI within a recipe."""
> -    uris =3D (d.getVar('SRC_URI', True) or "").split()
> +    uris =3D (d.getVar('SRC_URI') or "").split()
>      fetch =3D bb.fetch2.Fetch(uris, d)
>      # FIXME this list should be factored out somewhere else (such as the
>      # fetcher) though note that this only encompasses actual container f=
ormats
> @@ -454,7 +454,7 @@ def get_recipe_patched_files(d):
>      for patch in patches:
>          _, _, patchfile, _, _, parm =3D bb.fetch.decodeurl(patch)
>          striplevel =3D int(parm['striplevel'])
> -        patchedfiles[patchfile] =3D oe.patch.PatchSet.getPatchedFiles(pa=
tchfile, striplevel, os.path.join(d.getVar('S', True), parm.get('patchdir',=
 '')))
> +        patchedfiles[patchfile] =3D oe.patch.PatchSet.getPatchedFiles(pa=
tchfile, striplevel, os.path.join(d.getVar('S'), parm.get('patchdir', '')))
>      return patchedfiles
> =20
> =20
> @@ -492,9 +492,9 @@ def get_bbfile_path(d, destdir, extrapathhint=3DNone):
>      confdata.setVar('LAYERDIR', destlayerdir)
>      destlayerconf =3D os.path.join(destlayerdir, "conf", "layer.conf")
>      confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confdata)
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
> =20
> -    bbfilespecs =3D (confdata.getVar('BBFILES', True) or '').split()
> +    bbfilespecs =3D (confdata.getVar('BBFILES') or '').split()
>      if destdir =3D=3D destlayerdir:
>          for bbfilespec in bbfilespecs:
>              if not bbfilespec.endswith('.bbappend'):
> @@ -507,8 +507,8 @@ def get_bbfile_path(d, destdir, extrapathhint=3DNone):
> =20
>      # Try to make up a path that matches BBFILES
>      # this is a little crude, but better than nothing
> -    bpn =3D d.getVar('BPN', True)
> -    recipefn =3D os.path.basename(d.getVar('FILE', True))
> +    bpn =3D d.getVar('BPN')
> +    recipefn =3D os.path.basename(d.getVar('FILE'))
>      pathoptions =3D [destdir]
>      if extrapathhint:
>          pathoptions.append(os.path.join(destdir, extrapathhint))
> @@ -532,7 +532,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=3D=
False):
>      import bb.cookerdata
> =20
>      destlayerdir =3D os.path.abspath(destlayerdir)
> -    recipefile =3D d.getVar('FILE', True)
> +    recipefile =3D d.getVar('FILE')
>      recipefn =3D os.path.splitext(os.path.basename(recipefile))[0]
>      if wildcardver and '_' in recipefn:
>          recipefn =3D recipefn.split('_', 1)[0] + '_%'
> @@ -552,7 +552,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=3D=
False):
>      appendpath =3D os.path.join(destlayerdir, os.path.relpath(os.path.di=
rname(recipefile), origlayerdir), appendfn)
>      closepath =3D ''
>      pathok =3D True
> -    for bbfilespec in confdata.getVar('BBFILES', True).split():
> +    for bbfilespec in confdata.getVar('BBFILES').split():
>          if fnmatch.fnmatchcase(appendpath, bbfilespec):
>              # Our append path works, we're done
>              break
> @@ -625,7 +625,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, insta=
ll=3DNone, wildcardver=3DFalse,
> =20
>      # FIXME check if the bbappend doesn't get overridden by a higher pri=
ority layer?
> =20
> -    layerdirs =3D [os.path.abspath(layerdir) for layerdir in rd.getVar('=
BBLAYERS', True).split()]
> +    layerdirs =3D [os.path.abspath(layerdir) for layerdir in rd.getVar('=
BBLAYERS').split()]
>      if not os.path.abspath(destlayerdir) in layerdirs:
>          bb.warn('Specified layer is not currently enabled in bblayers.co=
nf, you will need to add it before this bbappend will be active')
> =20
> @@ -661,7 +661,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, insta=
ll=3DNone, wildcardver=3DFalse,
>          else:
>              bbappendlines.append((varname, op, value))
> =20
> -    destsubdir =3D rd.getVar('PN', True)
> +    destsubdir =3D rd.getVar('PN')
>      if srcfiles:
>          bbappendlines.append(('FILESEXTRAPATHS_prepend', ':=3D', '${THIS=
DIR}/${PN}:'))
> =20
> @@ -680,7 +680,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, insta=
ll=3DNone, wildcardver=3DFalse,
>                  srcurientry =3D 'file://%s' % srcfile
>                  # Double-check it's not there already
>                  # FIXME do we care if the entry is added by another bbap=
pend that might go away?
> -                if not srcurientry in rd.getVar('SRC_URI', True).split():
> +                if not srcurientry in rd.getVar('SRC_URI').split():
>                      if machine:
>                          appendline('SRC_URI_append%s' % appendoverride, =
'=3D', ' ' + srcurientry)
>                      else:
> @@ -829,7 +829,7 @@ def replace_dir_vars(path, d):
>      # Sort by length so we get the variables we're interested in first
>      for var in sorted(list(d.keys()), key=3Dlen):
>          if var.endswith('dir') and var.lower() =3D=3D var:
> -            value =3D d.getVar(var, True)
> +            value =3D d.getVar(var)
>              if value.startswith('/') and not '\n' in value and value not=
 in dirvars:
>                  dirvars[value] =3D var
>      for dirpath in sorted(list(dirvars.keys()), reverse=3DTrue):
> @@ -883,12 +883,12 @@ def get_recipe_upstream_version(rd):
>      ru['type'] =3D 'U'
>      ru['datetime'] =3D ''
> =20
> -    pv =3D rd.getVar('PV', True)
> +    pv =3D rd.getVar('PV')
> =20
>      # XXX: If don't have SRC_URI means that don't have upstream sources =
so
>      # returns the current recipe version, so that upstream version check
>      # declares a match.
> -    src_uris =3D rd.getVar('SRC_URI', True)
> +    src_uris =3D rd.getVar('SRC_URI')
>      if not src_uris:
>          ru['version'] =3D pv
>          ru['type'] =3D 'M'
> @@ -899,13 +899,13 @@ def get_recipe_upstream_version(rd):
>      src_uri =3D src_uris.split()[0]
>      uri_type, _, _, _, _, _ =3D  decodeurl(src_uri)
> =20
> -    manual_upstream_version =3D rd.getVar("RECIPE_UPSTREAM_VERSION", Tru=
e)
> +    manual_upstream_version =3D rd.getVar("RECIPE_UPSTREAM_VERSION")
>      if manual_upstream_version:
>          # manual tracking of upstream version.
>          ru['version'] =3D manual_upstream_version
>          ru['type'] =3D 'M'
> =20
> -        manual_upstream_date =3D rd.getVar("CHECK_DATE", True)
> +        manual_upstream_date =3D rd.getVar("CHECK_DATE")
>          if manual_upstream_date:
>              date =3D datetime.strptime(manual_upstream_date, "%b %d, %Y")
>          else:
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index a348b97..8c5976a 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -18,8 +18,8 @@ class Rootfs(object, metaclass=3DABCMeta):
>      def __init__(self, d, progress_reporter=3DNone):
>          self.d =3D d
>          self.pm =3D None
> -        self.image_rootfs =3D self.d.getVar('IMAGE_ROOTFS', True)
> -        self.deploydir =3D self.d.getVar('IMGDEPLOYDIR', True)
> +        self.image_rootfs =3D self.d.getVar('IMAGE_ROOTFS')
> +        self.deploydir =3D self.d.getVar('IMGDEPLOYDIR')
>          self.progress_reporter =3D progress_reporter
> =20
>          self.install_order =3D Manifest.INSTALL_ORDER
> @@ -69,7 +69,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>              else:
>                  msg =3D '%d %s messages' % (len(messages), type)
>              msg =3D '[log_check] %s: found %s in the logfile:\n%s' % \
> -                (self.d.getVar('PN', True), msg, ''.join(messages))
> +                (self.d.getVar('PN'), msg, ''.join(messages))
>              if type =3D=3D 'error':
>                  bb.fatal(msg)
>              else:
> @@ -100,7 +100,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>          pass
> =20
>      def _setup_dbg_rootfs(self, dirs):
> -        gen_debugfs =3D self.d.getVar('IMAGE_GEN_DEBUGFS', True) or '0'
> +        gen_debugfs =3D self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
>          if gen_debugfs !=3D '1':
>             return
> =20
> @@ -153,7 +153,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>          os.rename(self.image_rootfs + '-orig', self.image_rootfs)
> =20
>      def _exec_shell_cmd(self, cmd):
> -        fakerootcmd =3D self.d.getVar('FAKEROOT', True)
> +        fakerootcmd =3D self.d.getVar('FAKEROOT')
>          if fakerootcmd is not None:
>              exec_cmd =3D [fakerootcmd, cmd]
>          else:
> @@ -168,14 +168,14 @@ class Rootfs(object, metaclass=3DABCMeta):
> =20
>      def create(self):
>          bb.note("###### Generate rootfs #######")
> -        pre_process_cmds =3D self.d.getVar("ROOTFS_PREPROCESS_COMMAND", =
True)
> -        post_process_cmds =3D self.d.getVar("ROOTFS_POSTPROCESS_COMMAND"=
, True)
> -        rootfs_post_install_cmds =3D self.d.getVar('ROOTFS_POSTINSTALL_C=
OMMAND', True)
> +        pre_process_cmds =3D self.d.getVar("ROOTFS_PREPROCESS_COMMAND")
> +        post_process_cmds =3D self.d.getVar("ROOTFS_POSTPROCESS_COMMAND")
> +        rootfs_post_install_cmds =3D self.d.getVar('ROOTFS_POSTINSTALL_C=
OMMAND')
> =20
> -        postinst_intercepts_dir =3D self.d.getVar("POSTINST_INTERCEPTS_D=
IR", True)
> +        postinst_intercepts_dir =3D self.d.getVar("POSTINST_INTERCEPTS_D=
IR")
>          if not postinst_intercepts_dir:
>              postinst_intercepts_dir =3D self.d.expand("${COREBASE}/scrip=
ts/postinst-intercepts")
> -        intercepts_dir =3D os.path.join(self.d.getVar('WORKDIR', True),
> +        intercepts_dir =3D os.path.join(self.d.getVar('WORKDIR'),
>                                        "intercept_scripts")
> =20
>          bb.utils.remove(intercepts_dir, True)
> @@ -198,10 +198,10 @@ class Rootfs(object, metaclass=3DABCMeta):
>          # call the package manager dependent create method
>          self._create()
> =20
> -        sysconfdir =3D self.image_rootfs + self.d.getVar('sysconfdir', T=
rue)
> +        sysconfdir =3D self.image_rootfs + self.d.getVar('sysconfdir')
>          bb.utils.mkdirhier(sysconfdir)
>          with open(sysconfdir + "/version", "w+") as ver:
> -            ver.write(self.d.getVar('BUILDNAME', True) + "\n")
> +            ver.write(self.d.getVar('BUILDNAME') + "\n")
> =20
>          execute_pre_post_process(self.d, rootfs_post_install_cmds)
> =20
> @@ -220,7 +220,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>                           "offline and rootfs is read-only: %s" %
>                           delayed_postinsts)
> =20
> -        if self.d.getVar('USE_DEVFS', True) !=3D "1":
> +        if self.d.getVar('USE_DEVFS') !=3D "1":
>              self._create_devfs()
> =20
>          self._uninstall_unneeded()
> @@ -232,7 +232,7 @@ class Rootfs(object, metaclass=3DABCMeta):
> =20
>          self._run_ldconfig()
> =20
> -        if self.d.getVar('USE_DEPMOD', True) !=3D "0":
> +        if self.d.getVar('USE_DEPMOD') !=3D "0":
>              self._generate_kernel_module_deps()
> =20
>          self._cleanup()
> @@ -248,16 +248,16 @@ class Rootfs(object, metaclass=3DABCMeta):
>          if delayed_postinsts is None:
>              if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir=
}/init.d/run-postinsts")):
>                  self._exec_shell_cmd(["update-rc.d", "-f", "-r",
> -                                      self.d.getVar('IMAGE_ROOTFS', True=
),
> +                                      self.d.getVar('IMAGE_ROOTFS'),
>                                        "run-postinsts", "remove"])
> =20
>          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only-r=
ootfs",
>                                          True, False, self.d)
> -        image_rorfs_force =3D self.d.getVar('FORCE_RO_REMOVE', True)
> +        image_rorfs_force =3D self.d.getVar('FORCE_RO_REMOVE')
> =20
>          if image_rorfs or image_rorfs_force =3D=3D "1":
>              # Remove components that we don't need if it's a read-only r=
ootfs
> -            unneeded_pkgs =3D self.d.getVar("ROOTFS_RO_UNNEEDED", True).=
split()
> +            unneeded_pkgs =3D self.d.getVar("ROOTFS_RO_UNNEEDED").split()
>              pkgs_installed =3D image_list_installed_packages(self.d)
>              pkgs_to_remove =3D [pkg for pkg in pkgs_installed if pkg in =
unneeded_pkgs]
> =20
> @@ -270,7 +270,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>                  bb.warn("There are post install scripts "
>                          "in a read-only rootfs")
> =20
> -        post_uninstall_cmds =3D self.d.getVar("ROOTFS_POSTUNINSTALL_COMM=
AND", True)
> +        post_uninstall_cmds =3D self.d.getVar("ROOTFS_POSTUNINSTALL_COMM=
AND")
>          execute_pre_post_process(self.d, post_uninstall_cmds)
> =20
>          runtime_pkgmanage =3D bb.utils.contains("IMAGE_FEATURES", "packa=
ge-management",
> @@ -280,12 +280,12 @@ class Rootfs(object, metaclass=3DABCMeta):
>              self.pm.remove_packaging_data()
> =20
>      def _run_intercepts(self):
> -        intercepts_dir =3D os.path.join(self.d.getVar('WORKDIR', True),
> +        intercepts_dir =3D os.path.join(self.d.getVar('WORKDIR'),
>                                        "intercept_scripts")
> =20
>          bb.note("Running intercept scripts:")
>          os.environ['D'] =3D self.image_rootfs
> -        os.environ['STAGING_DIR_NATIVE'] =3D self.d.getVar('STAGING_DIR_=
NATIVE', True)
> +        os.environ['STAGING_DIR_NATIVE'] =3D self.d.getVar('STAGING_DIR_=
NATIVE')
>          for script in os.listdir(intercepts_dir):
>              script_full =3D os.path.join(intercepts_dir, script)
> =20
> @@ -317,7 +317,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>                          self._handle_intercept_failure(registered_pkgs)
> =20
>      def _run_ldconfig(self):
> -        if self.d.getVar('LDCONFIGDEPEND', True):
> +        if self.d.getVar('LDCONFIGDEPEND'):
>              bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c n=
ew -v")
>              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '=
-c',
>                                    'new', '-v'])
> @@ -337,7 +337,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>              bb.note("No Kernel Modules found, not running depmod")
>              return
> =20
> -        kernel_abi_ver_file =3D oe.path.join(self.d.getVar('PKGDATA_DIR'=
, True), "kernel-depmod",
> +        kernel_abi_ver_file =3D oe.path.join(self.d.getVar('PKGDATA_DIR'=
), "kernel-depmod",
>                                             'kernel-abiversion')
>          if not os.path.exists(kernel_abi_ver_file):
>              bb.fatal("No kernel-abiversion file found (%s), cannot run d=
epmod, aborting" % kernel_abi_ver_file)
> @@ -359,15 +359,15 @@ class Rootfs(object, metaclass=3DABCMeta):
>      """
>      def _create_devfs(self):
>          devtable_list =3D []
> -        devtable =3D self.d.getVar('IMAGE_DEVICE_TABLE', True)
> +        devtable =3D self.d.getVar('IMAGE_DEVICE_TABLE')
>          if devtable is not None:
>              devtable_list.append(devtable)
>          else:
> -            devtables =3D self.d.getVar('IMAGE_DEVICE_TABLES', True)
> +            devtables =3D self.d.getVar('IMAGE_DEVICE_TABLES')
>              if devtables is None:
>                  devtables =3D 'files/device_table-minimal.txt'
>              for devtable in devtables.split():
> -                devtable_list.append("%s" % bb.utils.which(self.d.getVar=
('BBPATH', True), devtable))
> +                devtable_list.append("%s" % bb.utils.which(self.d.getVar=
('BBPATH'), devtable))
> =20
>          for devtable in devtable_list:
>              self._exec_shell_cmd(["makedevs", "-r",
> @@ -383,16 +383,16 @@ class RpmRootfs(Rootfs):
>          self.manifest =3D RpmManifest(d, manifest_dir)
> =20
>          self.pm =3D RpmPM(d,
> -                        d.getVar('IMAGE_ROOTFS', True),
> -                        self.d.getVar('TARGET_VENDOR', True)
> +                        d.getVar('IMAGE_ROOTFS'),
> +                        self.d.getVar('TARGET_VENDOR')
>                          )
> =20
> -        self.inc_rpm_image_gen =3D self.d.getVar('INC_RPM_IMAGE_GEN', Tr=
ue)
> +        self.inc_rpm_image_gen =3D self.d.getVar('INC_RPM_IMAGE_GEN')
>          if self.inc_rpm_image_gen !=3D "1":
>              bb.utils.remove(self.image_rootfs, True)
>          else:
>              self.pm.recovery_packaging_data()
> -        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), Tru=
e)
> +        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
> =20
>          self.pm.create_configs()
> =20
> @@ -426,8 +426,8 @@ class RpmRootfs(Rootfs):
> =20
>      def _create(self):
>          pkgs_to_install =3D self.manifest.parse_initial_manifest()
> -        rpm_pre_process_cmds =3D self.d.getVar('RPM_PREPROCESS_COMMANDS'=
, True)
> -        rpm_post_process_cmds =3D self.d.getVar('RPM_POSTPROCESS_COMMAND=
S', True)
> +        rpm_pre_process_cmds =3D self.d.getVar('RPM_PREPROCESS_COMMANDS')
> +        rpm_post_process_cmds =3D self.d.getVar('RPM_POSTPROCESS_COMMAND=
S')
> =20
>          # update PM index files
>          self.pm.write_index()
> @@ -600,7 +600,7 @@ class DpkgOpkgRootfs(Rootfs):
>          pkg_list =3D []
> =20
>          pkgs =3D None
> -        if not self.d.getVar('PACKAGE_INSTALL', True).strip():
> +        if not self.d.getVar('PACKAGE_INSTALL').strip():
>              bb.note("Building empty image")
>          else:
>              pkgs =3D self._get_pkgs_postinsts(status_file)
> @@ -636,17 +636,17 @@ class DpkgRootfs(DpkgOpkgRootfs):
>          ]
> =20
>          bb.utils.remove(self.image_rootfs, True)
> -        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), Tru=
e)
> +        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
>          self.manifest =3D DpkgManifest(d, manifest_dir)
> -        self.pm =3D DpkgPM(d, d.getVar('IMAGE_ROOTFS', True),
> -                         d.getVar('PACKAGE_ARCHS', True),
> -                         d.getVar('DPKG_ARCH', True))
> +        self.pm =3D DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
> +                         d.getVar('PACKAGE_ARCHS'),
> +                         d.getVar('DPKG_ARCH'))
> =20
> =20
>      def _create(self):
>          pkgs_to_install =3D self.manifest.parse_initial_manifest()
> -        deb_pre_process_cmds =3D self.d.getVar('DEB_PREPROCESS_COMMANDS'=
, True)
> -        deb_post_process_cmds =3D self.d.getVar('DEB_POSTPROCESS_COMMAND=
S', True)
> +        deb_pre_process_cmds =3D self.d.getVar('DEB_PREPROCESS_COMMANDS')
> +        deb_post_process_cmds =3D self.d.getVar('DEB_POSTPROCESS_COMMAND=
S')
> =20
>          alt_dir =3D self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternat=
ives")
>          bb.utils.mkdirhier(alt_dir)
> @@ -724,10 +724,10 @@ class OpkgRootfs(DpkgOpkgRootfs):
>          self.log_check_regex =3D '(exit 1|Collected errors)'
> =20
>          self.manifest =3D OpkgManifest(d, manifest_dir)
> -        self.opkg_conf =3D self.d.getVar("IPKGCONF_TARGET", True)
> -        self.pkg_archs =3D self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", T=
rue)
> +        self.opkg_conf =3D self.d.getVar("IPKGCONF_TARGET")
> +        self.pkg_archs =3D self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
> =20
> -        self.inc_opkg_image_gen =3D self.d.getVar('INC_IPK_IMAGE_GEN', T=
rue) or ""
> +        self.inc_opkg_image_gen =3D self.d.getVar('INC_IPK_IMAGE_GEN') o=
r ""
>          if self._remove_old_rootfs():
>              bb.utils.remove(self.image_rootfs, True)
>              self.pm =3D OpkgPM(d,
> @@ -741,7 +741,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
>                               self.pkg_archs)
>              self.pm.recover_packaging_data()
> =20
> -        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), Tru=
e)
> +        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
> =20
>      def _prelink_file(self, root_dir, filename):
>          bb.note('prelink %s in %s' % (filename, root_dir))
> @@ -796,7 +796,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
>      """
>      def _multilib_sanity_test(self, dirs):
> =20
> -        allow_replace =3D self.d.getVar("MULTILIBRE_ALLOW_REP", True)
> +        allow_replace =3D self.d.getVar("MULTILIBRE_ALLOW_REP")
>          if allow_replace is None:
>              allow_replace =3D ""
> =20
> @@ -828,12 +828,12 @@ class OpkgRootfs(DpkgOpkgRootfs):
>                          files[key] =3D item
> =20
>      def _multilib_test_install(self, pkgs):
> -        ml_temp =3D self.d.getVar("MULTILIB_TEMP_ROOTFS", True)
> +        ml_temp =3D self.d.getVar("MULTILIB_TEMP_ROOTFS")
>          bb.utils.mkdirhier(ml_temp)
> =20
>          dirs =3D [self.image_rootfs]
> =20
> -        for variant in self.d.getVar("MULTILIB_VARIANTS", True).split():
> +        for variant in self.d.getVar("MULTILIB_VARIANTS").split():
>              ml_target_rootfs =3D os.path.join(ml_temp, variant)
> =20
>              bb.utils.remove(ml_target_rootfs, True)
> @@ -893,9 +893,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
>              old_vars_list =3D open(vars_list_file, 'r+').read()
> =20
>          new_vars_list =3D '%s:%s:%s\n' % \
> -                ((self.d.getVar('BAD_RECOMMENDATIONS', True) or '').stri=
p(),
> -                 (self.d.getVar('NO_RECOMMENDATIONS', True) or '').strip=
(),
> -                 (self.d.getVar('PACKAGE_EXCLUDE', True) or '').strip())
> +                ((self.d.getVar('BAD_RECOMMENDATIONS') or '').strip(),
> +                 (self.d.getVar('NO_RECOMMENDATIONS') or '').strip(),
> +                 (self.d.getVar('PACKAGE_EXCLUDE') or '').strip())
>          open(vars_list_file, 'w+').write(new_vars_list)
> =20
>          if old_vars_list !=3D new_vars_list:
> @@ -905,11 +905,11 @@ class OpkgRootfs(DpkgOpkgRootfs):
> =20
>      def _create(self):
>          pkgs_to_install =3D self.manifest.parse_initial_manifest()
> -        opkg_pre_process_cmds =3D self.d.getVar('OPKG_PREPROCESS_COMMAND=
S', True)
> -        opkg_post_process_cmds =3D self.d.getVar('OPKG_POSTPROCESS_COMMA=
NDS', True)
> +        opkg_pre_process_cmds =3D self.d.getVar('OPKG_PREPROCESS_COMMAND=
S')
> +        opkg_post_process_cmds =3D self.d.getVar('OPKG_POSTPROCESS_COMMA=
NDS')
> =20
>          # update PM index files, unless users provide their own feeds
> -        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") !=3D "=
1":
> +        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") !=3D "1":
>              self.pm.write_index()
> =20
>          execute_pre_post_process(self.d, opkg_pre_process_cmds)
> @@ -967,7 +967,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
> =20
>      def _get_delayed_postinsts(self):
>          status_file =3D os.path.join(self.image_rootfs,
> -                                   self.d.getVar('OPKGLIBDIR', True).str=
ip('/'),
> +                                   self.d.getVar('OPKGLIBDIR').strip('/'=
),
>                                     "opkg", "status")
>          return self._get_delayed_postinsts_common(status_file)
> =20
> @@ -992,14 +992,14 @@ def get_class_for_type(imgtype):
>              "deb": DpkgRootfs}[imgtype]
> =20
>  def variable_depends(d, manifest_dir=3DNone):
> -    img_type =3D d.getVar('IMAGE_PKGTYPE', True)
> +    img_type =3D d.getVar('IMAGE_PKGTYPE')
>      cls =3D get_class_for_type(img_type)
>      return cls._depends_list()
> =20
>  def create_rootfs(d, manifest_dir=3DNone, progress_reporter=3DNone):
>      env_bkp =3D os.environ.copy()
> =20
> -    img_type =3D d.getVar('IMAGE_PKGTYPE', True)
> +    img_type =3D d.getVar('IMAGE_PKGTYPE')
>      if img_type =3D=3D "rpm":
>          RpmRootfs(d, manifest_dir, progress_reporter).create()
>      elif img_type =3D=3D "ipk":
> @@ -1013,13 +1013,13 @@ def create_rootfs(d, manifest_dir=3DNone, progres=
s_reporter=3DNone):
> =20
>  def image_list_installed_packages(d, rootfs_dir=3DNone):
>      if not rootfs_dir:
> -        rootfs_dir =3D d.getVar('IMAGE_ROOTFS', True)
> +        rootfs_dir =3D d.getVar('IMAGE_ROOTFS')
> =20
> -    img_type =3D d.getVar('IMAGE_PKGTYPE', True)
> +    img_type =3D d.getVar('IMAGE_PKGTYPE')
>      if img_type =3D=3D "rpm":
>          return RpmPkgsList(d, rootfs_dir).list_pkgs()
>      elif img_type =3D=3D "ipk":
> -        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET", T=
rue)).list_pkgs()
> +        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET")).=
list_pkgs()
>      elif img_type =3D=3D "deb":
>          return DpkgPkgsList(d, rootfs_dir).list_pkgs()
> =20
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index c74525f..fef02d0 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -11,16 +11,16 @@ import traceback
>  class Sdk(object, metaclass=3DABCMeta):
>      def __init__(self, d, manifest_dir):
>          self.d =3D d
> -        self.sdk_output =3D self.d.getVar('SDK_OUTPUT', True)
> -        self.sdk_native_path =3D self.d.getVar('SDKPATHNATIVE', True).st=
rip('/')
> -        self.target_path =3D self.d.getVar('SDKTARGETSYSROOT', True).str=
ip('/')
> -        self.sysconfdir =3D self.d.getVar('sysconfdir', True).strip('/')
> +        self.sdk_output =3D self.d.getVar('SDK_OUTPUT')
> +        self.sdk_native_path =3D self.d.getVar('SDKPATHNATIVE').strip('/=
')
> +        self.target_path =3D self.d.getVar('SDKTARGETSYSROOT').strip('/')
> +        self.sysconfdir =3D self.d.getVar('sysconfdir').strip('/')
> =20
>          self.sdk_target_sysroot =3D os.path.join(self.sdk_output, self.t=
arget_path)
>          self.sdk_host_sysroot =3D self.sdk_output
> =20
>          if manifest_dir is None:
> -            self.manifest_dir =3D self.d.getVar("SDK_DIR", True)
> +            self.manifest_dir =3D self.d.getVar("SDK_DIR")
>          else:
>              self.manifest_dir =3D manifest_dir
> =20
> @@ -40,12 +40,12 @@ class Sdk(object, metaclass=3DABCMeta):
> =20
>          # Don't ship any libGL in the SDK
>          self.remove(os.path.join(self.sdk_output, self.sdk_native_path,
> -                         self.d.getVar('libdir_nativesdk', True).strip('=
/'),
> +                         self.d.getVar('libdir_nativesdk').strip('/'),
>                           "libGL*"))
> =20
>          # Fix or remove broken .la files
>          self.remove(os.path.join(self.sdk_output, self.sdk_native_path,
> -                         self.d.getVar('libdir_nativesdk', True).strip('=
/'),
> +                         self.d.getVar('libdir_nativesdk').strip('/'),
>                           "*.la"))
> =20
>          # Link the ld.so.cache file into the hosts filesystem
> @@ -54,7 +54,7 @@ class Sdk(object, metaclass=3DABCMeta):
>          self.mkdirhier(os.path.dirname(link_name))
>          os.symlink("/etc/ld.so.cache", link_name)
> =20
> -        execute_pre_post_process(self.d, self.d.getVar('SDK_POSTPROCESS_=
COMMAND', True))
> +        execute_pre_post_process(self.d, self.d.getVar('SDK_POSTPROCESS_=
COMMAND'))
> =20
>      def movefile(self, sourcefile, destdir):
>          try:
> @@ -102,7 +102,7 @@ class RpmSdk(Sdk):
> =20
>          self.target_pm =3D RpmPM(d,
>                                 self.sdk_target_sysroot,
> -                               self.d.getVar('TARGET_VENDOR', True),
> +                               self.d.getVar('TARGET_VENDOR'),
>                                 'target',
>                                 target_providename
>                                 )
> @@ -118,7 +118,7 @@ class RpmSdk(Sdk):
> =20
>          self.host_pm =3D RpmPM(d,
>                               self.sdk_host_sysroot,
> -                             self.d.getVar('SDK_VENDOR', True),
> +                             self.d.getVar('SDK_VENDOR'),
>                               'host',
>                               sdk_providename,
>                               "SDK_PACKAGE_ARCHS",
> @@ -149,9 +149,9 @@ class RpmSdk(Sdk):
>          bb.note("Installing TARGET packages")
>          self._populate_sysroot(self.target_pm, self.target_manifest)
> =20
> -        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INS=
TALL_COMPLEMENTARY', True))
> +        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INS=
TALL_COMPLEMENTARY'))
> =20
> -        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_TARGET_COMMAND", True))
> +        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_TARGET_COMMAND"))
> =20
>          if not bb.utils.contains("SDKIMAGE_FEATURES", "package-managemen=
t", True, False, self.d):
>              self.target_pm.remove_packaging_data()
> @@ -159,7 +159,7 @@ class RpmSdk(Sdk):
>          bb.note("Installing NATIVESDK packages")
>          self._populate_sysroot(self.host_pm, self.host_manifest)
> =20
> -        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_HOST_COMMAND", True))
> +        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_HOST_COMMAND"))
> =20
>          if not bb.utils.contains("SDKIMAGE_FEATURES", "package-managemen=
t", True, False, self.d):
>              self.host_pm.remove_packaging_data()
> @@ -167,7 +167,7 @@ class RpmSdk(Sdk):
>          # Move host RPM library data
>          native_rpm_state_dir =3D os.path.join(self.sdk_output,
>                                              self.sdk_native_path,
> -                                            self.d.getVar('localstatedir=
_nativesdk', True).strip('/'),
> +                                            self.d.getVar('localstatedir=
_nativesdk').strip('/'),
>                                              "lib",
>                                              "rpm"
>                                              )
> @@ -197,8 +197,8 @@ class OpkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=3DNone):
>          super(OpkgSdk, self).__init__(d, manifest_dir)
> =20
> -        self.target_conf =3D self.d.getVar("IPKGCONF_TARGET", True)
> -        self.host_conf =3D self.d.getVar("IPKGCONF_SDK", True)
> +        self.target_conf =3D self.d.getVar("IPKGCONF_TARGET")
> +        self.host_conf =3D self.d.getVar("IPKGCONF_SDK")
> =20
>          self.target_manifest =3D OpkgManifest(d, self.manifest_dir,
>                                              Manifest.MANIFEST_TYPE_SDK_T=
ARGET)
> @@ -206,15 +206,15 @@ class OpkgSdk(Sdk):
>                                            Manifest.MANIFEST_TYPE_SDK_HOS=
T)
> =20
>          self.target_pm =3D OpkgPM(d, self.sdk_target_sysroot, self.targe=
t_conf,
> -                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCH=
S", True))
> +                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCH=
S"))
> =20
>          self.host_pm =3D OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
> -                              self.d.getVar("SDK_PACKAGE_ARCHS", True))
> +                              self.d.getVar("SDK_PACKAGE_ARCHS"))
> =20
>      def _populate_sysroot(self, pm, manifest):
>          pkgs_to_install =3D manifest.parse_initial_manifest()
> =20
> -        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") !=3D "=
1":
> +        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") !=3D "1":
>              pm.write_index()
> =20
>          pm.update()
> @@ -228,9 +228,9 @@ class OpkgSdk(Sdk):
>          bb.note("Installing TARGET packages")
>          self._populate_sysroot(self.target_pm, self.target_manifest)
> =20
> -        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INS=
TALL_COMPLEMENTARY', True))
> +        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INS=
TALL_COMPLEMENTARY'))
> =20
> -        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_TARGET_COMMAND", True))
> +        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_TARGET_COMMAND"))
> =20
>          if not bb.utils.contains("SDKIMAGE_FEATURES", "package-managemen=
t", True, False, self.d):
>              self.target_pm.remove_packaging_data()
> @@ -238,7 +238,7 @@ class OpkgSdk(Sdk):
>          bb.note("Installing NATIVESDK packages")
>          self._populate_sysroot(self.host_pm, self.host_manifest)
> =20
> -        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_HOST_COMMAND", True))
> +        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_HOST_COMMAND"))
> =20
>          if not bb.utils.contains("SDKIMAGE_FEATURES", "package-managemen=
t", True, False, self.d):
>              self.host_pm.remove_packaging_data()
> @@ -257,7 +257,7 @@ class OpkgSdk(Sdk):
>                                os.path.basename(self.host_conf)), 0o644)
> =20
>          native_opkg_state_dir =3D os.path.join(self.sdk_output, self.sdk=
_native_path,
> -                                             self.d.getVar('localstatedi=
r_nativesdk', True).strip('/'),
> +                                             self.d.getVar('localstatedi=
r_nativesdk').strip('/'),
>                                               "lib", "opkg")
>          self.mkdirhier(native_opkg_state_dir)
>          for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "=
opkg", "*")):
> @@ -270,8 +270,8 @@ class DpkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=3DNone):
>          super(DpkgSdk, self).__init__(d, manifest_dir)
> =20
> -        self.target_conf_dir =3D os.path.join(self.d.getVar("APTCONF_TAR=
GET", True), "apt")
> -        self.host_conf_dir =3D os.path.join(self.d.getVar("APTCONF_TARGE=
T", True), "apt-sdk")
> +        self.target_conf_dir =3D os.path.join(self.d.getVar("APTCONF_TAR=
GET"), "apt")
> +        self.host_conf_dir =3D os.path.join(self.d.getVar("APTCONF_TARGE=
T"), "apt-sdk")
> =20
>          self.target_manifest =3D DpkgManifest(d, self.manifest_dir,
>                                              Manifest.MANIFEST_TYPE_SDK_T=
ARGET)
> @@ -279,17 +279,17 @@ class DpkgSdk(Sdk):
>                                            Manifest.MANIFEST_TYPE_SDK_HOS=
T)
> =20
>          self.target_pm =3D DpkgPM(d, self.sdk_target_sysroot,
> -                                self.d.getVar("PACKAGE_ARCHS", True),
> -                                self.d.getVar("DPKG_ARCH", True),
> +                                self.d.getVar("PACKAGE_ARCHS"),
> +                                self.d.getVar("DPKG_ARCH"),
>                                  self.target_conf_dir)
> =20
>          self.host_pm =3D DpkgPM(d, self.sdk_host_sysroot,
> -                              self.d.getVar("SDK_PACKAGE_ARCHS", True),
> -                              self.d.getVar("DEB_SDK_ARCH", True),
> +                              self.d.getVar("SDK_PACKAGE_ARCHS"),
> +                              self.d.getVar("DEB_SDK_ARCH"),
>                                self.host_conf_dir)
> =20
>      def _copy_apt_dir_to(self, dst_dir):
> -        staging_etcdir_native =3D self.d.getVar("STAGING_ETCDIR_NATIVE",=
 True)
> +        staging_etcdir_native =3D self.d.getVar("STAGING_ETCDIR_NATIVE")
> =20
>          self.remove(dst_dir, True)
> =20
> @@ -310,9 +310,9 @@ class DpkgSdk(Sdk):
>          bb.note("Installing TARGET packages")
>          self._populate_sysroot(self.target_pm, self.target_manifest)
> =20
> -        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INS=
TALL_COMPLEMENTARY', True))
> +        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INS=
TALL_COMPLEMENTARY'))
> =20
> -        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_TARGET_COMMAND", True))
> +        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_TARGET_COMMAND"))
> =20
>          self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc=
", "apt"))
> =20
> @@ -322,7 +322,7 @@ class DpkgSdk(Sdk):
>          bb.note("Installing NATIVESDK packages")
>          self._populate_sysroot(self.host_pm, self.host_manifest)
> =20
> -        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_HOST_COMMAND", True))
> +        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POS=
T_HOST_COMMAND"))
> =20
>          self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_nat=
ive_path,
>                                             "etc", "apt"))
> @@ -341,26 +341,26 @@ class DpkgSdk(Sdk):
> =20
>  def sdk_list_installed_packages(d, target, rootfs_dir=3DNone):
>      if rootfs_dir is None:
> -        sdk_output =3D d.getVar('SDK_OUTPUT', True)
> -        target_path =3D d.getVar('SDKTARGETSYSROOT', True).strip('/')
> +        sdk_output =3D d.getVar('SDK_OUTPUT')
> +        target_path =3D d.getVar('SDKTARGETSYSROOT').strip('/')
> =20
>          rootfs_dir =3D [sdk_output, os.path.join(sdk_output, target_path=
)][target is True]
> =20
> -    img_type =3D d.getVar('IMAGE_PKGTYPE', True)
> +    img_type =3D d.getVar('IMAGE_PKGTYPE')
>      if img_type =3D=3D "rpm":
>          arch_var =3D ["SDK_PACKAGE_ARCHS", None][target is True]
>          os_var =3D ["SDK_OS", None][target is True]
>          return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list_pkgs()
>      elif img_type =3D=3D "ipk":
>          conf_file_var =3D ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is =
True]
> -        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var, True)=
).list_pkgs()
> +        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list=
_pkgs()
>      elif img_type =3D=3D "deb":
>          return DpkgPkgsList(d, rootfs_dir).list_pkgs()
> =20
>  def populate_sdk(d, manifest_dir=3DNone):
>      env_bkp =3D os.environ.copy()
> =20
> -    img_type =3D d.getVar('IMAGE_PKGTYPE', True)
> +    img_type =3D d.getVar('IMAGE_PKGTYPE')
>      if img_type =3D=3D "rpm":
>          RpmSdk(d, manifest_dir).populate()
>      elif img_type =3D=3D "ipk":
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 8224e3a..e053c37 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -63,10 +63,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task,=
 dep, depname, dataCache):
> =20
>  def sstate_lockedsigs(d):
>      sigs =3D {}
> -    types =3D (d.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
> +    types =3D (d.getVar("SIGGEN_LOCKEDSIGS_TYPES") or "").split()
>      for t in types:
>          siggen_lockedsigs_var =3D "SIGGEN_LOCKEDSIGS_%s" % t
> -        lockedsigs =3D (d.getVar(siggen_lockedsigs_var, True) or "").spl=
it()
> +        lockedsigs =3D (d.getVar(siggen_lockedsigs_var) or "").split()
>          for ls in lockedsigs:
>              pn, task, h =3D ls.split(":", 2)
>              if pn not in sigs:
> @@ -77,8 +77,8 @@ def sstate_lockedsigs(d):
>  class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
>      name =3D "OEBasic"
>      def init_rundepcheck(self, data):
> -        self.abisaferecipes =3D (data.getVar("SIGGEN_EXCLUDERECIPES_ABIS=
AFE", True) or "").split()
> -        self.saferecipedeps =3D (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE=
_DEPS", True) or "").split()
> +        self.abisaferecipes =3D (data.getVar("SIGGEN_EXCLUDERECIPES_ABIS=
AFE") or "").split()
> +        self.saferecipedeps =3D (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE=
_DEPS") or "").split()
>          pass
>      def rundep_check(self, fn, recipename, task, dep, depname, dataCache=
 =3D None):
>          return sstate_rundepfilter(self, fn, recipename, task, dep, depn=
ame, dataCache)
> @@ -86,15 +86,15 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGe=
neratorBasic):
>  class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHas=
h):
>      name =3D "OEBasicHash"
>      def init_rundepcheck(self, data):
> -        self.abisaferecipes =3D (data.getVar("SIGGEN_EXCLUDERECIPES_ABIS=
AFE", True) or "").split()
> -        self.saferecipedeps =3D (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE=
_DEPS", True) or "").split()
> +        self.abisaferecipes =3D (data.getVar("SIGGEN_EXCLUDERECIPES_ABIS=
AFE") or "").split()
> +        self.saferecipedeps =3D (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE=
_DEPS") or "").split()
>          self.lockedsigs =3D sstate_lockedsigs(data)
>          self.lockedhashes =3D {}
>          self.lockedpnmap =3D {}
>          self.lockedhashfn =3D {}
> -        self.machine =3D data.getVar("MACHINE", True)
> +        self.machine =3D data.getVar("MACHINE")
>          self.mismatch_msgs =3D []
> -        self.unlockedrecipes =3D (data.getVar("SIGGEN_UNLOCKED_RECIPES",=
 True) or
> +        self.unlockedrecipes =3D (data.getVar("SIGGEN_UNLOCKED_RECIPES")=
 or
>                                  "").split()
>          self.unlockedrecipes =3D { k: "" for k in self.unlockedrecipes }
>          pass
> @@ -224,13 +224,13 @@ class SignatureGeneratorOEBasicHash(bb.siggen.Signa=
tureGeneratorBasicHash):
>                          sstate_missing_msgs.append("Locked sig is set fo=
r %s:%s (%s) yet not in sstate cache?"
>                                                 % (pn, sq_task[task], sq_=
hash[task]))
> =20
> -        checklevel =3D d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK", True)
> +        checklevel =3D d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK")
>          if checklevel =3D=3D 'warn':
>              warn_msgs +=3D self.mismatch_msgs
>          elif checklevel =3D=3D 'error':
>              error_msgs +=3D self.mismatch_msgs
> =20
> -        checklevel =3D d.getVar("SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK",=
 True)
> +        checklevel =3D d.getVar("SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK")
>          if checklevel =3D=3D 'warn':
>              warn_msgs +=3D sstate_missing_msgs
>          elif checklevel =3D=3D 'error':
> @@ -274,7 +274,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>      localdata.setVar('PV', '*')
>      localdata.setVar('PR', '*')
>      localdata.setVar('EXTENDPE', '')
> -    stamp =3D localdata.getVar('STAMP', True)
> +    stamp =3D localdata.getVar('STAMP')
>      if pn.startswith("gcc-source"):
>          # gcc-source shared workdir is a special case :(
>          stamp =3D localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-=
${PR}")
> @@ -309,18 +309,18 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>              localdata.setVar('PV', '*')
>              localdata.setVar('PR', '*')
>              localdata.setVar('BB_TASKHASH', hashval)
> -            swspec =3D localdata.getVar('SSTATE_SWSPEC', True)
> +            swspec =3D localdata.getVar('SSTATE_SWSPEC')
>              if taskname in ['do_fetch', 'do_unpack', 'do_patch', 'do_pop=
ulate_lic', 'do_preconfigure'] and swspec:
>                  localdata.setVar('SSTATE_PKGSPEC', '${SSTATE_SWSPEC}')
>              elif pn.endswith('-native') or "-cross-" in pn or "-crosssdk=
-" in pn:
>                  localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}=
/")
>              sstatename =3D taskname[3:]
> -            filespec =3D '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_P=
KG', True), sstatename)
> +            filespec =3D '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_P=
KG'), sstatename)
> =20
>              if hashval !=3D '*':
> -                sstatedir =3D "%s/%s" % (d.getVar('SSTATE_DIR', True), h=
ashval[:2])
> +                sstatedir =3D "%s/%s" % (d.getVar('SSTATE_DIR'), hashval=
[:2])
>              else:
> -                sstatedir =3D d.getVar('SSTATE_DIR', True)
> +                sstatedir =3D d.getVar('SSTATE_DIR')
> =20
>              for root, dirs, files in os.walk(sstatedir):
>                  for fn in files:
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 38e66ce..c7f26c4 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -196,7 +196,7 @@ class Custom(Terminal):
>      priority =3D 3
> =20
>      def __init__(self, sh_cmd, title=3DNone, env=3DNone, d=3DNone):
> -        self.command =3D d and d.getVar('OE_TERMINAL_CUSTOMCMD', True)
> +        self.command =3D d and d.getVar('OE_TERMINAL_CUSTOMCMD')
>          if self.command:
>              if not '{command}' in self.command:
>                  self.command +=3D ' {command}'
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index d6545b1..c9df220 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -23,13 +23,13 @@ def ifelse(condition, iftrue =3D True, iffalse =3D Fa=
lse):
>          return iffalse
> =20
>  def conditional(variable, checkvalue, truevalue, falsevalue, d):
> -    if d.getVar(variable, True) =3D=3D checkvalue:
> +    if d.getVar(variable) =3D=3D checkvalue:
>          return truevalue
>      else:
>          return falsevalue
> =20
>  def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
> -    if float(d.getVar(variable, True)) <=3D float(checkvalue):
> +    if float(d.getVar(variable)) <=3D float(checkvalue):
>          return truevalue
>      else:
>          return falsevalue
> @@ -42,8 +42,8 @@ def version_less_or_equal(variable, checkvalue, trueval=
ue, falsevalue, d):
>          return falsevalue
> =20
>  def both_contain(variable1, variable2, checkvalue, d):
> -    val1 =3D d.getVar(variable1, True)
> -    val2 =3D d.getVar(variable2, True)
> +    val1 =3D d.getVar(variable1)
> +    val2 =3D d.getVar(variable2)
>      val1 =3D set(val1.split())
>      val2 =3D set(val2.split())
>      if isinstance(checkvalue, str):
> @@ -66,8 +66,8 @@ def set_intersect(variable1, variable2, d):
>      s3 =3D set_intersect(s1, s2)
>      =3D> s3 =3D "b c"
>      """
> -    val1 =3D set(d.getVar(variable1, True).split())
> -    val2 =3D set(d.getVar(variable2, True).split())
> +    val1 =3D set(d.getVar(variable1).split())
> +    val2 =3D set(d.getVar(variable2).split())
>      return " ".join(val1 & val2)
> =20
>  def prune_suffix(var, suffixes, d):
> @@ -77,7 +77,7 @@ def prune_suffix(var, suffixes, d):
>          if var.endswith(suffix):
>              var =3D var.replace(suffix, "")
> =20
> -    prefix =3D d.getVar("MLPREFIX", True)
> +    prefix =3D d.getVar("MLPREFIX")
>      if prefix and var.startswith(prefix):
>          var =3D var.replace(prefix, "")
> =20
> @@ -115,9 +115,9 @@ def features_backfill(var,d):
>      # disturbing distributions that have already set DISTRO_FEATURES.
>      # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL=
 should
>      # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
> -    features =3D (d.getVar(var, True) or "").split()
> -    backfill =3D (d.getVar(var+"_BACKFILL", True) or "").split()
> -    considered =3D (d.getVar(var+"_BACKFILL_CONSIDERED", True) or "").sp=
lit()
> +    features =3D (d.getVar(var) or "").split()
> +    backfill =3D (d.getVar(var+"_BACKFILL") or "").split()
> +    considered =3D (d.getVar(var+"_BACKFILL_CONSIDERED") or "").split()
> =20
>      addfeatures =3D []
>      for feature in backfill:
> @@ -133,12 +133,12 @@ def packages_filter_out_system(d):
>      Return a list of packages from PACKAGES with the "system" packages s=
uch as
>      PN-dbg PN-doc PN-locale-eb-gb removed.
>      """
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      blacklist =3D [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc'=
, '-locale', '-staticdev')]
>      localepkg =3D pn + "-locale-"
>      pkgs =3D []
> =20
> -    for pkg in d.getVar('PACKAGES', True).split():
> +    for pkg in d.getVar('PACKAGES').split():
>          if pkg not in blacklist and localepkg not in pkg:
>              pkgs.append(pkg)
>      return pkgs
> @@ -302,8 +302,8 @@ def write_ld_so_conf(d):
>          bb.utils.remove(ldsoconf)
>      bb.utils.mkdirhier(os.path.dirname(ldsoconf))
>      with open(ldsoconf, "w") as f:
> -        f.write(d.getVar("base_libdir", True) + '\n')
> -        f.write(d.getVar("libdir", True) + '\n')
> +        f.write(d.getVar("base_libdir") + '\n')
> +        f.write(d.getVar("libdir") + '\n')
> =20
>  class ImageQAFailed(bb.build.FuncFailed):
>      def __init__(self, description, name=3DNone, logfile=3DNone):
> diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/con=
trollers/masterimage.py
> index 9ce3bf8..d796fc3 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/masterimage.py
> @@ -32,14 +32,14 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Ba=
seTarget, metaclass=3DABCMeta
>          super(MasterImageHardwareTarget, self).__init__(d)
> =20
>          # target ip
> -        addr =3D d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please se=
t TEST_TARGET_IP with the IP address of the machine you want to run the tes=
ts on.')
> +        addr =3D d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST=
_TARGET_IP with the IP address of the machine you want to run the tests on.=
')
>          self.ip =3D addr.split(":")[0]
>          try:
>              self.port =3D addr.split(":")[1]
>          except IndexError:
>              self.port =3D None
>          bb.note("Target IP: %s" % self.ip)
> -        self.server_ip =3D d.getVar("TEST_SERVER_IP", True)
> +        self.server_ip =3D d.getVar("TEST_SERVER_IP")
>          if not self.server_ip:
>              try:
>                  self.server_ip =3D subprocess.check_output(['ip', 'route=
', 'get', self.ip ]).split("\n")[0].split()[-1]
> @@ -49,8 +49,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Base=
Target, metaclass=3DABCMeta
> =20
>          # test rootfs + kernel
>          self.image_fstype =3D self.get_image_fstype(d)
> -        self.rootfs =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),=
 d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
> -        self.kernel =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),=
 d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '=
=2Ebin')
> +        self.rootfs =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.get=
Var("IMAGE_LINK_NAME") + '.' + self.image_fstype)
> +        self.kernel =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.get=
Var("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
>          if not os.path.isfile(self.rootfs):
>              # we could've checked that IMAGE_FSTYPES contains tar.gz but=
 the config for running testimage might not be
>              # the same as the config with which the image was build, ie
> @@ -64,16 +64,16 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Ba=
seTarget, metaclass=3DABCMeta
>          # master ssh connection
>          self.master =3D None
>          # if the user knows what they are doing, then by all means...
> -        self.user_cmds =3D d.getVar("TEST_DEPLOY_CMDS", True)
> +        self.user_cmds =3D d.getVar("TEST_DEPLOY_CMDS")
>          self.deploy_cmds =3D None
> =20
>          # this is the name of the command that controls the power for a =
board
>          # e.g: TEST_POWERCONTROL_CMD =3D "/home/user/myscripts/powercont=
rol.py ${MACHINE} what-ever-other-args-the-script-wants"
>          # the command should take as the last argument "off" and "on" an=
d "cycle" (off, on)
> -        self.powercontrol_cmd =3D d.getVar("TEST_POWERCONTROL_CMD", True=
) or None
> +        self.powercontrol_cmd =3D d.getVar("TEST_POWERCONTROL_CMD") or N=
one
>          self.powercontrol_args =3D d.getVar("TEST_POWERCONTROL_EXTRA_ARG=
S", False) or ""
> =20
> -        self.serialcontrol_cmd =3D d.getVar("TEST_SERIALCONTROL_CMD", Tr=
ue) or None
> +        self.serialcontrol_cmd =3D d.getVar("TEST_SERIALCONTROL_CMD") or=
 None
>          self.serialcontrol_args =3D d.getVar("TEST_SERIALCONTROL_EXTRA_A=
RGS", False) or ""
> =20
>          self.origenv =3D os.environ
> @@ -82,7 +82,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Base=
Target, metaclass=3DABCMeta
>              # ssh + keys means we need the original user env
>              bborigenv =3D d.getVar("BB_ORIGENV", False) or {}
>              for key in bborigenv:
> -                val =3D bborigenv.getVar(key, True)
> +                val =3D bborigenv.getVar(key)
>                  if val is not None:
>                      self.origenv[key] =3D str(val)
> =20
> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> index 95d3bf7..d1aef96 100644
> --- a/meta/lib/oeqa/oetest.py
> +++ b/meta/lib/oeqa/oetest.py
> @@ -221,15 +221,15 @@ class TestContext(object):
>              path =3D [os.path.dirname(os.path.abspath(__file__))]
>              extrapath =3D ""
>          else:
> -            path =3D d.getVar("BBPATH", True).split(':')
> +            path =3D d.getVar("BBPATH").split(':')
>              extrapath =3D "lib/oeqa"
> =20
>          self.testslist =3D self._get_tests_list(path, extrapath)
>          self.testsrequired =3D self._get_test_suites_required()
> =20
>          self.filesdir =3D os.path.join(os.path.dirname(os.path.abspath(_=
_file__)), "runtime/files")
> -        self.imagefeatures =3D d.getVar("IMAGE_FEATURES", True).split()
> -        self.distrofeatures =3D d.getVar("DISTRO_FEATURES", True).split()
> +        self.imagefeatures =3D d.getVar("IMAGE_FEATURES").split()
> +        self.distrofeatures =3D d.getVar("DISTRO_FEATURES").split()
> =20
>      # get testcase list from specified file
>      # if path is a relative path, then relative to build/conf/
> @@ -406,9 +406,9 @@ class RuntimeTestContext(TestContext):
>          self.target =3D target
> =20
>          self.pkgmanifest =3D {}
> -        manifest =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
> -                d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
> -        nomanifest =3D d.getVar("IMAGE_NO_MANIFEST", True)
> +        manifest =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),
> +                d.getVar("IMAGE_LINK_NAME") + ".manifest")
> +        nomanifest =3D d.getVar("IMAGE_NO_MANIFEST")
>          if nomanifest is None or nomanifest !=3D "1":
>              try:
>                  with open(manifest) as f:
> @@ -424,19 +424,19 @@ class RuntimeTestContext(TestContext):
>      def _get_test_suites(self):
>          testsuites =3D []
> =20
> -        manifests =3D (self.d.getVar("TEST_SUITES_MANIFEST", True) or ''=
).split()
> +        manifests =3D (self.d.getVar("TEST_SUITES_MANIFEST") or '').spli=
t()
>          if manifests:
>              for manifest in manifests:
>                  testsuites.extend(self._read_testlist(manifest,
> -                                  self.d.getVar("TOPDIR", True)).split())
> +                                  self.d.getVar("TOPDIR")).split())
> =20
>          else:
> -            testsuites =3D self.d.getVar("TEST_SUITES", True).split()
> +            testsuites =3D self.d.getVar("TEST_SUITES").split()
> =20
>          return testsuites
> =20
>      def _get_test_suites_required(self):
> -        return [t for t in self.d.getVar("TEST_SUITES", True).split() if=
 t !=3D "auto"]
> +        return [t for t in self.d.getVar("TEST_SUITES").split() if t !=
=3D "auto"]
> =20
>      def loadTests(self):
>          super(RuntimeTestContext, self).loadTests()
> @@ -449,10 +449,10 @@ class RuntimeTestContext(TestContext):
>          """
> =20
>          modules =3D self.getTestModules()
> -        bbpaths =3D self.d.getVar("BBPATH", True).split(":")
> +        bbpaths =3D self.d.getVar("BBPATH").split(":")
> =20
> -        shutil.rmtree(self.d.getVar("TEST_EXTRACTED_DIR", True))
> -        shutil.rmtree(self.d.getVar("TEST_PACKAGED_DIR", True))
> +        shutil.rmtree(self.d.getVar("TEST_EXTRACTED_DIR"))
> +        shutil.rmtree(self.d.getVar("TEST_PACKAGED_DIR"))
>          for module in modules:
>              json_file =3D self._getJsonFile(module)
>              if json_file:
> @@ -466,8 +466,8 @@ class RuntimeTestContext(TestContext):
> =20
>          import oe.path
> =20
> -        extracted_path =3D self.d.getVar("TEST_EXTRACTED_DIR", True)
> -        packaged_path =3D self.d.getVar("TEST_PACKAGED_DIR", True)
> +        extracted_path =3D self.d.getVar("TEST_EXTRACTED_DIR")
> +        packaged_path =3D self.d.getVar("TEST_PACKAGED_DIR")
> =20
>          for key,value in needed_packages.items():
>              packages =3D ()
> @@ -548,7 +548,7 @@ class RuntimeTestContext(TestContext):
> =20
>          from oeqa.utils.package_manager import get_package_manager
> =20
> -        pkg_path =3D os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR", =
True), pkg)
> +        pkg_path =3D os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR"),=
 pkg)
>          pm =3D get_package_manager(self.d, pkg_path)
>          extract_dir =3D pm.extract(pkg)
>          shutil.rmtree(pkg_path)
> @@ -562,8 +562,8 @@ class RuntimeTestContext(TestContext):
> =20
>          from oeqa.utils.package_manager import get_package_manager
> =20
> -        pkg_path =3D os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR", =
True), pkg)
> -        dst_dir =3D self.d.getVar("TEST_PACKAGED_DIR", True)
> +        pkg_path =3D os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR"),=
 pkg)
> +        dst_dir =3D self.d.getVar("TEST_PACKAGED_DIR")
>          pm =3D get_package_manager(self.d, pkg_path)
>          pkg_info =3D pm.package_info(pkg)
>          file_path =3D pkg_info[pkg]["filepath"]
> @@ -611,7 +611,7 @@ class ImageTestContext(RuntimeTestContext):
>      def __init__(self, d, target, host_dumper):
>          super(ImageTestContext, self).__init__(d, target)
> =20
> -        self.tagexp =3D d.getVar("TEST_SUITES_TAGS", True)
> +        self.tagexp =3D d.getVar("TEST_SUITES_TAGS")
> =20
>          self.host_dumper =3D host_dumper
> =20
> @@ -629,7 +629,7 @@ class ImageTestContext(RuntimeTestContext):
>          Check if the test requires a package and Install/Unistall it in =
the DUT
>          """
> =20
> -        pkg_dir =3D self.d.getVar("TEST_EXTRACTED_DIR", True)
> +        pkg_dir =3D self.d.getVar("TEST_EXTRACTED_DIR")
>          super(ImageTestContext, self).install_uninstall_packages(test_id=
, pkg_dir, install)
> =20
>  class ExportTestContext(RuntimeTestContext):
> @@ -643,7 +643,7 @@ class ExportTestContext(RuntimeTestContext):
>          super(ExportTestContext, self).__init__(d, target, exported)
> =20
>          tag =3D parsedArgs.get("tag", None)
> -        self.tagexp =3D tag if tag !=3D None else d.getVar("TEST_SUITES_=
TAGS", True)
> +        self.tagexp =3D tag if tag !=3D None else d.getVar("TEST_SUITES_=
TAGS")
> =20
>          self.sigterm =3D None
> =20
> @@ -653,7 +653,7 @@ class ExportTestContext(RuntimeTestContext):
>          """
> =20
>          export_dir =3D os.path.dirname(os.path.dirname(os.path.realpath(=
__file__)))
> -        extracted_dir =3D self.d.getVar("TEST_EXPORT_EXTRACTED_DIR", Tru=
e)
> +        extracted_dir =3D self.d.getVar("TEST_EXPORT_EXTRACTED_DIR")
>          pkg_dir =3D os.path.join(export_dir, extracted_dir)
>          super(ExportTestContext, self).install_uninstall_packages(test_i=
d, pkg_dir, install)
> =20
> @@ -666,7 +666,7 @@ class SDKTestContext(TestContext):
>          self.tcname =3D tcname
> =20
>          if not hasattr(self, 'target_manifest'):
> -            self.target_manifest =3D d.getVar("SDK_TARGET_MANIFEST", Tru=
e)
> +            self.target_manifest =3D d.getVar("SDK_TARGET_MANIFEST")
>          try:
>              self.pkgmanifest =3D {}
>              with open(self.target_manifest) as f:
> @@ -677,7 +677,7 @@ class SDKTestContext(TestContext):
>              bb.fatal("No package manifest file found. Did you build the =
sdk image?\n%s" % e)
> =20
>          if not hasattr(self, 'host_manifest'):
> -            self.host_manifest =3D d.getVar("SDK_HOST_MANIFEST", True)
> +            self.host_manifest =3D d.getVar("SDK_HOST_MANIFEST")
>          try:
>              with open(self.host_manifest) as f:
>                  self.hostpkgmanifest =3D f.read()
> @@ -688,16 +688,16 @@ class SDKTestContext(TestContext):
>          return "sdk"
> =20
>      def _get_test_suites(self):
> -        return (self.d.getVar("TEST_SUITES_SDK", True) or "auto").split()
> +        return (self.d.getVar("TEST_SUITES_SDK") or "auto").split()
> =20
>      def _get_test_suites_required(self):
> -        return [t for t in (self.d.getVar("TEST_SUITES_SDK", True) or \
> +        return [t for t in (self.d.getVar("TEST_SUITES_SDK") or \
>                  "auto").split() if t !=3D "auto"]
> =20
>  class SDKExtTestContext(SDKTestContext):
>      def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
> -        self.target_manifest =3D d.getVar("SDK_EXT_TARGET_MANIFEST", Tru=
e)
> -        self.host_manifest =3D d.getVar("SDK_EXT_HOST_MANIFEST", True)
> +        self.target_manifest =3D d.getVar("SDK_EXT_TARGET_MANIFEST")
> +        self.host_manifest =3D d.getVar("SDK_EXT_HOST_MANIFEST")
>          if args:
>              self.cm =3D args[0] # Compatibility mode for run SDK tests
>          else:
> @@ -715,8 +715,8 @@ class SDKExtTestContext(SDKTestContext):
>              return "sdkext"
> =20
>      def _get_test_suites(self):
> -        return (self.d.getVar("TEST_SUITES_SDK_EXT", True) or "auto").sp=
lit()
> +        return (self.d.getVar("TEST_SUITES_SDK_EXT") or "auto").split()
> =20
>      def _get_test_suites_required(self):
> -        return [t for t in (self.d.getVar("TEST_SUITES_SDK_EXT", True) o=
r \
> +        return [t for t in (self.d.getVar("TEST_SUITES_SDK_EXT") or \
>                  "auto").split() if t !=3D "auto"]
> diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
> index 7e245c4..9cfea0f 100755
> --- a/meta/lib/oeqa/runexported.py
> +++ b/meta/lib/oeqa/runexported.py
> @@ -43,8 +43,8 @@ class FakeTarget(object):
>          self.ip =3D None
>          self.server_ip =3D None
>          self.datetime =3D time.strftime('%Y%m%d%H%M%S',time.gmtime())
> -        self.testdir =3D d.getVar("TEST_LOG_DIR", True)
> -        self.pn =3D d.getVar("PN", True)
> +        self.testdir =3D d.getVar("TEST_LOG_DIR")
> +        self.pn =3D d.getVar("PN")
> =20
>      def exportStart(self):
>          self.sshlog =3D os.path.join(self.testdir, "ssh_target_log.%s" %=
 self.datetime)
> @@ -130,8 +130,8 @@ def extract_sdk(d):
>      """
> =20
>      export_dir =3D os.path.dirname(os.path.realpath(__file__))
> -    tools_dir =3D d.getVar("TEST_EXPORT_SDK_DIR", True)
> -    tarball_name =3D "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME", True)
> +    tools_dir =3D d.getVar("TEST_EXPORT_SDK_DIR")
> +    tarball_name =3D "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME")
>      tarball_path =3D os.path.join(export_dir, tools_dir, tarball_name)
>      extract_path =3D os.path.join(export_dir, "sysroot")
>      if os.path.isfile(tarball_path):
> diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_pte=
st.py
> index 71324d3..cfb4041 100644
> --- a/meta/lib/oeqa/runtime/_ptest.py
> +++ b/meta/lib/oeqa/runtime/_ptest.py
> @@ -13,7 +13,7 @@ def setUpModule():
>          skipModule("Image doesn't have package management feature")
>      if not oeRuntimeTest.hasPackage("smartpm"):
>          skipModule("Image doesn't have smart installed")
> -    if "package_rpm" !=3D oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", T=
rue).split()[0]:
> +    if "package_rpm" !=3D oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").s=
plit()[0]:
>          skipModule("Rpm is not the primary package manager")
> =20
>  class PtestRunnerTest(oeRuntimeTest):
> @@ -57,7 +57,7 @@ class PtestRunnerTest(oeRuntimeTest):
>  #        (status, result) =3D oeRuntimeTest.tc.target.run('smart channel=
 --show | grep "\["', 0)
>  #        for x in result.split("\n"):
>  #            self.existingchannels.add(x)
> -        self.repo_server =3D HTTPService(oeRuntimeTest.tc.d.getVar('DEPL=
OY_DIR', True), oeRuntimeTest.tc.target.server_ip)
> +        self.repo_server =3D HTTPService(oeRuntimeTest.tc.d.getVar('DEPL=
OY_DIR'), oeRuntimeTest.tc.target.server_ip)
>          self.repo_server.start()
> =20
>      @classmethod
> @@ -70,23 +70,23 @@ class PtestRunnerTest(oeRuntimeTest):
>  #                oeRuntimeTest.tc.target.run('smart channel --remove '+x=
[1:-1]+' -y', 0)
> =20
>      def add_smart_channel(self):
> -        image_pkgtype =3D self.tc.d.getVar('IMAGE_PKGTYPE', True)
> +        image_pkgtype =3D self.tc.d.getVar('IMAGE_PKGTYPE')
>          deploy_url =3D 'http://%s:%s/%s' %(self.target.server_ip, self.r=
epo_server.port, image_pkgtype)
> -        pkgarchs =3D self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-"=
,"_").split()
> +        pkgarchs =3D self.tc.d.getVar('PACKAGE_ARCHS').replace("-","_").=
split()
>          for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, ima=
ge_pkgtype)):
>              if arch in pkgarchs:
>                  self.target.run('smart channel -y --add {a} type=3Drpm-m=
d baseurl=3D{u}/{a}'.format(a=3Darch, u=3Ddeploy_url), 0)
>          self.target.run('smart update', 0)
> =20
>      def install_complementary(self, globs=3DNone):
> -        installed_pkgs_file =3D os.path.join(oeRuntimeTest.tc.d.getVar('=
WORKDIR', True),
> +        installed_pkgs_file =3D os.path.join(oeRuntimeTest.tc.d.getVar('=
WORKDIR'),
>                                             "installed_pkgs.txt")
> -        self.pkgs_list =3D RpmPkgsList(oeRuntimeTest.tc.d, oeRuntimeTest=
=2Etc.d.getVar('IMAGE_ROOTFS', True), oeRuntimeTest.tc.d.getVar('arch_var',=
 True), oeRuntimeTest.tc.d.getVar('os_var', True))
> +        self.pkgs_list =3D RpmPkgsList(oeRuntimeTest.tc.d, oeRuntimeTest=
=2Etc.d.getVar('IMAGE_ROOTFS'), oeRuntimeTest.tc.d.getVar('arch_var'), oeRu=
ntimeTest.tc.d.getVar('os_var'))
>          with open(installed_pkgs_file, "w+") as installed_pkgs:
>              installed_pkgs.write(self.pkgs_list.list("arch"))
> =20
>          cmd =3D [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
> -               "-p", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR', True), "gl=
ob", installed_pkgs_file,
> +               "-p", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR'), "glob", i=
nstalled_pkgs_file,
>                 globs]
>          try:
>              bb.note("Installing complementary packages ...")
> @@ -99,7 +99,7 @@ class PtestRunnerTest(oeRuntimeTest):
>          return complementary_pkgs.split()
> =20
>      def setUpLocal(self):
> -        self.ptest_log =3D os.path.join(oeRuntimeTest.tc.d.getVar("TEST_=
LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME', True=
))
> +        self.ptest_log =3D os.path.join(oeRuntimeTest.tc.d.getVar("TEST_=
LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME'))
> =20
>      @skipUnlessPassed('test_ssh')
>      def test_ptestrunner(self):
> diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
> index 447987e..6f3516a 100644
> --- a/meta/lib/oeqa/runtime/date.py
> +++ b/meta/lib/oeqa/runtime/date.py
> @@ -5,11 +5,11 @@ import re
>  class DateTest(oeRuntimeTest):
> =20
>      def setUpLocal(self):
> -        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", Tru=
e) =3D=3D "systemd":
> +        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager") =3D=
=3D "systemd":
>              self.target.run('systemctl stop systemd-timesyncd')
> =20
>      def tearDownLocal(self):
> -        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", Tru=
e) =3D=3D "systemd":
> +        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager") =3D=
=3D "systemd":
>              self.target.run('systemctl start systemd-timesyncd')
> =20
>      @testcase(211)
> diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/mu=
ltilib.py
> index 593d385..5cce24f 100644
> --- a/meta/lib/oeqa/runtime/multilib.py
> +++ b/meta/lib/oeqa/runtime/multilib.py
> @@ -3,7 +3,7 @@ from oeqa.oetest import oeRuntimeTest, skipModule
>  from oeqa.utils.decorators import *
> =20
>  def setUpModule():
> -    multilibs =3D oeRuntimeTest.tc.d.getVar("MULTILIBS", True) or ""
> +    multilibs =3D oeRuntimeTest.tc.d.getVar("MULTILIBS") or ""
>      if "multilib:lib32" not in multilibs:
>          skipModule("this isn't a multilib:lib32 image")
> =20
> diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/p=
arselogs.py
> index 58f62da..7e2738b 100644
> --- a/meta/lib/oeqa/runtime/parselogs.py
> +++ b/meta/lib/oeqa/runtime/parselogs.py
> @@ -179,10 +179,10 @@ class ParseLogsTest(oeRuntimeTest):
>                  self.ignore_errors[machine] =3D self.ignore_errors[machi=
ne] + video_related
> =20
>      def getMachine(self):
> -        return oeRuntimeTest.tc.d.getVar("MACHINE", True)
> +        return oeRuntimeTest.tc.d.getVar("MACHINE")
> =20
>      def getWorkdir(self):
> -        return oeRuntimeTest.tc.d.getVar("WORKDIR", True)
> +        return oeRuntimeTest.tc.d.getVar("WORKDIR")
> =20
>      #get some information on the CPU of the machine to display at the be=
ginning of the output. This info might be useful in some cases.
>      def getHardwareInfo(self):
> diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
> index 7f514ca..f1c4763 100644
> --- a/meta/lib/oeqa/runtime/rpm.py
> +++ b/meta/lib/oeqa/runtime/rpm.py
> @@ -7,7 +7,7 @@ from oeqa.utils.decorators import *
>  def setUpModule():
>      if not oeRuntimeTest.hasFeature("package-management"):
>              skipModule("rpm module skipped: target doesn't have package-=
management in IMAGE_FEATURES")
> -    if "package_rpm" !=3D oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", T=
rue).split()[0]:
> +    if "package_rpm" !=3D oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").s=
plit()[0]:
>              skipModule("rpm module skipped: target doesn't have rpm as p=
rimary package manager")
> =20
> =20
> @@ -29,8 +29,8 @@ class RpmInstallRemoveTest(oeRuntimeTest):
> =20
>      @classmethod
>      def setUpClass(self):
> -        pkgarch =3D oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True).repl=
ace("-", "_")
> -        rpmdir =3D os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', =
True), "rpm", pkgarch)
> +        pkgarch =3D oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH').replace("-=
", "_")
> +        rpmdir =3D os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR'),=
 "rpm", pkgarch)
>          # pick rpm-doc as a test file to get installed, because it's sma=
ll and it will always be built for standard targets
>          for f in fnmatch.filter(os.listdir(rpmdir), "rpm-doc-*.%s.rpm" %=
 pkgarch):
>              testrpmfile =3D f
> diff --git a/meta/lib/oeqa/runtime/scp.py b/meta/lib/oeqa/runtime/scp.py
> index 48e87d2..cf36cfa 100644
> --- a/meta/lib/oeqa/runtime/scp.py
> +++ b/meta/lib/oeqa/runtime/scp.py
> @@ -11,7 +11,7 @@ class ScpTest(oeRuntimeTest):
>      @testcase(220)
>      @skipUnlessPassed('test_ssh')
>      def test_scp_file(self):
> -        test_log_dir =3D oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True)
> +        test_log_dir =3D oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR")
>          test_file_path =3D os.path.join(test_log_dir, 'test_scp_file')
>          with open(test_file_path, 'w') as test_scp_file:
>              test_scp_file.seek(2 ** 22 - 1)
> diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart=
=2Epy
> index 6cdb10d..dde1c4d 100644
> --- a/meta/lib/oeqa/runtime/smart.py
> +++ b/meta/lib/oeqa/runtime/smart.py
> @@ -11,7 +11,7 @@ def setUpModule():
>          skipModule("Image doesn't have package management feature")
>      if not oeRuntimeTest.hasPackage("smartpm"):
>          skipModule("Image doesn't have smart installed")
> -    if "package_rpm" !=3D oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", T=
rue).split()[0]:
> +    if "package_rpm" !=3D oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").s=
plit()[0]:
>          skipModule("Rpm is not the primary package manager")
> =20
>  class SmartTest(oeRuntimeTest):
> @@ -75,16 +75,16 @@ class SmartRepoTest(SmartTest):
>          rpm_createrepo =3D bb.utils.which(os.getenv('PATH'), "createrepo=
")
>          index_cmds =3D []
>          rpm_dirs_found =3D False
> -        archs =3D (oeRuntimeTest.tc.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS=
', True) or "").replace('-', '_').split()
> +        archs =3D (oeRuntimeTest.tc.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS=
') or "").replace('-', '_').split()
>          for arch in archs:
> -            rpm_dir =3D os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_D=
IR_RPM', True), arch)
> -            idx_path =3D os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR=
', True), 'rpm', arch)
> -            db_path =3D os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'=
, True), 'rpmdb', arch)
> +            rpm_dir =3D os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_D=
IR_RPM'), arch)
> +            idx_path =3D os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR=
'), 'rpm', arch)
> +            db_path =3D os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'=
), 'rpmdb', arch)
>              if not os.path.isdir(rpm_dir):
>                  continue
>              if os.path.exists(db_path):
>                  bb.utils.remove(dbpath, True)
> -            lockfilename =3D oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM',=
 True) + "/rpm.lock"
> +            lockfilename =3D oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM')=
 + "/rpm.lock"
>              lf =3D bb.utils.lockfile(lockfilename, False)
>              oe.path.copyhardlinktree(rpm_dir, idx_path)
>              # Full indexes overload a 256MB image so reduce the number o=
f rpms
> @@ -98,7 +98,7 @@ class SmartRepoTest(SmartTest):
>          result =3D oe.utils.multiprocess_exec(index_cmds, self.create_in=
dex)
>          if result:
>              bb.fatal('%s' % ('\n'.join(result)))
> -        self.repo_server =3D HTTPService(oeRuntimeTest.tc.d.getVar('WORK=
DIR', True), oeRuntimeTest.tc.target.server_ip)
> +        self.repo_server =3D HTTPService(oeRuntimeTest.tc.d.getVar('WORK=
DIR'), oeRuntimeTest.tc.target.server_ip)
>          self.repo_server.start()
> =20
>      @classmethod
> @@ -113,9 +113,9 @@ class SmartRepoTest(SmartTest):
> =20
>      @testcase(719)
>      def test_smart_channel_add(self):
> -        image_pkgtype =3D self.tc.d.getVar('IMAGE_PKGTYPE', True)
> +        image_pkgtype =3D self.tc.d.getVar('IMAGE_PKGTYPE')
>          deploy_url =3D 'http://%s:%s/%s' %(self.target.server_ip, self.r=
epo_server.port, image_pkgtype)
> -        pkgarchs =3D self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-"=
,"_").split()
> +        pkgarchs =3D self.tc.d.getVar('PACKAGE_ARCHS').replace("-","_").=
split()
>          for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, ima=
ge_pkgtype)):
>              if arch in pkgarchs:
>                  self.smart('channel -y --add {a} type=3Drpm-md baseurl=
=3D{u}/{a}'.format(a=3Darch, u=3Ddeploy_url))
> diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/sys=
temd.py
> index 8de799c..52feb1b 100644
> --- a/meta/lib/oeqa/runtime/systemd.py
> +++ b/meta/lib/oeqa/runtime/systemd.py
> @@ -6,7 +6,7 @@ from oeqa.utils.decorators import *
>  def setUpModule():
>      if not oeRuntimeTest.hasFeature("systemd"):
>              skipModule("target doesn't have systemd in DISTRO_FEATURES")
> -    if "systemd" !=3D oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_ma=
nager", True):
> +    if "systemd" !=3D oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_ma=
nager"):
>              skipModule("systemd is not the init manager for this image")
> =20
> =20
> diff --git a/meta/lib/oeqa/runtime/x32lib.py b/meta/lib/oeqa/runtime/x32l=
ib.py
> index ce5e214..2f98dbf 100644
> --- a/meta/lib/oeqa/runtime/x32lib.py
> +++ b/meta/lib/oeqa/runtime/x32lib.py
> @@ -4,7 +4,7 @@ from oeqa.utils.decorators import *
> =20
>  def setUpModule():
>          #check if DEFAULTTUNE is set and it's value is: x86-64-x32
> -        defaulttune =3D oeRuntimeTest.tc.d.getVar("DEFAULTTUNE", True)
> +        defaulttune =3D oeRuntimeTest.tc.d.getVar("DEFAULTTUNE")
>          if "x86-64-x32" not in defaulttune:
>              skipModule("DEFAULTTUNE is not set to x86-64-x32")
> =20
> diff --git a/meta/lib/oeqa/sdk/gcc.py b/meta/lib/oeqa/sdk/gcc.py
> index 8395b9b..f3f4341 100644
> --- a/meta/lib/oeqa/sdk/gcc.py
> +++ b/meta/lib/oeqa/sdk/gcc.py
> @@ -5,7 +5,7 @@ from oeqa.oetest import oeSDKTest, skipModule
>  from oeqa.utils.decorators import *
> =20
>  def setUpModule():
> -    machine =3D oeSDKTest.tc.d.getVar("MACHINE", True)
> +    machine =3D oeSDKTest.tc.d.getVar("MACHINE")
>      if not oeSDKTest.hasHostPackage("packagegroup-cross-canadian-" + mac=
hine):
>          skipModule("SDK doesn't contain a cross-canadian toolchain")
> =20
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol=
=2Epy
> index 24669f4..d1f441f 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -19,7 +19,7 @@ from oeqa.controllers.testtargetloader import TestTarge=
tLoader
>  from abc import ABCMeta, abstractmethod
> =20
>  def get_target_controller(d):
> -    testtarget =3D d.getVar("TEST_TARGET", True)
> +    testtarget =3D d.getVar("TEST_TARGET")
>      # old, simple names
>      if testtarget =3D=3D "qemu":
>          return QemuTarget(d)
> @@ -33,7 +33,7 @@ def get_target_controller(d):
>          except AttributeError:
>              # nope, perhaps a layer defined one
>              try:
> -                bbpath =3D d.getVar("BBPATH", True).split(':')
> +                bbpath =3D d.getVar("BBPATH").split(':')
>                  testtargetloader =3D TestTargetLoader()
>                  controller =3D testtargetloader.get_controller_module(te=
sttarget, bbpath)
>              except ImportError as e:
> @@ -51,9 +51,9 @@ class BaseTarget(object, metaclass=3DABCMeta):
>          self.connection =3D None
>          self.ip =3D None
>          self.server_ip =3D None
> -        self.datetime =3D d.getVar('DATETIME', True)
> -        self.testdir =3D d.getVar("TEST_LOG_DIR", True)
> -        self.pn =3D d.getVar("PN", True)
> +        self.datetime =3D d.getVar('DATETIME')
> +        self.testdir =3D d.getVar("TEST_LOG_DIR")
> +        self.pn =3D d.getVar("PN")
> =20
>      @abstractmethod
>      def deploy(self):
> @@ -80,7 +80,7 @@ class BaseTarget(object, metaclass=3DABCMeta):
>      @classmethod
>      def match_image_fstype(self, d, image_fstypes=3DNone):
>          if not image_fstypes:
> -            image_fstypes =3D d.getVar('IMAGE_FSTYPES', True).split(' ')
> +            image_fstypes =3D d.getVar('IMAGE_FSTYPES').split(' ')
>          possible_image_fstypes =3D [fstype for fstype in self.supported_=
image_fstypes if fstype in image_fstypes]
>          if possible_image_fstypes:
>              return possible_image_fstypes[0]
> @@ -119,14 +119,14 @@ class QemuTarget(BaseTarget):
> =20
>          self.image_fstype =3D self.get_image_fstype(d)
>          self.qemulog =3D os.path.join(self.testdir, "qemu_boot_log.%s" %=
 self.datetime)
> -        self.rootfs =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),=
  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
> -        self.kernel =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),=
 d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '=
=2Ebin')
> -        dump_target_cmds =3D d.getVar("testimage_dump_target", True)
> -        dump_host_cmds =3D d.getVar("testimage_dump_host", True)
> -        dump_dir =3D d.getVar("TESTIMAGE_DUMP_DIR", True)
> +        self.rootfs =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.ge=
tVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
> +        self.kernel =3D os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.get=
Var("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
> +        dump_target_cmds =3D d.getVar("testimage_dump_target")
> +        dump_host_cmds =3D d.getVar("testimage_dump_host")
> +        dump_dir =3D d.getVar("TESTIMAGE_DUMP_DIR")
>          if d.getVar("QEMU_USE_KVM", False) is not None \
>             and d.getVar("QEMU_USE_KVM", False) =3D=3D "True" \
> -           and "x86" in d.getVar("MACHINE", True):
> +           and "x86" in d.getVar("MACHINE"):
>              use_kvm =3D True
>          else:
>              use_kvm =3D False
> @@ -141,26 +141,26 @@ class QemuTarget(BaseTarget):
>          logger.addHandler(loggerhandler)
>          oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.jo=
in(self.testdir, 'qemurunner_log'), force=3DTrue)
> =20
> -        if d.getVar("DISTRO", True) =3D=3D "poky-tiny":
> -            self.runner =3D QemuTinyRunner(machine=3Dd.getVar("MACHINE",=
 True),
> +        if d.getVar("DISTRO") =3D=3D "poky-tiny":
> +            self.runner =3D QemuTinyRunner(machine=3Dd.getVar("MACHINE"),
>                              rootfs=3Dself.rootfs,
> -                            tmpdir =3D d.getVar("TMPDIR", True),
> -                            deploy_dir_image =3D d.getVar("DEPLOY_DIR_IM=
AGE", True),
> -                            display =3D d.getVar("BB_ORIGENV", False).ge=
tVar("DISPLAY", True),
> +                            tmpdir =3D d.getVar("TMPDIR"),
> +                            deploy_dir_image =3D d.getVar("DEPLOY_DIR_IM=
AGE"),
> +                            display =3D d.getVar("BB_ORIGENV", False).ge=
tVar("DISPLAY"),
>                              logfile =3D self.qemulog,
>                              kernel =3D self.kernel,
> -                            boottime =3D int(d.getVar("TEST_QEMUBOOT_TIM=
EOUT", True)))
> +                            boottime =3D int(d.getVar("TEST_QEMUBOOT_TIM=
EOUT")))
>          else:
> -            self.runner =3D QemuRunner(machine=3Dd.getVar("MACHINE", Tru=
e),
> +            self.runner =3D QemuRunner(machine=3Dd.getVar("MACHINE"),
>                              rootfs=3Dself.rootfs,
> -                            tmpdir =3D d.getVar("TMPDIR", True),
> -                            deploy_dir_image =3D d.getVar("DEPLOY_DIR_IM=
AGE", True),
> -                            display =3D d.getVar("BB_ORIGENV", False).ge=
tVar("DISPLAY", True),
> +                            tmpdir =3D d.getVar("TMPDIR"),
> +                            deploy_dir_image =3D d.getVar("DEPLOY_DIR_IM=
AGE"),
> +                            display =3D d.getVar("BB_ORIGENV", False).ge=
tVar("DISPLAY"),
>                              logfile =3D self.qemulog,
> -                            boottime =3D int(d.getVar("TEST_QEMUBOOT_TIM=
EOUT", True)),
> +                            boottime =3D int(d.getVar("TEST_QEMUBOOT_TIM=
EOUT")),
>                              use_kvm =3D use_kvm,
>                              dump_dir =3D dump_dir,
> -                            dump_host_cmds =3D d.getVar("testimage_dump_=
host", True))
> +                            dump_host_cmds =3D d.getVar("testimage_dump_=
host"))
> =20
>          self.target_dumper =3D TargetDumper(dump_target_cmds, dump_dir, =
self.runner)
> =20
> @@ -214,14 +214,14 @@ class SimpleRemoteTarget(BaseTarget):
> =20
>      def __init__(self, d):
>          super(SimpleRemoteTarget, self).__init__(d)
> -        addr =3D d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please se=
t TEST_TARGET_IP with the IP address of the machine you want to run the tes=
ts on.')
> +        addr =3D d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST=
_TARGET_IP with the IP address of the machine you want to run the tests on.=
')
>          self.ip =3D addr.split(":")[0]
>          try:
>              self.port =3D addr.split(":")[1]
>          except IndexError:
>              self.port =3D None
>          bb.note("Target IP: %s" % self.ip)
> -        self.server_ip =3D d.getVar("TEST_SERVER_IP", True)
> +        self.server_ip =3D d.getVar("TEST_SERVER_IP")
>          if not self.server_ip:
>              try:
>                  self.server_ip =3D subprocess.check_output(['ip', 'route=
', 'get', self.ip ]).split("\n")[0].split()[-1]
> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/comman=
ds.py
> index 5cd0f74..53777e6 100644
> --- a/meta/lib/oeqa/utils/commands.py
> +++ b/meta/lib/oeqa/utils/commands.py
> @@ -231,7 +231,7 @@ def runqemu(pn, ssh=3DTrue):
>          logger =3D logging.getLogger('BitBake.QemuRunner')
>          logger.setLevel(logging.DEBUG)
>          logger.propagate =3D False
> -        logdir =3D recipedata.getVar("TEST_LOG_DIR", True)
> +        logdir =3D recipedata.getVar("TEST_LOG_DIR")
> =20
>          qemu =3D oeqa.targetcontrol.QemuTarget(recipedata)
>      finally:
> diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
> index 71422a9..44037a9 100644
> --- a/meta/lib/oeqa/utils/dump.py
> +++ b/meta/lib/oeqa/utils/dump.py
> @@ -6,8 +6,8 @@ import itertools
>  from .commands import runCmd
> =20
>  def get_host_dumper(d):
> -    cmds =3D d.getVar("testimage_dump_host", True)
> -    parent_dir =3D d.getVar("TESTIMAGE_DUMP_DIR", True)
> +    cmds =3D d.getVar("testimage_dump_host")
> +    parent_dir =3D d.getVar("TESTIMAGE_DUMP_DIR")
>      return HostDumper(cmds, parent_dir)
> =20
> =20
> diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils=
/package_manager.py
> index 099ecc9..0f6bdbc 100644
> --- a/meta/lib/oeqa/utils/package_manager.py
> +++ b/meta/lib/oeqa/utils/package_manager.py
> @@ -4,24 +4,24 @@ def get_package_manager(d, root_path):
>      """
>      from oe.package_manager import RpmPM, OpkgPM, DpkgPM
> =20
> -    pkg_class =3D d.getVar("IMAGE_PKGTYPE", True)
> +    pkg_class =3D d.getVar("IMAGE_PKGTYPE")
>      if pkg_class =3D=3D "rpm":
>          pm =3D RpmPM(d,
>                     root_path,
> -                   d.getVar('TARGET_VENDOR', True))
> +                   d.getVar('TARGET_VENDOR'))
>          pm.create_configs()
> =20
>      elif pkg_class =3D=3D "ipk":
>          pm =3D OpkgPM(d,
>                      root_path,
> -                    d.getVar("IPKGCONF_TARGET", True),
> -                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))
> +                    d.getVar("IPKGCONF_TARGET"),
> +                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
> =20
>      elif pkg_class =3D=3D "deb":
>          pm =3D DpkgPM(d,
>                      root_path,
> -                    d.getVar('PACKAGE_ARCHS', True),
> -                    d.getVar('DPKG_ARCH', True))
> +                    d.getVar('PACKAGE_ARCHS'),
> +                    d.getVar('DPKG_ARCH'))
> =20
>      pm.write_index()
>      pm.update()
> diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/tar=
getbuild.py
> index 59593f5..c001602 100644
> --- a/meta/lib/oeqa/utils/targetbuild.py
> +++ b/meta/lib/oeqa/utils/targetbuild.py
> @@ -25,7 +25,7 @@ class BuildProject(metaclass=3DABCMeta):
>      # Download self.archive to self.localarchive
>      def _download_archive(self):
> =20
> -        dl_dir =3D self.d.getVar("DL_DIR", True)
> +        dl_dir =3D self.d.getVar("DL_DIR")
>          if dl_dir and os.path.exists(os.path.join(dl_dir, self.archive)):
>              bb.utils.copyfile(os.path.join(dl_dir, self.archive), self.l=
ocalarchive)
>              return
> @@ -40,7 +40,7 @@ class BuildProject(metaclass=3DABCMeta):
> =20
>          cmd =3D ''
>          for var in exportvars:
> -            val =3D self.d.getVar(var, True)
> +            val =3D self.d.getVar(var)
>              if val:
>                  cmd =3D 'export ' + var + '=3D\"%s\"; %s' % (val, cmd)
> =20
> @@ -103,8 +103,8 @@ class SDKBuildProject(BuildProject):
>          self.testdir =3D testpath
>          self.targetdir =3D testpath
>          bb.utils.mkdirhier(testpath)
> -        self.datetime =3D d.getVar('DATETIME', True)
> -        self.testlogdir =3D d.getVar("TEST_LOG_DIR", True)
> +        self.datetime =3D d.getVar('DATETIME')
> +        self.testlogdir =3D d.getVar("TEST_LOG_DIR")
>          bb.utils.mkdirhier(self.testlogdir)
>          self.logfile =3D os.path.join(self.testlogdir, "sdk_target_log.%=
s" % self.datetime)
>          BuildProject.__init__(self, d, uri, foldername, tmpdir=3Dtestpat=
h)
> diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/test=
export.py
> index 57be2ca..be2a211 100644
> --- a/meta/lib/oeqa/utils/testexport.py
> +++ b/meta/lib/oeqa/utils/testexport.py
> @@ -72,9 +72,9 @@ def process_binaries(d, params):
>          return extract_bin_command
> =20
>      if determine_if_poky_env(): # machine with poky environment
> -        exportpath =3D d.getVar("TEST_EXPORT_DIR", True) if export_env e=
lse d.getVar("DEPLOY_DIR", True)
> -        rpm_deploy_dir =3D d.getVar("DEPLOY_DIR_RPM", True)
> -        arch =3D get_dest_folder(d.getVar("TUNE_FEATURES", True), os.lis=
tdir(rpm_deploy_dir))
> +        exportpath =3D d.getVar("TEST_EXPORT_DIR") if export_env else d.=
getVar("DEPLOY_DIR")
> +        rpm_deploy_dir =3D d.getVar("DEPLOY_DIR_RPM")
> +        arch =3D get_dest_folder(d.getVar("TUNE_FEATURES"), os.listdir(r=
pm_deploy_dir))
>          arch_rpm_dir =3D os.path.join(rpm_deploy_dir, arch)
>          extracted_bin_dir =3D os.path.join(exportpath,"binaries", arch, =
"extracted_binaries")
>          packaged_bin_dir =3D os.path.join(exportpath,"binaries", arch, "=
packaged_binaries")
> @@ -92,7 +92,7 @@ def process_binaries(d, params):
>                      return ""
>                  for item in native_rpm_file_list:# will copy all version=
s of package. Used version will be selected on remote machine
>                      bb.plain("Copying native package file: %s" % item)
> -                    sh.copy(os.path.join(rpm_deploy_dir, native_rpm_dir,=
 item), os.path.join(d.getVar("TEST_EXPORT_DIR", True), "binaries", "native=
"))
> +                    sh.copy(os.path.join(rpm_deploy_dir, native_rpm_dir,=
 item), os.path.join(d.getVar("TEST_EXPORT_DIR"), "binaries", "native"))
>              else: # nothing to do here; running tests under bitbake, so =
we asume native binaries are in sysroots dir.
>                  if param_list[1] or param_list[4]:
>                      bb.warn("Native binary %s %s%s. Running tests under =
bitbake environment. Version can't be checked except when the test itself d=
oes it"
> @@ -148,7 +148,7 @@ def process_binaries(d, params):
>          else: # this is for target device
>              if param_list[2] =3D=3D "rpm":
>                  return "No need to extract, this is an .rpm file"
> -            arch =3D get_dest_folder(d.getVar("TUNE_FEATURES", True), os=
=2Elistdir(binaries_path))
> +            arch =3D get_dest_folder(d.getVar("TUNE_FEATURES"), os.listd=
ir(binaries_path))
>              extracted_bin_path =3D os.path.join(binaries_path, arch, "ex=
tracted_binaries")
>              extracted_bin_list =3D [item for item in os.listdir(extracte=
d_bin_path)]
>              packaged_bin_path =3D os.path.join(binaries_path, arch, "pac=
kaged_binaries")
> @@ -206,9 +206,9 @@ def send_bin_to_DUT(d,params):
>      from oeqa.oetest import oeRuntimeTest
>      param_list =3D params
>      cleanup_list =3D list()
> -    bins_dir =3D os.path.join(d.getVar("TEST_EXPORT_DIR", True), "binari=
es") if determine_if_poky_env() \
> +    bins_dir =3D os.path.join(d.getVar("TEST_EXPORT_DIR"), "binaries") i=
f determine_if_poky_env() \
>                      else os.getenv("bin_dir")
> -    arch =3D get_dest_folder(d.getVar("TUNE_FEATURES", True), os.listdir=
(bins_dir))
> +    arch =3D get_dest_folder(d.getVar("TUNE_FEATURES"), os.listdir(bins_=
dir))
>      arch_rpms_dir =3D os.path.join(bins_dir, arch, "packaged_binaries")
>      extracted_bin_dir =3D os.path.join(bins_dir, arch, "extracted_binari=
es", param_list[0])
> =20
> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb b/meta/recipes-bsp=
/gnu-efi/gnu-efi_3.0.4.bb
> index e0d8ee7..9ddc4ba 100644
> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
> @@ -27,7 +27,7 @@ COMPATIBLE_HOST_armv4 =3D 'null'
> =20
>  def gnu_efi_arch(d):
>      import re
> -    tarch =3D d.getVar("TARGET_ARCH", True)
> +    tarch =3D d.getVar("TARGET_ARCH")
>      if re.match("i[3456789]86", tarch):
>          return "ia32"
>      return tarch
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.00.bb
> index 5a0dc95..531482b 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> @@ -13,7 +13,7 @@ S =3D "${WORKDIR}/grub-${PV}"
>  # Determine the target arch for the grub modules
>  python __anonymous () {
>      import re
> -    target =3D d.getVar('TARGET_ARCH', True)
> +    target =3D d.getVar('TARGET_ARCH')
>      if target =3D=3D "x86_64":
>          grubtarget =3D 'x86_64'
>          grubimage =3D "bootx64.efi"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index afe3fe9..4a55fd6 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -42,7 +42,7 @@ UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_S=
UFFIX}"
>  # deploy directory.  For those versions they can set the following varia=
bles
>  # to allow packaging the SPL.
>  SPL_BINARY ?=3D ""
> -SPL_BINARYNAME ?=3D "${@os.path.basename(d.getVar("SPL_BINARY", True))}"
> +SPL_BINARYNAME ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
>  SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}"
>  SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index ecefb7b..55a5055 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -95,13 +95,13 @@ FILES_${PN}-testtools =3D "${libdir}/bluez/test/*"
> =20
>  def get_noinst_tools_paths (d, bb, tools):
>      s =3D list()
> -    bindir =3D d.getVar("bindir", True)
> +    bindir =3D d.getVar("bindir")
>      for bdp in tools.split():
>          f =3D os.path.basename(bdp)
>          s.append("%s/%s" % (bindir, f))
>      return "\n".join(s)
> =20
> -FILES_${PN}-noinst-tools =3D "${@get_noinst_tools_paths(d, bb, d.getVar(=
'NOINST_TOOLS', True))}"
> +FILES_${PN}-noinst-tools =3D "${@get_noinst_tools_paths(d, bb, d.getVar(=
'NOINST_TOOLS'))}"
> =20
>  RDEPENDS_${PN}-testtools +=3D "python3 python3-dbus python3-pygobject"
> =20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index 35a7eed..7fa9a7b 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -58,7 +58,7 @@ INITSCRIPT_PARAMS =3D "start 05 5 2 3 . stop 22 0 1 6 ."
> =20
>  python __anonymous () {
>      systemd_packages =3D "${PN}"
> -    pkgconfig =3D d.getVar('PACKAGECONFIG', True)
> +    pkgconfig =3D d.getVar('PACKAGECONFIG')
>      if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
>          systemd_packages +=3D " ${PN}-vpn"
>      d.setVar('SYSTEMD_PACKAGES', systemd_packages)
> @@ -116,7 +116,7 @@ def add_rdepends(bb, d, file, pkg, depmap, multilib_p=
refix, add_insane_skip):
> =20
>  python populate_packages_prepend() {
>      depmap =3D dict(pppd=3D"ppp")
> -    multilib_prefix =3D (d.getVar("MLPREFIX", True) or "")
> +    multilib_prefix =3D (d.getVar("MLPREFIX") or "")
> =20
>      hook =3D lambda file,pkg,x,y,z: \
>          add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, False)
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index 5333110..d138005 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -173,5 +173,5 @@ FILES_${PN}-doc =3D "${docdir} ${datadir}/common-lice=
nses"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -CONFFILES_${PN} =3D "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname=
'][(d.getVar('hostname', True) !=3D '')]} ${sysconfdir}/shells"
> +CONFFILES_${PN} =3D "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname=
'][(d.getVar('hostname') !=3D '')]} ${sysconfdir}/shells"
>  CONFFILES_${PN} +=3D "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${s=
ysconfdir}/profile"
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index b2f1960..1f4a48c 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -331,21 +331,21 @@ ALTERNATIVE_LINK_NAME[syslog-conf] =3D "${sysconfdi=
r}/syslog.conf"
> =20
>  python () {
>      if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
>          d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
> -        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/=
syslog' % (d.getVar('sysconfdir', True)))
> -        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/sys=
log.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/=
syslog' % (d.getVar('sysconfdir')))
> +        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/sys=
log.%s' % (d.getVar('sysconfdir'), d.getVar('BPN')))
>          d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-con=
f')
> -        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s=
/syslog-startup.conf' % (d.getVar('sysconfdir', True)))
> -        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/sy=
slog-startup.conf.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True=
)))
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s=
/syslog-startup.conf' % (d.getVar('sysconfdir')))
> +        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/sy=
slog-startup.conf.%s' % (d.getVar('sysconfdir'), d.getVar('BPN')))
>  }
> =20
>  python do_package_prepend () {
>      # We need to load the full set of busybox provides from the /etc/bus=
ybox.links
>      # Use this to see the update-alternatives with the right information
> =20
> -    dvar =3D d.getVar('D', True)
> -    pn =3D d.getVar('PN', True)
> +    dvar =3D d.getVar('D')
> +    pn =3D d.getVar('PN')
>      def set_alternative_vars(links, target):
>          links =3D d.expand(links)
>          target =3D d.expand(target)
> diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-c=
ore/busybox/busybox_1.24.1.bb
> index df0e131..658c347 100644
> --- a/meta/recipes-core/busybox/busybox_1.24.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
> @@ -38,8 +38,8 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-$=
{PV}.tar.bz2;name=3Dtarball \
>             file://sha256sum.cfg \
>             file://getopts.cfg \
>             file://resize.cfg \
> -           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_ma=
nager', True) =3D=3D 'busybox')]} \
> -           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_man=
ager', True) =3D=3D 'busybox-mdev')]} \
> +           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_ma=
nager') =3D=3D 'busybox')]} \
> +           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_man=
ager') =3D=3D 'busybox-mdev')]} \
>             file://inittab \
>             file://rcS \
>             file://rcK \
> diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core=
/busybox/busybox_git.bb
> index c29b894..c2ee3e6 100644
> --- a/meta/recipes-core/busybox/busybox_git.bb
> +++ b/meta/recipes-core/busybox/busybox_git.bb
> @@ -40,8 +40,8 @@ SRC_URI =3D "git://busybox.net/busybox.git \
>             file://sha256sum.cfg \
>             file://getopts.cfg \
>             file://resize.cfg \
> -           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_ma=
nager', True) =3D=3D 'busybox')]} \
> -           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_man=
ager', True) =3D=3D 'busybox-mdev')]} \
> +           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_ma=
nager') =3D=3D 'busybox')]} \
> +           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_man=
ager') =3D=3D 'busybox-mdev')]} \
>             file://inittab \
>             file://rcS \
>             file://rcK \
> diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-=
core/coreutils/coreutils_6.9.bb
> index 35700a3..9bfbeab 100644
> --- a/meta/recipes-core/coreutils/coreutils_6.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
> @@ -99,9 +99,9 @@ ALTERNATIVE_LINK_NAME[lbracket] =3D "${bindir}/["
>  ALTERNATIVE_TARGET[lbracket] =3D "${bindir}/lbracket.${BPN}"
> =20
>  python __anonymous() {
> -	for prog in d.getVar('base_bindir_progs', True).split():
> -		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
bindir', True), prog))
> +	for prog in d.getVar('base_bindir_progs').split():
> +		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
bindir'), prog))
> =20
> -	for prog in d.getVar('sbindir_progs', True).split():
> -		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbind=
ir', True), prog))
> +	for prog in d.getVar('sbindir_progs').split():
> +		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbind=
ir'), prog))
>  }
> diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes=
-core/coreutils/coreutils_8.25.bb
> index df6ad38..6d6f7bc 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.25.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
> @@ -132,11 +132,11 @@ ALTERNATIVE_LINK_NAME[kill.1] =3D "${mandir}/man1/k=
ill.1"
>  ALTERNATIVE_LINK_NAME[stat.1] =3D "${mandir}/man1/stat.1"
> =20
>  python __anonymous() {
> -	for prog in d.getVar('base_bindir_progs', True).split():
> -		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
bindir', True), prog))
> +	for prog in d.getVar('base_bindir_progs').split():
> +		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
bindir'), prog))
> =20
> -	for prog in d.getVar('sbindir_progs', True).split():
> -		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbind=
ir', True), prog))
> +	for prog in d.getVar('sbindir_progs').split():
> +		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbind=
ir'), prog))
>  }
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/gli=
bc/glibc-ld.inc
> index e2e2474..547c235 100644
> --- a/meta/recipes-core/glibc/glibc-ld.inc
> +++ b/meta/recipes-core/glibc/glibc-ld.inc
> @@ -1,6 +1,6 @@
>  def ld_append_if_tune_exists(d, infos, dict):
> -    tune =3D d.getVar("DEFAULTTUNE", True) or ""
> -    libdir =3D d.getVar("base_libdir", True) or ""
> +    tune =3D d.getVar("DEFAULTTUNE") or ""
> +    libdir =3D d.getVar("base_libdir") or ""
>      if tune in dict:
>          infos['ldconfig'].add('{"' + libdir + '/' + dict[tune][0] + '",'=
 + dict[tune][1] + ' }')
>          infos['lddrewrite'].add(libdir+'/'+dict[tune][0])
> @@ -32,7 +32,7 @@ def glibc_dl_info(d):
>          localdata.setVar("DEFAULTTUNE", original_tune)
>          ld_append_if_tune_exists(localdata, infos, ld_info_all)
> =20
> -    variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""
> +    variants =3D d.getVar("MULTILIB_VARIANTS") or ""
>      for item in variants.split():
>          localdata =3D bb.data.createCopy(d)
>          overrides =3D localdata.getVar("OVERRIDES", False) + ":virtclass=
-multilib-" + item
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core=
/glibc/glibc-locale.inc
> index 0a7adfc..11bd612 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -41,22 +41,22 @@ PACKAGES_DYNAMIC =3D "^locale-base-.* \
>  # Create a glibc-binaries package
>  ALLOW_EMPTY_${BPN}-binaries =3D "1"
>  PACKAGES +=3D "${BPN}-binaries"
> -RRECOMMENDS_${BPN}-binaries =3D  "${@" ".join([p for p in d.getVar('PACK=
AGES', True).split() if p.find("glibc-binary") !=3D -1])}"
> +RRECOMMENDS_${BPN}-binaries =3D  "${@" ".join([p for p in d.getVar('PACK=
AGES').split() if p.find("glibc-binary") !=3D -1])}"
> =20
>  # Create a glibc-charmaps package
>  ALLOW_EMPTY_${BPN}-charmaps =3D "1"
>  PACKAGES +=3D "${BPN}-charmaps"
> -RRECOMMENDS_${BPN}-charmaps =3D  "${@" ".join([p for p in d.getVar('PACK=
AGES', True).split() if p.find("glibc-charmap") !=3D -1])}"
> +RRECOMMENDS_${BPN}-charmaps =3D  "${@" ".join([p for p in d.getVar('PACK=
AGES').split() if p.find("glibc-charmap") !=3D -1])}"
> =20
>  # Create a glibc-gconvs package
>  ALLOW_EMPTY_${BPN}-gconvs =3D "1"
>  PACKAGES +=3D "${BPN}-gconvs"
> -RRECOMMENDS_${BPN}-gconvs =3D  "${@" ".join([p for p in d.getVar('PACKAG=
ES', True).split() if p.find("glibc-gconv") !=3D -1])}"
> +RRECOMMENDS_${BPN}-gconvs =3D  "${@" ".join([p for p in d.getVar('PACKAG=
ES').split() if p.find("glibc-gconv") !=3D -1])}"
> =20
>  # Create a glibc-localedatas package
>  ALLOW_EMPTY_${BPN}-localedatas =3D "1"
>  PACKAGES +=3D "${BPN}-localedatas"
> -RRECOMMENDS_${BPN}-localedatas =3D  "${@" ".join([p for p in d.getVar('P=
ACKAGES', True).split() if p.find("glibc-localedata") !=3D -1])}"
> +RRECOMMENDS_${BPN}-localedatas =3D  "${@" ".join([p for p in d.getVar('P=
ACKAGES').split() if p.find("glibc-localedata") !=3D -1])}"
> =20
>  DESCRIPTION_localedef =3D "glibc: compile locale definition files"
> =20
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index bad6424..481a00e 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -8,10 +8,10 @@
> =20
>  python __anonymous () {
>      import bb, re
> -    uc_os =3D (re.match('.*uclibc*', d.getVar('TARGET_OS', True)) !=3D N=
one)
> +    uc_os =3D (re.match('.*uclibc*', d.getVar('TARGET_OS')) !=3D None)
>      if uc_os:
>          raise bb.parse.SkipPackage("incompatible with target %s" %
> -                                   d.getVar('TARGET_OS', True))
> +                                   d.getVar('TARGET_OS'))
>  }
> =20
>  # Set this to zero if you don't want ldconfig in the output package
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
> index e85c704..2faee37 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -10,13 +10,13 @@ TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_TCB=
OOTSTRAP}"
> =20
>  python () {
>      opt_effective =3D "-O"
> -    for opt in d.getVar('SELECTED_OPTIMIZATION', True).split():
> +    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
>          if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
>              opt_effective =3D opt
>      if opt_effective =3D=3D "-O0":
> -        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVa=
r('PN', True), opt_effective))
> +        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVa=
r('PN'), opt_effective))
>      if opt_effective in ("-O", "-O1", "-Os"):
> -        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to =
SELECTED_OPTIMIZATION" % (d.getVar('PN', True), opt_effective))
> +        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to =
SELECTED_OPTIMIZATION" % (d.getVar('PN'), opt_effective))
>          d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
>  }
> =20
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-cor=
e/libxml/libxml2_2.9.4.bb
> index 59874be..a7221a5 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
> @@ -52,7 +52,7 @@ EXTRA_OECONF_linuxstdbase =3D "--with-debug --with-lega=
cy --with-docbook --with-c1
> =20
>  python populate_packages_prepend () {
>      # autonamer would call this libxml2-2, but we don't want that
> -    if d.getVar('DEBIAN_NAMES', True):
> +    if d.getVar('DEBIAN_NAMES'):
>          d.setVar('PKG_libxml2', '${MLPREFIX}libxml2')
>  }
> =20
> diff --git a/meta/recipes-core/meta/meta-environment-extsdk.bb b/meta/rec=
ipes-core/meta/meta-environment-extsdk.bb
> index d9e5961..52012cc 100644
> --- a/meta/recipes-core/meta/meta-environment-extsdk.bb
> +++ b/meta/recipes-core/meta/meta-environment-extsdk.bb
> @@ -5,8 +5,8 @@ require meta-environment.bb
>  PN =3D "meta-environment-extsdk-${MACHINE}"
> =20
>  create_sdk_files_append() {
> -	local sysroot=3D${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_TAR=
GET', True), d.getVar('TOPDIR', True))}
> -	local sdkpathnative=3D${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_D=
IR_NATIVE',True), d.getVar('TOPDIR', True))}
> +	local sysroot=3D${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_TAR=
GET'), d.getVar('TOPDIR'))}
> +	local sdkpathnative=3D${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_D=
IR_NATIVE',True), d.getVar('TOPDIR'))}
> =20
>  	toolchain_create_sdk_env_script '' '' $sysroot '' ${bindir_native} ${pr=
efix_native} $sdkpathnative
>  }
> diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-co=
re/meta/meta-environment.bb
> index 71e0c23..a250cc8 100644
> --- a/meta/recipes-core/meta/meta-environment.bb
> +++ b/meta/recipes-core/meta/meta-environment.bb
> @@ -26,16 +26,16 @@ python do_generate_content() {
>      localdata =3D bb.data.createCopy(d)
> =20
>      # make sure we only use the WORKDIR value from 'd', or it can change
> -    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
> +    localdata.setVar('WORKDIR', d.getVar('WORKDIR'))
> =20
>      # make sure we only use the SDKTARGETSYSROOT value from 'd'
> -    localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', Tr=
ue))
> +    localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT'))
>      localdata.setVar('libdir', d.getVar('target_libdir', False))
> =20
>      # Process DEFAULTTUNE
>      bb.build.exec_func("create_sdk_files", localdata)
> =20
> -    variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""
> +    variants =3D d.getVar("MULTILIB_VARIANTS") or ""
>      for item in variants.split():
>          # Load overrides from 'd' to avoid having to reset the value...
>          overrides =3D d.getVar("OVERRIDES", False) + ":virtclass-multili=
b-" + item
> diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recip=
es-core/meta/meta-extsdk-toolchain.bb
> index 22de0f3..fc6d6de 100644
> --- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
> +++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
> @@ -19,7 +19,7 @@ do_locked_sigs[sstate-outputdirs] =3D "${STAGING_DIR_HO=
ST}/locked-sigs"
> =20
>  python do_locked_sigs() {
>      import oe.copy_buildsystem
> -    outdir =3D os.path.join(d.getVar('LOCKED_SIGS_INDIR', True))
> +    outdir =3D os.path.join(d.getVar('LOCKED_SIGS_INDIR'))
>      bb.utils.mkdirhier(outdir)
>      sigfile =3D os.path.join(outdir, 'locked-sigs-extsdk-toolchain.inc')
>      oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
> diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-=
core/meta/meta-world-pkgdata.bb
> index 81c8647..0ce378e 100644
> --- a/meta/recipes-core/meta/meta-world-pkgdata.bb
> +++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
> @@ -19,7 +19,7 @@ do_collect_packagedata[sstate-outputdirs] =3D "${STAGIN=
G_DIR_HOST}/world-pkgdata"
> =20
>  python do_collect_packagedata() {
>      import oe.copy_buildsystem
> -    outdir =3D os.path.join(d.getVar('WORLD_PKGDATADIR', True))
> +    outdir =3D os.path.join(d.getVar('WORLD_PKGDATADIR'))
>      bb.utils.mkdirhier(outdir)
>      sigfile =3D os.path.join(outdir, 'locked-sigs-pkgdata.inc')
>      oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
> diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/m=
eta/signing-keys.bb
> index d088c0c..aaa01d0 100644
> --- a/meta/recipes-core/meta/signing-keys.bb
> +++ b/meta/recipes-core/meta/signing-keys.bb
> @@ -21,23 +21,23 @@ FILES_${PN}-packagefeed =3D "${sysconfdir}/pki/packag=
efeed-gpg"
>  python do_get_public_keys () {
>      from oe.gpg_sign import get_signer
> =20
> -    if d.getVar("RPM_SIGN_PACKAGES", True):
> +    if d.getVar("RPM_SIGN_PACKAGES"):
>          # Export public key of the rpm signing key
> -        signer =3D get_signer(d, d.getVar('RPM_GPG_BACKEND', True))
> +        signer =3D get_signer(d, d.getVar('RPM_GPG_BACKEND'))
>          signer.export_pubkey(os.path.join(d.expand('${B}'), 'rpm-key'),
> -                             d.getVar('RPM_GPG_NAME', True))
> +                             d.getVar('RPM_GPG_NAME'))
> =20
> -    if d.getVar("IPK_SIGN_PACKAGES", True):
> +    if d.getVar("IPK_SIGN_PACKAGES"):
>          # Export public key of the ipk signing key
> -        signer =3D get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
> +        signer =3D get_signer(d, d.getVar('IPK_GPG_BACKEND'))
>          signer.export_pubkey(os.path.join(d.expand('${B}'), 'ipk-key'),
> -                             d.getVar('IPK_GPG_NAME', True))
> +                             d.getVar('IPK_GPG_NAME'))
> =20
> -    if d.getVar('PACKAGE_FEED_SIGN', True) =3D=3D '1':
> +    if d.getVar('PACKAGE_FEED_SIGN') =3D=3D '1':
>          # Export public key of the feed signing key
> -        signer =3D get_signer(d, d.getVar('PACKAGE_FEED_GPG_BACKEND', Tr=
ue))
> +        signer =3D get_signer(d, d.getVar('PACKAGE_FEED_GPG_BACKEND'))
>          signer.export_pubkey(os.path.join(d.expand('${B}'), 'pf-key'),
> -                             d.getVar('PACKAGE_FEED_GPG_NAME', True))
> +                             d.getVar('PACKAGE_FEED_GPG_NAME'))
>  }
>  do_get_public_keys[cleandirs] =3D "${B}"
>  addtask get_public_keys before do_install
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
> index fac0bac..f988704 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -32,8 +32,8 @@ def sanitise_version(ver):
>  python do_compile () {
>      import shutil
>      with open(d.expand('${B}/os-release'), 'w') as f:
> -        for field in d.getVar('OS_RELEASE_FIELDS', True).split():
> -            value =3D d.getVar(field, True)
> +        for field in d.getVar('OS_RELEASE_FIELDS').split():
> +            value =3D d.getVar(field)
>              if value and field =3D=3D 'VERSION_ID':
>                  value =3D sanitise_version(value)
>              if value:
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index 2e94fde..0069e3e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -110,8 +110,8 @@ python __anonymous () {
>      # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (o=
ne of them)
>      # then include packagegroup-base-wifi in packagegroup-base
> =20
> -    distro_features =3D set(d.getVar("DISTRO_FEATURES", True).split())
> -    machine_features=3D set(d.getVar("MACHINE_FEATURES", True).split())
> +    distro_features =3D set(d.getVar("DISTRO_FEATURES").split())
> +    machine_features=3D set(d.getVar("MACHINE_FEATURES").split())
> =20
>      if "bluetooth" in distro_features and not "bluetooth" in machine_fea=
tures and ("pcmcia" in machine_features or "pci" in machine_features or "us=
bhost" in machine_features):
>          d.setVar("ADD_BT", "packagegroup-base-bluetooth")
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/m=
eta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index 327cd8e..7d6d414 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -42,7 +42,7 @@ RRECOMMENDS_packagegroup-core-sdk =3D "\
> =20
>  #python generate_sdk_pkgs () {
>  #    poky_pkgs =3D read_pkgdata('packagegroup-core', d)['PACKAGES']
> -#    pkgs =3D d.getVar('PACKAGES', True).split()
> +#    pkgs =3D d.getVar('PACKAGES').split()
>  #    for pkg in poky_pkgs.split():
>  #        newpkg =3D pkg.replace('packagegroup-core', 'packagegroup-core-=
sdk')
>  #
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core=
/psplash/psplash_git.bb
> index 0537426..b0d6bb4 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -16,8 +16,8 @@ SRC_URI =3D "git://git.yoctoproject.org/${BPN} \
>  SPLASH_IMAGES =3D "file://psplash-poky-img.h;outsuffix=3Ddefault"
> =20
>  python __anonymous() {
> -    oldpkgs =3D d.getVar("PACKAGES", True).split()
> -    splashfiles =3D d.getVar('SPLASH_IMAGES', True).split()
> +    oldpkgs =3D d.getVar("PACKAGES").split()
> +    splashfiles =3D d.getVar('SPLASH_IMAGES').split()
>      pkgs =3D []
>      localpaths =3D []
>      haspng =3D False
> @@ -50,8 +50,8 @@ python __anonymous() {
>          d.appendVar("DEPENDS", " gdk-pixbuf-native")
> =20
>      d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
> -    mlprefix =3D d.getVar('MLPREFIX', True) or ''
> -    pn =3D d.getVar('PN', True) or ''
> +    mlprefix =3D d.getVar('MLPREFIX') or ''
> +    pn =3D d.getVar('PN') or ''
>      for p in pkgs:
>          ep =3D '%s%s' % (mlprefix, p)
>          epsplash =3D '%s%s' % (mlprefix, 'psplash')
> @@ -74,11 +74,11 @@ python do_compile () {
>      import shutil
> =20
>      # Build a separate executable for each splash image
> -    workdir =3D d.getVar('WORKDIR', True)
> -    convertscript =3D "%s/make-image-header.sh" % d.getVar('S', True)
> -    destfile =3D "%s/psplash-poky-img.h" % d.getVar('S', True)
> -    localfiles =3D d.getVar('SPLASH_LOCALPATHS', True).split()
> -    outputfiles =3D d.getVar('SPLASH_INSTALL', True).split()
> +    workdir =3D d.getVar('WORKDIR')
> +    convertscript =3D "%s/make-image-header.sh" % d.getVar('S')
> +    destfile =3D "%s/psplash-poky-img.h" % d.getVar('S')
> +    localfiles =3D d.getVar('SPLASH_LOCALPATHS').split()
> +    outputfiles =3D d.getVar('SPLASH_INSTALL').split()
>      for localfile, outputfile in zip(localfiles, outputfiles):
>          if localfile.endswith(".png"):
>              outp =3D oe.utils.getstatusoutput('%s %s POKY' % (convertscr=
ipt, os.path.join(workdir, localfile)))
> @@ -89,7 +89,7 @@ python do_compile () {
>              shutil.copyfile(os.path.join(workdir, localfile), destfile)
>          # For some reason just updating the header is not enough, we hav=
e to touch the .c
>          # file in order to get it to rebuild
> -        os.utime("%s/psplash.c" % d.getVar('S', True), None)
> +        os.utime("%s/psplash.c" % d.getVar('S'), None)
>          bb.build.exec_func("oe_runmake", d)
>          shutil.copyfile("psplash", outputfile)
>  }
> diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core=
/systemd/systemd_230.bb
> index 77b7130..98d3cd9 100644
> --- a/meta/recipes-core/systemd/systemd_230.bb
> +++ b/meta/recipes-core/systemd/systemd_230.bb
> @@ -279,7 +279,7 @@ do_install_ptest () {
>  }
> =20
>  python populate_packages_prepend (){
> -    systemdlibdir =3D d.getVar("rootlibdir", True)
> +    systemdlibdir =3D d.getVar("rootlibdir")
>      do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Sys=
temd %s library', extra_depends=3D'', allow_links=3DTrue)
>  }
>  PACKAGES_DYNAMIC +=3D "^lib(udev|systemd).*"
> @@ -595,6 +595,6 @@ python () {
>          raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
> =20
>      import re
> -    if re.match('.*musl*', d.getVar('TARGET_OS', True)) !=3D None:
> +    if re.match('.*musl*', d.getVar('TARGET_OS')) !=3D None:
>          raise bb.parse.SkipPackage("Not _yet_ supported on musl based ta=
rgets")
>  }
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 70cba6b..21815fb 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -270,7 +270,7 @@ ALTERNATIVE_LINK_NAME[mountpoint] =3D "${base_bindir}=
/mountpoint"
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
>  python do_package_prepend () {
> -    if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
> +    if '--enable-su' in d.getVar('EXTRA_OECONF').split():
>          d.appendVar(d.expand('ALTERNATIVE_${PN}'), ' su')
>          d.appendVar(d.expand('ALTERNATIVE_${PN}-doc'), ' su.1')
> =20
> diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/re=
cipes-core/volatile-binds/volatile-binds.bb
> index fee7275..f07458a 100644
> --- a/meta/recipes-core/volatile-binds/volatile-binds.bb
> +++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
> @@ -46,7 +46,7 @@ do_compile () {
>              -e "s#@whatparent@#${spec%/*}#g; s#@whereparent@#${mountpoin=
t%/*}#g" \
>              volatile-binds.service.in >$servicefile
>      done <<END
> -${@d.getVar('VOLATILE_BINDS', True).replace("\\n", "\n")}
> +${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
>  END
> =20
>      if [ -e var-volatile-lib.service ]; then
> diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devt=
ools/apt/apt-native.inc
> index 9fa206e..68f1b3c 100644
> --- a/meta/recipes-devtools/apt/apt-native.inc
> +++ b/meta/recipes-devtools/apt/apt-native.inc
> @@ -17,14 +17,14 @@ python do_install () {
>  }
> =20
>  python do_install_config () {
> -    indir =3D os.path.dirname(d.getVar('FILE', True))
> +    indir =3D os.path.dirname(d.getVar('FILE'))
>      infile =3D open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
>      data =3D infile.read()
>      infile.close()
> =20
>      data =3D d.expand(data)
> =20
> -    outdir =3D oe.path.join(d.getVar('D', True), d.getVar('sysconfdir', =
True), 'apt')
> +    outdir =3D oe.path.join(d.getVar('D'), d.getVar('sysconfdir'), 'apt')
>      if not os.path.exists(outdir):
>          os.makedirs(outdir)
> =20
> diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-dev=
tools/apt/apt-package.inc
> index a553aa2..6e8cb84 100644
> --- a/meta/recipes-devtools/apt/apt-package.inc
> +++ b/meta/recipes-devtools/apt/apt-package.inc
> @@ -34,9 +34,9 @@ FILES_${PN} =3D "${bindir}/apt-cdrom ${bindir}/apt-get \
>  	       ${localstatedir} ${sysconfdir} \
>  	       ${libdir}/dpkg"
>  FILES_${PN}-utils =3D "${bindir}/apt-sortpkgs ${bindir}/apt-extracttempl=
ates"
> -FILES_${PN}-doc =3D "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages'=
, True))} \
> +FILES_${PN}-doc =3D "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages'=
))} \
>  		   ${docdir}/apt"
> -FILES_${PN}-utils-doc =3D "${@get_files_apt_doc(d, bb, d.getVar('apt-uti=
ls-manpages', True))}"
> +FILES_${PN}-utils-doc =3D "${@get_files_apt_doc(d, bb, d.getVar('apt-uti=
ls-manpages'))}"
>  FILES_${PN}-dev =3D "${libdir}/libapt*.so ${includedir}"
> =20
>  do_install () {
> diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-d=
evtools/automake/automake.inc
> index 4f9b5f7..87cedc9 100644
> --- a/meta/recipes-devtools/automake/automake.inc
> +++ b/meta/recipes-devtools/automake/automake.inc
> @@ -16,6 +16,6 @@ do_configure() {
>  	oe_runconf
>  }
> =20
> -export AUTOMAKE =3D "${@bb.utils.which('automake', d.getVar('PATH', True=
))}"
> +export AUTOMAKE =3D "${@bb.utils.which('automake', d.getVar('PATH'))}"
> =20
>  FILES_${PN} +=3D "${datadir}/automake* ${datadir}/aclocal*"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/reci=
pes-devtools/binutils/binutils-2.27.inc
> index fc81721..cf6a904 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM=3D"\
>      "
> =20
>  def binutils_branch_version(d):
> -    pvsplit =3D d.getVar('PV', True).split('.')
> +    pvsplit =3D d.getVar('PV').split('.')
>      return pvsplit[0] + "_" + pvsplit[1]
> =20
>  BINUPV =3D "${@binutils_branch_version(d)}"
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 75d190f..9b1192b 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -59,9 +59,9 @@ USE_ALTERNATIVES_FOR =3D " \
>  "
> =20
>  python do_package_prepend() {
> -    make_alts =3D d.getVar("USE_ALTERNATIVES_FOR", True) or ""
> -    prefix =3D d.getVar("TARGET_PREFIX", True)
> -    bindir =3D d.getVar("bindir", True)
> +    make_alts =3D d.getVar("USE_ALTERNATIVES_FOR") or ""
> +    prefix =3D d.getVar("TARGET_PREFIX")
> +    bindir =3D d.getVar("bindir")
>      for alt in make_alts.split():
>          d.setVarFlag('ALTERNATIVE_TARGET', alt, bindir + "/" + prefix + =
alt)
>          d.setVarFlag('ALTERNATIVE_LINK_NAME', alt, bindir + "/" + alt)
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
> index fee511f..10577fd 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -9,7 +9,7 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://Copyright.txt;md5=3D052f86c15bbde68af55c7f7=
b340ab639 \
>                      file://Source/cmake.h;beginline=3D1;endline=3D10;md5=
=3D341736dae83c9e344b53eeb1bc7d7bc2"
> =20
> -CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV', True).split('.')[0:2=
])}"
> +CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> =20
>  SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}=
=2Etar.gz \
>             file://support-oe-qt4-tools-names.patch \
> diff --git a/meta/recipes-devtools/cmake/cmake_3.6.2.bb b/meta/recipes-de=
vtools/cmake/cmake_3.6.2.bb
> index 850d6de..8b732e6 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.6.2.bb
> +++ b/meta/recipes-devtools/cmake/cmake_3.6.2.bb
> @@ -10,8 +10,8 @@ SRC_URI_append_class-nativesdk =3D " \
> =20
>  # Strip ${prefix} from ${docdir}, set result into docdir_stripped
>  python () {
> -    prefix=3Dd.getVar("prefix", True)
> -    docdir=3Dd.getVar("docdir", True)
> +    prefix=3Dd.getVar("prefix")
> +    docdir=3Dd.getVar("docdir")
> =20
>      if not docdir.startswith(prefix):
>          bb.fatal('docdir must contain prefix as its prefix')
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/=
dpkg/dpkg.inc
> index e8d8a9b..ff88318 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -13,7 +13,7 @@ inherit autotools gettext perlnative pkgconfig systemd
> =20
>  python () {
>      if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
> -        pn =3D d.getVar('PN', True)
> +        pn =3D d.getVar('PN')
>          d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'dpkg-configure.service')
>  }
> =20
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
> index f540b4d..d17ba29 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -10,35 +10,35 @@ inherit autotools gettext texinfo
>  BPN =3D "gcc"
> =20
>  def get_gcc_float_setting(bb, d):
> -    if d.getVar('ARMPKGSFX_EABI', True) =3D=3D "hf" and d.getVar('TRANSL=
ATED_TARGET_ARCH', True) =3D=3D "arm":
> +    if d.getVar('ARMPKGSFX_EABI') =3D=3D "hf" and d.getVar('TRANSLATED_T=
ARGET_ARCH') =3D=3D "arm":
>          return "--with-float=3Dhard"
> -    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
> +    if d.getVar('TARGET_FPU') in [ 'soft' ]:
>          return "--with-float=3Dsoft"
> -    if d.getVar('TARGET_FPU', True) in [ 'ppc-efd' ]:
> +    if d.getVar('TARGET_FPU') in [ 'ppc-efd' ]:
>          return "--enable-e500_double"
>      return ""
> =20
>  get_gcc_float_setting[vardepvalue] =3D "${@get_gcc_float_setting(bb, d)}"
> =20
>  def get_gcc_mips_plt_setting(bb, d):
> -    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] =
and bb.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
> +    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'mips', 'mipsel' ] and bb=
=2Eutils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
>          return "--with-mips-plt"
>      return ""
> =20
>  def get_gcc_ppc_plt_settings(bb, d):
> -    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc' ] and not=
 bb.utils.contains('DISTRO_FEATURES', 'bssplt', True, False, d):
> +    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc' ] and not bb.ut=
ils.contains('DISTRO_FEATURES', 'bssplt', True, False, d):
>          return "--enable-secureplt"
>      return ""
> =20
>  def get_long_double_setting(bb, d):
> -    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc', 'powerpc=
64' ] and d.getVar('TCLIBC', True) in [ 'uclibc', 'glibc' ]:
> +    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] =
and d.getVar('TCLIBC') in [ 'uclibc', 'glibc' ]:
>          return "--with-long-double-128"
>      else:
>          return "--without-long-double-128"
>      return ""
> =20
>  def get_gcc_multiarch_setting(bb, d):
> -    target_arch =3D d.getVar('TRANSLATED_TARGET_ARCH', True)
> +    target_arch =3D d.getVar('TRANSLATED_TARGET_ARCH')
>      multiarch_options =3D {
>          "i586":    "--enable-targets=3Dall",
>          "i686":    "--enable-targets=3Dall",
> @@ -54,7 +54,7 @@ def get_gcc_multiarch_setting(bb, d):
> =20
>  # this is used by the multilib setup of gcc
>  def get_tune_parameters(tune, d):
> -    availtunes =3D d.getVar('AVAILTUNES', True)
> +    availtunes =3D d.getVar('AVAILTUNES')
>      if tune not in availtunes.split():
>          bb.error('The tune: %s is not one of the available tunes: %s' % =
(tune or None, availtunes))
> =20
> @@ -65,15 +65,15 @@ def get_tune_parameters(tune, d):
> =20
>      retdict =3D {}
>      retdict['tune'] =3D tune
> -    retdict['ccargs'] =3D localdata.getVar('TUNE_CCARGS', True)
> -    retdict['features'] =3D localdata.getVar('TUNE_FEATURES', True)
> +    retdict['ccargs'] =3D localdata.getVar('TUNE_CCARGS')
> +    retdict['features'] =3D localdata.getVar('TUNE_FEATURES')
>      # BASELIB is used by the multilib code to change library paths
> -    retdict['baselib'] =3D localdata.getVar('BASE_LIB', True) or localda=
ta.getVar('BASELIB', True)
> -    retdict['arch'] =3D localdata.getVar('TUNE_ARCH', True)
> -    retdict['abiextension'] =3D localdata.getVar('ABIEXTENSION', True)
> -    retdict['target_fpu'] =3D localdata.getVar('TARGET_FPU', True)
> -    retdict['pkgarch'] =3D localdata.getVar('TUNE_PKGARCH', True)
> -    retdict['package_extra_archs'] =3D localdata.getVar('PACKAGE_EXTRA_A=
RCHS', True)
> +    retdict['baselib'] =3D localdata.getVar('BASE_LIB') or localdata.get=
Var('BASELIB')
> +    retdict['arch'] =3D localdata.getVar('TUNE_ARCH')
> +    retdict['abiextension'] =3D localdata.getVar('ABIEXTENSION')
> +    retdict['target_fpu'] =3D localdata.getVar('TARGET_FPU')
> +    retdict['pkgarch'] =3D localdata.getVar('TUNE_PKGARCH')
> +    retdict['package_extra_archs'] =3D localdata.getVar('PACKAGE_EXTRA_A=
RCHS')
>      return retdict
> =20
>  get_tune_parameters[vardepsexclude] =3D "AVAILTUNES TUNE_CCARGS OVERRIDE=
S TUNE_FEATURES BASE_LIB BASELIB TUNE_ARCH ABIEXTENSION TARGET_FPU TUNE_PKG=
ARCH PACKAGE_EXTRA_ARCHS"
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index ddebbb8..00ef89e 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -23,7 +23,7 @@ GCCMULTILIB ?=3D "--disable-multilib"
>  GCCTHREADS ?=3D "posix"
> =20
>  EXTRA_OECONF =3D "\
> -    ${@['--enable-clocale=3Dgeneric', ''][d.getVar('USE_NLS', True) !=3D=
 'no']} \
> +    ${@['--enable-clocale=3Dgeneric', ''][d.getVar('USE_NLS') !=3D 'no']=
} \
>      --with-gnu-ld \
>      --enable-shared \
>      --enable-languages=3D${LANGUAGES} \
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index cc465a2..c4f7084 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -5,7 +5,7 @@ EXTRADEPENDS =3D ""
>  DEPENDS =3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}li=
bc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
>  PROVIDES =3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
>  python () {
> -    if d.getVar("TARGET_OS", True).startswith("linux"):
> +    if d.getVar("TARGET_OS").startswith("linux"):
>          d.setVar("EXTRADEPENDS", "linux-libc-headers")
>  }
> =20
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/rec=
ipes-devtools/gcc/gcc-multilib-config.inc
> index a0a2ac0..31b8619 100644
> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -21,8 +21,8 @@ python gcc_multilib_setup() {
>      import shutil
>      import glob
> =20
> -    srcdir =3D d.getVar('S', True)
> -    builddir =3D d.getVar('B', True)
> +    srcdir =3D d.getVar('S')
> +    builddir =3D d.getVar('B')
>      src_conf_dir =3D '%s/gcc/config' % srcdir
>      build_conf_dir =3D '%s/gcc/config' % builddir
> =20
> @@ -43,12 +43,12 @@ python gcc_multilib_setup() {
>              bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
>              bb.utils.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
> =20
> -    pn =3D d.getVar('PN', True)
> -    multilibs =3D (d.getVar('MULTILIB_VARIANTS', True) or '').split()
> +    pn =3D d.getVar('PN')
> +    multilibs =3D (d.getVar('MULTILIB_VARIANTS') or '').split()
>      if not multilibs and pn !=3D "nativesdk-gcc":
>          return
> =20
> -    mlprefix =3D d.getVar('MLPREFIX', True)
> +    mlprefix =3D d.getVar('MLPREFIX')
> =20
>      if ('%sgcc' % mlprefix) !=3D pn and (not pn.startswith('gcc-cross-ca=
nadian')) and pn !=3D "nativesdk-gcc":
>          return
> @@ -155,10 +155,10 @@ python gcc_multilib_setup() {
>      libdirn32 =3D 'SYSTEMLIBS_DIR'
> =20
> =20
> -    target_arch =3D (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if =
mlprefix
> -                    else d.getVar('TARGET_ARCH', True))
> +    target_arch =3D (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL') if mlpref=
ix
> +                    else d.getVar('TARGET_ARCH'))
>      if pn =3D=3D "nativesdk-gcc":
> -        header_config_files =3D gcc_header_config_files[d.getVar("SDK_AR=
CH", True)]
> +        header_config_files =3D gcc_header_config_files[d.getVar("SDK_AR=
CH")]
>          write_headers(builddir, header_config_files, libdir32, libdir64,=
 libdirx32, libdirn32)
>          return
> =20
> @@ -188,7 +188,7 @@ python gcc_multilib_setup() {
>      optsets =3D []
> =20
>      for ml in ml_list:
> -        tune =3D d.getVar(ml, True)
> +        tune =3D d.getVar(ml)
>          if not tune:
>              bb.warn("%s doesn't have a corresponding tune. Skipping..." =
% ml)
>              continue
> @@ -212,7 +212,7 @@ python gcc_multilib_setup() {
> =20
>          # take out '-' mcpu=3D's and march=3D's from parameters
>          opts =3D []
> -        whitelist =3D (d.getVar("MULTILIB_OPTION_WHITELIST", True) or ""=
).split()
> +        whitelist =3D (d.getVar("MULTILIB_OPTION_WHITELIST") or "").spli=
t()
>          for i in d.expand(tune_parameters['ccargs']).split():
>              if i in whitelist:
>                  # Need to strip '-' from option
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-d=
evtools/gcc/libgcc-common.inc
> index 8a13f54..74e9faa 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -64,18 +64,18 @@ addtask multilib_install after do_install before do_p=
ackage do_populate_sysroot
>  fakeroot python do_multilib_install() {
>      import re
> =20
> -    multilibs =3D d.getVar('MULTILIB_VARIANTS', True)
> +    multilibs =3D d.getVar('MULTILIB_VARIANTS')
>      if not multilibs or bb.data.inherits_class('nativesdk', d):
>          return
> =20
> -    binv =3D d.getVar('BINV', True)
> +    binv =3D d.getVar('BINV')
> =20
> -    mlprefix =3D d.getVar('MLPREFIX', True)
> -    if ('%slibgcc' % mlprefix) !=3D d.getVar('PN', True):
> +    mlprefix =3D d.getVar('MLPREFIX')
> +    if ('%slibgcc' % mlprefix) !=3D d.getVar('PN'):
>          return
> =20
>      if mlprefix:
> -        orig_tune =3D d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL', True)
> +        orig_tune =3D d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL')
>          orig_tune_params =3D get_tune_parameters(orig_tune, d)
>          orig_tune_baselib =3D orig_tune_params['baselib']
>          orig_tune_bitness =3D orig_tune_baselib.replace('lib', '')
> @@ -83,10 +83,10 @@ fakeroot python do_multilib_install() {
>              orig_tune_bitness =3D '32'
> =20
>          src =3D '../../../' + orig_tune_baselib + '/' + \
> -            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL', True) + '/' + binv =
+ '/'
> +            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL') + '/' + binv + '/'
> =20
> -        dest =3D d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
> -            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + orig_tune_=
bitness
> +        dest =3D d.getVar('D') + d.getVar('libdir') + '/' + \
> +            d.getVar('TARGET_SYS') + '/' + binv + '/' + orig_tune_bitness
> =20
>          if os.path.lexists(dest):
>              os.unlink(dest)
> @@ -95,7 +95,7 @@ fakeroot python do_multilib_install() {
> =20
> =20
>      for ml in multilibs.split():
> -        tune =3D d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True)
> +        tune =3D d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml)
>          if not tune:
>              bb.warn('DEFAULTTUNE_virtclass-multilib-%s is not defined. S=
kipping...' % ml)
>              continue
> @@ -118,11 +118,11 @@ fakeroot python do_multilib_install() {
>              libcextension =3D ''
> =20
>          src =3D '../../../' + tune_baselib + '/' + \
> -            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
> -            '-' + d.getVar('TARGET_OS', True) + libcextension +  '/' + b=
inv + '/'
> +            tune_arch + d.getVar('TARGET_VENDOR') + 'ml' + ml + \
> +            '-' + d.getVar('TARGET_OS') + libcextension +  '/' + binv + =
'/'
> =20
> -        dest =3D d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
> -            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitne=
ss
> +        dest =3D d.getVar('D') + d.getVar('libdir') + '/' + \
> +            d.getVar('TARGET_SYS') + '/' + binv + '/' + tune_bitness
> =20
>          if os.path.lexists(dest):
>              os.unlink(dest)
> @@ -131,7 +131,7 @@ fakeroot python do_multilib_install() {
> =20
>  def get_original_os(d):
>      vendoros =3D d.expand('${TARGET_ARCH}${ORIG_TARGET_VENDOR}-${TARGET_=
OS}')
> -    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSI=
ON', True)]:
> +    for suffix in [d.getVar('ABIEXTENSION'), d.getVar('LIBCEXTENSION')]:
>          if suffix and vendoros.endswith(suffix):
>              vendoros =3D vendoros[:-len(suffix)]
>      # Arm must use linux-gnueabi not linux as only the former is accepte=
d by gcc
> @@ -144,11 +144,11 @@ BASETARGET_SYS =3D "${@get_original_os(d)}"
> =20
>  addtask extra_symlinks after do_multilib_install before do_package do_po=
pulate_sysroot
>  fakeroot python do_extra_symlinks() {
> -    targetsys =3D d.getVar('BASETARGET_SYS', True)
> +    targetsys =3D d.getVar('BASETARGET_SYS')
> =20
> -    if targetsys !=3D d.getVar('TARGET_SYS', True):
> -        dest =3D d.getVar('D', True) + d.getVar('libdir', True) + '/' + =
targetsys
> -        src =3D d.getVar('TARGET_SYS', True)
> -        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', T=
rue) + d.getVar('libdir', True)):
> +    if targetsys !=3D d.getVar('TARGET_SYS'):
> +        dest =3D d.getVar('D') + d.getVar('libdir') + '/' + targetsys
> +        src =3D d.getVar('TARGET_SYS')
> +        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D') +=
 d.getVar('libdir')):
>              os.symlink(src, dest)
>  }
> diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-dev=
tools/gcc/libgfortran.inc
> index 58ceb2e..1943635 100644
> --- a/meta/recipes-devtools/gcc/libgfortran.inc
> +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> @@ -69,7 +69,7 @@ do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}=
libc:do_packagedata"
>  do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}libc:do_packageda=
ta"
> =20
>  python __anonymous () {
> -    f =3D d.getVar("FORTRAN", True)
> +    f =3D d.getVar("FORTRAN")
>      if "fortran" not in f:
>          raise bb.parse.SkipPackage("libgfortran needs fortran support to=
 be enabled in the compiler")
>  }
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/gi=
t/git.inc
> index 753b047..ade99ec 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -46,7 +46,7 @@ do_install () {
>  perl_native_fixup () {
>  	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
>  	       -e 's#${libdir}/perl-native/#${libdir}/#' \
> -	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '=
/')}
> +	    ${@d.getVar("PERLTOOLS").replace(' /',d.getVar('D') + '/')}
> =20
>  	# ${libdir} is not applicable here, perl-native files are always
>  	# installed to /usr/lib on both 32/64 bits targets.
> diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.=
12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.=
0.0.bb
> index 9b65a99..09e10c9 100644
> --- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.=
bb
> +++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.=
bb
> @@ -32,7 +32,7 @@ EXTRA_OECONF +=3D "--disable-gconf --disable-qconf"
> =20
>  # Some packages have the version preceeding the .so instead properly
>  # versioned .so.<version>, so we need to reorder and repackage.
> -SOLIBS =3D "-${@d.getVar('PV', True)[:-2]}.so"
> +SOLIBS =3D "-${@d.getVar('PV')[:-2]}.so"
>  FILES_SOLIBSDEV =3D "${libdir}/libkconfig-parser.so"
> =20
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-dev=
tools/perl/perl_5.22.1.bb
> index 792a65b..6c98cf7 100644
> --- a/meta/recipes-devtools/perl/perl_5.22.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
> @@ -358,7 +358,7 @@ python split_perl_packages () {
>      # perl-modules should recommend every perl module, and only the
>      # modules. Don't attempt to use the result of do_split_packages() as=
 some
>      # modules are manually split (eg. perl-module-unicore).
> -    packages =3D filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGE=
S', True).split())
> +    packages =3D filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGE=
S').split())
>      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
>  }
> =20
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-=
devtools/prelink/prelink_git.bb
> index 0856b1c..4529dbf 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -132,7 +132,7 @@ python do_linkerpaths () {
>  }
> =20
>  python () {
> -    overrides =3D d.getVar("OVERRIDES", True).split(":")
> +    overrides =3D d.getVar("OVERRIDES").split(":")
>      if "class-target" in overrides:
>          bb.build.addtask('do_linkerpaths', 'do_configure', 'do_patch', d)
>  }
> diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/re=
cipes-devtools/python/python-smartpm_git.bb
> index 861910c..6daabf4 100644
> --- a/meta/recipes-devtools/python/python-smartpm_git.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_git.bb
> @@ -97,9 +97,9 @@ do_install_append() {
> =20
>  add_native_wrapper() {
>          create_wrapper ${D}/${bindir}/smart \
> -		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir', True), d.getVar('bindir', True))}/rpm \
> -		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
> -		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir', True), d.getVar('bindir', True))}/locale
> +		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir'), d.getVar('bindir'))}/rpm \
> +		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
> +		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir'), d.getVar('bindir'))}/locale
>  }
> =20
>  do_install_append_class-native() {
> diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-d=
evtools/qemu/qemu-targets.inc
> index a3e46a8..66dd675 100644
> --- a/meta/recipes-devtools/qemu/qemu-targets.inc
> +++ b/meta/recipes-devtools/qemu/qemu-targets.inc
> @@ -4,8 +4,8 @@
> =20
>  def get_qemu_target_list(d):
>      import bb
> -    archs =3D d.getVar('QEMU_TARGETS', True).split()
> -    tos =3D d.getVar('HOST_OS', True)
> +    archs =3D d.getVar('QEMU_TARGETS').split()
> +    tos =3D d.getVar('HOST_OS')
>      softmmuonly =3D ""
>      for arch in ['ppcemb']:
>          if arch in archs:
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devto=
ols/rpm/rpm_5.4.16.bb
> index 182818e..3df4d1f 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> @@ -626,13 +626,13 @@ def multilib_rpmmacros(d):
>      localdata.delVar('TOOLCHAIN_OPTIONS')
> =20
>      # Set 'localdata' values to be consistent with 'd' values.
> -    distromacrodirVal =3D d.getVar('distromacrodir', True)
> -    workdirVal =3D d.getVar('WORKDIR', True)
> -    dval =3D d.getVar('D', True)
> +    distromacrodirVal =3D d.getVar('distromacrodir')
> +    workdirVal =3D d.getVar('WORKDIR')
> +    dval =3D d.getVar('D')
> =20
>      ret =3D gen_arch_macro(localdata)
> =20
> -    variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""
> +    variants =3D d.getVar("MULTILIB_VARIANTS") or ""
>      for item in variants.split():
>          # Load overrides from 'd' to avoid having to reset the value...
>          localdata =3D d.createCopy()
> @@ -656,17 +656,17 @@ def gen_arch_macro(d):
>      val +=3D "\n"
>      val +=3D "# Toolchain configuration\n"
>      val +=3D "%TOOLCHAIN_OPTIONS  %{nil}\n"
> -    val +=3D "%__ar               ${@d.getVar('AR', True).replace('$','%=
')}\n"
> -    val +=3D "%__as               ${@d.getVar('AS', True).replace('$','%=
')}\n"
> -    val +=3D "%__cc               ${@d.getVar('CC', True).replace('$','%=
')}\n"
> -    val +=3D "%__cpp              ${@d.getVar('CPP', True).replace('$','=
%')}\n"
> -    val +=3D "%__cxx              ${@d.getVar('CXX', True).replace('$','=
%')}\n"
> -    val +=3D "%__ld               ${@d.getVar('LD', True).replace('$','%=
')}\n"
> -    val +=3D "%__nm               ${@d.getVar('NM', True).replace('$','%=
')}\n"
> -    val +=3D "%__objcopy          ${@d.getVar('OBJCOPY', True).replace('=
$','%')}\n"
> -    val +=3D "%__objdump          ${@d.getVar('OBJDUMP', True).replace('=
$','%')}\n"
> -    val +=3D "%__ranlib           ${@d.getVar('RANLIB', True).replace('$=
','%')}\n"
> -    val +=3D "%__strip            ${@d.getVar('STRIP', True).replace('$'=
,'%')}\n"
> +    val +=3D "%__ar               ${@d.getVar('AR').replace('$','%')}\n"
> +    val +=3D "%__as               ${@d.getVar('AS').replace('$','%')}\n"
> +    val +=3D "%__cc               ${@d.getVar('CC').replace('$','%')}\n"
> +    val +=3D "%__cpp              ${@d.getVar('CPP').replace('$','%')}\n"
> +    val +=3D "%__cxx              ${@d.getVar('CXX').replace('$','%')}\n"
> +    val +=3D "%__ld               ${@d.getVar('LD').replace('$','%')}\n"
> +    val +=3D "%__nm               ${@d.getVar('NM').replace('$','%')}\n"
> +    val +=3D "%__objcopy          ${@d.getVar('OBJCOPY').replace('$','%'=
)}\n"
> +    val +=3D "%__objdump          ${@d.getVar('OBJDUMP').replace('$','%'=
)}\n"
> +    val +=3D "%__ranlib           ${@d.getVar('RANLIB').replace('$','%')=
}\n"
> +    val +=3D "%__strip            ${@d.getVar('STRIP').replace('$','%')}=
\n"
>      val +=3D "EOF\n"
>      val +=3D "\n"
>      return d.expand(val)
> @@ -674,30 +674,30 @@ def gen_arch_macro(d):
> =20
>  add_native_wrapper() {
>          create_wrapper ${D}/${bindir}/rpm \
> -		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir', True), d.getVar('bindir', True))}/rpm \
> -		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
> -		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir', True), d.getVar('bindir', True))}/locale
> +		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir'), d.getVar('bindir'))}/rpm \
> +		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
> +		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir'), d.getVar('bindir'))}/locale
> =20
>          create_wrapper ${D}/${bindir}/rpm2cpio \
> -		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir', True), d.getVar('bindir', True))}/rpm \
> -		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
> -		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir', True), d.getVar('bindir', True))}/locale
> +		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir'), d.getVar('bindir'))}/rpm \
> +		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
> +		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir'), d.getVar('bindir'))}/locale
> =20
>          create_wrapper ${D}/${bindir}/rpmbuild \
> -		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir', True), d.getVar('bindir', True))}/rpm \
> -		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
> -		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir', True), d.getVar('bindir', True))}/locale
> +		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir'), d.getVar('bindir'))}/rpm \
> +		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
> +		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir'), d.getVar('bindir'))}/locale
> =20
>          create_wrapper ${D}/${bindir}/rpmconstant \
> -		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir', True), d.getVar('bindir', True))}/rpm \
> -		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
> -		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir', True), d.getVar('bindir', True))}/locale
> +		RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('l=
ibdir'), d.getVar('bindir'))}/rpm \
> +		RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
> +		RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar=
('datadir'), d.getVar('bindir'))}/locale
> =20
>  	for rpm_binary in ${D}/${libdir}/rpm/bin/rpm* ${D}/${libdir}/rpm/bin/de=
bugedit; do
>          	create_wrapper $rpm_binary \
> -			RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('=
libdir', True), d.getVar('bindir', True))}/rpm \
> -			RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpat=
h(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
> -			RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVa=
r('datadir', True), d.getVar('bindir', True))}/locale
> +			RPM_USRLIBRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVar('=
libdir'), d.getVar('bindir'))}/rpm \
> +			RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpat=
h(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
> +			RPM_LOCALEDIRRPM=3D'`dirname $''realpath`'/${@os.path.relpath(d.getVa=
r('datadir'), d.getVar('bindir'))}/locale
>  	done
>  }
> =20
> diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/=
swig/swig.inc
> index 704bb27..8cb6fbd 100644
> --- a/meta/recipes-devtools/swig/swig.inc
> +++ b/meta/recipes-devtools/swig/swig.inc
> @@ -54,8 +54,8 @@ do_install_append_class-nativesdk() {
>  }
> =20
>  def swiglib_relpath(d):
> -    swiglib =3D d.getVar('datadir', True) + "/" + d.getVar('BPN', True) =
+ "/" + d.getVar('PV', True)
> -    return os.path.relpath(swiglib, d.getVar('bindir', True))
> +    swiglib =3D d.getVar('datadir') + "/" + d.getVar('BPN') + "/" + d.ge=
tVar('PV')
> +    return os.path.relpath(swiglib, d.getVar('bindir'))
> =20
>  do_install_append_class-native() {
>      create_wrapper ${D}${bindir}/swig SWIG_LIB=3D'`dirname $''realpath`'=
/${@swiglib_relpath(d)}
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/=
vala/vala.inc
> index afa09ec..b338ea0 100644
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -11,7 +11,7 @@ HOMEPAGE =3D "http://vala-project.org"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> =20
> -SHRT_VER =3D "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', T=
rue).split('.')[1]}"
> +SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
=2E')[1]}"
> =20
>  SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/$=
{BP}.tar.xz"
>  inherit autotools pkgconfig upstream-version-is-even
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.12.0.bb
> index 2474bbc..2f55217 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> @@ -42,7 +42,7 @@ COMPATIBLE_HOST_mipsarch =3D "${@bb.utils.contains("TAR=
GET_FPU", "soft", "null", "
>  inherit autotools ptest
> =20
>  EXTRA_OECONF =3D "--enable-tls --without-mpicc"
> -EXTRA_OECONF +=3D "${@['--enable-only32bit','--enable-only64bit'][d.getV=
ar('SITEINFO_BITS', True) !=3D '32']}"
> +EXTRA_OECONF +=3D "${@['--enable-only32bit','--enable-only64bit'][d.getV=
ar('SITEINFO_BITS') !=3D '32']}"
> =20
>  # valgrind checks host_cpu "armv7*)", so we need to over-ride the autoto=
ols.bbclass default --host option
>  EXTRA_OECONF_append_arm =3D " --host=3Darmv7${HOST_VENDOR}-${HOST_OS}"
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index 02b6358..e6d24ee 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -83,7 +83,7 @@ do_install () {
>  python do_package_append() {
>      import subprocess
>      # Change permissions back the way they were, they probably had a rea=
son...
> -    workdir =3D d.getVar('WORKDIR', True)
> +    workdir =3D d.getVar('WORKDIR')
>      subprocess.call('chmod 0511 %s/install/cups/var/run/cups/certs' % wo=
rkdir, shell=3DTrue)
>  }
> =20
> diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extende=
d/man/man_1.6g.bb
> index e78aa18..ff603f8 100644
> --- a/meta/recipes-extended/man/man_1.6g.bb
> +++ b/meta/recipes-extended/man/man_1.6g.bb
> @@ -10,8 +10,8 @@ PR =3D "r1"
>  DEPENDS =3D "groff less"
> =20
>  def compress_pkg(d):
> -    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
> -         compress =3D d.getVar("DOC_COMPRESS", True)
> +    if "compress_doc" in (d.getVar("INHERIT") or "").split():
> +         compress =3D d.getVar("DOC_COMPRESS")
>           if compress =3D=3D "gz":
>               return "gzip"
>           elif compress =3D=3D "bz2":
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/=
recipes-extended/net-tools/net-tools_1.60-26.bb
> index 47a68a5..49a65f8 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> @@ -106,10 +106,10 @@ ALTERNATIVE_LINK_NAME[hostname.1] =3D "${mandir}/ma=
n1/hostname.1"
>  ALTERNATIVE_PRIORITY[hostname.1] =3D "10"
> =20
>  python __anonymous() {
> -	for prog in d.getVar('base_sbindir_progs', True).split():
> -		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
sbindir', True), prog))
> -	for prog in d.getVar('base_bindir_progs', True).split():
> -		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
bindir', True), prog))
> +	for prog in d.getVar('base_sbindir_progs').split():
> +		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
sbindir'), prog))
> +	for prog in d.getVar('base_bindir_progs').split():
> +		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_=
bindir'), prog))
>  }
>  ALTERNATIVE_PRIORITY =3D "100"
> =20
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-c=
mdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdl=
ine.bb
> index a60a68c..d8975f2 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.=
bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.=
bb
> @@ -31,7 +31,7 @@ python __anonymous () {
>      namemap["packagegroup-core-full-cmdline-initscripts"] =3D "packagegr=
oup-core-initscripts"
>      namemap["packagegroup-core-full-cmdline-sys-services"] =3D "packageg=
roup-core-sys-services"
> =20
> -    packages =3D d.getVar("PACKAGES", True).split()
> +    packages =3D d.getVar("PACKAGES").split()
>      for pkg in packages:
>          if pkg.endswith('-dev'):
>              mapped =3D namemap.get(pkg[:-4], None)
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb=
 b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 29564e0..734dda1 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -15,9 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>  # We will skip parsing this packagegeoup for non-glibc systems
>  #
>  python __anonymous () {
> -    if d.getVar('TCLIBC', True) !=3D "glibc":
> +    if d.getVar('TCLIBC') !=3D "glibc":
>          raise bb.parse.SkipPackage("incompatible with %s C library" %
> -                                   d.getVar('TCLIBC', True))
> +                                   d.getVar('TCLIBC'))
>  }
> =20
>  PACKAGES =3D "\
> diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-ext=
ended/pam/libpam_1.3.0.bb
> index bb5a4bd..67b9d53 100644
> --- a/meta/recipes-extended/pam/libpam_1.3.0.bb
> +++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
> @@ -62,7 +62,7 @@ FILES_${PN}-xtests =3D "${datadir}/Linux-PAM/xtests"
>  PACKAGES_DYNAMIC +=3D "^${MLPREFIX}pam-plugin-.*"
> =20
>  def get_multilib_bit(d):
> -    baselib =3D d.getVar('baselib', True) or ''
> +    baselib =3D d.getVar('baselib') or ''
>      return baselib.replace('lib', '')
> =20
>  libpam_suffix =3D "suffix${@get_multilib_bit(d)}"
> @@ -92,30 +92,30 @@ RRECOMMENDS_${PN}_class-native =3D ""
>  python populate_packages_prepend () {
>      def pam_plugin_append_file(pn, dir, file):
>          nf =3D os.path.join(dir, file)
> -        of =3D d.getVar('FILES_' + pn, True)
> +        of =3D d.getVar('FILES_' + pn)
>          if of:
>              nf =3D of + " " + nf
>          d.setVar('FILES_' + pn, nf)
> =20
>      def pam_plugin_hook(file, pkg, pattern, format, basename):
> -        pn =3D d.getVar('PN', True)
> -        libpam_suffix =3D d.getVar('libpam_suffix', True)
> +        pn =3D d.getVar('PN')
> +        libpam_suffix =3D d.getVar('libpam_suffix')
> =20
> -        rdeps =3D d.getVar('RDEPENDS_' + pkg, True)
> +        rdeps =3D d.getVar('RDEPENDS_' + pkg)
>          if rdeps:
>              rdeps =3D rdeps + " " + pn + "-" + libpam_suffix
>          else:
>              rdeps =3D pn + "-" + libpam_suffix
>          d.setVar('RDEPENDS_' + pkg, rdeps)
> =20
> -        provides =3D d.getVar('RPROVIDES_' + pkg, True)
> +        provides =3D d.getVar('RPROVIDES_' + pkg)
>          if provides:
>              provides =3D provides + " " + pkg + "-" + libpam_suffix
>          else:
>              provides =3D pkg + "-" + libpam_suffix
>          d.setVar('RPROVIDES_' + pkg, provides)
> =20
> -    mlprefix =3D d.getVar('MLPREFIX', True) or ''
> +    mlprefix =3D d.getVar('MLPREFIX') or ''
>      dvar =3D bb.data.expand('${WORKDIR}/package', d, True)
>      pam_libdir =3D d.expand('${base_libdir}/security')
>      pam_sbindir =3D d.expand('${sbindir}')
> diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes=
-extended/procps/procps_3.3.12.bb
> index 4ca1a50..1f793b9 100644
> --- a/meta/recipes-extended/procps/procps_3.3.12.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.12.bb
> @@ -57,10 +57,10 @@ ALTERNATIVE_LINK_NAME[kill.1] =3D "${mandir}/man1/kil=
l.1"
>  ALTERNATIVE_LINK_NAME[uptime.1] =3D "${mandir}/man1/uptime.1"
> =20
>  python __anonymous() {
> -    for prog in d.getVar('base_bindir_progs', True).split():
> -        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar(=
'base_bindir', True), prog))
> +    for prog in d.getVar('base_bindir_progs').split():
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar(=
'base_bindir'), prog))
> =20
> -    for prog in d.getVar('base_sbindir_progs', True).split():
> -        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar(=
'base_sbindir', True), prog))
> +    for prog in d.getVar('base_sbindir_progs').split():
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar(=
'base_sbindir'), prog))
>  }
> =20
> diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-=
extended/texinfo/texinfo_6.0.bb
> index 8638bb1..c23c6fc 100644
> --- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
> @@ -11,7 +11,7 @@ PROVIDES_append_class-native =3D " texinfo-replacement-=
native"
> =20
>  def compress_pkg(d):
>      if bb.data.inherits_class('compress_doc', d):
> -         compress =3D d.getVar("DOC_COMPRESS", True)
> +         compress =3D d.getVar("DOC_COMPRESS")
>           if compress =3D=3D "gz":
>               return "gzip"
>           elif compress =3D=3D "bz2":
> diff --git a/meta/recipes-extended/tzdata/tzdata_2016i.bb b/meta/recipes-=
extended/tzdata/tzdata_2016i.bb
> index 3801a3f..46488cd 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2016i.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2016i.bb
> @@ -209,5 +209,5 @@ FILES_${PN} +=3D "${datadir}/zoneinfo/Pacific/Honolul=
u     \
>                  ${datadir}/zoneinfo/iso3166.tab          \
>                  ${datadir}/zoneinfo/Etc/*"
> =20
> -CONFFILES_${PN} +=3D "${@ "${sysconfdir}/timezone" if bb.utils.to_boolea=
n(d.getVar('INSTALL_TIMEZONE_FILE', True)) else "" }"
> +CONFFILES_${PN} +=3D "${@ "${sysconfdir}/timezone" if bb.utils.to_boolea=
n(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
>  CONFFILES_${PN} +=3D "${sysconfdir}/localtime"
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
> index a5ebeca..9efe374 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
> @@ -59,7 +59,7 @@ PACKAGES_DYNAMIC +=3D "^gdk-pixbuf-loader-.*"
>  PACKAGES_DYNAMIC_class-native =3D ""
> =20
>  python populate_packages_prepend () {
> -    postinst_pixbufloader =3D d.getVar("postinst_pixbufloader", True)
> +    postinst_pixbufloader =3D d.getVar("postinst_pixbufloader")
> =20
>      loaders_root =3D d.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders')
> =20
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.48.0.bb
> index abaa485..3ffd05a 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48=
=2E0.bb
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48=
=2E0.bb
> @@ -168,6 +168,6 @@ python gobject_introspection_preconfigure () {
> =20
>  SSTATEPOSTINSTFUNCS +=3D "gobject_introspection_postinst"
>  python gobject_introspection_postinst () {
> -    if d.getVar("BB_CURRENTTASK", True).startswith("populate_sysroot"):
> +    if d.getVar("BB_CURRENTTASK").startswith("populate_sysroot"):
>          oe.utils.write_ld_so_conf(d)
>  }
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
> index 745c6fa..6499ea6 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -125,6 +125,6 @@ python populate_packages_prepend () {
> =20
>      do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$'=
, 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
> =20
> -    if (d.getVar('DEBIAN_NAMES', True)):
> +    if (d.getVar('DEBIAN_NAMES')):
>          d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-3.0')
>  }
> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb b/meta/recipes-gnome=
/gtk+/gtk+_2.24.31.bb
> index 84d0b4d..cc31bab 100644
> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
> @@ -29,6 +29,6 @@ python populate_packages_prepend () {
>      d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immo=
dules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
>      do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$'=
, 'gtk-printbackend-%s', 'GTK printbackend module for %s')
> =20
> -    if (d.getVar('DEBIAN_NAMES', True)):
> +    if (d.getVar('DEBIAN_NAMES')):
>          d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-2.0')
>  }
> diff --git a/meta/recipes-graphics/cairo/cairo-fpu.inc b/meta/recipes-gra=
phics/cairo/cairo-fpu.inc
> index ef72e89..fe7c533 100644
> --- a/meta/recipes-graphics/cairo/cairo-fpu.inc
> +++ b/meta/recipes-graphics/cairo/cairo-fpu.inc
> @@ -1,6 +1,6 @@
> =20
>  def get_cairo_fpu_setting(bb, d):
> -    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
> +    if d.getVar('TARGET_FPU') in [ 'soft' ]:
>          return "--disable-some-floating-point"
>      return ""
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 4ec4961..d04670e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -111,7 +111,7 @@ do_install_append () {
>  # they don't get Debian-renamed (which would remove the -mesa suffix), a=
nd
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
>  python __anonymous() {
> -    pkgconfig =3D (d.getVar('PACKAGECONFIG', True) or "").split()
> +    pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
>      for p in (("egl", "libegl", "libegl1"),
>                ("dri", "libgl", "libgl1"),
>                ("gles", "libgles1", "libglesv1-cm1"),
> @@ -145,7 +145,7 @@ python mesa_populate_packages() {
>          d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa", "mesa-dri", 1=
))
> =20
>      import re
> -    dri_drivers_root =3D oe.path.join(d.getVar('PKGD', True), d.getVar('=
libdir', True), "dri")
> +    dri_drivers_root =3D oe.path.join(d.getVar('PKGD'), d.getVar('libdir=
'), "dri")
>      if os.path.isdir(dri_drivers_root):
>          dri_pkgs =3D os.listdir(dri_drivers_root)
>          lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
> @@ -157,7 +157,7 @@ python mesa_populate_packages() {
>                  d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
>                  d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
> =20
> -    pipe_drivers_root =3D os.path.join(d.getVar('libdir', True), "galliu=
m-pipe")
> +    pipe_drivers_root =3D os.path.join(d.getVar('libdir'), "gallium-pipe=
")
>      do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-dri=
ver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
>  }
> =20
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/m=
eta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index 57a4c82..fe42f11 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -33,8 +33,8 @@ def _add_xorg_abi_depends(d, name):
>      }
> =20
>      output =3D os.popen("pkg-config xorg-server --variable=3D%s" % abis[=
name]).read()
> -    mlprefix =3D d.getVar('MLPREFIX', True) or ''
> +    mlprefix =3D d.getVar('MLPREFIX') or ''
>      abi =3D "%sxorg-abi-%s-%s" % (mlprefix, name, output.split(".")[0])
> =20
> -    pn =3D d.getVar("PN", True)
> +    pn =3D d.getVar("PN")
>      d.appendVar('RDEPENDS_' + pn, ' ' + abi)
> diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb b/meta/recipe=
s-graphics/xorg-lib/libxft_2.3.2.bb
> index a967cdc..b454781 100644
> --- a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
> @@ -28,6 +28,6 @@ XORG_PN =3D "libXft"
>  BBCLASSEXTEND =3D "native"
> =20
>  python () {
> -        if d.getVar('DEBIAN_NAMES', True):
> +        if d.getVar('DEBIAN_NAMES'):
>              d.setVar('PKG_${PN}', '${MLPREFIX}libxft2')
>  }
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index 269fa63..e037996 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -170,10 +170,10 @@ python populate_packages_prepend() {
>                               shell=3DTrue, env=3Dnewenv, stdout=3Dsubpro=
cess.PIPE)
>          stdout, stderr =3D p.communicate()
>          output =3D stdout.decode("utf-8").split(".")[0]
> -        mlprefix =3D d.getVar('MLPREFIX', True) or ''
> +        mlprefix =3D d.getVar('MLPREFIX') or ''
>          return "%sxorg-abi-%s-%s" % (mlprefix, name, output)
> =20
> -    pn =3D d.getVar("PN", True)
> +    pn =3D d.getVar("PN")
>      d.appendVar("RPROVIDES_" + pn, " " + get_abi("input"))
>      d.appendVar("RPROVIDES_" + pn, " " + get_abi("video"))
>  }
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_4.1.bb
> index d15a4dc..928ca44 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>  # to build multiple virtual/kernel providers, e.g. as dependency of
>  # core-image-rt-sdk, core-image-rt.
>  python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=3D "linux-y=
octo-rt":
> +    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-r=
t":
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>  }
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_4.4.bb
> index 27a4fa3..5684661 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>  # to build multiple virtual/kernel providers, e.g. as dependency of
>  # core-image-rt-sdk, core-image-rt.
>  python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=3D "linux-y=
octo-rt":
> +    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-r=
t":
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>  }
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_4.8.bb
> index 26b309d..5049df3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>  # to build multiple virtual/kernel providers, e.g. as dependency of
>  # core-image-rt-sdk, core-image-rt.
>  python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=3D "linux-y=
octo-rt":
> +    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-r=
t":
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>  }
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 09cd1f1..556546f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -12,9 +12,9 @@ INC_PR =3D "r4"
>  # PREFERRED_PROVIDER for virtual/kernel. This avoids network access requ=
ired
>  # by the use of AUTOREV SRCREVs, which are the default for this recipe.
>  python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=3D d.getVar=
("PN", True):
> +    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D d.getVar("PN"):
>          d.delVar("BB_DONT_CACHE")
> -        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to %s to enable it" % (d.getVar("PN", True)))
> +        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to %s to enable it" % (d.getVar("PN")))
>  }
> =20
>  DEPENDS +=3D "xz-native bc-native"
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipe=
s-kernel/lttng/lttng-modules_git.bb
> index 7014541..8a28713 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
> @@ -28,7 +28,7 @@ do_install_append() {
>  }
> =20
>  python do_package_prepend() {
> -    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules=
')):
> -        bb.warn("%s: no modules were created; this may be due to CONFIG_=
TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
> +    if not os.path.exists(os.path.join(d.getVar('D'), 'lib/modules')):
> +        bb.warn("%s: no modules were created; this may be due to CONFIG_=
TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
>  }
> =20
> diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-ke=
rnel/perf/perf-features.inc
> index b8859ab..a4402cc 100644
> --- a/meta/recipes-kernel/perf/perf-features.inc
> +++ b/meta/recipes-kernel/perf/perf-features.inc
> @@ -16,7 +16,7 @@ def perf_feature_enabled(feature, trueval, falseval, d):
>        perf-tui: enable support for the perf TUI (via libnewt)
> =20
>      """
> -    enabled_features =3D d.getVar("PERF_FEATURES_ENABLE", True) or ""
> +    enabled_features =3D d.getVar("PERF_FEATURES_ENABLE") or ""
>      if feature in enabled_features:
>          return trueval
>      return falseval
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 25ae83c..9f0777f 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -203,7 +203,7 @@ do_configure_prepend () {
>  }
> =20
>  python do_package_prepend() {
> -    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
> +    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
>  }
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta/recipes-multimedia/alsa/alsa-fpu.inc b/meta/recipes-mul=
timedia/alsa/alsa-fpu.inc
> index 5040230..1ca31e7 100644
> --- a/meta/recipes-multimedia/alsa/alsa-fpu.inc
> +++ b/meta/recipes-multimedia/alsa/alsa-fpu.inc
> @@ -1,6 +1,6 @@
> =20
>  def get_alsa_fpu_setting(bb, d):
> -	if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
> +	if d.getVar('TARGET_FPU') in [ 'soft' ]:
>  		return "--with-softfloat"
>  	return ""
> =20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/=
meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> index c24493e..3fdb10e 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -3,8 +3,8 @@ PACKAGESPLITFUNCS_append =3D " set_metapkg_rdepends "
> =20
>  python split_gstreamer10_packages () {
>      gst_libdir =3D d.expand('${libdir}/gstreamer-${LIBV}')
> -    postinst =3D d.getVar('plugin_postinst', True)
> -    glibdir =3D d.getVar('libdir', True)
> +    postinst =3D d.getVar('plugin_postinst')
> +    glibdir =3D d.getVar('libdir')
> =20
>      do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer=
 %s library', extra_depends=3D'', allow_links=3DTrue)
>      do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-=
%s'), 'GStreamer plugin for %s', postinst=3Dpostinst, extra_depends=3D'')
> @@ -16,14 +16,14 @@ python split_gstreamer10_packages () {
>  python set_metapkg_rdepends () {
>      import os
> =20
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
>      metapkg =3D  pn + '-meta'
>      d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>      d.setVar('FILES_' + metapkg, "")
>      blacklist =3D [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn + '=
-doc', pn + '-meta' ]
>      metapkg_rdepends =3D []
> -    packages =3D d.getVar('PACKAGES', True).split()
> -    pkgdest =3D d.getVar('PKGDEST', True)
> +    packages =3D d.getVar('PACKAGES').split()
> +    pkgdest =3D d.getVar('PKGDEST')
>      for pkg in packages[1:]:
>          if not pkg in blacklist and not pkg in metapkg_rdepends and not =
pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale=
') and not pkg.count('-staticdev'):
>              # See if the package is empty by looking at the contents of =
its PKGDEST subdirectory.=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
> index 07e5b7d..05562b1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
> @@ -18,7 +18,7 @@ GSTREAMER_1_0_OMX_CORE_NAME ?=3D "${libdir}/libomxil-be=
llagio.so.0"
>  EXTRA_OECONF +=3D "--disable-valgrind --with-omx-target=3D${GSTREAMER_1_=
0_OMX_TARGET}"
> =20
>  python __anonymous () {
> -    omx_target =3D d.getVar("GSTREAMER_1_0_OMX_TARGET", True)
> +    omx_target =3D d.getVar("GSTREAMER_1_0_OMX_TARGET")
>      if omx_target in ['generic', 'bellagio']:
>          # Bellagio headers are incomplete (they are missing the OMX_VERS=
ION_MAJOR,#
>          # OMX_VERSION_MINOR, OMX_VERSION_REVISION, and OMX_VERSION_STEP =
macros);
> @@ -26,7 +26,7 @@ python __anonymous () {
>          d.appendVar("CFLAGS", " -I${S}/omx/openmax")
>      elif omx_target =3D=3D "rpi":
>          # Dedicated Raspberry Pi OpenMAX IL support makes this package m=
achine specific
> -        d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH", True))
> +        d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH"))
>  }
> =20
>  set_omx_core_name() {
> diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-r=
t/images/core-image-rt-sdk.bb
> index 7ddf671..7c1e5bf 100644
> --- a/meta/recipes-rt/images/core-image-rt-sdk.bb
> +++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
> @@ -4,7 +4,7 @@ require recipes-core/images/core-image-minimal.bb
>  # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>  # to build multiple virtual/kernel providers.
>  python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=3D "linux-y=
octo-rt":
> +    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-r=
t":
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>  }
> =20
> diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/im=
ages/core-image-rt.bb
> index 9c86f25..d8bb04a 100644
> --- a/meta/recipes-rt/images/core-image-rt.bb
> +++ b/meta/recipes-rt/images/core-image-rt.bb
> @@ -4,7 +4,7 @@ require recipes-core/images/core-image-minimal.bb
>  # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>  # to build multiple virtual/kernel providers.
>  python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=3D "linux-y=
octo-rt":
> +    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-r=
t":
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>  }
> =20
> diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/=
attr/ea-acl.inc
> index 370e16f..be6ffe5 100644
> --- a/meta/recipes-support/attr/ea-acl.inc
> +++ b/meta/recipes-support/attr/ea-acl.inc
> @@ -23,8 +23,8 @@ FILES_lib${BPN} =3D "${base_libdir}/lib*${SOLIBS}"
> =20
>  BBCLASSEXTEND =3D "native"
>  # Only append ldflags for target recipe and if USE_NLS is enabled
> -LDFLAGS_append_libc-uclibc_class-target =3D "${@['', ' -lintl '][(d.getV=
ar('USE_NLS', True) =3D=3D 'yes')]}"
> -EXTRA_OECONF_append_libc-uclibc_class-target =3D "${@['', ' --disable-ge=
ttext '][(d.getVar('USE_NLS', True) =3D=3D 'no')]}"
> +LDFLAGS_append_libc-uclibc_class-target =3D "${@['', ' -lintl '][(d.getV=
ar('USE_NLS') =3D=3D 'yes')]}"
> +EXTRA_OECONF_append_libc-uclibc_class-target =3D "${@['', ' --disable-ge=
ttext '][(d.getVar('USE_NLS') =3D=3D 'no')]}"
> =20
>  fix_symlink () {
>  	if [ "${BB_CURRENTTASK}" !=3D "populate_sysroot" -a "${BB_CURRENTTASK}"=
 !=3D "populate_sysroot_setscene" ]
> diff --git a/meta/recipes-support/boost/boost-1.62.0.inc b/meta/recipes-s=
upport/boost/boost-1.62.0.inc
> index 1e555e1..1138de6 100644
> --- a/meta/recipes-support/boost/boost-1.62.0.inc
> +++ b/meta/recipes-support/boost/boost-1.62.0.inc
> @@ -7,8 +7,8 @@ HOMEPAGE =3D "http://www.boost.org/"
>  LICENSE =3D "BSL-1.0 & MIT & Python-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d=
31bef20d78c"
> =20
> -BOOST_VER =3D "${@"_".join(d.getVar("PV", True).split("."))}"
> -BOOST_MAJ =3D "${@"_".join(d.getVar("PV", True).split(".")[0:2])}"
> +BOOST_VER =3D "${@"_".join(d.getVar("PV").split("."))}"
> +BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>  BOOST_P =3D "boost_${BOOST_VER}"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.=
tar.bz2"
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
> index 1966d3d..a1a6a90 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -59,7 +59,7 @@ PACKAGES =3D "${PN}-dbg ${BOOST_PACKAGES}"
>  python __anonymous () {
>      packages =3D []
>      extras =3D []
> -    for lib in d.getVar('BOOST_LIBS', True).split( ):
> +    for lib in d.getVar('BOOST_LIBS').split( ):
>          # BJAM does not know '--with-python3' (only --with-python)
>          if lib !=3D "python3":
>              extras.append("--with-%s" % lib)
> @@ -67,10 +67,10 @@ python __anonymous () {
>          packages.append(pkg)
>          if lib =3D=3D "python":
>              # special: python*.so matches python3.so !!
> -            if not d.getVar("FILES_%s" % pkg, True):
> +            if not d.getVar("FILES_%s" % pkg):
>                      d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s.so=
=2E*" % lib)
>          else:
> -            if not d.getVar("FILES_%s" % pkg, True):
> +            if not d.getVar("FILES_%s" % pkg):
>                      d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.s=
o.*" % lib)
>      d.setVar("BOOST_PACKAGES", " ".join(packages))
>      d.setVar("BJAM_EXTRA", " ".join(extras))
> @@ -145,7 +145,7 @@ BJAM_TOOLS   =3D "--ignore-site-config \
>  # use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greate=
r parallelism causes bjam to segfault or to ignore -j
>  # https://svn.boost.org/trac/boost/ticket/7634
>  def get_boost_parallel_make(d):
> -    pm =3D d.getVar('PARALLEL_MAKE', True)
> +    pm =3D d.getVar('PARALLEL_MAKE')
>      if pm:
>          # look for '-j' and throw other options (e.g. '-l') away
>          # because they might have different meaning in bjam
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-suppor=
t/gnutls/gnutls.inc
> index 51b9d2b..4a5c3df 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71391c8e0c1c=
fe68077e7fce3b586283 \
>  DEPENDS =3D "nettle gmp virtual/libiconv"
>  DEPENDS_append_libc-musl =3D " argp-standalone"
> =20
> -SHRT_VER =3D "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', T=
rue).split('.')[1]}"
> +SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
=2E')[1]}"
> =20
>  SRC_URI =3D "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV=
}.tar.xz"
> =20
> diff --git a/meta/recipes-support/icu/icu_57.1.bb b/meta/recipes-support/=
icu/icu_57.1.bb
> index 90c2b82..b8821f9 100644
> --- a/meta/recipes-support/icu/icu_57.1.bb
> +++ b/meta/recipes-support/icu/icu_57.1.bb
> @@ -3,7 +3,7 @@ require icu.inc
>  LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D787d3b37867445c1cdd6f6167b=
d0e347"
> =20
>  def icu_download_version(d):
> -    pvsplit =3D d.getVar('PV', True).split('.')
> +    pvsplit =3D d.getVar('PV').split('.')
>      return pvsplit[0] + "_" + pvsplit[1]
> =20
>  ICU_PV =3D "${@icu_download_version(d)}"
> diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/reci=
pes-support/libiconv/libiconv_1.11.1.bb
> index 6ce4b96..f28e64a 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> @@ -23,7 +23,7 @@ S =3D "${WORKDIR}/libiconv-${PV}"
>  inherit autotools pkgconfig gettext
> =20
>  python __anonymous() {
> -    if d.getVar("TCLIBC", True) =3D=3D "glibc":
> +    if d.getVar("TCLIBC") =3D=3D "glibc":
>          raise bb.parse.SkipPackage("libiconv is provided for use with uC=
libc only - glibc already provides iconv")
>  }
> =20
> diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipe=
s-support/libiconv/libiconv_1.14.bb
> index 1b6fe09..9fd5114 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.14.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
> @@ -23,9 +23,9 @@ S =3D "${WORKDIR}/libiconv-${PV}"
>  inherit autotools pkgconfig gettext
> =20
>  python __anonymous() {
> -    if d.getVar("TARGET_OS", True) !=3D "linux":
> +    if d.getVar("TARGET_OS") !=3D "linux":
>          return
> -    if d.getVar("TCLIBC", True) =3D=3D "glibc":
> +    if d.getVar("TCLIBC") =3D=3D "glibc":
>          raise bb.parse.SkipPackage("libiconv is provided for use with uC=
libc only - glibc already provides iconv")
>  }
> =20
> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-su=
pport/libnl/libnl_3.2.28.bb
> index 26982f3..04e2d18 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
> =20
>  DEPENDS =3D "flex-native bison-native"
> =20
> -SRC_URI =3D "https://github.com/thom311/${BPN}/releases/download/${BPN}$=
{@d.getVar('PV', True).replace('.','_')}/${BP}.tar.gz \
> +SRC_URI =3D "https://github.com/thom311/${BPN}/releases/download/${BPN}$=
{@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
>             file://fix-pktloc_syntax_h-race.patch \
>             file://fix-pc-file.patch \
>             file://0001-lib-add-utility-function-nl_strerror_l.patch \
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.56.0.bb
> index 16c6068..a1f294e 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
> =20
>  DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
> =20
> -SHRT_VER =3D "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', T=
rue).split('.')[1]}"
> +SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
=2E')[1]}"
> =20
>  SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
> =20
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-suppo=
rt/sqlite/sqlite3.inc
> index 5bff33b..3d668c8 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -5,7 +5,7 @@ SECTION =3D "libs"
>  PE =3D "3"
> =20
>  def sqlite_download_version(d):
> -    pvsplit =3D d.getVar('PV', True).split('.')
> +    pvsplit =3D d.getVar('PV').split('.')
>      if len(pvsplit) < 4:
>          pvsplit.append('0')
>      return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1=
:]])
> diff --git a/meta/recipes-support/taglib/taglib_1.11.bb b/meta/recipes-su=
pport/taglib/taglib_1.11.bb
> index c29bda9..7eb7e09 100644
> --- a/meta/recipes-support/taglib/taglib_1.11.bb
> +++ b/meta/recipes-support/taglib/taglib_1.11.bb
> @@ -21,7 +21,7 @@ inherit cmake pkgconfig binconfig-disabled
>  PACKAGES =3D+ "${PN}-c"
>  FILES_${PN}-c =3D "${libdir}/libtag_c.so.*"
> =20
> -EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DLIB_SUFFIX=3D${@d.getVar('=
baselib', True).replace('lib', '')}"
> +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DLIB_SUFFIX=3D${@d.getVar('=
baselib').replace('lib', '')}"
> =20
>  do_configure_prepend () {
>  	rm -f ${S}/admin/ltmain.sh
> diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contri=
b/list-packageconfig-flags.py
> index 389fb97..7ce7186 100755
> --- a/scripts/contrib/list-packageconfig-flags.py
> +++ b/scripts/contrib/list-packageconfig-flags.py
> @@ -76,7 +76,7 @@ def collect_pkgs(data_dict):
>      for fn in data_dict:
>          pkgconfigflags =3D data_dict[fn].getVarFlags("PACKAGECONFIG")
>          pkgconfigflags.pop('doc', None)
> -        pkgname =3D data_dict[fn].getVar("P", True)
> +        pkgname =3D data_dict[fn].getVar("P")
>          pkg_dict[pkgname] =3D sorted(pkgconfigflags.keys())
> =20
>      return pkg_dict
> @@ -124,9 +124,9 @@ def display_all(data_dict):
>      ''' Display all pkgs and PACKAGECONFIG information '''
>      print(str("").ljust(50, '=3D'))
>      for fn in data_dict:
> -        print('%s' % data_dict[fn].getVar("P", True))
> +        print('%s' % data_dict[fn].getVar("P"))
>          print(fn)
> -        packageconfig =3D data_dict[fn].getVar("PACKAGECONFIG", True) or=
 ''
> +        packageconfig =3D data_dict[fn].getVar("PACKAGECONFIG") or ''
>          if packageconfig.strip() =3D=3D '':
>              packageconfig =3D 'None'
>          print('PACKAGECONFIG %s' % packageconfig)
> diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-=
homepage.py
> index d39dd1d..76f1749 100755
> --- a/scripts/contrib/verify-homepage.py
> +++ b/scripts/contrib/verify-homepage.py
> @@ -44,7 +44,7 @@ def verifyHomepage(bbhandler):
>              if realfn in checked:
>                  continue
>              data =3D bbhandler.parse_recipe_file(realfn)
> -            homepage =3D data.getVar("HOMEPAGE", True)
> +            homepage =3D data.getVar("HOMEPAGE")
>              if homepage:
>                  try:
>                      urllib.request.urlopen(homepage, timeout=3D5)
> diff --git a/scripts/devtool b/scripts/devtool
> index 0c32c50..c23999e 100755
> --- a/scripts/devtool
> +++ b/scripts/devtool
> @@ -290,7 +290,7 @@ def main():
>      if global_args.bbpath is None:
>          tinfoil =3D setup_tinfoil(config_only=3DTrue, basepath=3Dbasepat=
h)
>          try:
> -            global_args.bbpath =3D tinfoil.config_data.getVar('BBPATH', =
True)
> +            global_args.bbpath =3D tinfoil.config_data.getVar('BBPATH')
>          finally:
>              tinfoil.shutdown()
> =20
> diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init=
__.py
> index 31ecb65..4348789 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -87,13 +87,13 @@ def exec_watch(cmd, **options):
>  def exec_fakeroot(d, cmd, **kwargs):
>      """Run a command under fakeroot (pseudo, in fact) so that it picks u=
p the appropriate file permissions"""
>      # Grab the command and check it actually exists
> -    fakerootcmd =3D d.getVar('FAKEROOTCMD', True)
> +    fakerootcmd =3D d.getVar('FAKEROOTCMD')
>      if not os.path.exists(fakerootcmd):
>          logger.error('pseudo executable %s could not be found - have you=
 run a build yet? pseudo-native should install this and if you have run any=
 build then that should have been built')
>          return 2
>      # Set up the appropriate environment
>      newenv =3D dict(os.environ)
> -    fakerootenv =3D d.getVar('FAKEROOTENV', True)
> +    fakerootenv =3D d.getVar('FAKEROOTENV')
>      for varvalue in fakerootenv.split():
>          if '=3D' in varvalue:
>              splitval =3D varvalue.split('=3D', 1)
> @@ -191,7 +191,7 @@ def use_external_build(same_dir, no_same_dir, d):
>          logger.info('Using source tree as build directory since --same-d=
ir specified')
>      elif bb.data.inherits_class('autotools-brokensep', d):
>          logger.info('Using source tree as build directory since recipe i=
nherits autotools-brokensep')
> -    elif d.getVar('B', True) =3D=3D os.path.abspath(d.getVar('S', True)):
> +    elif d.getVar('B') =3D=3D os.path.abspath(d.getVar('S')):
>          logger.info('Using source tree as build directory since that wou=
ld be the default for this recipe')
>      else:
>          b_is_s =3D False
> @@ -268,7 +268,7 @@ def ensure_npm(config, basepath, fixed_setup=3DFalse):
>      """
>      tinfoil =3D setup_tinfoil(config_only=3DTrue, basepath=3Dbasepath)
>      try:
> -        nativepath =3D tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE=
', True)
> +        nativepath =3D tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE=
')
>      finally:
>          tinfoil.shutdown()
> =20
> diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/bui=
ld_image.py
> index ae75511..e581038 100644
> --- a/scripts/lib/devtool/build_image.py
> +++ b/scripts/lib/devtool/build_image.py
> @@ -34,8 +34,8 @@ def _get_packages(tinfoil, workspace, config):
>      result =3D []
>      for recipe in workspace:
>          data =3D parse_recipe(config, tinfoil, recipe, True)
> -        if 'class-target' in data.getVar('OVERRIDES', True).split(':'):
> -            if recipe in data.getVar('PACKAGES', True).split():
> +        if 'class-target' in data.getVar('OVERRIDES').split(':'):
> +            if recipe in data.getVar('PACKAGES').split():
>                  result.append(recipe)
>              else:
>                  logger.warning("Skipping recipe %s as it doesn't produce=
 a "
> @@ -95,7 +95,7 @@ def build_image_task(config, basepath, workspace, image=
, add_packages=3DNone, task
>              raise TargetNotImageError()
> =20
>          # Get the actual filename used and strip the .bb and full path
> -        target_basename =3D rd.getVar('FILE', True)
> +        target_basename =3D rd.getVar('FILE')
>          target_basename =3D os.path.splitext(os.path.basename(target_bas=
ename))[0]
>          config.set('SDK', 'target_basename', target_basename)
>          config.write()
> @@ -132,9 +132,9 @@ def build_image_task(config, basepath, workspace, ima=
ge, add_packages=3DNone, task
>                              afile.write('%s\n' % line)
> =20
>              if task in ['populate_sdk', 'populate_sdk_ext']:
> -                outputdir =3D rd.getVar('SDK_DEPLOY', True)
> +                outputdir =3D rd.getVar('SDK_DEPLOY')
>              else:
> -                outputdir =3D rd.getVar('DEPLOY_DIR_IMAGE', True)
> +                outputdir =3D rd.getVar('DEPLOY_DIR_IMAGE')
> =20
>              tmp_tinfoil =3D tinfoil
>              tinfoil =3D None
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index c4c7bf6..df0d298 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -160,7 +160,7 @@ def deploy(args, config, basepath, workspace):
>          except Exception as e:
>              raise DevtoolError('Exception parsing recipe %s: %s' %
>                              (args.recipename, e))
> -        recipe_outdir =3D rd.getVar('D', True)
> +        recipe_outdir =3D rd.getVar('D')
>          if not os.path.exists(recipe_outdir) or not os.listdir(recipe_ou=
tdir):
>              raise DevtoolError('No files to deploy - have you built the =
%s '
>                              'recipe? If so, the install step has not ins=
talled '
> diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package=
=2Epy
> index afb5809..495269a 100644
> --- a/scripts/lib/devtool/package.py
> +++ b/scripts/lib/devtool/package.py
> @@ -34,7 +34,7 @@ def package(args, config, basepath, workspace):
> =20
>          image_pkgtype =3D config.get('Package', 'image_pkgtype', '')
>          if not image_pkgtype:
> -            image_pkgtype =3D tinfoil.config_data.getVar('IMAGE_PKGTYPE'=
, True)
> +            image_pkgtype =3D tinfoil.config_data.getVar('IMAGE_PKGTYPE')
> =20
>          deploy_dir_pkg =3D tinfoil.config_data.getVar('DEPLOY_DIR_%s' % =
image_pkgtype.upper(), True)
>      finally:
> diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu=
=2Epy
> index ae25cee..641664e 100644
> --- a/scripts/lib/devtool/runqemu.py
> +++ b/scripts/lib/devtool/runqemu.py
> @@ -31,8 +31,8 @@ def runqemu(args, config, basepath, workspace):
> =20
>      tinfoil =3D setup_tinfoil(config_only=3DTrue, basepath=3Dbasepath)
>      try:
> -        machine =3D tinfoil.config_data.getVar('MACHINE', True)
> -        bindir_native =3D tinfoil.config_data.getVar('STAGING_BINDIR_NAT=
IVE', True)
> +        machine =3D tinfoil.config_data.getVar('MACHINE')
> +        bindir_native =3D tinfoil.config_data.getVar('STAGING_BINDIR_NAT=
IVE')
>      finally:
>          tinfoil.shutdown()
> =20
> diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
> index 922277b..f629db1 100644
> --- a/scripts/lib/devtool/sdk.py
> +++ b/scripts/lib/devtool/sdk.py
> @@ -132,9 +132,9 @@ def sdk_update(args, config, basepath, workspace):
>      # Grab variable values
>      tinfoil =3D setup_tinfoil(config_only=3DTrue, basepath=3Dbasepath)
>      try:
> -        stamps_dir =3D tinfoil.config_data.getVar('STAMPS_DIR', True)
> -        sstate_mirrors =3D tinfoil.config_data.getVar('SSTATE_MIRRORS', =
True)
> -        site_conf_version =3D tinfoil.config_data.getVar('SITE_CONF_VERS=
ION', True)
> +        stamps_dir =3D tinfoil.config_data.getVar('STAMPS_DIR')
> +        sstate_mirrors =3D tinfoil.config_data.getVar('SSTATE_MIRRORS')
> +        site_conf_version =3D tinfoil.config_data.getVar('SITE_CONF_VERS=
ION')
>      finally:
>          tinfoil.shutdown()
> =20
> @@ -273,7 +273,7 @@ def sdk_install(args, config, basepath, workspace):
>              rd =3D parse_recipe(config, tinfoil, recipe, True)
>              if not rd:
>                  return 1
> -            stampprefixes[recipe] =3D '%s.%s' % (rd.getVar('STAMP', True=
), tasks[0])
> +            stampprefixes[recipe] =3D '%s.%s' % (rd.getVar('STAMP'), tas=
ks[0])
>              if checkstamp(recipe):
>                  logger.info('%s is already installed' % recipe)
>              else:
> diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
> index b44bed7..054985b 100644
> --- a/scripts/lib/devtool/search.py
> +++ b/scripts/lib/devtool/search.py
> @@ -31,7 +31,7 @@ def search(args, config, basepath, workspace):
> =20
>      tinfoil =3D setup_tinfoil(config_only=3DFalse, basepath=3Dbasepath)
>      try:
> -        pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR', True)
> +        pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR')
>          defsummary =3D tinfoil.config_data.getVar('SUMMARY', False) or ''
> =20
>          keyword_rc =3D re.compile(args.keyword)
> @@ -70,7 +70,7 @@ def search(args, config, basepath, workspace):
> =20
>              if match:
>                  rd =3D parse_recipe(config, tinfoil, fn, True)
> -                summary =3D rd.getVar('SUMMARY', True)
> +                summary =3D rd.getVar('SUMMARY')
>                  if summary =3D=3D rd.expand(defsummary):
>                      summary =3D ''
>                  print("%s  %s" % (fn.ljust(20), summary))
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index e4d2a57..77ed492 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -303,7 +303,7 @@ def _check_compatible_recipe(pn, d):
>          raise DevtoolError("The %s recipe is a meta-recipe, and therefor=
e is "
>                             "not supported by this tool" % pn, 4)
> =20
> -    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSR=
C', True):
> +    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSR=
C'):
>          # Not an incompatibility error per se, so we don't pass the erro=
r code
>          raise DevtoolError("externalsrc is currently enabled for the %s "
>                             "recipe. This prevents the normal do_patch ta=
sk "
> @@ -433,7 +433,7 @@ class BbTaskExecutor(object):
>                      self.exec_func(taskdepfunc, True)
>              if report:
>                  logger.info('Executing %s...' % func)
> -            fn =3D self.rdata.getVar('FILE', True)
> +            fn =3D self.rdata.getVar('FILE')
>              localdata =3D bb.build._task_data(fn, func, self.rdata)
>              try:
>                  bb.build.exec_func(func, localdata)
> @@ -452,7 +452,7 @@ class PatchTaskExecutor(BbTaskExecutor):
> =20
>      def exec_func(self, func, report):
>          from oe.patch import GitApplyTree
> -        srcsubdir =3D self.rdata.getVar('S', True)
> +        srcsubdir =3D self.rdata.getVar('S')
>          haspatches =3D False
>          if func =3D=3D 'do_patch':
>              patchdir =3D os.path.join(srcsubdir, 'patches')
> @@ -514,7 +514,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, d):
>      if hasattr(bb.event, 'set_eventfilter'):
>          bb.event.set_eventfilter(eventfilter)
> =20
> -    pn =3D d.getVar('PN', True)
> +    pn =3D d.getVar('PN')
> =20
>      _check_compatible_recipe(pn, d)
> =20
> @@ -552,13 +552,13 @@ def _extract_source(srctree, keep_temp, devbranch, =
sync, d):
>          workdir =3D os.path.join(tempdir, 'workdir')
>          crd.setVar('WORKDIR', workdir)
>          crd.setVar('T', os.path.join(tempdir, 'temp'))
> -        if not crd.getVar('S', True).startswith(workdir):
> +        if not crd.getVar('S').startswith(workdir):
>              # Usually a shared workdir recipe (kernel, gcc)
>              # Try to set a reasonable default
>              if bb.data.inherits_class('kernel', d):
>                  crd.setVar('S', '${WORKDIR}/source')
>              else:
> -                crd.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.get=
Var('S', True)))
> +                crd.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.get=
Var('S')))
>          if bb.data.inherits_class('kernel', d):
>              # We don't want to move the source to STAGING_KERNEL_DIR here
>              crd.setVar('STAGING_KERNEL_DIR', '${S}')
> @@ -575,7 +575,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, d):
>              # Extra step for kernel to populate the source directory
>              logger.info('Doing kernel checkout...')
>              task_executor.exec_func('do_kernel_checkout', False)
> -        srcsubdir =3D crd.getVar('S', True)
> +        srcsubdir =3D crd.getVar('S')
> =20
>          task_executor.check_git =3D True
> =20
> @@ -625,7 +625,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, d):
>                             "doesn't use any source or the correct source=
 "
>                             "directory could not be determined" % pn)
> =20
> -        setup_git_repo(srcsubdir, crd.getVar('PV', True), devbranch, d=
=3Dd)
> +        setup_git_repo(srcsubdir, crd.getVar('PV'), devbranch, d=3Dd)
> =20
>          (stdout, _) =3D bb.process.run('git rev-parse HEAD', cwd=3Dsrcsu=
bdir)
>          initial_rev =3D stdout.rstrip()
> @@ -642,7 +642,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, d):
>              # Store generate and store kernel config
>              logger.info('Generating kernel config')
>              task_executor.exec_func('do_configure', False)
> -            kconfig =3D os.path.join(crd.getVar('B', True), '.config')
> +            kconfig =3D os.path.join(crd.getVar('B'), '.config')
> =20
> =20
>          tempdir_localdir =3D os.path.join(tempdir, 'oe-local-files')
> @@ -674,7 +674,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, d):
> =20
>              shutil.move(srcsubdir, srctree)
> =20
> -            if os.path.abspath(d.getVar('S', True)) =3D=3D os.path.abspa=
th(d.getVar('WORKDIR', True)):
> +            if os.path.abspath(d.getVar('S')) =3D=3D os.path.abspath(d.g=
etVar('WORKDIR')):
>                  # If recipe extracts to ${WORKDIR}, symlink the files in=
to the srctree
>                  # (otherwise the recipe won't build as expected)
>                  local_files_dir =3D os.path.join(srctree, 'oe-local-file=
s')
> @@ -773,7 +773,7 @@ def modify(args, config, basepath, workspace):
>          if not rd:
>              return 1
> =20
> -        pn =3D rd.getVar('PN', True)
> +        pn =3D rd.getVar('PN')
>          if pn !=3D args.recipename:
>              logger.info('Mapping %s to %s' % (args.recipename, pn))
>          if pn in workspace:
> @@ -795,7 +795,7 @@ def modify(args, config, basepath, workspace):
>                  # Error already shown
>                  return 1
> =20
> -        recipefile =3D rd.getVar('FILE', True)
> +        recipefile =3D rd.getVar('FILE')
>          appendfile =3D recipe_to_append(recipefile, config, args.wildcar=
d)
>          if os.path.exists(appendfile):
>              raise DevtoolError("Another variant of recipe %s is already =
in your "
> @@ -832,8 +832,8 @@ def modify(args, config, basepath, workspace):
>                      initial_rev =3D stdout.rstrip()
> =20
>          # Check that recipe isn't using a shared workdir
> -        s =3D os.path.abspath(rd.getVar('S', True))
> -        workdir =3D os.path.abspath(rd.getVar('WORKDIR', True))
> +        s =3D os.path.abspath(rd.getVar('S'))
> +        workdir =3D os.path.abspath(rd.getVar('WORKDIR'))
>          if s.startswith(workdir) and s !=3D workdir and os.path.dirname(=
s) !=3D workdir:
>              # Handle if S is set to a subdirectory of the source
>              srcsubdir =3D os.path.relpath(s, workdir).split(os.sep, 1)[1]
> @@ -914,17 +914,17 @@ def rename(args, config, basepath, workspace):
>          if not rd:
>              return 1
> =20
> -        bp =3D rd.getVar('BP', True)
> -        bpn =3D rd.getVar('BPN', True)
> +        bp =3D rd.getVar('BP')
> +        bpn =3D rd.getVar('BPN')
>          if newname !=3D args.recipename:
>              localdata =3D rd.createCopy()
>              localdata.setVar('PN', newname)
> -            newbpn =3D localdata.getVar('BPN', True)
> +            newbpn =3D localdata.getVar('BPN')
>          else:
>              newbpn =3D bpn
>          s =3D rd.getVar('S', False)
>          src_uri =3D rd.getVar('SRC_URI', False)
> -        pv =3D rd.getVar('PV', True)
> +        pv =3D rd.getVar('PV')
> =20
>          # Correct variable values that refer to the upstream source - th=
ese
>          # values must stay the same, so if the name/version are changing=
 then
> @@ -1325,8 +1325,8 @@ def _export_local_files(srctree, rd, destdir):
>              elif fname !=3D '.gitignore':
>                  added[fname] =3D None
> =20
> -        workdir =3D rd.getVar('WORKDIR', True)
> -        s =3D rd.getVar('S', True)
> +        workdir =3D rd.getVar('WORKDIR')
> +        s =3D rd.getVar('S')
>          if not s.endswith(os.sep):
>              s +=3D os.sep
> =20
> @@ -1348,14 +1348,14 @@ def _export_local_files(srctree, rd, destdir):
> =20
>  def _determine_files_dir(rd):
>      """Determine the appropriate files directory for a recipe"""
> -    recipedir =3D rd.getVar('FILE_DIRNAME', True)
> -    for entry in rd.getVar('FILESPATH', True).split(':'):
> +    recipedir =3D rd.getVar('FILE_DIRNAME')
> +    for entry in rd.getVar('FILESPATH').split(':'):
>          relpth =3D os.path.relpath(entry, recipedir)
>          if not os.sep in relpth:
>              # One (or zero) levels below only, so we don't put anything =
in machine-specific directories
>              if os.path.isdir(entry):
>                  return entry
> -    return os.path.join(recipedir, rd.getVar('BPN', True))
> +    return os.path.join(recipedir, rd.getVar('BPN'))
> =20
> =20
>  def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version,=
 no_remove):
> @@ -1363,7 +1363,7 @@ def _update_recipe_srcrev(srctree, rd, appendlayerd=
ir, wildcard_version, no_remo
>      import bb
>      import oe.recipeutils
> =20
> -    recipefile =3D rd.getVar('FILE', True)
> +    recipefile =3D rd.getVar('FILE')
>      logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipe=
file))
> =20
>      # Get HEAD revision
> @@ -1445,7 +1445,7 @@ def _update_recipe_patch(recipename, workspace, src=
tree, rd, appendlayerdir, wil
>      import bb
>      import oe.recipeutils
> =20
> -    recipefile =3D rd.getVar('FILE', True)
> +    recipefile =3D rd.getVar('FILE')
>      append =3D workspace[recipename]['bbappend']
>      if not os.path.exists(append):
>          raise DevtoolError('unable to find workspace bbappend for recipe=
 %s' %
> @@ -1456,7 +1456,7 @@ def _update_recipe_patch(recipename, workspace, src=
tree, rd, appendlayerdir, wil
>          raise DevtoolError('Unable to find initial revision - please spe=
cify '
>                             'it with --initial-rev')
> =20
> -    dl_dir =3D rd.getVar('DL_DIR', True)
> +    dl_dir =3D rd.getVar('DL_DIR')
>      if not dl_dir.endswith('/'):
>          dl_dir +=3D '/'
> =20
> @@ -1615,7 +1615,7 @@ def update_recipe(args, config, basepath, workspace=
):
>          updated =3D _update_recipe(args.recipename, workspace, rd, args.=
mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev)
> =20
>          if updated:
> -            rf =3D rd.getVar('FILE', True)
> +            rf =3D rd.getVar('FILE')
>              if rf.startswith(config.workspace_path):
>                  logger.warn('Recipe file %s has been updated but is insi=
de the workspace - you will need to move it (and any associated files next =
to it) out to the desired layer before using "devtool reset" in order to ke=
ep any changes' % rf)
>      finally:
> @@ -1719,7 +1719,7 @@ def reset(args, config, basepath, workspace):
> =20
>  def _get_layer(layername, d):
>      """Determine the base layer path for the specified layer name/path"""
> -    layerdirs =3D d.getVar('BBLAYERS', True).split()
> +    layerdirs =3D d.getVar('BBLAYERS').split()
>      layers =3D {os.path.basename(p): p for p in layerdirs}
>      # Provide some shortcuts
>      if layername.lower() in ['oe-core', 'openembedded-core']:
> @@ -1745,7 +1745,7 @@ def finish(args, config, basepath, workspace):
>              return 1
> =20
>          destlayerdir =3D _get_layer(args.destination, tinfoil.config_dat=
a)
> -        origlayerdir =3D oe.recipeutils.find_layerdir(rd.getVar('FILE', =
True))
> +        origlayerdir =3D oe.recipeutils.find_layerdir(rd.getVar('FILE'))
> =20
>          if not os.path.isdir(destlayerdir):
>              raise DevtoolError('Unable to find layer or directory matchi=
ng "%s"' % args.destination)
> @@ -1776,7 +1776,7 @@ def finish(args, config, basepath, workspace):
>              if not destpath:
>                  raise DevtoolError("Unable to determine destination laye=
r path - check that %s specifies an actual layer and %s/conf/layer.conf spe=
cifies BBFILES. You may also need to specify a more complete path." % (args=
=2Edestination, destlayerdir))
>              # Warn if the layer isn't in bblayers.conf (the code to crea=
te a bbappend will do this in other cases)
> -            layerdirs =3D [os.path.abspath(layerdir) for layerdir in rd.=
getVar('BBLAYERS', True).split()]
> +            layerdirs =3D [os.path.abspath(layerdir) for layerdir in rd.=
getVar('BBLAYERS').split()]
>              if not os.path.abspath(destlayerdir) in layerdirs:
>                  bb.warn('Specified destination layer is not currently en=
abled in bblayers.conf, so the %s recipe will now be unavailable in your cu=
rrent configuration until you add the layer there' % args.recipename)
> =20
> @@ -1806,7 +1806,7 @@ def finish(args, config, basepath, workspace):
>              # associated files to the specified layer
>              no_clean =3D True
>              logger.info('Moving recipe file to %s' % destpath)
> -            recipedir =3D os.path.dirname(rd.getVar('FILE', True))
> +            recipedir =3D os.path.dirname(rd.getVar('FILE'))
>              for root, _, files in os.walk(recipedir):
>                  for fn in files:
>                      srcpath =3D os.path.join(root, fn)
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade=
=2Epy
> index a4239f1..86d5561 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -68,7 +68,7 @@ def _remove_patch_dirs(recipefolder):
>              shutil.rmtree(os.path.join(root,d))
> =20
>  def _recipe_contains(rd, var):
> -    rf =3D rd.getVar('FILE', True)
> +    rf =3D rd.getVar('FILE')
>      varfiles =3D oe.recipeutils.get_var_files(rf, [var], rd)
>      for var, fn in varfiles.items():
>          if fn and fn.startswith(os.path.dirname(rf) + os.sep):
> @@ -132,7 +132,7 @@ def _write_append(rc, srctree, same_dir, no_same_dir,=
 rev, copied, workspace, d)
>          if rev:
>              f.write('# initial_rev: %s\n' % rev)
>          if copied:
> -            f.write('# original_path: %s\n' % os.path.dirname(d.getVar('=
FILE', True)))
> +            f.write('# original_path: %s\n' % os.path.dirname(d.getVar('=
FILE')))
>              f.write('# original_files: %s\n' % ' '.join(copied))
>      return af
> =20
> @@ -154,7 +154,7 @@ def _upgrade_error(e, rf, srctree):
>      raise DevtoolError(e)
> =20
>  def _get_uri(rd):
> -    srcuris =3D rd.getVar('SRC_URI', True).split()
> +    srcuris =3D rd.getVar('SRC_URI').split()
>      if not len(srcuris):
>          raise DevtoolError('SRC_URI not found on recipe')
>      # Get first non-local entry in SRC_URI - usually by convention it's
> @@ -185,7 +185,7 @@ def _extract_new_source(newpv, srctree, no_patch, src=
rev, branch, keep_temp, tin
> =20
>      crd =3D rd.createCopy()
> =20
> -    pv =3D crd.getVar('PV', True)
> +    pv =3D crd.getVar('PV')
>      crd.setVar('PV', newpv)
> =20
>      tmpsrctree =3D None
> @@ -270,15 +270,15 @@ def _extract_new_source(newpv, srctree, no_patch, s=
rcrev, branch, keep_temp, tin
>  def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace,=
 tinfoil, rd):
>      """Creates the new recipe under workspace"""
> =20
> -    bpn =3D rd.getVar('BPN', True)
> +    bpn =3D rd.getVar('BPN')
>      path =3D os.path.join(workspace, 'recipes', bpn)
>      bb.utils.mkdirhier(path)
>      copied, _ =3D oe.recipeutils.copy_recipe_files(rd, path)
> =20
> -    oldpv =3D rd.getVar('PV', True)
> +    oldpv =3D rd.getVar('PV')
>      if not newpv:
>          newpv =3D oldpv
> -    origpath =3D rd.getVar('FILE', True)
> +    origpath =3D rd.getVar('FILE')
>      fullpath =3D _rename_recipe_files(origpath, bpn, oldpv, newpv, path)
>      logger.debug('Upgraded %s =3D> %s' % (origpath, fullpath))
> =20
> @@ -341,7 +341,7 @@ def upgrade(args, config, basepath, workspace):
>          if not rd:
>              return 1
> =20
> -        pn =3D rd.getVar('PN', True)
> +        pn =3D rd.getVar('PN')
>          if pn !=3D args.recipename:
>              logger.info('Mapping %s to %s' % (args.recipename, pn))
>          if pn in workspace:
> @@ -353,12 +353,12 @@ def upgrade(args, config, basepath, workspace):
>              srctree =3D standard.get_default_srctree(config, pn)
> =20
>          standard._check_compatible_recipe(pn, rd)
> -        old_srcrev =3D rd.getVar('SRCREV', True)
> +        old_srcrev =3D rd.getVar('SRCREV')
>          if old_srcrev =3D=3D 'INVALID':
>              old_srcrev =3D None
>          if old_srcrev and not args.srcrev:
>              raise DevtoolError("Recipe specifies a SRCREV value; you mus=
t specify a new one when upgrading")
> -        if rd.getVar('PV', True) =3D=3D args.version and old_srcrev =3D=
=3D args.srcrev:
> +        if rd.getVar('PV') =3D=3D args.version and old_srcrev =3D=3D arg=
s.srcrev:
>              raise DevtoolError("Current and upgrade versions are the sam=
e version")
> =20
>          rf =3D None
> diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcm=
ds.py
> index b761a80..0437e64 100644
> --- a/scripts/lib/devtool/utilcmds.py
> +++ b/scripts/lib/devtool/utilcmds.py
> @@ -39,7 +39,7 @@ def edit_recipe(args, config, basepath, workspace):
>              rd =3D parse_recipe(config, tinfoil, args.recipename, True)
>              if not rd:
>                  return 1
> -            recipefile =3D rd.getVar('FILE', True)
> +            recipefile =3D rd.getVar('FILE')
>          finally:
>              tinfoil.shutdown()
>      else:
> @@ -62,20 +62,20 @@ def configure_help(args, config, basepath, workspace):
>          rd =3D parse_recipe(config, tinfoil, args.recipename, appends=3D=
True, filter_workspace=3DFalse)
>          if not rd:
>              return 1
> -        b =3D rd.getVar('B', True)
> -        s =3D rd.getVar('S', True)
> +        b =3D rd.getVar('B')
> +        s =3D rd.getVar('S')
>          configurescript =3D os.path.join(s, 'configure')
>          confdisabled =3D 'noexec' in rd.getVarFlags('do_configure') or '=
do_configure' not in (rd.getVar('__BBTASKS', False) or [])
> -        configureopts =3D oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS=
', True) or '')
> -        extra_oeconf =3D oe.utils.squashspaces(rd.getVar('EXTRA_OECONF',=
 True) or '')
> -        extra_oecmake =3D oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE=
', True) or '')
> -        do_configure =3D rd.getVar('do_configure', True) or ''
> +        configureopts =3D oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS=
') or '')
> +        extra_oeconf =3D oe.utils.squashspaces(rd.getVar('EXTRA_OECONF')=
 or '')
> +        extra_oecmake =3D oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE=
') or '')
> +        do_configure =3D rd.getVar('do_configure') or ''
>          do_configure_noexpand =3D rd.getVar('do_configure', False) or ''
>          packageconfig =3D rd.getVarFlags('PACKAGECONFIG') or []
>          autotools =3D bb.data.inherits_class('autotools', rd) and ('oe_r=
unconf' in do_configure or 'autotools_do_configure' in do_configure)
>          cmake =3D bb.data.inherits_class('cmake', rd) and ('cmake_do_con=
figure' in do_configure)
> -        cmake_do_configure =3D rd.getVar('cmake_do_configure', True)
> -        pn =3D rd.getVar('PN', True)
> +        cmake_do_configure =3D rd.getVar('cmake_do_configure')
> +        pn =3D rd.getVar('PN')
>      finally:
>          tinfoil.shutdown()
> =20
> diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/ap=
pend.py
> index 1e0fc1e..575c5dc 100644
> --- a/scripts/lib/recipetool/append.py
> +++ b/scripts/lib/recipetool/append.py
> @@ -48,7 +48,7 @@ def find_target_file(targetpath, d, pkglist=3DNone):
>      """Find the recipe installing the specified target path, optionally =
limited to a select list of packages"""
>      import json
> =20
> -    pkgdata_dir =3D d.getVar('PKGDATA_DIR', True)
> +    pkgdata_dir =3D d.getVar('PKGDATA_DIR')
> =20
>      # The mix between /etc and ${sysconfdir} here may look odd, but it i=
s just
>      # being consistent with usage elsewhere
> @@ -123,8 +123,8 @@ def determine_file_source(targetpath, rd):
>      import oe.recipeutils
> =20
>      # See if it's in do_install for the recipe
> -    workdir =3D rd.getVar('WORKDIR', True)
> -    src_uri =3D rd.getVar('SRC_URI', True)
> +    workdir =3D rd.getVar('WORKDIR')
> +    src_uri =3D rd.getVar('SRC_URI')
>      srcfile =3D ''
>      modpatches =3D []
>      elements =3D check_do_install(rd, targetpath)
> @@ -203,7 +203,7 @@ def get_source_path(cmdelements):
> =20
>  def get_func_deps(func, d):
>      """Find the function dependencies of a shell function"""
> -    deps =3D bb.codeparser.ShellParser(func, logger).parse_shell(d.getVa=
r(func, True))
> +    deps =3D bb.codeparser.ShellParser(func, logger).parse_shell(d.getVa=
r(func))
>      deps |=3D set((d.getVarFlag(func, "vardeps", True) or "").split())
>      funcdeps =3D []
>      for dep in deps:
> @@ -213,12 +213,12 @@ def get_func_deps(func, d):
> =20
>  def check_do_install(rd, targetpath):
>      """Look at do_install for a command that installs/copies the specifi=
ed target path"""
> -    instpath =3D os.path.abspath(os.path.join(rd.getVar('D', True), targ=
etpath.lstrip('/')))
> -    do_install =3D rd.getVar('do_install', True)
> +    instpath =3D os.path.abspath(os.path.join(rd.getVar('D'), targetpath=
=2Elstrip('/')))
> +    do_install =3D rd.getVar('do_install')
>      # Handle where do_install calls other functions (somewhat crudely, b=
ut good enough for this purpose)
>      deps =3D get_func_deps('do_install', rd)
>      for dep in deps:
> -        do_install =3D do_install.replace(dep, rd.getVar(dep, True))
> +        do_install =3D do_install.replace(dep, rd.getVar(dep))
> =20
>      # Look backwards through do_install as we want to catch where a late=
r line (perhaps
>      # from a bbappend) is writing over the top
> @@ -335,12 +335,12 @@ def appendfile(args):
>  def appendsrc(args, files, rd, extralines=3DNone):
>      import oe.recipeutils
> =20
> -    srcdir =3D rd.getVar('S', True)
> -    workdir =3D rd.getVar('WORKDIR', True)
> +    srcdir =3D rd.getVar('S')
> +    workdir =3D rd.getVar('WORKDIR')
> =20
>      import bb.fetch
>      simplified =3D {}
> -    src_uri =3D rd.getVar('SRC_URI', True).split()
> +    src_uri =3D rd.getVar('SRC_URI').split()
>      for uri in src_uri:
>          if uri.endswith(';'):
>              uri =3D uri[:-1]
> @@ -353,7 +353,7 @@ def appendsrc(args, files, rd, extralines=3DNone):
>      for newfile, srcfile in files.items():
>          src_destdir =3D os.path.dirname(srcfile)
>          if not args.use_workdir:
> -            if rd.getVar('S', True) =3D=3D rd.getVar('STAGING_KERNEL_DIR=
', True):
> +            if rd.getVar('S') =3D=3D rd.getVar('STAGING_KERNEL_DIR'):
>                  srcdir =3D os.path.join(workdir, 'git')
>                  if not bb.data.inherits_class('kernel-yocto', rd):
>                      logger.warn('S =3D=3D STAGING_KERNEL_DIR and non-ker=
nel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/git=
')
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
> index ab26531..0801223 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -68,8 +68,8 @@ class RecipeHandler(object):
>              return
>          # First build up library->package mapping
>          shlib_providers =3D oe.package.read_shlib_providers(d)
> -        libdir =3D d.getVar('libdir', True)
> -        base_libdir =3D d.getVar('base_libdir', True)
> +        libdir =3D d.getVar('libdir')
> +        base_libdir =3D d.getVar('base_libdir')
>          libpaths =3D list(set([base_libdir, libdir]))
>          libname_re =3D re.compile('^lib(.+)\.so.*$')
>          pkglibmap =3D {}
> @@ -85,7 +85,7 @@ class RecipeHandler(object):
>                          logger.debug('unable to extract library name fro=
m %s' % lib)
> =20
>          # Now turn it into a library->recipe mapping
> -        pkgdata_dir =3D d.getVar('PKGDATA_DIR', True)
> +        pkgdata_dir =3D d.getVar('PKGDATA_DIR')
>          for libname, pkg in pkglibmap.items():
>              try:
>                  with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as =
f:
> @@ -109,9 +109,9 @@ class RecipeHandler(object):
>          '''Build up development file->recipe mapping'''
>          if RecipeHandler.recipeheadermap:
>              return
> -        pkgdata_dir =3D d.getVar('PKGDATA_DIR', True)
> -        includedir =3D d.getVar('includedir', True)
> -        cmakedir =3D os.path.join(d.getVar('libdir', True), 'cmake')
> +        pkgdata_dir =3D d.getVar('PKGDATA_DIR')
> +        includedir =3D d.getVar('includedir')
> +        cmakedir =3D os.path.join(d.getVar('libdir'), 'cmake')
>          for pkg in glob.glob(os.path.join(pkgdata_dir, 'runtime', '*-dev=
')):
>              with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
>                  pn =3D None
> @@ -140,9 +140,9 @@ class RecipeHandler(object):
>          '''Build up native binary->recipe mapping'''
>          if RecipeHandler.recipebinmap:
>              return
> -        sstate_manifests =3D d.getVar('SSTATE_MANIFESTS', True)
> -        staging_bindir_native =3D d.getVar('STAGING_BINDIR_NATIVE', True)
> -        build_arch =3D d.getVar('BUILD_ARCH', True)
> +        sstate_manifests =3D d.getVar('SSTATE_MANIFESTS')
> +        staging_bindir_native =3D d.getVar('STAGING_BINDIR_NATIVE')
> +        build_arch =3D d.getVar('BUILD_ARCH')
>          fileprefix =3D 'manifest-%s-' % build_arch
>          for fn in glob.glob(os.path.join(sstate_manifests, '%s*-native.p=
opulate_sysroot' % fileprefix)):
>              with open(fn, 'r') as f:
> @@ -837,7 +837,7 @@ def get_license_md5sums(d, static_only=3DFalse):
>      md5sums =3D {}
>      if not static_only:
>          # Gather md5sums of license files in common license dir
> -        commonlicdir =3D d.getVar('COMMON_LICENSE_DIR', True)
> +        commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
>          for fn in os.listdir(commonlicdir):
>              md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn=
))
>              md5sums[md5value] =3D fn
> @@ -1007,7 +1007,7 @@ def split_pkg_licenses(licvalues, packages, outline=
s, fallback_licenses=3DNone, pn
>      return outlicenses
> =20
>  def read_pkgconfig_provides(d):
> -    pkgdatadir =3D d.getVar('PKGDATA_DIR', True)
> +    pkgdatadir =3D d.getVar('PKGDATA_DIR')
>      pkgmap =3D {}
>      for fn in glob.glob(os.path.join(pkgdatadir, 'shlibs2', '*.pclist')):
>          with open(fn, 'r') as f:
> @@ -1117,7 +1117,7 @@ def convert_rpm_xml(xmlfile):
> =20
> =20
>  def check_npm(d, debugonly=3DFalse):
> -    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE',=
 True), 'npm')):
> +    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE')=
, 'npm')):
>          log_error_cond('npm required to process specified source, but np=
m is not available - you need to build nodejs-native first', debugonly)
>          sys.exit(14)
> =20
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
> index e41d81a..53902ab 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -532,11 +532,11 @@ class PythonRecipeHandler(RecipeHandler):
> =20
>      def parse_pkgdata_for_python_packages(self):
>          suffixes =3D [t[0] for t in imp.get_suffixes()]
> -        pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR', True)
> +        pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR')
> =20
>          ldata =3D tinfoil.config_data.createCopy()
>          bb.parse.handle('classes/python-dir.bbclass', ldata, True)
> -        python_sitedir =3D ldata.getVar('PYTHON_SITEPACKAGES_DIR', True)
> +        python_sitedir =3D ldata.getVar('PYTHON_SITEPACKAGES_DIR')
> =20
>          dynload_dir =3D os.path.join(os.path.dirname(python_sitedir), 'l=
ib-dynload')
>          python_dirs =3D [python_sitedir + os.sep,
> diff --git a/scripts/lib/recipetool/create_kernel.py b/scripts/lib/recipe=
tool/create_kernel.py
> index 7dac59f..ca4996c 100644
> --- a/scripts/lib/recipetool/create_kernel.py
> +++ b/scripts/lib/recipetool/create_kernel.py
> @@ -41,7 +41,7 @@ class KernelRecipeHandler(RecipeHandler):
>          handled.append('buildsystem')
>          del lines_after[:]
>          del classes[:]
> -        template =3D os.path.join(tinfoil.config_data.getVar('COREBASE',=
 True), 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
> +        template =3D os.path.join(tinfoil.config_data.getVar('COREBASE')=
, 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
>          def handle_var(varname, origvalue, op, newlines):
>              if varname in ['SRCREV', 'SRCREV_machine']:
>                  while newlines[-1].startswith('#'):
> @@ -85,7 +85,7 @@ class KernelRecipeHandler(RecipeHandler):
>              elif varname =3D=3D 'COMPATIBLE_MACHINE':
>                  while newlines[-1].startswith('#'):
>                      del newlines[-1]
> -                machine =3D tinfoil.config_data.getVar('MACHINE', True)
> +                machine =3D tinfoil.config_data.getVar('MACHINE')
>                  return machine, op, 0, True
>              return origvalue, op, 0, True
>          with open(template, 'r') as f:
> diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetoo=
l/create_npm.py
> index 7bb844c..888aa2b 100644
> --- a/scripts/lib/recipetool/create_npm.py
> +++ b/scripts/lib/recipetool/create_npm.py
> @@ -49,7 +49,7 @@ class NpmRecipeHandler(RecipeHandler):
> =20
>      def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_bef=
ore):
>          try:
> -            runenv =3D dict(os.environ, PATH=3Dtinfoil.config_data.getVa=
r('PATH', True))
> +            runenv =3D dict(os.environ, PATH=3Dtinfoil.config_data.getVa=
r('PATH'))
>              bb.process.run('npm shrinkwrap', cwd=3Dsrctree, stderr=3Dsub=
process.STDOUT, env=3Drunenv, shell=3DTrue)
>          except bb.process.ExecutionError as e:
>              logger.warn('npm shrinkwrap failed:\n%s' % e.stdout)
> @@ -62,7 +62,7 @@ class NpmRecipeHandler(RecipeHandler):
>          lines_before.append('NPM_SHRINKWRAP :=3D "${THISDIR}/${PN}/npm-s=
hrinkwrap.json"')
> =20
>      def _lockdown(self, srctree, localfilesdir, extravalues, lines_befor=
e):
> -        runenv =3D dict(os.environ, PATH=3Dtinfoil.config_data.getVar('P=
ATH', True))
> +        runenv =3D dict(os.environ, PATH=3Dtinfoil.config_data.getVar('P=
ATH'))
>          if not NpmRecipeHandler.lockdownpath:
>              NpmRecipeHandler.lockdownpath =3D tempfile.mkdtemp('recipeto=
ol-npm-lockdown')
>              bb.process.run('npm install lockdown --prefix %s' % NpmRecip=
eHandler.lockdownpath,
> @@ -257,7 +257,7 @@ class NpmRecipeHandler(RecipeHandler):
>          if version !=3D '*' and not '/' in version:
>              pkgfullname +=3D "@'%s'" % version
>          logger.debug(2, "Calling getdeps on %s" % pkg)
> -        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH', True))
> +        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
>          fetchcmd =3D "npm view %s --json" % pkgfullname
>          output, _ =3D bb.process.run(fetchcmd, stderr=3Dsubprocess.STDOU=
T, env=3Drunenv, shell=3DTrue)
>          data =3D self._parse_view(output)
> diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool=
/newappend.py
> index fbdd7bc..ccfb726 100644
> --- a/scripts/lib/recipetool/newappend.py
> +++ b/scripts/lib/recipetool/newappend.py
> @@ -72,7 +72,7 @@ def newappend(args):
>      if not path_ok:
>          logger.warn('Unable to determine correct subdirectory path for b=
bappend file - check that what %s adds to BBFILES also matches .bbappend fi=
les. Using %s for now, but until you fix this the bbappend will not be appl=
ied.', os.path.join(args.destlayer, 'conf', 'layer.conf'), os.path.dirname(=
append_path))
> =20
> -    layerdirs =3D [os.path.abspath(layerdir) for layerdir in rd.getVar('=
BBLAYERS', True).split()]
> +    layerdirs =3D [os.path.abspath(layerdir) for layerdir in rd.getVar('=
BBLAYERS').split()]
>      if not os.path.abspath(args.destlayer) in layerdirs:
>          logger.warn('Specified layer is not currently enabled in bblayer=
s.conf, you will need to add it before this bbappend will be active')
> =20
> diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> index 5ccc027..d95ccb0 100644
> --- a/scripts/lib/scriptutils.py
> +++ b/scripts/lib/scriptutils.py
> @@ -89,7 +89,7 @@ def fetch_uri(d, uri, destdir, srcrev=3DNone):
>          fetcher.download()
>          for u in fetcher.ud:
>              ud =3D fetcher.ud[u]
> -            if ud.localpath.rstrip(os.sep) =3D=3D localdata.getVar('DL_D=
IR', True).rstrip(os.sep):
> +            if ud.localpath.rstrip(os.sep) =3D=3D localdata.getVar('DL_D=
IR').rstrip(os.sep):
>                  raise Exception('Local path is download directory - plea=
se check that the URI "%s" is correct' % uri)
>          fetcher.unpack(destdir)
>          for u in fetcher.ud:
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index dbffd6a..11af391 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -570,7 +570,7 @@ def main():
>          logger.debug('Found bitbake path: %s' % bitbakepath)
>          tinfoil =3D tinfoil_init()
>          try:
> -            args.pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR=
', True)
> +            args.pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR=
')
>          finally:
>              tinfoil.shutdown()
>          logger.debug('Value of PKGDATA_DIR is "%s"' % args.pkgdata_dir)
> diff --git a/scripts/recipetool b/scripts/recipetool
> index 1052cd2..75d80a6 100755
> --- a/scripts/recipetool
> +++ b/scripts/recipetool
> @@ -79,7 +79,7 @@ def main():
>      tinfoil =3D tinfoil_init(False)
>      try:
>          for path in ([scripts_path] +
> -                    tinfoil.config_data.getVar('BBPATH', True).split(':'=
)):
> +                    tinfoil.config_data.getVar('BBPATH').split(':')):
>              pluginpath =3D os.path.join(path, 'lib', 'recipetool')
>              scriptutils.load_plugins(logger, plugins, pluginpath)
> =20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWD1GdAAKCRA3VSO3ZXaA
HB0TAJ94wLdS+3emF5Qf9YIaI47mn3N7wQCffXBoQk/MXNk+oPezfxp2jYE1x7E=
=M+/W
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
