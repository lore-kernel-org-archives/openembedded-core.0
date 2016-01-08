Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3D030731FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:09 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id o11so348653546qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bJ5lYMI+SbAHZSn/5aXJgOvj66BIu17DCG6n9zDclJ8=;
	b=hlCveANrIymoOCZzCe8yzfiIeH//I6z/zrmmsmjYp6mQXMkHtBKTURK9FoPK7q7Po/
	t1k5JTRUrM4Q2klE3HRqWWV4CSANCoPEAeXgLWkiV9M4ltxVJXooP/9GHDMzSvmt1rnA
	MB0wkBtLcBPW/E9wJrVahy9enDtiI6QZTwmDxecDJR48MjVFiFcK+nOVDaATBqBcZ9Ey
	vq8rJTYbska+kZ+F1+nWdWOgwcK1GkHk+acL7BUadQmrl2gEiVpHJK9t5KgOXQVXkql4
	oRicOAejzBRIDtDLNLA9HsVHX8MW7ucAIJ+NtMJprEJjjKhBdYYP+AaZlgdYzwvJyGun
	wGLQ==
X-Received: by 10.140.92.215 with SMTP id b81mr132394406qge.44.1452248350565; 
	Fri, 08 Jan 2016 02:19:10 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	n91sm39571921qkh.11.2016.01.08.02.19.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:04 +0000
Message-Id: <cover.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:12 -0000

This set of fixes let core-image-full-cmdline build with musl along with core-image-sato
and core-image-weston

Here is a qemuarm world build results.

http://errors.yoctoproject.org/Errors/Build/11421/

Few fixes are also for uclibc

The following changes since commit 5661d8cb7849df62358368743134c0aaf523965e:

  image: Really remove lockfiles flag (2016-01-07 13:41:47 +0000)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/musl-fixes
  https://github.com/kraj/openembedded-core/tree/kraj/musl-fixes

Kai Kang (1):
  Revert "glib-2.0: build dependency cleanup"

