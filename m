Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF82C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.10087.1632927554721798137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="224613750"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="224613750"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="520858396"
Received: from zkeh-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.143.173])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:12 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/10] Review request
Date: Wed, 29 Sep 2021 22:58:58 +0800
Message-Id: <cover.1632903759.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 14:59:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156457

Please review these changes for hardknott. One intermittent failure seen
when running SDK tests on Centos-8 but that doesn't look related to
these changes.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2660

Thanks,

Anuj

The following changes since commit 437f5e04c92158d3c9e27fe6252260a02a108391:

  ffmpeg: fix CVE-2021-38114 (2021-09-24 10:17:24 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Konrad Weihmann (1):
  expat: pull from github releases

Mingli Yu (1):
  vim: fix CVEs

Richard Purdie (5):
  pybootchart: Avoid divide by zero
  oeqa/qemurunner: Use oe._exit(), not sys.exit()
  oeqa/selftest/gotoolchain: Fix temp file cleanup
  oeqa/buildproject: Ensure temp directories are cleaned up
  bash: Ensure deterministic build

Steve Sakoman (1):
  connman: add CVE_PRODUCT

Tom Pollard (2):
  bzip2: Update soname for libbz2 1.0.8
  libsamplerate0: Set correct soname for 0.1.9

 meta/lib/oeqa/selftest/cases/gotoolchain.py   |  6 +++
 meta/lib/oeqa/utils/buildproject.py           |  3 ++
 meta/lib/oeqa/utils/qemurunner.py             |  2 +-
 meta/lib/oeqa/utils/targetbuild.py            |  4 +-
 meta/recipes-connectivity/connman/connman.inc |  2 +
 meta/recipes-core/expat/expat_2.2.10.bb       |  6 ++-
 meta/recipes-extended/bash/bash.inc           |  5 ++
 meta/recipes-extended/bzip2/bzip2/Makefile.am |  2 +-
 .../libsamplerate0/shared_version_info.patch  | 13 +++++
 .../libsamplerate/libsamplerate0_0.1.9.bb     |  1 +
 .../vim/files/CVE-2021-3778.patch             | 34 +++++++++++++
 .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 scripts/pybootchartgui/pybootchartgui/draw.py |  5 +-
 14 files changed, 130 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

-- 
2.31.1


