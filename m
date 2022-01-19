Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878F4C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 02:35:53 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.1332.1642559751461712423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 18:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=X5A8L8wI;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642559751; x=1674095751;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tUEvKfKDOlh9BCQhKyM4IppHDLgigdUs+pPM+uSPPjE=;
  b=X5A8L8wIpMkjXzGWXB4TBH17x6xCvoPGSsc4xfu0dDgN61sVMhz1b5Ad
   gq0x+Dnr1VEf48Ls0Yyz702zM3zLNYti/bNuL073bDt7n54J8z4iHJJ+M
   B3qMRsIJPIyEvWB/oLZpCQCOLL49FgSM3v74e38LzavzAMoalLT/9uajx
   Ov6lhwN1U6XBnUG9sq2sIyFHcVTj5u8NlKi4diW6LykXpz0TwPI3dx0H2
   cBmll0Vuq3I7lHogu8kjoXb+xefbci2bqNK909RYFOXA/s7v22oeFhtWN
   ogrrdoW6lVEa++XBmyOqHd5CA8goOUaH99NvVtuvJUflHQ9EYhDptLCHN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244924341"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600";
   d="scan'208";a="244924341"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 18:35:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600";
   d="scan'208";a="625721149"
Received: from ailoonta-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.232.248])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 18:35:49 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [honister][PATCH 00/12] Pull request (cover letter only)
Date: Wed, 19 Jan 2022 10:35:41 +0800
Message-Id: <cover.1642559611.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 02:35:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160687

The following changes since commit 298222353584776afc1dfe17abc5916b4ada40de:

  scripts/buildhistory-diff: drop use of distutils (2022-01-12 10:10:57 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Alexander Kanavin (1):
  lib/oe/reproducible: correctly set .git location when recursively
    looking for git repos

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.89
  linux-yocto/5.14: fix arm 32bit -rt warnings
  linux-yocto/5.10/cfg: add kcov feature fragment
  linux-yocto/5.10: update to v5.10.90

Changqing Li (1):
  libsndfile1: fix CVE-2021-4156

Khairul Rohaizzat Jamaluddin (1):
  epiphany: Update 40.3 -> 40.6

Konrad Weihmann (1):
  cve-check: add lockfile to task

Peter Kjellerstedt (1):
  rootfs-postcommands.bbclass: Make two comments use the new variable
    syntax

Richard Purdie (1):
  oeqa/sstate: Fix allarch samesigs test

Ross Burton (1):
  xserver-xorg: whitelist two CVEs

Sakib Sajal (1):
  go: upgrade 1.16.10 -> 1.16.13

 meta/classes/cve-check.bbclass                |  1 +
 meta/classes/rootfs-postcommands.bbclass      |  4 +--
 meta/lib/oe/reproducible.py                   |  2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 13 ++++++--
 .../go/{go-1.16.10.inc => go-1.16.13.inc}     |  4 +--
 ...1.16.10.bb => go-binary-native_1.16.13.bb} |  4 +--
 ....16.10.bb => go-cross-canadian_1.16.13.bb} |  0
 ...o-cross_1.16.10.bb => go-cross_1.16.13.bb} |  0
 ...ssdk_1.16.10.bb => go-crosssdk_1.16.13.bb} |  0
 ...native_1.16.10.bb => go-native_1.16.13.bb} |  0
 ...ntime_1.16.10.bb => go-runtime_1.16.13.bb} |  0
 .../go/{go_1.16.10.bb => go_1.16.13.bb}       |  0
 .../{epiphany_40.3.bb => epiphany_40.6.bb}    |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  8 +++++
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++--
 .../linux/linux-yocto-rt_5.14.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_5.14.bb |  2 +-
 .../libsndfile1/CVE-2021-4156.patch           | 32 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  1 +
 22 files changed, 82 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.10.inc => go-1.16.13.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.10.bb => go-binary-native_1.16.13.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.10.bb => go-cross-canadian_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.10.bb => go-cross_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.10.bb => go-crosssdk_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.10.bb => go-native_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.10.bb => go-runtime_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.10.bb => go_1.16.13.bb} (100%)
 rename meta/recipes-gnome/epiphany/{epiphany_40.3.bb => epiphany_40.6.bb} (93%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch

-- 
2.34.1


