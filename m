Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 45A677199E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Dec 2017 23:21:51 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id v41so8288173plg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Dec 2017 15:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q2XXXV0rzBtKgnG6N+X1jU7ixrk/++CMgzhomTChihg=;
	b=hYz00xEQ2trzKFRA3+VQJkb9xwuLmTlUjy+lR8PB4E5YLiuPXyJffsillVZ5k81NHE
	uVZgq/80FcuLdBfqzD8KaKMILPh8Nf0EoAFSotHkZR1DGT2bir2imKkUJaDABd6tvaRa
	OTFpJvRfwalD8Xxvfmfbc1JcU6OPP8yqx/Gs+XgV9OA7wA3ulwgybdKb2JKGjmVY8SMM
	uuT0+7V5+45STiSEK8toLC4jCsBC0fDiDUr9iIB1DfDaqQo3xKyaXcq8oq3lqNhJSmIW
	yDZo+WiCMnIr6YJUadk5ayGr04hsYXbwfSFPLHbh5tK5/oKmCJNPulcr/U3trXl4crZF
	Nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q2XXXV0rzBtKgnG6N+X1jU7ixrk/++CMgzhomTChihg=;
	b=KWotolzEjbKInvft8VwSsxTFWuVlt0gRhD0ngDUu2naZ1sOh2ka6Pb/aTew9Dmgbzr
	ToUETMjR127qDxfrWDIBjO/voEVfBlEx1jTsINAR4kziuIoUfZpYR3VISmVsFZib8Zhe
	nDfpcL3Ww2XUXkTjxyu2iXT7vw9eOouszy6XB5o5CsNsU4l+6D0qUHya56Fotv79bOed
	wjFZFmOulfekrblWNHF3RVfdGvd6t7cs4MYDBhDpY8zP7OzFbk3AAR9ZakajTBo9nYqi
	RXr7QjLS8HPMe8HHbA4Vw+M0SgGxiuue6/CNCjpPR1XfSQvAMfcSwKqytufSqLZbiCjW
	Cjuw==
X-Gm-Message-State: AJaThX5OoBm+Jc9u8c5ZCxwaZyoWBOEbYSmoABpPHt/VQwhyzg4oWXhg
	WOf76tZtB5moTG+DRLNV4b4=
X-Google-Smtp-Source: AGs4zMax/wbknzcYxjt4ZZmv0e02SCXZCD9vJr+SkGQyUJDMfCclzOJ+Nr1wXdy2Qu5yn4M5WFepSQ==
X-Received: by 10.84.128.36 with SMTP id 33mr10524750pla.329.1512256913107;
	Sat, 02 Dec 2017 15:21:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:e488:5338:e471:17ad])
	by smtp.gmail.com with ESMTPSA id
	g77sm18089044pfd.75.2017.12.02.15.21.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 Dec 2017 15:21:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat,  2 Dec 2017 15:19:39 -0800
Message-Id: <cover.1512256681.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 000/131] Rocko-next pull request
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
X-List-Received-Date: Sat, 02 Dec 2017 23:21:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

conver letter only.

please concider these changes for Rocko next.
Clean AB build.

The following changes since commit f7b90ab3eaf832bd81f3efc1dab4dcf6863ac284:

  bitbake: main: Give a user readable error if we can't locate topdir (2017-10-31 09:09:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stable/rocko-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/rocko-next

Alexander Kanavin (4):
  gtk-doc.bbclass: correctly make the list of directories with shared
    libraries
  maintainers.inc: add Khem Raj for libmnl
  maintainers.inc: add Otavio Salvador for go-dep
  gstreamer1.0-plugins: disable introspection on mips64

Andre McCurdy (9):
  feature-arm-vfp.inc: drop unnecessary extra space from TUNE_CCARGS
  base.bbclass: increase indent in get_layers_branch_rev() and
    buildcfg_vars()
  package_ipk.bbclass: handle only whitespace in PACKAGE_EXCLUDE
  tclibc-musl.inc: disable ldconfig distro feature
  systemd: remove musl specific control of ldconfig PACKAGECONFIG
  systemd: use consistent approach for musl PACKAGECONFIG options
  systemd: sort PACKAGECONFIG options
  systemd: use consistent indenting and coding style in do_install()
  systemd: fix duplication of CACHED_CONFIGUREVARS

André Draszik (1):
  base: add automatic dependency on xz-native for .txz SRC_URI

Armin Kuster (2):
  tzcode-native: update to 2017c
  tzdata: update 2017c

Artur Mądrzak (1):
  wic: add 'part-name' argument for naming GPT partitions

