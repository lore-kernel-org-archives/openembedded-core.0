Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A67FC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 14:22:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.12231.1638541371985221286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 06:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="237205161"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800";
   d="scan'208";a="237205161"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:22:50 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800";
   d="scan'208";a="597990251"
Received: from ffoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:22:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/14] Pull request
Date: Fri,  3 Dec 2021 22:22:39 +0800
Message-Id: <cover.1638541231.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 14:22:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159118

Please merge these changes.

Thanks,

Anuj

The following changes since commit e95ccf6f7fe5a42fffcfa5e43087ff964622e26c:

  squashfs-tools: fix CVE-2021-41072 (2021-11-22 09:45:46 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.154
  linux-yocto/5.4: update to v5.4.155
  linux-yocto/5.4: update to v5.4.156
  linux-yocto/5.4: update to v5.4.158
  linux-yocto/5.10: update to v5.10.79

Claus Stovgaard (1):
  cups: Fix missing installation of cups sysv init scripts

Daniel Gomez (1):
  os-release: Add DISTRO_CODENAME as vardeps for do_compile

Mingli Yu (1):
  wic: use shutil.which

Oleksandr Kravchuk (1):
  python3: update to 3.9.7

Pavel Zhukov (1):
  go: upgrade 1.16.8 -> 1.16.10

Richard Purdie (2):
  uninative: Add version to uninative tarball name
  glibc: Fix i586/c3 support

Ross Burton (1):
  gmp: fix CVE-2021-43618

zhengruoqin (1):
  python3: upgrade 3.9.5 -> 3.9.6

 meta/classes/uninative.bbclass                |  2 +-
 meta/conf/distro/include/yocto-uninative.inc  |  3 +-
 meta/recipes-core/glibc/glibc_2.33.bb         |  2 +-
 meta/recipes-core/os-release/os-release.bb    |  4 ++-
 .../go/{go-1.16.8.inc => go-1.16.10.inc}      |  6 ++--
 ..._1.16.8.bb => go-binary-native_1.16.10.bb} |  4 +--
 ...1.16.8.bb => go-cross-canadian_1.16.10.bb} |  0
 ...go-cross_1.16.8.bb => go-cross_1.16.10.bb} |  0
 ...sssdk_1.16.8.bb => go-crosssdk_1.16.10.bb} |  0
 ...-native_1.16.8.bb => go-native_1.16.10.bb} |  0
 ...untime_1.16.8.bb => go-runtime_1.16.10.bb} |  0
 .../go/{go_1.16.8.bb => go_1.16.10.bb}        |  0
 ...sue36464-parallel-build-race-problem.patch | 34 -------------------
 .../{python3_3.9.5.bb => python3_3.9.7.bb}    |  3 +-
 meta/recipes-extended/cups/cups.inc           |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++--
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  8 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++-------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++------
 .../gmp/gmp/cve-2021-43618.patch              | 27 +++++++++++++++
 meta/recipes-support/gmp/gmp_6.2.1.bb         |  1 +
 scripts/lib/wic/engine.py                     |  6 ++--
 scripts/lib/wic/misc.py                       |  4 +--
 scripts/wic                                   |  4 +--
 26 files changed, 86 insertions(+), 90 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc} (86%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.8.bb => go-native_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
 rename meta/recipes-devtools/python/{python3_3.9.5.bb => python3_3.9.7.bb} (98%)
 create mode 100644 meta/recipes-support/gmp/gmp/cve-2021-43618.patch

-- 
2.33.1


