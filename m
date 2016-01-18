Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 443306FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:39:49 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id uo6so425502468pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=rosyziWDUI2lcNqSD5fR1iUL9ltIYtrFowJB4xhL5Io=;
	b=KyDvECWjTUcUtq9U33aG8SNK/PuGGm63sBiDy3Kx6YuQv6Y9bAv50Ka+SkSkefhhTK
	sPy/pH5A5UY16qm+OA9UmvxCtU7+UBWI42wNQTAHPC032+UKT/Y2xD7NXHlUmQdlgCv2
	JomBqlKPViSb9YOIRjQryQ1rA3gq7A7wAOq24ikTDOina9r5Vl7C3HtoBx5FTUTrq0dl
	+NqYxBsXbLs1zfxYL6DAeLSYWjv8V4ii5VPITvv5cgH3WQ8wSY65+JMhU2fWoYSL29tj
	iZhrDNjNbyRvZa0czWNdZ8uYAxtm9i1L8Rt7T9DEK7Z9TUEWlrXxGxnZU1u4TKi0g+UD
	si/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=rosyziWDUI2lcNqSD5fR1iUL9ltIYtrFowJB4xhL5Io=;
	b=AyHJT2IsqOp6szE7PvoDkOcDbkf3HrMm6zOIxLMfETZLCMsyx+ywdD39bGuqdz6DL8
	sLgSIyBANPKn/Vx/BNDYV4y3EVsHkUyUhq+FGWTAcA5E/gsmEdIN8Ssqm/JhSpVqMd9L
	usLuVObZ4yIJhOt4KDtfwwL8yv7hhMxDcLqTzcjo11/OBT3CkhNErWt/b+u91T96YBf4
	9gO8maSP4bq+AMBWomgGsmWzTWoPsQzvr3WiR96drzZni0Ifp1BnowSRy7KUaA3hdqbv
	9M3yVOHm8B0DKX3e3FWjJVYPRmmjmgeJbL1KsbudvrWRzb2HxySVZOmOjWVStp4/kUDx
	r+KA==
X-Gm-Message-State: ALoCoQkJDOv9A7jK6GxqnUIbpLjDQE9tAzFEW7Zjc/iPoQjf7EPeLJsUvNEOOXgxmgdRRxIAJuecrZM7EyeTmvcQoadduzcd4A==
X-Received: by 10.67.24.33 with SMTP id if1mr39645606pad.137.1453153189988;
	Mon, 18 Jan 2016 13:39:49 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3558:fa03:50c:331?
	([2601:646:8802:5d5c:3558:fa03:50c:331])
	by smtp.gmail.com with ESMTPSA id
	v71sm36088004pfi.91.2016.01.18.13.39.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 13:39:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
Date: Mon, 18 Jan 2016 13:39:44 -0800
Message-Id: <FAC68523-1EDE-437C-A130-944AA15A2024@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCH 00/73] musl fixes part 3 & 4 combined
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
X-List-Received-Date: Mon, 18 Jan 2016 21:39:49 -0000
X-Groupsio-MsgNum: 76363
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F8113472-A904-47C5-A955-E7887AD20160";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F8113472-A904-47C5-A955-E7887AD20160
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 17, 2016, at 3:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
> This patchset rebases the last pull request on top of latest master
> since lot of recipes went in and the patches wont apply straight
>=20
> core-image-weston/core-image-sato/core-image-full-cmdline build for
> all qemu machines work well.
>=20
> No regressions seen on glibc based world builds
>=20
> Here are some of world build results for qemu (musl)
>=20
> http://errors.yoctoproject.org/Errors/Build/11636/
> http://errors.yoctoproject.org/Errors/Build/11637/
> http://errors.yoctoproject.org/Errors/Build/11638/
>=20
> more to follow as the run finishes
>=20
> One patch is for upgrading uclibc to 1.0.11
>=20
> The following changes since commit =
b3b679d5be86f73d1a06c7230cb00872f0a407b5:
>=20