Awais Belal (1):
  dhcp: fix build issue with libxml2 support

Bruce Ashfield (8):
  linux-yocto/4.12: configuration and feature updates
  linux-yocto/4.4: update to v4.4.93
  linux-yocto/4.12: update to v4.12.14
  linux-yocto/4.12: stable backports and bug fixes
  kern-tools: make fuzzy matching optional
  linux-yocto/4.9: update to v4.9.57
  linux-yocto/4.12: configuration fragment updates
  linux-yocto/4.12: ide:ide-cd: fix kernel panic resulting from missing
    scsi_req_init

Chen Qi (3):
  bash-completion: remove rfkill file that util-linux provides
  systemd: remove useless options for mips4
  gcc: backport patch to fix miscompilation on mips64

Dan Dedrick (1):
  dhcp: use ${BPN} instead of ${PN} for user

Erik Botö (4):
  masterimage.py: fix issue with calling reboot on masterimage/DUT
  masterimage.py: fix stop()
  masterimage.py: rename parameter "params" in start() to
    "extra_bootparams"
  sshcontrol.py: in copy_to() always use scp

Igor Romanov (1):
  image.bbclass: Fix 'vardepsexclude' mechanism for image_cmd_${FSTYPE}

Jackie Huang (1):
  libnsl2: fix installed-vs-shipped QA issue

Javier Viguera (1):
  curl: add 'enable-ares' packageconfig option

Joe Slater (4):
  goarch: There is no GOARCH defined for mips64-n32
  rpm: remove --sysroot from macros on target
  net-tools: correctly set COPTS and LOPTS
  nss: pay attention to CFLAGS

Joshua Lock (1):
  lib/oeqa/selftest/cases/gotoolchain: add selftest for the Go toolchain

Juro Bystricky (10):
  gawk-ptest: fix a failing test
  nettle-ptest: fix a failing test
  util-linux-ptest: various fixes
  grub_2.02.bb: improve reproducibility
  curl_7.54.1.bb: improve reproducibility
  gobject-introspection: improve reproducibility
  e2fsprogs-ptest: improve reproducibility
  grub-efi_2.02.bb: improve reproducibility
  x11perf: improve reproducibility
  sudo: improve reproducibility

Khem Raj (6):
  elfutils: Fix missing library on linker cmdline
  mdadm: Fix build with gcc < 7
  systemd: Fix build on musl
  systemd: Fix build with musl/mips64
  go: Fix build with PIE on musl
  gcc7: Fix unaligned STRD issue on ARM

Li Zhou (1):
  curl: Security Advisory - curl - CVE-2017-1000254

Luca Ceresoli (1):
  externalsrc: fix ExpansionError if the source dir does not exist yet

Markus Lehtonen (1):
  oe-build-perf-report-email.py: add images as MIME objects

Martin Kelly (1):
  systemctl-native: add target.wants to target regex

Ming Liu (4):
  lib/oe/terminal.py: use an absolute path to execute
    oe-gnome-terminal-phonehome
  image.bbclass: let do_image depend on do_populate_lic of
    EXTRA_IMAGEDEPENDS
  libsolv: fix a kernel-devsrc installation issue
  qemu.inc: let linux-yocto-rt also provide nfs server kernel module

Nikolay Merinov (1):
  perl-native: Provide correct lddlflags

Oleksandr Andrushchenko (1):
  fetch2: Fix missing logger import in repo fetcher

Otavio Salvador (1):
  lttng-modules: Upgrade to 2.9.5 release

Ovidiu Panait (1):
  icu: CVE-2017-14952

Patrick Ohly (2):
  useradd-staticids: skip recipes without static IDs
  useradd-staticids: explain how to fix the the problem

Patrick Vacek (1):
  ca-certificates: Add /etc to SYSROOT_DIRS

Paul Eggleton (6):
  lib/oe/sstatesig: fix wildcard matching wrong task signature files
  recipetool: pass absolute source tree path to plugins
  recipetool: ignore incidental kernel module source
  lib/oe/recipeutils: fix find_layerdir() to return absolute paths
  lib/oe/recipeutils: fix line splitting in patch_recipe_*
  recipetool: create: fix failure handling included dicts

Peter Griffin (1):
  initramfs-live-install: Add aarch64 arch to COMPATIBLE_HOST.

Peter Kjellerstedt (1):
  oeqa/core/loader: Make _built_modules_dict() support packages
    correctly

Radek Dostál (2):
  sbc: move examples to their own package
  sbc: fix license

Randy MacLeod (1):
  openssl: force soft link to avoid rare race

