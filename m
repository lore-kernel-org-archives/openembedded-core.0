Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64964C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 01:00:58 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.4288.1647910857472207693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 18:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iLFhQUNN;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647910857; x=1679446857;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U66200KqZ9ky2FG4zu/HOQrG6UPdsfLBttI1uqrwSLQ=;
  b=iLFhQUNNLNpMxBDglOhjYXdVOEt6IyIaW+5j+1TmhXSsLEL/lQBZBsfd
   Jvlty0FGUuGqR+42WcC+qTkiLoaob//y9tDOX1qVZTcvUGEeplP3DbX6X
   qyalwpOEnEgGskKVZBx98JMqOsYgNObxepvoGvOI9mN3tuf+Qx8/N9n/z
   /UZQbK+6B8hoXtGKrEfIlk31+u25WdS4gnHUuUB8wg4qjZlpKLDEcw7e0
   mKfxXr/Ge9aoo1MMWPVqU+TyvHV9FwM1hUXccrit33ZuCByKLMUrVS4Ls
   qF6sVtLyUS9LFucxYGtggiGrcIbHnlHc3tijwShHiU1a2HGow0+OREoRN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="255250881"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400";
   d="scan'208";a="255250881"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 18:00:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400";
   d="scan'208";a="648775600"
Received: from mchong5-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.138.6])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 18:00:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/3] Pull request
Date: Tue, 22 Mar 2022 09:00:31 +0800
Message-Id: <cover.1647910766.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 01:00:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163529

The following changes since commit 427f4ef11beb8ceee007b5c7e152f2383a114aca:

  patch.py: Prevent git repo reinitialization (2022-03-11 10:55:24 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Chee Yang Lee (2):
  ghostscript: fix CVE-2021-3781
  go: update to 1.16.15

Sakib Sajal (1):
  go: upgrade 1.16.13 -> 1.16.14

 .../go/{go-1.16.13.inc => go-1.16.15.inc}     |   4 +-
 ...1.16.13.bb => go-binary-native_1.16.15.bb} |   4 +-
 ....16.13.bb => go-cross-canadian_1.16.15.bb} |   0
 ...o-cross_1.16.13.bb => go-cross_1.16.15.bb} |   0
 ...ssdk_1.16.13.bb => go-crosssdk_1.16.15.bb} |   0
 ...native_1.16.13.bb => go-native_1.16.15.bb} |   0
 ...ntime_1.16.13.bb => go-runtime_1.16.15.bb} |   0
 .../go/{go_1.16.13.bb => go_1.16.15.bb}       |   0
 .../ghostscript/CVE-2021-3781.patch           | 236 ++++++++++++++++++
 .../ghostscript/ghostscript_9.54.0.bb         |   1 +
 10 files changed, 241 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.13.inc => go-1.16.15.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.13.bb => go-binary-native_1.16.15.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.13.bb => go-cross-canadian_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.13.bb => go-cross_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.13.bb => go-crosssdk_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.13.bb => go-native_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.13.bb => go-runtime_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.13.bb => go_1.16.15.bb} (100%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781.patch

-- 
2.35.1


