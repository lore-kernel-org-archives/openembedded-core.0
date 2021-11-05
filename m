Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFECC433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 15:57:32 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.7590.1636127838560510120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 08:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="232176876"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800";
   d="scan'208";a="232176876"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 08:57:18 -0700
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800";
   d="scan'208";a="586394010"
Received: from rroslan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 08:57:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/24] Pull request (cover letter only)
Date: Fri,  5 Nov 2021 23:57:11 +0800
Message-Id: <cover.1636127766.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 15:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157908

Please merge these changes.

Thanks,

Anuj

The following changes since commit 6ca6c9c12c93c6df7b18f49ebdbfb69433ff5158:

  bootchart2: Don't compile python modules (2021-10-26 21:42:27 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Ahmed Hossam (1):
  go.bbclass: Allow adding parameters to go ldflags

Alexander Kanavin (4):
  waffle: convert to git, website is down
  stress-ng: convert to git, website is down
  tzdata: upgrade 2021a -> 2021d
  tzdata: update 2021d -> 2021e

Bruce Ashfield (7):
  linux-yocto/5.10: update to v5.10.73
  linux-yocto/5.14: update to v5.14.12
  linux-yocto/5.14: update to v5.14.13
  linux-yocto/5.10: update to v5.10.74
  linux-yocto/5.14: common-pc: enable CONFIG_ATA_PIIX as built-in
  linux-yocto/5.14: update to v5.14.14
  linux-yocto/5.10: update to v5.10.75

Hsia-Jun(Randy) Li (1):
  meson: install native file in sdk

Joshua Watt (1):
  classes/populate_sdk_base: Add setscene tasks

Peter Kjellerstedt (2):
  meson.bblcass: Remove empty egg-info directories before running meson
  qemu.inc: Remove empty egg-info directories before running meson

Randy Li (1):
  meson: move lang args to the right section

Richard Purdie (1):
  staging: Fix autoconf-native rebuild failure

Ross Burton (1):
  strace: show test suite log on failure

Saul Wold (3):
  spdx.py: Add annotation to relationship
  create-spdx: add create_annotation function
  create-spdx: cross recipes are native also

Teoh Jay Shen (1):
  oeqa/runtime/parselogs: modified drm error in common errors list

Tim Orling (1):
  python3-setuptools: _distutils/sysconfig fix

 meta/classes/create-spdx.bbclass              | 22 +++++---
 meta/classes/go.bbclass                       |  3 +-
 meta/classes/meson.bbclass                    | 10 ++++
 meta/classes/populate_sdk_base.bbclass        |  4 ++
 meta/classes/staging.bbclass                  |  2 +-
 meta/lib/oe/spdx.py                           |  6 ++-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  2 +-
 .../meson/meson/meson-setup.py                |  8 +++
 .../meson/meson/meson-wrapper                 |  1 +
 .../meson/nativesdk-meson_0.58.1.bb           | 52 ++++++++++++++++++-
 ...nfig-append-STAGING_LIBDIR-python-sy.patch | 34 ++++++++++++
 .../python/python3-setuptools_57.4.0.bb       |  5 +-
 meta/recipes-devtools/qemu/qemu.inc           |  8 ++-
 meta/recipes-devtools/strace/strace/run-ptest |  9 ++++
 ...write-the-timestamp-into-compressed-.patch | 26 ++++++++++
 .../stress-ng/stress-ng_0.13.00.bb            |  8 +--
 meta/recipes-extended/timezone/timezone.inc   |  7 +--
 meta/recipes-graphics/waffle/waffle_1.6.1.bb  | 10 ++--
 .../linux/linux-yocto-rt_5.10.bb              |  6 +--
 .../linux/linux-yocto-rt_5.14.bb              |  6 +--
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++-----
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++-----
 24 files changed, 227 insertions(+), 68 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch

-- 
2.31.1