Richard Purdie (23):
  oe-buildenv-internal: Fix finding build directory
  rng-tools: Fix crazy defaults
  bind: Convert from ftp to https urls
  tests/fetch: Switch gnu.org urls from ftp -> http/https
  tests/fetch: Add ftp test url
  event: Ensure we clean up loggers
  tinfoil: Ensure we clean up loggers
  qemurunner: Ensure logging handler is removed
  oeqa/runqemu: Only show stdout/stderr upon test failure
  oeqa/targetcontrol: Drop unused get_target_controller function
  oeqa/qemurunner: Use logger.debug, not logger.info
  testimage: Pass the logger into
    OERuntimeTestContextExecutor.getTarget()
  oeqa: Clean up logger handling
  oeqa/target/ssh: Drop command/output logging to debug level
  testimage: Ensure full logs are shown for failures
  oeqa: Markup further tests for stdout/stderr buffering
  oeqa/runner: Pass the value of buffer, don't force to True
  runqemu: Ensure we process all tap devices
  qemu: Add patch to avoid qemuppc boot hangs
  runqemu: Improve relative path handling in qemuconf files
  qemuboot: Improve relative path handling
  qemurunner: Simplify binary data handling
  runqemu: Also specialcase resolution of '.' to the file's location

Robert Berger (1):
  nativesdk-packagegroup-sdk-host: remove redundant LICENSE

Robert Yang (2):
  useradd.bbclass: print a warn when useradd not found
  runqemu: print command search result when not found

Ross Burton (11):
  qemurunner: fix bad indentation in serial login
  tests/fetch: skip network tests the idiomatic way
  bitbake: be more explicit when warning about locale choice
  tests/fetch: use subtests in the wget tests
  oeqa/selftest/runtime: force empty root password, use helpers to
    access qemu
  oeqa/selftest/runtime_test: fix postinst_rootfs_and_boot
  oeqa/selftest/runtime_test: use console in postinst_rootfs_and_boot
  selftest/imagefeatures: add basic test for useradd-staticids
  db: change types to avoid headers changing between architectures
  python: add PACKAGECONFIG for Berkeley DB module
  dpkg: use snapshot.debian.org

Saul Wold (4):
  wic: misc.py: Added more mtools binaries
  wic: misc.py: Use mmd from mtools instead of syslinux
  linux-firmware: Remove iwlwifi-8000C-19 SRC_URI
  image_types: Add debugging code to ext4 fs creation

Thomas Perrot (1):
  runqemu: correct rootfs setup to boot an ide hddimg

Tom Rini (2):
  wic: When using --use-uuid make sure that we update the fstab with
    PARTUUID
  wic: Update canned-wks for systemd to use UUID everywhere

Wenlin Kang (1):
  kexec-tools: add systemd support for kdump

Wenzong Fan (1):
  tcl: remove host path from tclConfig.sh

