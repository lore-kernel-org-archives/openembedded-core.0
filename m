Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E23AC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 15:19:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.9653.1633101557110045749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 08:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="248026703"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200";
   d="scan'208";a="248026703"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 08:16:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200";
   d="scan'208";a="565058709"
Received: from jkong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.226.127])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 08:16:04 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/10] Pull Request (cover letter only)
Date: Fri,  1 Oct 2021 23:15:56 +0800
Message-Id: <cover.1633101306.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 15:19:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156528

Please merge these changes.

Thanks,

Anuj

The following changes since commit 437f5e04c92158d3c9e27fe6252260a02a108391:

  ffmpeg: fix CVE-2021-38114 (2021-09-24 10:17:24 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

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


