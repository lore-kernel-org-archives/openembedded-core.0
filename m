Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115A7C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:22:06 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.6693.1637763725337560376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222159806"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800";
   d="scan'208";a="222159806"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:22:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800";
   d="scan'208";a="457487161"
Received: from itong-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.141.89])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:22:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/16] Pull request
Date: Wed, 24 Nov 2021 22:21:51 +0800
Message-Id: <cover.1637763666.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:22:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158690

Please merge these changes.

Thanks,

Anuj

The following changes since commit 2fd327ae5b3da8841ebed00bfc60b7bb8d6a64c5:

  llvm: bump HASHEQUIV_HASH_VERSION (2021-11-16 11:20:31 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Andrej Valek (1):
  mklibs-native: drop deprecated cpp17 exceptions

Bruce Ashfield (2):
  linux-yocto/5.10: update to v5.10.77
  linux-yocto/5.10: update to v5.10.78

Changqing Li (1):
  rpm: fix CVE-2021-3521

Jon Mason (1):
  scripts/lib/wic/help.py: Update Fedora Kickstart URLs

Kai Kang (2):
  convert-srcuri.py: use regex to check space in SRC_URI
  squashfs-tools: fix CVE-2021-41072

Mingli Yu (4):
  vim: fix CVE-2021-3872 and CVE-2021-3903
  vim: fix CVE-2021-3875
  bind: fix CVE-2021-25219
  vim: fix CVE-2021-3927 and CVE-2021-3928

Pgowda (1):
  gcc: Fix CVE-2021-35465

Richard Purdie (3):
  mirrors: Add uninative mirror on kernel.org
  scripts/oe-package-browser: Handle no packages being built
  mirrors: Add kernel.org sources mirror for downloads.yoctoproject.org

Yi Zhao (1):
  inetutils: fix CVE-2021-40491

 meta/classes/mirrors.bbclass                  |   2 +
 .../bind/bind-9.16.16/CVE-2021-25219-1.patch  |  76 +++
 .../bind/bind-9.16.16/CVE-2021-25219-2.patch  |  65 +++
 .../recipes-connectivity/bind/bind_9.16.16.bb |   2 +
 .../inetutils/inetutils/CVE-2021-40491.patch  |  67 +++
 .../inetutils/inetutils_2.0.bb                |   1 +
 meta/recipes-devtools/gcc/gcc-10.2.inc        |   4 +
 .../gcc/gcc/0001-CVE-2021-35465.patch         | 138 ++++++
 .../gcc/gcc/0002-CVE-2021-35465.patch         |  40 ++
 .../gcc/gcc/0003-CVE-2021-35465.patch         | 103 +++++
 .../gcc/gcc/0004-CVE-2021-35465.patch         | 304 ++++++++++++
 ...ecated-exception-specification-cpp17.patch | 431 ++++++++++++++++++
 .../mklibs/mklibs-native_0.1.44.bb            |   1 +
 .../rpm/files/0001-CVE-2021-3521.patch        |  57 +++
 .../rpm/files/0002-CVE-2021-3521.patch        |  62 +++
 .../rpm/files/0003-CVE-2021-3521.patch        | 332 ++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |   3 +
 .../files/CVE-2021-41072-requisite-1.patch    | 135 ++++++
 .../files/CVE-2021-41072-requisite-2.patch    | 109 +++++
 .../files/CVE-2021-41072-requisite-3.patch    | 330 ++++++++++++++
 .../squashfs-tools/files/CVE-2021-41072.patch | 316 +++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |   4 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 .../vim/files/CVE-2021-3872.patch             |  57 +++
 .../vim/files/CVE-2021-3875.patch             |  37 ++
 .../vim/files/CVE-2021-3903.patch             |  38 ++
 .../vim/files/CVE-2021-3927.patch             |  32 ++
 .../vim/files/CVE-2021-3928.patch             |  34 ++
 meta/recipes-support/vim/vim.inc              |   5 +
 scripts/contrib/convert-srcuri.py             |   8 +-
 scripts/lib/wic/help.py                       |   4 +-
 scripts/oe-pkgdata-browser                    |   2 +
 34 files changed, 2812 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-1.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-2.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-3.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3872.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3875.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3903.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3927.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3928.patch

-- 
2.33.1


