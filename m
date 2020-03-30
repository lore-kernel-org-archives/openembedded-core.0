Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.53566.1585583490800997346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 08:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: C3IjbzcVXaSC0qKmUAHgZCTx+26fGAh/Twwy67pt4YKEQjAwb+wng6bK6sId0zTFImfTtIocHw
 2R0E1Ock5W/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 08:51:30 -0700
IronPort-SDR: q4RETBG7DdIPRlD2UxwtOCyZTC2VI/GpIlFJMd/wNaMsEPUxbezUoRa4UTGwI0BMy8Zw/jZjjR
 84szb6q1hv7g==
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; 
   d="scan'208";a="395165993"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.144.5])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 08:51:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 0/9] zeus pull request - cover letter only
Date: Mon, 30 Mar 2020 23:51:23 +0800
Message-Id: <cover.1585583178.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please pull these changes for zeus. Clean a-full on autobuilder.

Thanks,

Anuj

The following changes since commit c940e4b858d6be28b198770768117ecc098fa0d3:

  bluez: fix CVE-2020-0556 (2020-03-16 15:49:02 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

Anuj Mittal (4):
  icu: fix CVE-2020-10531
  screen: fix CVE-2020-9366
  e2fsprogs: fix CVE-2019-5188
  e2fsprogs: backport upstream patch

Bruce Ashfield (1):
  linux-yocto/4.19: update to v4.19.107

Chee Yang Lee (1):
  wic/direct: reserve 2 sector for extended partition

Julius Hemanth Pitti (1):
  nfs-utils: Disable statx if using glibc emulation

Ross Burton (1):
  sanity: check for more bits of Python

Tom Hochstein (1):
  security_flags.inc: fix flags missing from SDK toolchain

 meta/classes/sanity.bbclass                   |  12 +-
 meta/conf/distro/include/security_flags.inc   |   2 +
 ...sable-statx-if-using-glibc-emulation.patch |  34 +++++
 .../nfs-utils/nfs-utils_2.4.1.bb              |   1 +
 ...-t-try-to-rehash-a-deleted-directory.patch |  49 +++++++
 .../e2fsprogs/e2fsprogs/CVE-2019-5188.patch   |  57 ++++++++
 ...fix-use-after-free-in-calculate_tree.patch |  76 +++++++++++
 .../e2fsprogs/e2fsprogs_1.45.3.bb             |   3 +
 .../screen/screen/CVE-2020-9366.patch         |  48 +++++++
 meta/recipes-extended/screen/screen_4.6.2.bb  |   1 +
 .../linux/linux-yocto-rt_4.19.bb              |   6 +-
 .../linux/linux-yocto-tiny_4.19.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  20 +--
 .../icu/icu/CVE-2020-10531.patch              | 122 ++++++++++++++++++
 meta/recipes-support/icu/icu_64.2.bb          |   1 +
 scripts/lib/wic/plugins/imager/direct.py      |   6 +-
 16 files changed, 421 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2020-9366.patch
 create mode 100644 meta/recipes-support/icu/icu/CVE-2020-10531.patch

-- 
2.25.1

