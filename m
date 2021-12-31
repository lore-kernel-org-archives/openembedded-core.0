Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2420C433F5
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:19:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.5700.1640909970911138426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EgKVKLub;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640909971; x=1672445971;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W7Z7bsSE4pVfM8yN61d2MOq6H00fNJf+jz3id6uzmMI=;
  b=EgKVKLubi0nM5vWfWICENvkPqOJ+4tRRWQXr9WyhOu2PPRTDRvudGK0F
   IFEvbqqaPDj3YpagICpGj1QvPtb7gtmgn9v08rjFjr6bsWZXnGsakRn3j
   l9C+miFpa6xZSRTzrUa+rPb70uRuHIR6F/iMIhfku+NWaAdLVwFJRz8Uc
   7YdmsRvwseTmKsbbaORSYXt+kdMkmoAblQAxYcPC1ge/G579Youj9Op20
   GfZ7bnW0tIcYiENY9+VJTBE4JJRk8FR1iEvLG/4l2FbLy0AUAN1A62SF4
   c/D6oswQ6u+seGKlfsL1fgzM/8NWgnAo22q0iuq1QGuR0IOwGu92XfCsV
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573090"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573090"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502231"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/11] Patch review
Date: Fri, 31 Dec 2021 08:19:13 +0800
Message-Id: <cover.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160068

Next set of changes for honister. Please review. Tested on autobuilder
and no problems seen.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3054

Thanks,

Anuj

The following changes since commit 067fbe5e12a81225cf3ff436837af6a6d23040a6:

  license.bbclass: implement ast.NodeVisitor.visit_Constant (2021-12-13 12:19:03 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Anuj Mittal (1):
  xserver-xorg: upgrade 1.20.13 -> 1.20.14

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.84
  linux-yocto/5.10: update to v5.10.85
  linux-yocto/5.10: update to v5.10.87

Chaitanya Vadrevu (1):
  python3-pyelftools: Depend on debugger, pprint

Florian Amstutz (1):
  systemd: Fix systemd-journal-gateway user/groups

Pgowda (1):
  gcc: Fix CVE-2021-35465

Richard Purdie (1):
  oeqa/selftest/bbtests: Use YP sources mirror instead of GNU

pgowda (2):
  gcc: Fix CVE-2021-42574
  binutils: CVE-2021-42574

wangmy (1):
  linux-firmware: upgrade 20211027 -> 20211216

 meta/lib/oeqa/selftest/cases/bbtests.py       |    2 +-
 meta/recipes-core/systemd/systemd_249.7.bb    |    4 +-
 .../binutils/binutils-2.37.inc                |    1 +
 .../binutils/0001-CVE-2021-42574.patch        | 2001 +++++++++++++++
 meta/recipes-devtools/gcc/gcc-11.2.inc        |    8 +
 .../gcc/gcc/0001-CVE-2021-35465.patch         |  138 +
 .../gcc/gcc/0001-CVE-2021-42574.patch         | 2282 +++++++++++++++++
 .../gcc/gcc/0002-CVE-2021-35465.patch         |   39 +
 .../gcc/gcc/0002-CVE-2021-42574.patch         | 1765 +++++++++++++
 .../gcc/gcc/0003-CVE-2021-35465.patch         |  103 +
 .../gcc/gcc/0003-CVE-2021-42574.patch         |  142 +
 .../gcc/gcc/0004-CVE-2021-35465.patch         |  304 +++
 .../gcc/gcc/0004-CVE-2021-42574.patch         |  573 +++++
 .../python/python3-pyelftools_0.27.bb         |    2 +
 ...org_1.20.13.bb => xserver-xorg_1.20.14.bb} |    2 +-
 ...20211027.bb => linux-firmware_20211216.bb} |    4 +-
 .../linux/linux-yocto-rt_5.10.bb              |    6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |   24 +-
 19 files changed, 7383 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_1.20.14.bb} (93%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)

-- 
2.33.1


