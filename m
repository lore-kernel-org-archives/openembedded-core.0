Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7D7C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 14:55:12 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.11980.1647356110910416702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=a6R4v593;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647356111; x=1678892111;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NggFBEALrO0MLwokiPDvWZo4SoQr8DFn8lCPibjBEqU=;
  b=a6R4v5933v0uOPZz5mWNa3u952ZgLgMAXeTPWF3C1hwmdjXdde374gcG
   HjO4hl65r9s9qDdpfsyAnAwSlAvyckMAXuMXKJOxBzp+/R4x6KUxSC8OE
   FBTXaEm8C91bk8O0eZdOgYwbNxrPC9TlJj3wsfy9WULkSErJaoyGE5ygU
   p6DHryXtRCAM6sFF2j77FV/qreBs7H1Mya2XQrD2MsS57kWC9RNq1Z1pH
   Zoh0zZvOECE9XQ2DagWVQ5eO4VhTir72PE21PdaDxcyss9p3pjcY5ViUp
   VYUEpWCNz1kuNYiWQNz/CqehRoucdhyLvTzD48gsWjx+JZdOsTekczgUV
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238491320"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="238491320"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 07:55:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="598334035"
Received: from ezulkifl-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.233.253])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 07:55:08 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/6] Pull request
Date: Tue, 15 Mar 2022 22:55:02 +0800
Message-Id: <cover.1647355908.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 14:55:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163295

The following changes since commit c2ebef2113d05aefb98b41caf380e03ec368934c:

  expat: Upgrade 2.4.6 -> 2.4.7 (2022-03-07 11:10:21 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Alexander Kanavin (2):
  util-linux: update 2.37.2 -> 2.37.3
  util-linux: upgrade 2.37.3 -> 2.37.4

Bill Pittman (1):
  wic: Use custom kernel path if provided

Jose Quaresma (1):
  sstate: inside the threadedpool don't write to the shared localdata

Pavel Zhukov (1):
  patch.py: Prevent git repo reinitialization

Richard Purdie (1):
  vim: Update to 8.2.4524 for further CVE fixes

 .../recipes-test/gitrepotest/gitrepotest.bb    | 16 ++++++++++++++++
 .../gitrepotest/0001-testpatch.patch           |  9 +++++++++
 meta/classes/sstate.bbclass                    |  2 +-
 meta/lib/oe/patch.py                           | 11 ++++++++---
 meta/lib/oeqa/selftest/cases/bbtests.py        | 18 ++++++++++++++++--
 ..._2.37.2.bb => util-linux-libuuid_2.37.4.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc    |  2 +-
 ...il-linux_2.37.2.bb => util-linux_2.37.4.bb} |  0
 meta/recipes-support/vim/vim.inc               |  4 ++--
 scripts/wic                                    |  3 +++
 10 files changed, 56 insertions(+), 9 deletions(-)
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.2.bb => util-linux-libuuid_2.37.4.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.37.2.bb => util-linux_2.37.4.bb} (100%)

-- 
2.35.1


