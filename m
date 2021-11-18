Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AADC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 06:49:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.2320.1637218141319468938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 22:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="320341871"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800";
   d="scan'208";a="320341871"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 22:49:00 -0800
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800";
   d="scan'208";a="536594441"
Received: from mnoorazm-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.140.242])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 22:48:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/17] Pull request (cover letter only)
Date: Thu, 18 Nov 2021 14:48:54 +0800
Message-Id: <cover.1637218024.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 06:49:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158466

Please merge these changes.

Thanks,

Anuj

The following changes since commit d2cba06c27c87c64423636153c0f186c5f45b147:

  glibc-version.inc: remove branch= from GLIBC_GIT_URI (2021-11-12 10:57:32 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Bruce Ashfield (4):
  linux-yocto/5.14: update to v5.14.16
  linux-yocto/5.10: update to v5.10.77
  linux-yocto/5.14: update to v5.14.17
  linux-yocto/5.10: update to v5.10.78

Chen Qi (1):
  avahi: update CVE id fixed by local-ping.patch

Jon Mason (1):
  scripts/lib/wic/help.py: Update Fedora Kickstart URLs

Kai Kang (2):
  squashfs-tools: follow-up fix for CVE-2021-41072
  convert-srcuri.py: use regex to check space in SRC_URI

Peter Kjellerstedt (1):
  insane.bbclass: Add a check for directories that are expected to be
    empty

Richard Purdie (6):
  mirrors: Add uninative mirror on kernel.org
  scripts/oe-package-browser: Fix after overrides change
  scripts/oe-package-browser: Handle no packages being built
  wpa-supplicant: Match package override to PACKAGES for pkg_postinst
  uninative: Add version to uninative tarball name
  mirrors: Add kernel.org sources mirror for downloads.yoctoproject.org

Ross Burton (2):
  vim: fix CVE-2021-3796, CVE-2021-3872, and CVE-2021-3875
  vim: add patch number to CVE-2021-3778 patch

 meta/classes/insane.bbclass                   | 30 ++++++
 meta/classes/mirrors.bbclass                  |  2 +
 meta/classes/uninative.bbclass                |  2 +-
 meta/conf/distro/include/yocto-uninative.inc  |  3 +-
 meta/conf/documentation.conf                  |  2 +
 .../avahi/files/local-ping.patch              |  1 +
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  2 +-
 .../squashfs-tools/CVE-2021-41072.patch       |  6 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.14.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +-
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 ++---
 ...28-using-freed-memory-when-replacing.patch | 83 ++++++++++++++++
 ...llegal-memory-access-if-buffer-name-.patch | 86 ++++++++++++++++
 ...ml_get-error-after-search-with-range.patch | 72 ++++++++++++++
 ...nvalid-memory-access-when-scrolling-.patch | 97 +++++++++++++++++++
 .../vim/files/CVE-2021-3778.patch             | 37 ++++---
 meta/recipes-support/vim/vim.inc              |  8 +-
 scripts/contrib/convert-srcuri.py             |  8 +-
 scripts/lib/wic/help.py                       |  4 +-
 scripts/oe-pkgdata-browser                    |  8 +-
 23 files changed, 464 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
 create mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
 create mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
 create mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch

-- 
2.33.1