Khem Raj (52):
  powertop: Include right headers for timval struct
  dhcp: Include sys/types.h for u_int* defs
  blktrace: Include <sys/types.h for dev_t
  ppp: Fix build with musl
  tcp-wrappers: Fix build with musl
  fts: Add recipe
  connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
  libcgroup: Add dependency on fts when building on musl
  linux-libc-headers: Port patches for linux-headers for musl
  xserver-xorg: Fix build with musl
  gdk-pixbuf: Fix latent build  issue exposed by musl
  argp-standalone: Add recipe
  gnutls: Link with libargp on musl and depend on argp-standalone
  util-linux: Fix ptest builds on musl
  webkitgtk: Fix build with clang
  elfutils: Fix build with uclibc
  packagegroup-self-hosted.bb: Move glibc-gconv-ibm850 to glibc only
    case
  guile: Fix build with uclibc
  gnutls: Link with libuargp on uclibc
  mtools: Fix build with uclibc
  parted: Fix build with uclibc
  net-tools: Link with libintl on uclibc
  libdrm: Upgrade 2.4.65 -> 2.4.66
  directfb: Fix build with musl
  gzip: Fix build with musl
  watchdog: Fix build with musl
  xinetd: Fix build with musl
  dpkg: Add musleabi to known architectures
  puzzles: Zero'ise structs before use
  apt: Add support for building for musl targets
  libunwind: backtrace APIs are glibc specific
  babeltrace: Add missing header for MAXNAMLEN define
  elfutils: Fix build with musl
  sysklogd: untangle header inclusion maze
  console-tools: Include sys/types.h for u_char and u_short defs
  webkitgtk: Fix build on non-glibc linux systems
  rt-tests: Fix build with non-gcc compilers
  webkitgtk: Update patch status
  tar: Fix build for musl based targets
  net-tools: Fix build on musl
  pax: Fix build with musl
  iputils: Fix build with musl
  libuser: Fix build when secure getenv is not there
  iproute2: Fix build with musl
  irda-utils: Fix header inclusions
  nspr: Drop older glibc code
  chkconfig: Avoid using caddr_t
  tcf-agent: Implement canonicalize_file_name() for musl as well
  bsd-headers,musl: Add recipe for bsd missing features
  nfs-utils: Disable tcp-wrappers for musl
  portmap: Point to tirpc headers and libraries on musl
  elfutils: Add ALLOW_EMPTY for musl

 .../0003-Fix-header-inclusions-for-musl.patch      |   79 +-
 .../dhcp/0001-include-missing-sys-types.h.patch    |   58 +
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |    1 +
 .../iproute2/iproute2/iproute2-4.3.0-musl.patch    |   97 ++
 .../iproute2/iproute2_4.3.0.bb                     |    1 +
 .../irda-utils/irda-utils-0.9.18/musl.patch        |   29 +
 .../irda-utils/irda-utils_0.9.18.bb                |    1 +
 .../nfs-utils/nfs-utils_1.3.3.bb                   |    1 +
 meta/recipes-connectivity/portmap/portmap_6.0.bb   |    4 +
 .../ppp/ppp/0001-Fix-build-with-musl.patch         |  163 +++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |    3 +
 meta/recipes-core/bsd-headers/bsd-headers.bb       |   25 +
 .../bsd-headers/bsd-headers/sys-queue.h            |  846 ++++++++++++
 .../bsd-headers/bsd-headers/sys-tree.h             |  761 +++++++++++
 ...clude-sys-types.h-for-u_char-and-u_short-.patch |   44 +
 .../console-tools/console-tools_0.3.2.bb           |    1 +
 meta/recipes-core/fts/fts.bb                       |   39 +
 .../fts/fts/fts-header-correctness.patch           |   25 +
 meta/recipes-core/fts/fts/fts-uclibc.patch         |   50 +
 meta/recipes-core/fts/fts/gcc5.patch               | 1368 ++++++++++++++++++++
 meta/recipes-core/fts/fts/remove_cdefs.patch       |   69 +
 meta/recipes-core/fts/fts/stdint.patch             |   15 +
 meta/recipes-core/glib-2.0/glib.inc                |    6 +-
 .../libcgroup/libcgroup/musl-decls-compat.patch    |  235 ++++
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |    4 +
 meta/recipes-core/musl/musl_git.bb                 |    1 +
 .../packagegroups/packagegroup-self-hosted.bb      |    2 +-
 .../util-linux/uuid-test-error-api.patch           |   92 ++
 meta/recipes-core/util-linux/util-linux_2.27.1.bb  |    1 +
 meta/recipes-devtools/apt/apt.inc                  |    1 +
 ....mak-musl-based-systems-can-generate-shar.patch |   29 +
 meta/recipes-devtools/apt/apt_1.0.10.1.bb          |    3 +-
 ...0006-add-musleabi-to-known-target-tripets.patch |   42 +
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |    3 +-
 ...de-alternatives-for-glibc-assumptions-hel.patch |  132 ++
 .../uclibc-support-for-elfutils-0.161.patch        |   79 +-
 .../elfutils/elfutils/mempcpy.patch                |   24 -
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    1 -
 meta/recipes-devtools/elfutils/elfutils_0.163.bb   |    8 +-
 .../guile/files/remove_strcase_l_funcs.patch       |   38 +
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    3 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    3 +
 ...nonicalize_file_name-is-specific-to-glibc.patch |   46 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    1 +
 .../chkconfig/chkconfig/replace_caddr_t.patch      |   33 +
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    4 +-
 meta/recipes-extended/gzip/gzip.inc                |    7 +
 .../files/0001-Fix-header-inclusion-for-musl.patch |   92 ++
 meta/recipes-extended/iputils/iputils_s20121221.bb |    1 +
 .../libuser/libuser/0001-Check-for-issetugid.patch |   62 +
 .../libuser/0002-remove-unused-execinfo.h.patch    |   27 +
 meta/recipes-extended/libuser/libuser_0.62.bb      |    4 +-
 .../net-tools/net-tools/musl-fixes.patch           |  100 ++
 .../net-tools/net-tools_1.60-26.bb                 |    3 +-
 meta/recipes-extended/parted/parted_3.2.bb         |    3 +-
 .../pax/pax/0001-Fix-build-with-musl.patch         | 1287 ++++++++++++++++++
 .../pax/0001-use-strtoll-instead-of-strtoq.patch   |   33 +
 meta/recipes-extended/pax/pax_3.4.bb               |   10 +
 .../sysklogd/files/0001-Fix-build-with-musl.patch  |  132 ++
 meta/recipes-extended/sysklogd/sysklogd.inc        |    1 +
 meta/recipes-extended/tar/tar/musl_dirent.patch    |   19 +
 meta/recipes-extended/tar/tar_1.28.bb              |    6 +
 .../tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch |   31 +
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +
 ...d-issues-found-with-non-glibc-C-libraries.patch |   99 ++
 meta/recipes-extended/watchdog/watchdog_5.14.bb    |    8 +-
 ...se-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch |  100 ++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    5 +
 .../gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch      |   63 +
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb |    1 +
 meta/recipes-graphics/directfb/directfb.inc        |    5 +
 .../directfb/directfb/compar_fn_t.patch            |   62 +
 .../directfb/directfb/union-sigval.patch           |   19 +
 .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     |   19 +
 ...tests-kms-steal-crtc-Include-sys-select.h.patch |   33 +
 .../recipes-graphics/drm/libdrm/installtests.patch |   24 +-
 .../drm/{libdrm_2.4.65.bb => libdrm_2.4.66.bb}     |    8 +-
 .../xserver-xorg/musl-arm-inb-outb.patch           |   18 +
 .../xorg-xserver/xserver-xorg_1.18.0.bb            |    4 +-
 ...-include-sys-types.h-for-dev_t-definition.patch |   30 +
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    4 +-
 ...mpat.h-fix-some-issues-arising-from-in6.h.patch |   82 ++
 ...t.h-prevent-redefinition-of-struct-ethhdr.patch |   59 +
 ...remove-inclusion-of-sysinfo.h-in-kernel.h.patch |   32 +
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |    5 +
 ...Include-sys-param.h-for-MAXNAMLEN-definti.patch |   29 +
 meta/recipes-kernel/lttng/babeltrace_1.3.1.bb      |    5 +-
 ...0001-include-rquired-headers-for-typedefs.patch |   47 +
 meta/recipes-kernel/powertop/powertop_2.8.bb       |    4 +-
 ...t-CC-AR-variable-only-if-it-doesn-t-have-.patch |   30 +
 meta/recipes-rt/rt-tests/rt-tests_0.96.bb          |    3 +-
 ...mpiler-errors-about-uninitialized-use-of-.patch |   32 +
 meta/recipes-sato/puzzles/puzzles_git.bb           |    1 +
 ...nable-backtrace-on-linux-when-using-glibc.patch |   39 +
 ...x-build-with-non-glibc-libraries-on-linux.patch |   61 +
 meta/recipes-sato/webkit/webkitgtk/clang.patch     |   25 +
 meta/recipes-sato/webkit/webkitgtk_2.10.4.bb       |    3 +
 .../argp-standalone/argp-standalone_1.3.bb         |   28 +
 .../files/0001-throw-in-funcdef.patch              |   84 ++
 .../argp-standalone/files/0002-isprint.patch       |   51 +
 meta/recipes-support/gnutls/gnutls.inc             |    5 +-
 ...-backtrace-Use-only-with-glibc-and-uclibc.patch |   45 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
 ...001-Remove-the-check-for-LINUX-glibc-case.patch |   35 +
 meta/recipes-support/nspr/nspr_4.11.bb             |    9 +
 105 files changed, 7393 insertions(+), 117 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-core/bsd-headers/bsd-headers.bb
 create mode 100644 meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h
 create mode 100644 meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch
 create mode 100644 meta/recipes-core/fts/fts.bb
 create mode 100644 meta/recipes-core/fts/fts/fts-header-correctness.patch
 create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patch
 create mode 100644 meta/recipes-core/fts/fts/gcc5.patch
 create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.patch
 create mode 100644 meta/recipes-core/fts/fts/stdint.patch
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
 create mode 100644 meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
 create mode 100644 meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
 create mode 100644 meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch
 create mode 100644 meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/musl-fixes.patch
 create mode 100644 meta/recipes-extended/pax/pax/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-extended/pax/pax/0001-use-strtoll-instead-of-strtoq.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-extended/tar/tar/musl_dirent.patch
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
 create mode 100644 meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch
 create mode 100644 meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/union-sigval.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
 create mode 100644 meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.65.bb => libdrm_2.4.66.bb} (86%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
 create mode 100644 meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch
 create mode 100644 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
 create mode 100644 meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
 create mode 100644 meta/recipes-support/argp-standalone/files/0002-isprint.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch
 create mode 100644 meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch

-- 
2.7.0


