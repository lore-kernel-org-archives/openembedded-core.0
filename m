Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.12454.1612885957531443030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hKtua1BWdxhrziBWIASaJfq21SrQByZZWzxLmdaM/TTJ1q9ur2Dlx/escHCf+2lD22uiPnjBLp
 SHYvzxXav/vQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968559"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968559"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:36 -0800
IronPort-SDR: g4qMRGmowXEQSJNvr0RLYbl56UhP1fZGQDpSiLysumqcxFasJRSReGhyCYTPem7YPrWqGFoWCt
 6b4jH8OZOquw==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215403"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/35] review request
Date: Tue,  9 Feb 2021 23:51:45 +0800
Message-Id: <cover.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. Builds cleanly
on autobuilder except for a known intermittent issue while executing a
tinfoil selftest.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1842

Thanks,

Anuj

The following changes since commit c63feb7e062750ef9d1fcfd6ee16f1d220f8a369:

  strace: increase ptest timeout duration 120->240s (2021-02-05 23:34:49 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Alexander Kanavin (5):
  python3: split python target configuration into own class
  python3-pycairo: use python3targetconfig
  distutils3-base.bbclass: use python3targetconfig
  meta: drop _PYTHON_SYSCONFIGDATA_NAME hacks
  gpgme: use python3targetconfig

Anuj Mittal (2):
  sudo: fix CVE-2021-23240
  sudo: fix CVE-2021-3156

Awais Belal (1):
  kernel.bbclass: fix deployment for initramfs images

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.90
  linux-yocto-rt/5.4: fix 5.4-stable caused build breakage
  linux-yocto/5.4: update to v5.4.94

Chen Qi (1):
  systemd: change /bin/nologin to /sbin/nologin

Dorinda (1):
  sanity.bbclass: Check if PSEUDO_IGNORE_PATHS and paths under pseudo
    control overlap

Kamel Bouhara (2):
  npm.bbclass: make shrinkwrap file optional
  recipetool: create: only add npmsw url if required

Khem Raj (1):
  python3targetconfig.bbclass: Make py3 dep and tasks only for target
    recipes

Lee Chee Yang (2):
  openssl: set CVE_VERSION_SUFFIX
  wic/selftest: test_permissions also test bitbake image

Martin Jansa (1):
  image_types.bbclass: tar: use posix format instead of gnu

Michael Halstead (2):
  uninative: Upgrade to 2.10
  yocto-uninative.inc: version 2.11 updates glibc to 2.33

Mike Looijmans (1):
  license_image.bbclass: Don't attempt to symlink to the same file

Richard Purdie (8):
  image_types: Ensure tar archives are reproducible
  ncurses: Don't put terminfo into the sysroot
  python3: Avoid installing test data into recipe-sysroot
  staging: Clean up files installed into the sysroot
  package: Ensure do_packagedata is cleaned correctly
  qemu.inc: Should depend on qemu-system-native, not qemu-native
  openssh: Backport a fix to fix with glibc 2.33 on some platforms
  pseudo: Update to work with glibc 2.33

Steve Sakoman (1):
  glibc: update to latest release/2.32/master branch

Tomasz Dziendzielski (1):
  sstatesig: Add descriptive error message to getpwuid/getgrgid "uid/gid
    not found" KeyError

Vyacheslav Yurkov (1):
  npm.bbclass: use python3 for npm config

saloni (2):
  libgcrypt: Whitelisted CVEs
  libcroco: Added CVE

 meta/classes/distutils3-base.bbclass          |   2 +-
 meta/classes/image_types.bbclass              |   2 +-
 meta/classes/kernel.bbclass                   |   2 +-
 meta/classes/license_image.bbclass            |   3 +-
 meta/classes/npm.bbclass                      |  37 +-
 meta/classes/package.bbclass                  |   1 +
 meta/classes/python3native.bbclass            |   2 -
 meta/classes/python3targetconfig.bbclass      |  17 +
 meta/classes/sanity.bbclass                   |  10 +
 meta/classes/scons.bbclass                    |   3 -
 meta/classes/staging.bbclass                  |   4 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/conf/machine/include/qemu.inc            |   2 +-
 meta/lib/oe/prservice.py                      |   4 -
 meta/lib/oe/sstatesig.py                      |   6 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  16 +
 ...440ca70abab947acbd77795e9f130967956c.patch |  28 ++
 .../openssh/openssh_8.3p1.bb                  |   1 +
 .../openssl/openssl_1.1.1i.bb                 |   2 +
 meta/recipes-core/glib-2.0/glib.inc           |   4 -
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/CVE-2019-25013.patch          | 137 ------
 meta/recipes-core/glibc/glibc_2.32.bb         |   4 +-
 meta/recipes-core/ncurses/ncurses.inc         |   5 +
 meta/recipes-core/systemd/systemd_246.9.bb    |  16 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../python/python3-pycairo_1.19.1.bb          |   2 +-
 meta/recipes-devtools/python/python3_3.8.5.bb |   6 +
 .../sudo/files/CVE-2021-23240.patch           | 419 ++++++++++++++++++
 .../sudo/files/CVE-2021-3156-1.patch          | 100 +++++
 .../sudo/files/CVE-2021-3156-2.patch          |  53 +++
 .../sudo/files/CVE-2021-3156-3.patch          |  73 +++
 .../sudo/files/CVE-2021-3156-4.patch          |  29 ++
 .../sudo/files/CVE-2021-3156-5.patch          |  41 ++
 meta/recipes-extended/sudo/sudo_1.9.3.bb      |   6 +
 meta/recipes-graphics/mesa/mesa.inc           |   5 -
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-support/gpgme/gpgme_1.14.0.bb    |   2 +-
 .../libcroco/files/CVE-2020-12825.patch       | 192 ++++++++
 .../libcroco/libcroco_0.6.13.bb               |   3 +
 .../libgcrypt/libgcrypt_1.8.6.bb              |   3 +
 scripts/lib/recipetool/create_npm.py          |   6 +-
 44 files changed, 1085 insertions(+), 213 deletions(-)
 create mode 100644 meta/classes/python3targetconfig.bbclass
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-23240.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-1.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-2.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-3.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-4.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-5.patch
 create mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.patch

-- 
2.29.2

