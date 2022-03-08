Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595D4C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:20:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.8477.1646749237171537025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=J98Oxr1w;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749237; x=1678285237;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e/Gs78JVfdWDU9M/4YWvQM1+XOd0/zpyRm4y9gLJaII=;
  b=J98Oxr1wncBBY5YARZ0Z++n/GfE1SB4fWIpZx71InnmZ8A0YXGPIFHp5
   Ff3UiSgzGiKcUb8d3AdtGXi62ccY3j4qBaUG5PvNuuTSaMzcQZvqX6uRJ
   RHM0e+IQh7uZ8t6ZYG2cIjDlvqsAQIlHwdvYlLsyXGmPXkh+gXhDHNI4X
   kEiOcGiBAArpMj4nf7NWB95bknyfiWL4bT7sN6KOWgq1sZbVAq2YwMW9h
   B0MERAf2QN5jpasQxThVVLaSLVVlVMEKGcWPazOheABdQfJ5NliwRB6K9
   EoqONsIIDocnSwQtlAAxa+jrOp3s1UskInZomVBG8+Er6da/Qz04yIbse
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="253519468"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="253519468"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119877"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/15] Patch review
Date: Tue,  8 Mar 2022 22:19:51 +0800
Message-Id: <cover.1646748869.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:20:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162907

Next set of changes for hardknott. Please review.

No problems seen while testing on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3338

Thanks,

Anuj

The following changes since commit 94db7109f21cdefd50baea5660b691e5fe44a0d1:

  scripts/buildhistory-diff: drop use of distutils (2022-02-25 22:14:02 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Anuj Mittal (1):
  lttng-modules: upgrade 2.12.6 -> 2.12.7

Bruce Ashfield (6):
  linux-yocto/5.10: ppc/riscv: fix build with binutils 2.3.8
  linux-yocto/5.10: fix dssall build error with binutils 2.3.8
  linux-yocto/5.10: features/zram: remove CONFIG_ZRAM_DEF_COMP
  linux-yocto/5.10: update to v5.10.101
  linux-yocto/5.10: Fix ramoops/ftrace
  linux-yocto/5.10: update to v5.10.103

Changqing Li (1):
  unfs3: correct configure option

Lee Chee Yang (1):
  ruby : update to 3.0.3

Minjae Kim (1):
  ghostscript: fix CVE-2021-45949

Peter Kjellerstedt (1):
  selftest: recipetool: Correct the URI for socat

Richard Purdie (1):
  libgcrypt: Upgrade 1.9.3 -> 1.9.4

Ross Burton (1):
  asciidoc: update git repository

Sakib Sajal (1):
  go: upgrade 1.16.13 -> 1.16.14

wangmy (1):
  wireless-regdb: upgrade 2021.08.28 -> 2022.02.18

 meta/lib/oeqa/selftest/cases/recipetool.py    |   2 +-
 .../go/{go-1.16.13.inc => go-1.16.14.inc}     |   4 +-
 ...1.16.13.bb => go-binary-native_1.16.14.bb} |   4 +-
 ....16.13.bb => go-cross-canadian_1.16.14.bb} |   0
 ...o-cross_1.16.13.bb => go-cross_1.16.14.bb} |   0
 ...ssdk_1.16.13.bb => go-crosssdk_1.16.14.bb} |   0
 ...native_1.16.13.bb => go-native_1.16.14.bb} |   0
 ...ntime_1.16.13.bb => go-runtime_1.16.14.bb} |   0
 .../go/{go_1.16.13.bb => go_1.16.14.bb}       |   0
 .../ruby/ruby/CVE-2021-31799.patch            |  57 ----
 .../ruby/ruby/CVE-2021-31810.patch            | 258 ------------------
 .../ruby/ruby/CVE-2021-32066.patch            | 102 -------
 .../ruby/{ruby_3.0.1.bb => ruby_3.0.3.bb}     |   7 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb      |   2 +-
 .../asciidoc/asciidoc_9.1.0.bb                |   2 +-
 .../ghostscript/CVE-2021-45949.patch          |  65 +++++
 ...tack-limits-after-function-evalution.patch |  51 ++++
 .../ghostscript/ghostscript_9.53.3.bb         |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 ...ules_2.12.6.bb => lttng-modules_2.12.7.bb} |   2 +-
 ....08.28.bb => wireless-regdb_2022.02.18.bb} |   2 +-
 ...{libgcrypt_1.9.3.bb => libgcrypt_1.9.4.bb} |   2 +-
 24 files changed, 148 insertions(+), 452 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.13.inc => go-1.16.14.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.13.bb => go-binary-native_1.16.14.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.13.bb => go-cross-canadian_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.13.bb => go-cross_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.13.bb => go-crosssdk_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.13.bb => go-native_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.13.bb => go-runtime_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.13.bb => go_1.16.14.bb} (100%)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch
 rename meta/recipes-devtools/ruby/{ruby_3.0.1.bb => ruby_3.0.3.bb} (90%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.12.7.bb} (94%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} (94%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.3.bb => libgcrypt_1.9.4.bb} (96%)

-- 
2.35.1


