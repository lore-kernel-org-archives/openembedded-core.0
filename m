Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7836.1614918119443975246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: KGPJJVlskiTHEplBlWfR67j/fmc+oeZR7gbLFHmXg3Cj0ZAjJG5ZI4Az4QyS3EPpLbwal+SY7Q
 f6gjDytUpVDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670804"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:21:58 -0800
IronPort-SDR: t34kn4BT/NzRgdEZ0UE8FBod/SkH6uHjnKv3N3RfFXNnYbk5oA83TdqKalfl3v3tkRCAaph6PC
 cwRN4gOzI+KQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128748"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:21:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/52] review request
Date: Fri,  5 Mar 2021 12:20:36 +0800
Message-Id: <cover.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. Builds cleanly
on autobuilder except for one intermittent and unrelated failure.

Thanks,

Anuj

The following changes since commit 0e5605af9ebbfceffd510e42013d4eaa76c4e820:

  acpica: Fix reproducibility issues (2021-02-22 23:53:37 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Andrei Gherzan (1):
  oe/recipeutils: Fix copying patches when BBLAYERS entries are not
    normalised

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.96
  linux-yocto/5.4: update to v5.4.98

Florian Bezdeka (1):
  wic: Warn if an ext filesystem affected by the Y2038 problem is used

Jan-Simon Möller (1):
  package_rpm: Enable use_source_date_epoch_as_buildtime in package_rpm
    class

Khem Raj (2):
  go: Update to 1.15.8
  oeqa/pam: Need shadow installed for the tests

Lee Chee Yang (2):
  python3: fix CVE-2021-23336
  libsdl2: fix CVE-2020-14409 CVE-2020-14410

Martin Jansa (1):
  sstatesig.py: show an error instead of warning when sstate manifest
    isn't found

Michael Halstead (2):
  yocto-uninative.inc: version 2.11 updates glibc to 2.33
  yocto-uninative.inc: version 3.0 incorporate seccomp filter workaround

Mike Crowe (1):
  externalsrc: Pass through npmsw URIs in SRC_URI

Milan Shah (1):
  report-error.bbclass: Add layer and bitbake version info to error
    report

Mingli Yu (1):
  python3: Fix python interpreter line length for nativesdk

Minjae Kim (1):
  bind: fix CVE-2020-8625

Peter Kjellerstedt (1):
  asciidoc: Switch to using the main branch

Richard Purdie (19):
  xorg-fonts-minimal: Fix reproducibility
  xorg-minimal-fonts: Really fix determinism
  git: Fix determinism issue
  groff: Fix determinism issue
  oeqa/commands: Fix compatibility with python 3.9
  linux-firmware: upgrade 20201218 -> 20210208
  rsync: Fix a file sorting determinism issue
  rsync: Fix group name determinism issue
  libevdev: Update patch status to backport
  babeltrace2: Fix reproducibility
  cups: Fix reproducibility issues
  gcr: Fix reproducibility issue
  epiphany: Fix reproducibility issue
  epiphany: Fix distributor contamination from /etc/os-release
  image: Add directories to PSEUDO_IGNORE_PATHS
  populate_sdk: Add directories to PSEUDO_IGNORE_PATHS
  bitbake.conf/image: Move image specific PSEUDO_IGNORE_PATHS to image
    class
  bitbake.conf: Split PSEUDO_IGNORE_PATHS to be more readable
  parted: Fix reproducibility issue

Ross Burton (1):
  rootfs_deb: handle aarch64 SDK_ARCH

Scott Murray (1):
  screen: fix CVE-2021-26937

Stefan Ghinea (2):
  wpa-supplicant: fix CVE-2021-0326
  cups: fix CVE-2020-10001

Thomas Viehweger (1):
  mtd-utils: Remove duplicate assignments to alternative link names

Tomasz Dziendzielski (1):
  bitbake.conf: Introduce FAKEROOTLOGS variable used by bitbake to print
    pseudo.log

Vivien Didelot (2):
  local.conf.sample.extended: prefer INIT_MANAGER
  systemd: Fix importd requirements comment

Wang Mingyu (1):
  openssl: upgrade 1.1.1i -> 1.1.1j

Wes Lindauer (1):
  df.py: Add feature check for read-only-rootfs

Yi Fan Yu (2):
  valgrind: Disable ptest nlcontrolc for x86-64
  valgrind: Increase timeout duration 30 -> 90 s

Yoann Congal (1):
  npm.bbclass: avoid building target nodejs for native npm recipes

Zbigniew Bodek (1):
  wpebackend-fdo: Fix missing .so symlink when using dev package

akuster (2):
  cve-check.bbclass: add layer to cve log
  cve-check: add include/exclude layers

 meta/classes/cve-check.bbclass                |   21 +
 meta/classes/externalsrc.bbclass              |    1 +
 meta/classes/image.bbclass                    |    2 +
 meta/classes/npm.bbclass                      |    2 +-
 meta/classes/package_rpm.bbclass              |    1 +
 meta/classes/populate_sdk_base.bbclass        |    2 +-
 meta/classes/report-error.bbclass             |    4 +
 meta/classes/rootfs_deb.bbclass               |    4 +
 meta/conf/bitbake.conf                        |    6 +-
 meta/conf/distro/include/yocto-uninative.inc  |   10 +-
 meta/conf/local.conf.sample.extended          |   21 +-
 meta/lib/oe/recipeutils.py                    |    2 +-
 meta/lib/oe/sstatesig.py                      |    2 +-
 meta/lib/oeqa/runtime/cases/df.py             |    2 +
 meta/lib/oeqa/runtime/cases/pam.py            |    3 +
 meta/lib/oeqa/utils/commands.py               |    4 +-
 .../bind/bind-9.16.7/CVE-2020-8625.patch      |   29 +
 meta/recipes-connectivity/bind/bind_9.16.7.bb |    1 +
 .../{openssl_1.1.1i.bb => openssl_1.1.1j.bb}  |    2 +-
 .../wpa-supplicant/CVE-2021-0326.patch        |   45 +
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |    1 +
 meta/recipes-core/systemd/systemd_246.9.bb    |    2 +-
 meta/recipes-devtools/git/git.inc             |    3 +-
 meta/recipes-devtools/git/git/fixsort.patch   |   31 +
 meta/recipes-devtools/go/go-1.15.inc          |    4 +-
 ...e_1.15.6.bb => go-binary-native_1.15.8.bb} |    4 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |    2 -
 .../python/python3/CVE-2021-23336.patch       |  548 +++++++++
 meta/recipes-devtools/python/python3_3.8.5.bb |    5 +
 .../rsync/files/determism.patch               |   28 +
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |    3 +-
 ...Disable-nlcontrolc.vgtest-for-x86-64.patch |   36 +
 ...est-wrapper-to-support-PTEST-formats.patch |    9 +-
 .../valgrind/valgrind_3.16.1.bb               |    1 +
 .../asciidoc/asciidoc_9.0.2.bb                |    2 +-
 meta/recipes-extended/cups/cups.inc           |    3 +
 .../cups/cups/CVE-2020-10001.patch            |   74 ++
 .../groff/files/0001-Include-config.h.patch   | 1026 +----------------
 meta/recipes-extended/groff/groff_1.22.4.bb   |   11 +
 meta/recipes-extended/parted/parted_3.3.bb    |    1 +
 .../screen/screen/CVE-2021-26937.patch        |   68 ++
 meta/recipes-extended/screen/screen_4.8.0.bb  |    1 +
 .../recipes-gnome/epiphany/epiphany_3.36.4.bb |    2 +
 .../epiphany/files/distributor.patch          |   17 +
 .../epiphany/files/migrator.patch             |   24 +
 meta/recipes-gnome/gcr/gcr_3.36.0.bb          |   10 +
 .../libsdl2/CVE-2020-14409-14410.patch        |   79 ++
 .../libsdl2/libsdl2_2.0.12.bb                 |    1 +
 .../xorg-font/xorg-minimal-fonts.bb           |    8 +-
 ...20201218.bb => linux-firmware_20210208.bb} |    4 +-
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.3.bb |    2 +-
 .../webkit/wpebackend-fdo_1.7.1.bb            |    3 +
 .../libevdev/libevdev/determinism.patch       |    3 +-
 scripts/lib/wic/canned-wks/common.wks.inc     |    2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks |    2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      |    2 +-
 scripts/lib/wic/misc.py                       |    1 +
 scripts/lib/wic/partition.py                  |   38 +
 61 files changed, 1171 insertions(+), 1090 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1i.bb => openssl_1.1.1j.bb} (98%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
 create mode 100644 meta/recipes-devtools/git/git/fixsort.patch
 rename meta/recipes-devtools/go/{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} (83%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-23336.patch
 create mode 100644 meta/recipes-devtools/rsync/files/determism.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2020-10001.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2021-26937.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/distributor.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/migrator.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb => linux-firmware_20210208.bb} (99%)

-- 
2.29.2

