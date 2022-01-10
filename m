Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CA6C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=XCnqP85f;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787762; x=1673323762;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OchHXWO3yBghZMHDHY0m4uViAFdRS0KoAvqLSZipy6k=;
  b=XCnqP85f0OU99f35AiTMtPxLtBqjAoWdC3Poi9FKkJwFIYskJwA8SldH
   Vq2rFcg+UwIqoMJxDYr0M2yLIZSFvKbZAJOCDOH9a7vFU8DxQ/3iXwHnF
   PRXbRdbUlSkgndgxTSUkvIBUBungzNcfVKepCW6fGw9fBEF9W+K1ejYov
   FYdN7fpm5l/D24CCLvX0XsOAHYoKZUjGqSNvDifaZKq0M30vlp3+ofOuO
   XGKx3wpGsBBY/d5aQSJD2Tr0VvZQDSn5LEWpx5Wyh/if75Sjj6GXjYHVP
   IxC/2yz35IcsXf/Glp91AJ4XYtSbm5cV0U6+yUV009guOWUHWz5RxiQ5s
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347342"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347342"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402187"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/10] Patch review
Date: Mon, 10 Jan 2022 12:09:04 +0800
Message-Id: <cover.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160321

Next set of changes for honister. No problems seen while testing on
autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3092

Thanks,

Anuj

The following changes since commit 4e732ef0d3c90952f14804f5fc41ea16304810af:

  xserver-xorg: upgrade 1.20.13 -> 1.20.14 (2021-12-29 09:21:24 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

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

Ross Burton (1):
  linux-yocto: add libmpc-native to DEPENDS

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
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  2 +-
 .../webkit/webkitgtk/reproducibility.patch    | 22 +++++++++
 meta/recipes-sato/webkit/webkitgtk_2.32.3.bb  |  1 +
 scripts/buildhistory-diff                     |  5 --
 scripts/lib/scriptutils.py                    |  7 ++-
 scripts/lib/wic/pluginbase.py                 |  8 ++-
 14 files changed, 117 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch

-- 
2.33.1


