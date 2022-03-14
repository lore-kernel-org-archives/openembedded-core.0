Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1075AC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:00 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.22151.1647223378479367004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=F9U6LPe/;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647223378; x=1678759378;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KB7j4NQ4XNbf2h64qhQCtfFE2DRIvcVUAhe+YKtjVSg=;
  b=F9U6LPe/e7Kv+nLS3oYc9PR13t9WJy9qkuohHiNpro7rHPAC2ipIHYsd
   9cBbJQY0Y+oUWlDRject+R9indWkr8q36pknvNe5K4C/oRGwCQ1Y67AHF
   RnDAdUgjXScbiDBxsZgHfc9RMFiwzL86ExM3DkeOnHiwNBLuMKCxnxlfq
   hj+OUyuXEd7GT0b8hVxg0KfFza/kmAUUQMKx5jY6QHMZU9nmqRn6gV/1G
   OryfYTd/plekVAVzRb/fhyeoeQNW+YAXR2q4PyV+JEVqtIEDyGtCQGBvZ
   zMeSayt+nuGTQYecO8wMF4Rg+tcIv4FhKBYtwaEaW9jwtRxEs/7MdnuLB
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="316641447"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="316641447"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="515229446"
Received: from lsim7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.229.232])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:12 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/6] Patch review
Date: Mon, 14 Mar 2022 10:01:59 +0800
Message-Id: <cover.1647222224.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163115

Next set of changes to be merged for honister. Please review.

No problems seen while testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3349

Thanks,

Anuj

The following changes since commit c2ebef2113d05aefb98b41caf380e03ec368934c:

  expat: Upgrade 2.4.6 -> 2.4.7 (2022-03-07 11:10:21 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

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