Yi Zhao (1):
  maintainers.inc: update maintainership

 bitbake/bin/bitbake                                |   2 +-
 bitbake/bin/bitbake-worker                         |   3 +-
 bitbake/lib/bb/event.py                            |   4 +
 bitbake/lib/bb/fetch2/repo.py                      |   1 +
 bitbake/lib/bb/tests/fetch.py                      | 427 +++++++++--------
 bitbake/lib/bb/tinfoil.py                          |  10 +-
 meta-selftest/files/static-group                   |  14 +
 meta-selftest/files/static-passwd                  |  11 +
 meta/classes/base.bbclass                          |   6 +-
 meta/classes/externalsrc.bbclass                   |   4 +-
 meta/classes/goarch.bbclass                        |   1 +
 meta/classes/gtk-doc.bbclass                       |   2 +-
 meta/classes/image.bbclass                         |  19 +-
 meta/classes/image_types.bbclass                   |   4 +
 meta/classes/package_ipk.bbclass                   |   2 +-
 meta/classes/qemuboot.bbclass                      |   8 +-
 meta/classes/testimage.bbclass                     |   6 +-
 meta/classes/useradd-staticids.bbclass             |  74 +--
 meta/classes/useradd.bbclass                       |   1 +
 meta/conf/distro/include/maintainers.inc           |  44 +-
 meta/conf/distro/include/tclibc-musl.inc           |   2 +
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |   4 +-
 meta/conf/machine/include/qemu.inc                 |   1 +
 meta/lib/oe/recipeutils.py                         |   7 +-
 meta/lib/oe/sstatesig.py                           |   2 +-
 meta/lib/oe/terminal.py                            |   2 +-
 meta/lib/oeqa/controllers/masterimage.py           |   6 +-
 meta/lib/oeqa/core/loader.py                       |  50 +-
 meta/lib/oeqa/core/runner.py                       |   8 +
 meta/lib/oeqa/core/target/qemu.py                  |   2 +-
 meta/lib/oeqa/core/target/ssh.py                   |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py            |   2 +
 meta/lib/oeqa/selftest/cases/gotoolchain.py        |  67 +++
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |  12 +
 meta/lib/oeqa/selftest/cases/runqemu.py            |   7 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py       |   8 +-
 meta/lib/oeqa/targetcontrol.py                     |  52 +--
 meta/lib/oeqa/utils/commands.py                    |  25 +-
 meta/lib/oeqa/utils/qemurunner.py                  | 101 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py              |   3 +-
 meta/lib/oeqa/utils/sshcontrol.py                  |   9 +-
 meta/recipes-bsp/grub/grub-efi_2.02.bb             |  10 +
 meta/recipes-bsp/grub/grub_2.02.bb                 |   7 +
 meta/recipes-connectivity/bind/bind_9.10.5-P3.bb   |   4 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   2 +-
 ...correct-the-intention-for-xml2-lib-search.patch |  37 ++
 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       |   1 +
 ...penssl-force-soft-link-to-avoid-rare-race.patch |  46 ++
 .../recipes-connectivity/openssl/openssl_1.0.2l.bb |   1 +
 .../initramfs-live-install-efi_1.0.bb              |   2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |   2 +-
 .../nativesdk-packagegroup-sdk-host.bb             |   1 -
 .../systemd/systemd-systemctl/systemctl            |   2 +-
 ...PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch |  43 ++
 .../0001-Use-uintmax_t-for-handling-rlim_t.patch   |  89 ++++
 ...llback-parse_printf_format-implementation.patch | 433 +++++++++++++++++
 ...asic-missing.h-check-for-missing-strndupa.patch | 104 +++++
 ...if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch | 157 +++++++
 ...issing.h-check-for-missing-__compar_fn_t-.patch |  47 ++
 .../systemd/0006-Include-netinet-if_ether.h.patch  |  86 ++++
 ...-check-for-missing-canonicalize_file_name.patch |  63 +++
 .../systemd/0008-Do-not-enable-nss-tests.patch     |  35 ++
 ...xdecoct.c-Include-missing.h-form-strndupa.patch |  27 ++
 ....c-Disable-tests-for-missing-typedefs-in-.patch |  49 ++
 .../0011-don-t-use-glibc-specific-qsort_r.patch    | 105 +++++
 ...ass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  99 ++++
 ...fn_t-is-glibc-specific-use-raw-signature-.patch |  31 ++
 meta/recipes-core/systemd/systemd_234.bb           | 257 +++++-----
 meta/recipes-core/util-linux/util-linux.inc        |  45 +-
 meta/recipes-devtools/dpkg/dpkg_1.18.24.bb         |   2 +-
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb |   5 +
 meta/recipes-devtools/elfutils/elfutils_0.170.bb   |   1 +
 ...0001-libasm-may-link-with-libbz2-if-found.patch |  39 ++
 meta/recipes-devtools/gcc/gcc-7.2.inc              |   2 +
 .../gcc-7.2/0001-PR-rtl-optimization-81803.patch   |  52 +++
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 ++++++++
 meta/recipes-devtools/go/go-1.9.inc                |   3 +
 .../go/go-1.9/default-buildmode-pie.patch          |  18 +
 .../go/go-1.9/set-external-linker.patch            | 111 +++++
 meta/recipes-devtools/perl/perl-native_5.24.1.bb   |   1 +
 meta/recipes-devtools/python/python_2.7.13.bb      |  14 +-
 meta/recipes-devtools/qemu/qemu/ppc_locking.patch  | 105 +++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |   1 +
 meta/recipes-devtools/rpm/rpm_git.bb               |  11 +-
 meta/recipes-devtools/tcltk/tcl_8.6.7.bb           |  13 +
 meta/recipes-extended/gawk/gawk_4.1.4.bb           |   2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb        |   1 +
 ....c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch |  35 ++
 meta/recipes-extended/libsolv/libsolv_0.6.28.bb    |   3 +-
 ...heck-for-implicit-fallthrough-warning-sup.patch |  31 ++
 meta/recipes-extended/mdadm/mdadm_4.0.bb           |   1 +
 .../net-tools/net-tools_1.60-26.bb                 |  14 +-
 meta/recipes-extended/sudo/sudo.inc                |   6 +
 .../files/0001-Fix-Makefile-quoting-bug.patch      | 174 +++++++
 .../files/0002-Port-zdump-to-C90-snprintf.patch    | 115 +++++
 ...code-native_2017b.bb => tzcode-native_2017c.bb} |  15 +-
 .../tzdata/{tzdata_2017b.bb => tzdata_2017c.bb}    |   6 +-
 .../gobject-introspection_1.52.1.bb                |   9 +
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   4 +
 meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb    |   4 +
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 meta/recipes-kernel/kexec/kexec-tools.inc          |   1 +
 .../recipes-kernel/kexec/kexec-tools/kdump.service |  12 +
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  23 +-
 .../linux-firmware/linux-firmware_git.bb           |   8 -
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       |  20 +-
 ...Fix-handle-missing-ftrace-header-on-v4.12.patch |  96 ----
 .../0002-Fix-sched-for-v4.11.5-rt1.patch           |  31 --
 ...ping-function-called-from-invalid-context.patch | 133 ------
 ...date-ext4-instrumentation-for-kernel-4.13.patch | 189 --------
 ...-mmap-caches-aliased-on-virtual-addresses.patch | 100 ----
 .../0006-Add-kmalloc-failover-to-vmalloc.patch     | 519 ---------------------
 .../0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch  |  37 --
 ...0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch |  34 --
 ...tng-modules_2.9.3.bb => lttng-modules_2.9.5.bb} |  15 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |   3 +
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |   2 +
 meta/recipes-multimedia/sbc/sbc_1.3.bb             |   9 +-
 .../bash-completion/bash-completion_2.7.bb         |   2 +-
 .../ca-certificates/ca-certificates_20170717.bb    |   1 +
 .../curl/curl/CVE-2017-1000254.patch               | 138 ++++++
 .../curl/curl/reproducible-mkhelp.patch            |  32 ++
 meta/recipes-support/curl/curl_7.54.1.bb           |  13 +-
 meta/recipes-support/db/db/sequence-type.patch     |  59 +++
 meta/recipes-support/db/db_5.3.28.bb               |   5 +-
 meta/recipes-support/icu/icu/CVE-2017-14952.patch  |  28 ++
 meta/recipes-support/icu/icu_59.1.bb               |   1 +
 .../nettle/nettle-3.3/dlopen-test.patch            |  20 +
 meta/recipes-support/nettle/nettle_3.3.bb          |   4 +
 meta/recipes-support/nss/nss_3.31.1.bb             |   7 +-
 meta/recipes-support/rng-tools/rng-tools/default   |   3 +-
 scripts/contrib/oe-build-perf-report-email.py      |  42 +-
 scripts/lib/recipetool/create.py                   |  10 +-
 scripts/lib/recipetool/create_buildsys_python.py   |   2 +
 scripts/lib/recipetool/create_kmod.py              |   2 +-
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks    |   4 +-
 scripts/lib/wic/help.py                            |   2 +
 scripts/lib/wic/ksparser.py                        |   1 +
 scripts/lib/wic/misc.py                            |   5 +-
 scripts/lib/wic/partition.py                       |   1 +
 scripts/lib/wic/plugins/imager/direct.py           |  20 +-
 scripts/oe-buildenv-internal                       |   3 +
 scripts/runqemu                                    |  11 +-
 151 files changed, 3632 insertions(+), 1886 deletions(-)
 create mode 100644 meta-selftest/files/static-group
 create mode 100644 meta-selftest/files/static-passwd
 create mode 100644 meta/lib/oeqa/selftest/cases/gotoolchain.py
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/ppc_locking.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
 create mode 100644 meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
 create mode 100644 meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2017b.bb => tzcode-native_2017c.bb} (54%)
 rename meta/recipes-extended/tzdata/{tzdata_2017b.bb => tzdata_2017c.bb} (97%)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kdump.service
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-handle-missing-ftrace-header-on-v4.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sched-for-v4.11.5-rt1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Sleeping-function-called-from-invalid-context.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-update-ext4-instrumentation-for-kernel-4.13.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-mmap-caches-aliased-on-virtual-addresses.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Add-kmalloc-failover-to-vmalloc.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.9.3.bb => lttng-modules_2.9.5.bb} (63%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000254.patch
 create mode 100644 meta/recipes-support/curl/curl/reproducible-mkhelp.patch
 create mode 100644 meta/recipes-support/db/db/sequence-type.patch
 create mode 100644 meta/recipes-support/icu/icu/CVE-2017-14952.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch

-- 
2.7.4