For glibc I see 1 issue on qemuarm which is valgrind and I think Andre =
wanted to
send a patch to fix it since valgrind won=E2=80=99t work on arm < v7 =
without patching.
Another issue on ppc kernel is due to 2.26 binutils/gas upgrade, I have =
sent
and email about that separately besides that all world builds are clean.

uclibc/qemu runs

Building world for qemuarm/uclibc...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11654/
Building world for qemuarm64/uclibc...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11655/
Building world for qemux86/uclibc...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11657/
Building world for qemux86-64/uclibc...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11658/
Building world for qemumips/uclibc...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11660/
Building world for qemuppc/uclibc...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11661/


musl/qemu world builds


---------------------------------------------------------------------
Building world for qemuarm/musl ...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11636/
---------------------------------------------------------------------
Building world for qemuarm64/musl ...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11637/
---------------------------------------------------------------------
Building world for qemux86/musl ...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11638/
---------------------------------------------------------------------
Building world for qemux86-64/musl ...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11640/
---------------------------------------------------------------------
Building world for qemumips/musl ...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11641/
---------------------------------------------------------------------
Building world for qemuppc/musl ...
Your entry can be found here: =
http://errors.yoctoproject.org/Errors/Build/11645/

>  openssh: update to 7.1p2 (2016-01-15 15:44:51 +0000)
>=20
> are available in the git repository at:
>=20
>  git://github.com/kraj/openembedded-core kraj/musl-fixes
>  https://github.com/kraj/openembedded-core/tree/kraj/musl-fixes
>=20
> Khem Raj (72):
>  powertop: Include right headers for timval struct
>  blktrace: Include <sys/types.h for dev_t
>  ppp: Fix build with musl
>  tcp-wrappers: Fix build with musl
>  fts: Add recipe
>  connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
>  libcgroup: Add dependency on fts when building on musl
>  linux-libc-headers: Port patches for linux-headers for musl
>  xserver-xorg: Fix build with musl
>  gdk-pixbuf: Fix latent build  issue exposed by musl
>  argp-standalone: Add recipe
>  gnutls: Link with libargp on musl and depend on argp-standalone
>  util-linux: Fix ptest builds on musl
>  elfutils: Fix build with uclibc/musl
>  systemd: Update and fix build with uclibc
>  packagegroup-self-hosted.bb: Move glibc-gconv-ibm850 to glibc only
>    case
>  guile: Fix build with uclibc
>  gnutls: Link with libuargp on uclibc
>  mtools: Fix build with uclibc
>  parted: Fix build with uclibc
>  net-tools: Link with libintl on uclibc
>  libdrm: Upgrade 2.4.65 -> 2.4.66
>  directfb: Fix build with musl
>  gzip: Fix build with musl
>  watchdog: Fix build with musl
>  xinetd: Fix build with musl
>  dpkg: Add musleabi to known architectures
>  puzzles: Zero'ise structs before use
>  apt: Add support for building for musl targets
>  libunwind: backtrace APIs are glibc specific
>  babeltrace: Add missing header for MAXNAMLEN define
>  sysklogd: untangle header inclusion maze
>  console-tools: Include sys/types.h for u_char and u_short defs
>  webkitgtk: Fix build with clang/musl
>  rt-tests: Fix build with non-gcc compilers
>  tar: Fix build for musl based targets
>  pax: Fix build with musl
>  iputils: Use member based initialization for mrghdr struct
>  libuser: Fix build when secure getenv is not there
>  iproute2: Fix build with musl
>  irda-utils: Fix header inclusions
>  nspr: Drop older glibc code
>  chkconfig: Avoid using caddr_t
>  tcf-agent: Implement canonicalize_file_name() for musl as well
>  bsd-headers,musl: Add recipe for bsd missing features
>  nfs-utils: Disable tcp-wrappers for musl
>  portmap: Point to tirpc headers and libraries on musl
>  systemd: Skip parsing on musl based targets
>  libsolv: Update to 0.6.17+
>  db: Use cross libtool
>  kexec-tools: Define _GNU_SOURCE for getting loff_t definition
>  pcmciautils: Fix parallel build and include sys/types.h
>  btrfs-tools: Disable backtrace on musl
>  apmd: Fix build with musl
>  nss: Undefine HAVE_SYS_CDEFS_H
>  dosfstools: Correct cross-compile CFLAGS and fix build with musl
>  fts: Fix linker hash-style option
>  musl: Create ld.so as a relative symlink
>  bsd-headers: Package cdefs.h
>  guile: Fix build with musl
>  unfs3: Depend on libtirpc when building on musl
>  uclibc: Update to 1.0.11
>  acpid: Fix build on musl
>  grub: Backport fix for largefile detection/use
>  console-tools: Fix header inclusion when not using glibc
>  gpgme: Define __error_t_defined on musl
>  mdadm: Fix build with musl
>  eglinfo: Fix build on raspberrypi
>  puzzles: Silence warning on arm with clang
>  binutils: Fix gold linking errors due to unresolved R_ARM_MOVW_ABS_NC
>  syslinux: Set LD to avoid using build host ld
>  glib-2.0: Fix locale location on musl
>=20
> Ross Burton (1):
>  oprofile: fix build with musl
>=20
> meta/recipes-bsp/acpid/acpid.inc                   |    2 +
> ...1-Define-isfdtype-if-libc-doesn-t-have-it.patch |   62 +
> ...-config.h-from-builddir-instead-of-srcdir.patch |   51 +
> meta/recipes-bsp/apmd/apmd/wexitcode.patch         |   26 +
> meta/recipes-bsp/apmd/apmd_3.2.2-15.bb             |    1 +
> ...ct-_llseek-code-and-require-long-filesyst.patch |   80 +
> meta/recipes-bsp/grub/grub-efi_2.00.bb             |    2 +
> ...-mfpmath-sse-as-well-when-SSE-is-disabled.patch |   46 +
> ...1-grub.d-10_linux.in-add-oe-s-kernel-name.patch |   56 +
> meta/recipes-bsp/grub/grub2.inc                    |    1 +
> meta/recipes-bsp/grub/grub_2.00.bb                 |    2 +
> meta/recipes-bsp/grub/grub_git.bb                  |   13 +-
> .../0001-fix-a-parallel-building-issue.patch       |   18 +-
> .../pcmciautils-018/lex_sys_types.patch            |   21 +
> meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |    1 +
> .../0003-Fix-header-inclusions-for-musl.patch      |   79 +-
> .../iproute2/iproute2/iproute2-4.3.0-musl.patch    |   97 +
> .../iproute2/iproute2_4.3.0.bb                     |    1 +
> .../irda-utils/irda-utils-0.9.18/musl.patch        |   29 +
> .../irda-utils/irda-utils_0.9.18.bb                |    1 +
> .../nfs-utils/nfs-utils_1.3.3.bb                   |    1 +
> meta/recipes-connectivity/portmap/portmap_6.0.bb   |    4 +
> .../ppp/ppp/0001-Fix-build-with-musl.patch         |  163 +
> meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |    3 +
> meta/recipes-core/bsd-headers/bsd-headers.bb       |   27 +
> .../bsd-headers/bsd-headers/sys-cdefs.h            |   26 +
> .../bsd-headers/bsd-headers/sys-queue.h            |  846 +++
> .../bsd-headers/bsd-headers/sys-tree.h             |  761 +++
> .../0001-Cover-the-else-with-__GLIBC__.patch       |   51 +
> ...clude-sys-types.h-for-u_char-and-u_short-.patch |   44 +
> .../console-tools/console-tools_0.3.2.bb           |    4 +
> meta/recipes-core/fts/fts.bb                       |   45 +
> .../fts/fts/fts-header-correctness.patch           |   25 +
> meta/recipes-core/fts/fts/fts-uclibc.patch         |   50 +
> meta/recipes-core/fts/fts/gcc5.patch               | 1368 +++++
> meta/recipes-core/fts/fts/remove_cdefs.patch       |   69 +
> meta/recipes-core/fts/fts/stdint.patch             |   15 +
> ...{uclibc.patch =3D> uclibc_musl_translation.patch} |   20 +-
> meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb      |    2 +-
> meta/recipes-core/glib-2.0/glib.inc                |    4 +
> .../libcgroup/libcgroup/musl-decls-compat.patch    |  235 +
> meta/recipes-core/libcgroup/libcgroup_0.41.bb      |    4 +
> ...dynamic-linker-a-relative-symlink-to-libc.patch |   34 +
> meta/recipes-core/musl/musl_git.bb                 |    4 +-
> .../packagegroups/packagegroup-self-hosted.bb      |    2 +-
> .../systemd/0001-define-exp10-if-missing.patch     |    4 +-
> ...r-getty-to-agetty-in-console-setup-system.patch |    4 +-
> ...pper-instead-of-looking-for-relative-opti.patch |   61 +
> ...v-when-secure-versions-are-not-available.patch} |   21 +-
> ...c-Change-the-default-device-timeout-to-2.patch} |    4 +-
> ...-install-dependency-links-at-install-tim.patch} |    6 +-
> ...eck-for-additional-features-that-uclibc-.patch} |   12 +-
> ...n-Use-execvpe-only-when-libc-supports-it.patch} |    4 +-
> ...unimplemented-_SC_PHYS_PAGES-system-conf.patch} |    4 +-
> ...010-implment-systemd-sysv-install-for-OE.patch} |    4 +-
> ...es-Build-conditionally-when-HAVE_MYHOSTN.patch} |    6 +-
> ...patch =3D> 0012-rules-whitelist-hd-devices.patch} |    4 +-
> ...or-add-support-for-executing-scripts-und.patch} |    4 +-
> ...-Make-root-s-home-directory-configurable.patch} |   14 +-
> ...015-systemd-user-avoid-using-system-auth.patch} |    4 +-
> ...vert-rules-remove-firmware-loading-rules.patch} |    4 +-
> ...remove-userspace-firmware-loading-suppor.patch} |   16 +-
> ...sing.h-for-getting-secure_getenv-definiti.patch |   25 +
> ...il-don-t-fail-if-libc-doesn-t-support-IDN.patch |   34 +
> meta/recipes-core/systemd/systemd_228.bb           |   50 +-
> meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
> .../uclibc-git/0003-Add-argp-implementation.patch  | 5811 =
--------------------
> .../util-linux/uuid-test-error-api.patch           |   92 +
> meta/recipes-core/util-linux/util-linux_2.27.1.bb  |    1 +
> meta/recipes-devtools/apt/apt.inc                  |    1 +
> ....mak-musl-based-systems-can-generate-shar.patch |   29 +
> meta/recipes-devtools/apt/apt_1.0.10.1.bb          |    3 +-
> meta/recipes-devtools/binutils/binutils-2.25.1.inc |    1 +
> ...h-adds-IFUNC-support-for-arm-gold-backend.patch | 1004 ++++
> ...001-btrfs-corrupt-blocks-Include-limits.h.patch |   34 +
> .../btrfs-tools/btrfs-tools_4.3.1.bb               |    3 +
> .../0001-mkfs.fat-fix-incorrect-int-type.patch     |   46 +
> .../dosfstools/dosfstools/largefile.patch          |   19 +
> .../dosfstools/dosfstools_3.0.28.bb                |    7 +-
> ...0006-add-musleabi-to-known-target-tripets.patch |   42 +
> meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |    3 +-
> ...de-alternatives-for-glibc-assumptions-hel.patch | 1161 ++++
> .../elfutils/elfutils-0.164/aarch64_uio.patch      |   47 +
> .../elfutils/elfutils-0.164/shadow.patch           |   23 +
> .../elfutils/elfutils-0.164/uclibc-support.patch   |  129 +
> .../elfutils/elfutils/mempcpy.patch                |   24 -
> meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    1 -
> meta/recipes-devtools/elfutils/elfutils_0.164.bb   |   13 +-
> ...guile-Check-for-strtol_l-during-configure.patch |   56 +
> .../guile/files/remove_strcase_l_funcs.patch       |   38 +
> meta/recipes-devtools/guile/guile_2.0.11.bb        |   13 +
> meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    3 +
> meta/recipes-devtools/syslinux/syslinux_6.03.bb    |    4 +-
> ...nonicalize_file_name-is-specific-to-glibc.patch |   46 +
> meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    1 +
> meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb   |    8 +-
> .../chkconfig/chkconfig/replace_caddr_t.patch      |   33 +
> .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    4 +-
> meta/recipes-extended/gzip/gzip.inc                |    7 +
> .../files/0001-Fix-header-inclusion-for-musl.patch |   92 +
> .../0001-Intialize-struct-elements-by-name.patch   |   52 +
> meta/recipes-extended/iputils/iputils_s20151218.bb |    2 +
> meta/recipes-extended/libsolv/libsolv_git.bb       |    4 +-
> .../libuser/libuser/0001-Check-for-issetugid.patch |   62 +
> .../libuser/0002-remove-unused-execinfo.h.patch    |   27 +
> meta/recipes-extended/libuser/libuser_0.62.bb      |    4 +-
> .../0001-Define-_POSIX_C_SOURCE-if-undefined.patch |   59 +
> meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |    2 +-
> .../net-tools/net-tools/musl-fixes.patch           |  100 +
> .../net-tools/net-tools_1.60-26.bb                 |    3 +-
> meta/recipes-extended/parted/parted_3.2.bb         |    3 +-
> .../pax/pax/0001-Fix-build-with-musl.patch         | 1287 +++++
> .../pax/0001-use-strtoll-instead-of-strtoq.patch   |   33 +
> meta/recipes-extended/pax/pax_3.4.bb               |   10 +
> .../sysklogd/files/0001-Fix-build-with-musl.patch  |  132 +
> meta/recipes-extended/sysklogd/sysklogd.inc        |    1 +
> meta/recipes-extended/tar/tar/musl_dirent.patch    |   19 +
> meta/recipes-extended/tar/tar_1.28.bb              |    6 +
> .../tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch |   31 +
> .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +
> ...d-issues-found-with-non-glibc-C-libraries.patch |   99 +
> meta/recipes-extended/watchdog/watchdog_5.14.bb    |    8 +-
> ...se-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch |  100 +
> meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    5 +
> .../gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch      |   63 +
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb |    1 +
> meta/recipes-graphics/directfb/directfb.inc        |    3 +
> .../directfb/directfb/compar_fn_t.patch            |   62 +
> .../directfb/directfb/union-sigval.patch           |   19 +
> .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     |  116 +
> ...tests-kms-steal-crtc-Include-sys-select.h.patch |   33 +
> .../recipes-graphics/drm/libdrm/installtests.patch |   24 +-
> .../drm/{libdrm_2.4.65.bb =3D> libdrm_2.4.66.bb}     |    8 +-
> meta/recipes-graphics/eglinfo/eglinfo.inc          |    4 +-
> ...GING_INCDIR-to-searchpath-for-egl-headers.patch |   34 +
> .../xserver-xorg/musl-arm-inb-outb.patch           |   18 +
> .../xorg-xserver/xserver-xorg_1.18.0.bb            |    4 +-
> ...-include-sys-types.h-for-dev_t-definition.patch |   30 +
> meta/recipes-kernel/blktrace/blktrace_git.bb       |    4 +-
> .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     |   31 +
> meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb    |    1 +
> ...mpat.h-fix-some-issues-arising-from-in6.h.patch |   82 +
> ...t.h-prevent-redefinition-of-struct-ethhdr.patch |   59 +
> ...remove-inclusion-of-sysinfo.h-in-kernel.h.patch |   32 +
> .../linux-libc-headers/linux-libc-headers_4.1.bb   |    5 +
> ...Include-sys-param.h-for-MAXNAMLEN-definti.patch |   29 +
> meta/recipes-kernel/lttng/babeltrace_1.3.1.bb      |    5 +-
> meta/recipes-kernel/oprofile/oprofile.inc          |    2 +
> meta/recipes-kernel/oprofile/oprofile/musl.patch   |   46 +
> ...0001-include-rquired-headers-for-typedefs.patch |   47 +
> meta/recipes-kernel/powertop/powertop_2.8.bb       |    4 +-
> ...t-CC-AR-variable-only-if-it-doesn-t-have-.patch |   30 +
> meta/recipes-rt/rt-tests/rt-tests_0.96.bb          |    3 +-
> ...1-palisade-Fix-warnings-with-clang-on-arm.patch |   72 +
> ...mpiler-errors-about-uninitialized-use-of-.patch |   32 +
> meta/recipes-sato/puzzles/puzzles_git.bb           |    2 +
> ...nable-backtrace-on-linux-when-using-glibc.patch |   39 +
> ...x-build-with-non-glibc-libraries-on-linux.patch |   61 +
> meta/recipes-sato/webkit/webkitgtk/clang.patch     |   25 +
> meta/recipes-sato/webkit/webkitgtk_2.10.4.bb       |    3 +
> .../argp-standalone/argp-standalone_1.3.bb         |   28 +
> .../files/0001-throw-in-funcdef.patch              |   84 +
> .../argp-standalone/files/0002-isprint.patch       |   51 +
> meta/recipes-support/db/db_5.3.28.bb               |    1 +
> meta/recipes-support/db/db_6.0.30.bb               |    1 +
> meta/recipes-support/gnutls/gnutls.inc             |    5 +-
> meta/recipes-support/gpgme/gpgme_1.5.4.bb          |    1 +
> ...-backtrace-Use-only-with-glibc-and-uclibc.patch |   45 +
> meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
> ...001-Remove-the-check-for-LINUX-glibc-case.patch |   35 +
> meta/recipes-support/nspr/nspr_4.11.bb             |    9 +
> meta/recipes-support/nss/nss_3.19.2.bb             |    4 +
> 172 files changed, 10817 insertions(+), 6019 deletions(-)
> create mode 100644 =
meta/recipes-bsp/acpid/acpid/0001-Define-isfdtype-if-libc-doesn-t-have-it.=
patch
> create mode 100644 =
meta/recipes-bsp/acpid/acpid/0001-Use-config.h-from-builddir-instead-of-sr=
cdir.patch
> create mode 100644 meta/recipes-bsp/apmd/apmd/wexitcode.patch
> create mode 100644 =
meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-lo=
ng-filesyst.patch
> create mode 100644 =
meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-i=
s-disabled.patch
> create mode 100644 =
meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-nam=
e.patch
> create mode 100644 =
meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch
> create mode 100644 =
meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
> create mode 100644 =
meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
> create mode 100644 =
meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
> create mode 100644 meta/recipes-core/bsd-headers/bsd-headers.bb
> create mode 100644 =
meta/recipes-core/bsd-headers/bsd-headers/sys-cdefs.h
> create mode 100644 =
meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h
> create mode 100644 =
meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h
> create mode 100644 =
meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-wi=
th-__GLIBC__.patch
> create mode 100644 =
meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-=
sys-types.h-for-u_char-and-u_short-.patch
> create mode 100644 meta/recipes-core/fts/fts.bb
> create mode 100644 =
meta/recipes-core/fts/fts/fts-header-correctness.patch
> create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patch
> create mode 100644 meta/recipes-core/fts/fts/gcc5.patch
> create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.patch
> create mode 100644 meta/recipes-core/fts/fts/stdint.patch
> rename meta/recipes-core/glib-2.0/glib-2.0/{uclibc.patch =3D> =
uclibc_musl_translation.patch} (51%)
> create mode 100644 =
meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
> create mode 100644 =
meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-t=
o-libc.patch
> create mode 100644 =
meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-=
for-relative-opti.patch
> rename =
meta/recipes-core/systemd/systemd/{0003-Use-getenv-when-secure-versions-ar=
e-not-available.patch =3D> =
0004-Use-getenv-when-secure-versions-are-not-available.patch} (56%)
> rename =
meta/recipes-core/systemd/systemd/{0004-core-device.c-Change-the-default-d=
evice-timeout-to-2.patch =3D> =
0005-core-device.c-Change-the-default-device-timeout-to-2.patch} (88%)
> rename =
meta/recipes-core/systemd/systemd/{0005-binfmt-Don-t-install-dependency-li=
nks-at-install-tim.patch =3D> =
0006-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (92%)
> rename =
meta/recipes-core/systemd/systemd/{0006-configure-Check-for-additional-fea=
tures-that-uclibc-.patch =3D> =
0007-configure-Check-for-additional-features-that-uclibc-.patch} (72%)
> rename =
meta/recipes-core/systemd/systemd/{0007-nspawn-Use-execvpe-only-when-libc-=
supports-it.patch =3D> =
0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch} (89%)
> rename =
meta/recipes-core/systemd/systemd/{0008-util-bypass-unimplemented-_SC_PHYS=
_PAGES-system-conf.patch =3D> =
0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch} (90%)
> rename =
meta/recipes-core/systemd/systemd/{0009-implment-systemd-sysv-install-for-=
OE.patch =3D> 0010-implment-systemd-sysv-install-for-OE.patch} (91%)
> rename =
meta/recipes-core/systemd/systemd/{0010-nss-mymachines-Build-conditionally=
-when-HAVE_MYHOSTN.patch =3D> =
0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch} (83%)
> rename =
meta/recipes-core/systemd/systemd/{0011-rules-whitelist-hd-devices.patch =
=3D> 0012-rules-whitelist-hd-devices.patch} (91%)
> rename =
meta/recipes-core/systemd/systemd/{0012-sysv-generator-add-support-for-exe=
cuting-scripts-und.patch =3D> =
0013-sysv-generator-add-support-for-executing-scripts-und.patch} (98%)
> rename =
meta/recipes-core/systemd/systemd/{0013-Make-root-s-home-directory-configu=
rable.patch =3D> 0014-Make-root-s-home-directory-configurable.patch} =
(95%)
> rename =
meta/recipes-core/systemd/systemd/{0014-systemd-user-avoid-using-system-au=
th.patch =3D> 0015-systemd-user-avoid-using-system-auth.patch} (87%)
> rename =
meta/recipes-core/systemd/systemd/{0015-Revert-rules-remove-firmware-loadi=
ng-rules.patch =3D> =
0016-Revert-rules-remove-firmware-loading-rules.patch} (84%)
> rename =
meta/recipes-core/systemd/systemd/{0016-Revert-udev-remove-userspace-firmw=
are-loading-suppor.patch =3D> =
0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (96%)
> create mode 100644 =
meta/recipes-core/systemd/systemd/0018-include-missing.h-for-getting-secur=
e_getenv-definiti.patch
> create mode 100644 =
meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-does=
n-t-support-IDN.patch
> delete mode 100644 =
meta/recipes-core/uclibc/uclibc-git/0003-Add-argp-implementation.patch
> create mode 100644 =
meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
> create mode 100644 =
meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-=
generate-shar.patch
> create mode 100644 =
meta/recipes-devtools/binutils/binutils/0016-This-patch-adds-IFUNC-support=
-for-arm-gold-backend.patch
> create mode 100644 =
meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-In=
clude-limits.h.patch
> create mode 100644 =
meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-in=
t-type.patch
> create mode 100644 =
meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
> create mode 100644 =
meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.=
patch
> create mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.164/0001-build-Provide-alternati=
ves-for-glibc-assumptions-hel.patch
> create mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.164/aarch64_uio.patch
> create mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.164/shadow.patch
> create mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.164/uclibc-support.patch
> delete mode 100644 =
meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
> create mode 100644 =
meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-=
configure.patch
> create mode 100644 =
meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
> create mode 100644 =
meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-s=
pecific-to-glibc.patch
> create mode 100644 =
meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
> create mode 100644 =
meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.pat=
ch
> create mode 100644 =
meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name=
.patch
> create mode 100644 =
meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch
> create mode 100644 =
meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch
> create mode 100644 =
meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined=
.patch
> create mode 100644 =
meta/recipes-extended/net-tools/net-tools/musl-fixes.patch
> create mode 100644 =
meta/recipes-extended/pax/pax/0001-Fix-build-with-musl.patch
> create mode 100644 =
meta/recipes-extended/pax/pax/0001-use-strtoll-instead-of-strtoq.patch
> create mode 100644 =
meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch
> create mode 100644 meta/recipes-extended/tar/tar/musl_dirent.patch
> create mode 100644 =
meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
> create mode 100644 =
meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-n=
on-glibc-C-libraries.patch
> create mode 100644 =
meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H=
-to-guard-sys-resou.patch
> create mode 100644 =
meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
> create mode 100644 =
meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
> create mode 100644 =
meta/recipes-graphics/directfb/directfb/union-sigval.patch
> create mode 100644 =
meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
> create mode 100644 =
meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-sel=
ect.h.patch
> rename meta/recipes-graphics/drm/{libdrm_2.4.65.bb =3D> =
libdrm_2.4.66.bb} (86%)
> create mode 100644 =
meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-=
for-egl-headers.patch
> create mode 100644 =
meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch
> create mode 100644 =
meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-d=
efinition.patch
> create mode 100644 =
meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE=
.patch
> create mode 100644 =
meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat=
.h-fix-some-issues-arising-from-in6.h.patch
> create mode 100644 =
meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat=
.h-prevent-redefinition-of-struct-ethhdr.patch
> create mode 100644 =
meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-incl=
usion-of-sysinfo.h-in-kernel.h.patch
> create mode 100644 =
meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-f=
or-MAXNAMLEN-definti.patch
> create mode 100644 meta/recipes-kernel/oprofile/oprofile/musl.patch
> create mode 100644 =
meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typ=
edefs.patch
> create mode 100644 =
meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it=
-doesn-t-have-.patch
> create mode 100644 =
meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-a=
rm.patch
> create mode 100644 =
meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninit=
ialized-use-of-.patch
> create mode 100644 =
meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-usi=
ng-glibc.patch
> create mode 100644 =
meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries=
-on-linux.patch
> create mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch
> create mode 100644 =
meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
> create mode 100644 =
meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
> create mode 100644 =
meta/recipes-support/argp-standalone/files/0002-isprint.patch
> create mode 100644 =
meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-=
glibc-and-uclibc.patch
> create mode 100644 =
meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.=
patch
>=20
> --
> 2.7.0
>=20


--Apple-Mail=_F8113472-A904-47C5-A955-E7887AD20160
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAladW6QACgkQuwUzVZGdMxQRkACfR5QGa/MlOzplBS6t7XOsjV27
x8AAn1ybEX5FBN9Zl7Z8Ay6+e5k/b7yR
=aPE2
-----END PGP SIGNATURE-----

--Apple-Mail=_F8113472-A904-47C5-A955-E7887AD20160--
