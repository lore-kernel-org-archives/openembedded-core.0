Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B120C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:25:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.13946.1633371946898459055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="311744750"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="311744750"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208777"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/11] Review request
Date: Tue,  5 Oct 2021 00:50:44 +0800
Message-Id: <cover.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:25:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156622

Please review these changes for hardknott. No issues seen on
autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2689

Thanks,

Anuj

The following changes since commit 97d6a8452779fe511a354a70a72dd338f52a92cb:

  bash: Ensure deterministic build (2021-09-29 16:22:10 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (1):
  wic: keep rootfs_size as integer

Anibal Limon (1):
  recipes-support/ptest-runner: Bump to v2.4.2

Chandana kalluri (1):
  scriptutils.py: Add check before deleting path

Chen Qi (1):
  systemd: fix CVE-2021-33910

Jon Mason (1):
  Update mailing list address

Kenfe-Mickael Laventure (1):
  package_ipk: Use localdata store when signing packages

Richard Purdie (3):
  bind: Exclude CVE-2019-6470 from cve-check
  vim: Backport fix for CVE-2021-3770
  glew: Stop polluting /tmp during builds

Sakib Sajal (1):
  qemu: fix CVE-2021-3682

William A. Kennington III (1):
  rm_work.bbclass: Fix for files starting with -

 meta/classes/package_ipk.bbclass              |   4 +-
 meta/classes/rm_work.bbclass                  |   8 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../recipes-connectivity/bind/bind_9.16.16.bb |   4 +
 .../ldconfig-native-2.12.1/ldconfig.patch     |   2 +-
 ...it-name-do-not-use-strdupa-on-a-path.patch |  72 ++++++
 meta/recipes-core/systemd/systemd_247.6.bb    |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3682.patch             |  41 ++++
 .../glew/glew/notempdir.patch                 |  19 ++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |   1 +
 ...-runner_2.4.1.bb => ptest-runner_2.4.2.bb} |   2 +-
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 scripts/lib/scriptutils.py                    |   3 +-
 scripts/lib/wic/partition.py                  |   2 +-
 16 files changed, 360 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
 create mode 100644 meta/recipes-graphics/glew/glew/notempdir.patch
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.1.bb => ptest-runner_2.4.2.bb} (93%)
 create mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

-- 
2.31.1


