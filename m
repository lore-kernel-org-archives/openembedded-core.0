Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E235FC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 02:17:58 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.17837.1641953877933269840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 18:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Hm/4e96w;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641953877; x=1673489877;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mmShqMP+uCVxCqH03VwzTtfdQDVL0DUGBbXqZEyuUAk=;
  b=Hm/4e96widVqPI1wUYNYfuOBQhVFCFvjxZcbdnAfSaPwnW4wtba8R02f
   DVcY1sQJeOyQKerC2VLhNQjWbNKWVQVc+u42r6bAa/hk8n/JljDnr++xy
   rGH2E8oUTXBwjADqylYwEeXJYqgleM59FLwjCmpLHuPt4IGtogvsLvto5
   j5DqHxlt+YXBe82Lhu64Es+9anjJcYQvyda03I9nvrErhdFElQdSOV3Cu
   iT60+lhvrvMuN3eZRCDIqKHVizzO8QPh9/rftHq/Uk6sr2vUv0o2QaHfn
   VDctekUgqESsBdz2tjMdZ2PuHjS2qWqScrFqmhczIlZInX2Bh2D8mBLlk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="329989367"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600";
   d="scan'208";a="329989367"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 18:17:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600";
   d="scan'208";a="762733687"
Received: from joharim1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.143.62])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 18:17:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/9] Pull request (cover letter only)
Date: Wed, 12 Jan 2022 10:17:51 +0800
Message-Id: <cover.1641953532.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 02:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160477

The following changes since commit 626e138ebf0b7d733f0099cc5a0d9534c1ae64c3:

  linux-yocto: add libmpc-native to DEPENDS (2022-01-10 11:57:36 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Anuj Mittal (1):
  xserver-xorg: update CVE_PRODUCT

Markus Volk (1):
  vulkan-loader: inherit pkgconfig

Oleksiy Obitotskyy (1):
  package_manager: ipk: Fix host manifest generation

Richard Purdie (3):
  openssl: Add reproducibility fix
  webkitgtk: Add reproducibility fix
  scripts: Update to use exec_module() instead of load_module()

Samuli Piippo (1):
  rpm: remove tmp folder created during install

Tim Orling (1):
  scripts/buildhistory-diff: drop use of distutils

Yongxin Liu (1):
  grub2: fix CVE-2021-3981

 meta/lib/oe/sdk.py                            |  4 ++
 ...onfig-Restore-umask-for-the-grub.cfg.patch | 49 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 .../openssl/openssl/reproducibility.patch     | 22 +++++++++
 .../openssl/openssl_1.1.1l.bb                 |  1 +
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  3 ++
 .../vulkan/vulkan-loader_1.2.182.0.bb         |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  2 +-
 .../webkit/webkitgtk/reproducibility.patch    | 22 +++++++++
 meta/recipes-sato/webkit/webkitgtk_2.32.3.bb  |  1 +
 scripts/buildhistory-diff                     |  5 --
 scripts/lib/scriptutils.py                    |  7 ++-
 scripts/lib/wic/pluginbase.py                 |  8 ++-
 13 files changed, 116 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch

-- 
2.34.1


