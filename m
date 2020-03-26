Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ddOiRcktI1IvXeY98tuf7sZLTV26VBNxAy5BC8oAPQOxwrYH0Xmkkcwm2Aub04VYtvnK1HPILd
 xAW31/lnyZng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:53:51 -0700
IronPort-SDR: TbJLZTwuG5cHnMWKfT9OFdn4A2+juk8Dfoj1IlpVJ/0J7QW5G1cT9few7wZadAZnDjmMmwu2Yt
 bUJYMa1eqF7w==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621836"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 0/9] zeus review
Date: Thu, 26 Mar 2020 16:53:27 +0800
Message-Id: <cover.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4

Next set of changes for zeus. Please review.

Thanks,

Anuj

The following changes since commit c940e4b858d6be28b198770768117ecc098fa0d3:

  bluez: fix CVE-2020-0556 (2020-03-16 15:49:02 +0800)

are available in the git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/zeus

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

 meta/classes/sanity.bbclass                        |  12 +-
 meta/conf/distro/include/security_flags.inc        |   2 +
 ...01-Disable-statx-if-using-glibc-emulation.patch |  34 ++++++
 .../nfs-utils/nfs-utils_2.4.1.bb                   |   1 +
 ...k-don-t-try-to-rehash-a-deleted-directory.patch |  49 +++++++++
 .../e2fsprogs/e2fsprogs/CVE-2019-5188.patch        |  57 ++++++++++
 ...fsck-fix-use-after-free-in-calculate_tree.patch |  76 +++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb |   3 +
 .../screen/screen/CVE-2020-9366.patch              |  48 ++++++++
 meta/recipes-extended/screen/screen_4.6.2.bb       |   1 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |  20 ++--
 meta/recipes-support/icu/icu/CVE-2020-10531.patch  | 122 +++++++++++++++++++++
 meta/recipes-support/icu/icu_64.2.bb               |   1 +
 scripts/lib/wic/plugins/imager/direct.py           |   6 +-
 16 files changed, 421 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2020-9366.patch
 create mode 100644 meta/recipes-support/icu/icu/CVE-2020-10531.patch

-- 
2.7.4

