Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.1101.1618450511543252463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 18:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1z5erKtJ6UvWTu5NW2OPKKYLrPx28B6JPnKXaEDvY2QWnEAZrwZd5V28cZcYQUnbNBggO+HMTk
 5IyIZWjv/yFw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="194335709"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="194335709"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 18:35:10 -0700
IronPort-SDR: 7cBrm9j/s7pj6/b9smP57CM75dMphnlJbWfRWkiyV3XmdeUhtWd3S7mt2u1IA/r2pg6dpVvhFx
 p9vaDDMQxwvQ==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="532975558"
Received: from rdsharma-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.140.131])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 18:35:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/18] pull request
Date: Thu, 15 Apr 2021 09:35:04 +0800
Message-Id: <cover.1618450421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit fdae970656cc421c542af9856bc9ae038c61db13:

  build-appliance-image: Update to gatesgarth head revision (2021-03-28 22:33:00 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

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

