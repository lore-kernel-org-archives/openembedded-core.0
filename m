Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB99C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=W3TgzYk2;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776670; x=1674312670;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f3tDmJBQU21nEXtmmtq3AH/G+PwN0okEjrMJub4aEUU=;
  b=W3TgzYk2JvgVkEmziaqZgtfLtAMQXuyaqIq070PMFp1vWEyx/hpgt5Ef
   8Hl5EF5ZL4fYkLour1GIpfmcYTpeLijfMAZ+38OM7W9kbWGL7zXwd5I0N
   7vRVpoQgHamy71b4vEXG/xX0YnhMpUMwA9ymuE2dB8ZWk5RmD0n+fpxj2
   qRzRNIBmgZs1YIBqnsg8oGBWHkWW5O7etQmhrP58eqq/srRsPuyxlvepj
   a/X0czHcYV74wAIVo+j2iMTWW+8QgDOS+qk7kDU6MAQVZxYL60Heu5aep
   FtVvyfMZxVe0OyXiZI0v6KrnUtuxukJq3ATxMbVF8y633ZsUE2a9Kl8m1
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886016"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886016"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336592"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:08 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/15] Patch review
Date: Fri, 21 Jan 2022 22:50:48 +0800
Message-Id: <cover.1642736950.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160831

Next set of changes for hardknott. Please review.

No issues while testing except for an intermittent and unrelated failure
in qemuppc.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3140

Thanks,

Anuj

The following changes since commit 7e569186820163d731cbb14f8c25ce6a2cc45dc9:

  python3-pyelftools: fix the override syntax (2022-01-11 10:07:36 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.89
  linux-yocto/5.10/cfg: add kcov feature fragment
  linux-yocto/5.10: update to v5.10.90
  linux-yocto/5.10: amdgpu: updates for CVE-2021-42327
  linux-yocto/5.10: update to v5.10.91

Changqing Li (1):
  libsndfile1: fix CVE-2021-4156

Chen Qi (1):
  populate_sdk_base: remove unneeded dirs such as /dev

Joshua Watt (1):
  selftest: reproducible: Set maximum report size

Kevin Hao (2):
  arch-armv8-5a.inc: Add tune include for armv8.5a
  armv9a/tune: Add the support for the Neoverse N2 core

Konrad Weihmann (1):
  cve-check: add lockfile to task

Richard Purdie (1):
  scripts: Update to use exec_module() instead of load_module()

Robert Joslyn (1):
  curl: Backport CVE fixes

Ross Burton (1):
  xserver-xorg: whitelist two CVEs

Sakib Sajal (1):
  go: upgrade 1.16.10 -> 1.16.13

 meta/classes/cve-check.bbclass                |   1 +
 meta/classes/populate_sdk_base.bbclass        |  11 +-
 .../machine/include/arm/arch-armv8-5a.inc     |  19 +
 .../include/arm/armv9a/tune-neoversen2.inc    |  22 ++
 meta/lib/oeqa/selftest/cases/reproducible.py  |  10 +-
 .../go/{go-1.16.10.inc => go-1.16.13.inc}     |   4 +-
 ...1.16.10.bb => go-binary-native_1.16.13.bb} |   4 +-
 ....16.10.bb => go-cross-canadian_1.16.13.bb} |   0
 ...o-cross_1.16.10.bb => go-cross_1.16.13.bb} |   0
 ...ssdk_1.16.10.bb => go-crosssdk_1.16.13.bb} |   0
 ...native_1.16.10.bb => go-native_1.16.13.bb} |   0
 ...ntime_1.16.10.bb => go-runtime_1.16.13.bb} |   0
 .../go/{go_1.16.10.bb => go_1.16.13.bb}       |   0
 .../xorg-xserver/xserver-xorg.inc             |   8 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 .../libsndfile1/CVE-2021-4156.patch           |  32 ++
 .../libsndfile/libsndfile1_1.0.28.bb          |   1 +
 .../curl/curl/CVE-2021-22945.patch            |  35 ++
 .../curl/curl/CVE-2021-22946.patch            | 333 ++++++++++++++++
 .../curl/curl/CVE-2021-22947.patch            | 357 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   8 +
 scripts/lib/scriptutils.py                    |   7 +-
 scripts/lib/wic/pluginbase.py                 |   8 +-
 25 files changed, 867 insertions(+), 31 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-5a.inc
 create mode 100644 meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
 rename meta/recipes-devtools/go/{go-1.16.10.inc => go-1.16.13.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.10.bb => go-binary-native_1.16.13.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.10.bb => go-cross-canadian_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.10.bb => go-cross_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.10.bb => go-crosssdk_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.10.bb => go-native_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.10.bb => go-runtime_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.10.bb => go_1.16.13.bb} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22945.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22947.patch

-- 
2.34.1


