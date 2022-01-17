Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F43EC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:10:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.6025.1642385439034419685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Vhsi04M8;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385439; x=1673921439;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T+Bh9C6Vol+1aoiWgvKjzzsbvt5ajJER6i3CGx3jw34=;
  b=Vhsi04M8EjIqJta0eWa6yEf4q2EB5odAPtvhPNVxTHUdtHIKJ6bhZLUI
   0rixyRKxcjLKehaLk/bMbA2cMxRSLfCv08SfgPj2VN8lDy/PCainP1btZ
   q/uzxjAJRnU/5838g0aQQG/NN0h50Z5WxohuV8Bx5qeQa4943LSDqhBpK
   GxdB8eL7b06pcCMcXMLn0n7h/EUWCVI6WW0HAlsgbIXXl0HIRnhd0a/U6
   zIXfwdPEgeQ/AQz2d8YrG4b+a0KmzaniEx+cmOZ8AD0CrlYVbyqNIodR+
   WC5iODXOjQ9ALuaFPgCKq5qJ7/tHa+EVxdHi6XtN9PYjBuFh9Ks9Nz5Fk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094184"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094184"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220678"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/12] Patch review
Date: Mon, 17 Jan 2022 10:10:20 +0800
Message-Id: <cover.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:10:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160619

Next set of changes for honister. Please review.

No problems seen while testing on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3115

Thanks,

Anuj

The following changes since commit 298222353584776afc1dfe17abc5916b4ada40de:

  scripts/buildhistory-diff: drop use of distutils (2022-01-12 10:10:57 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

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


