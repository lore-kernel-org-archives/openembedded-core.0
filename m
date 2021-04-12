Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 63uQHKu1fHRqCqVc35Vi/rBwV2Es7KF+SgRAsh1Ls5053tTC177e5kFnTo4m6RPTjiO0AZBxx4
 et4gb6PBtYkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467865"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467865"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:34 -0700
IronPort-SDR: OobW4tmU9s6dUUKkrZ7c5drvtZXiOR0aSQfzeVSGbg3CtQvs/ZY8BUaoQpqsVaNfENWiuPSA+j
 wD5BSj0chxew==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809016"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/18] review request
Date: Mon, 12 Apr 2021 17:08:08 +0800
Message-Id: <cover.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. Builds cleanly
on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2039

Thanks,

Anuj

The following changes since commit fdae970656cc421c542af9856bc9ae038c61db13:

  build-appliance-image: Update to gatesgarth head revision (2021-03-28 22:33:00 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Anatol Belski (1):
  glibc: Pull latest 2.32 HEAD

Anton D. Kachalov (1):
  run-postinsts: do not remove postinsts directory.

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.105
  linux-yocto/5.4: update to v5.4.107

Christopher Larson (2):
  buildhistory: add missing vardepsexcludes
  image,populate_sdk_base: move 'func' flag setting for sdk command vars

Dorinda Bassey (1):
  devshell.bbclass: Exceptions displayed within devpyshell

Guillaume Champagne (1):
  image-live.bbclass: optional depends when ROOTFS empty

Khem Raj (1):
  documentation-audit.sh: Fix typo in specifying LICENSE_FLAGS_WHITELIST

Lee Chee Yang (2):
  cve-update-db-native: consider version suffix when update CVE db
  cve-check: CVE_VERSION_SUFFIX to work with patched release

Martin Jansa (1):
  binutils: backport fix for gold with theads enabled from 2.36.0

Michael Trensch (1):
  linux-firmware: Fix packaging

Mikko Rapeli (1):
  openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449

Mingli Yu (1):
  libtool: make sure autoheader run before autoconf

Minjae Kim (1):
  git: fix CVE-2021-21300

Petr Vorel (1):
  scripts/verify-bashisms: Update checkbashisms.pl URL

Richard Purdie (1):
  selftest/wic: Fix dependency issue in rawcopy test

 meta/classes/buildhistory.bbclass             |   3 +
 meta/classes/devshell.bbclass                 |   1 +
 meta/classes/image-live.bbclass               |   2 +-
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/populate_sdk_base.bbclass        |   7 +
 meta/lib/oe/cve_check.py                      |   7 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |   8 +
 meta/lib/oeqa/selftest/cases/wic.py           |  18 +-
 .../{openssl_1.1.1j.bb => openssl_1.1.1k.bb}  |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.32.bb         |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 .../binutils/binutils-2.35.1.inc              |   1 +
 ..._counts_lock-is-initialized-before-u.patch |  41 +++
 meta/recipes-devtools/git/git.inc             |   4 +-
 .../git/git/CVE-2021-21300.patch              | 304 ++++++++++++++++++
 .../libtool/libtool-2.4.6.inc                 |   1 +
 ...-sure-autoheader-run-before-autoconf.patch |  35 ++
 .../run-postinsts/run-postinsts/run-postinsts |  10 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +
 .../linux-firmware/linux-firmware_20210208.bb |  41 ++-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 scripts/contrib/documentation-audit.sh        |   2 +-
 scripts/verify-bashisms                       |   2 +-
 26 files changed, 490 insertions(+), 50 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb} (98%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gold-ensure-file_counts_lock-is-initialized-before-u.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2021-21300.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch

-- 
2.30.2

