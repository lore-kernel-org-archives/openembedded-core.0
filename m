Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B57C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 01:42:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.4909.1646876556851747821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 17:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Og/m+nC/;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646876556; x=1678412556;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ac6S5+DDkKn/qU4T+MOwx5C3cn9TvLdafLQ1H+7k4+g=;
  b=Og/m+nC/j8NITwPXLJGtLLWkdVPS+2karW21LGWJbc/9YxAZp1sgD6oB
   0LQFICCIp/TB9G79BFNAZHhOZhSF+sU1Wi3ulwW56vyzh97Db9Y2qnwio
   Fc0t6Q6iQ+IzSjkbRIIXQEoU8TNWlx0LntlLRms6u2iTPQzwWFtm5cU9W
   iwyi5Y7AzBmrONKuo+xdyO9t/m+n/OMVXMiPDrIq/XZAphMZlMe6X+n1T
   0iKZu4GMS5TrDEiKxyP/cJZsM+ELIukcUo23bz1OTJBl/9ISZTlzZ8D6C
   OV2vqKXMrgeYbTwJQLxtVvLz8AHpRwKNSaw/kP/nZhIFT+j7GJubAVFHT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237303811"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400";
   d="scan'208";a="237303811"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 17:42:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400";
   d="scan'208";a="596489746"
Received: from jeffreyy-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.125])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 17:42:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/15] Pull request (cover letter only)
Date: Thu, 10 Mar 2022 09:42:26 +0800
Message-Id: <cover.1646876220.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 01:42:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162999

The following changes since commit 94db7109f21cdefd50baea5660b691e5fe44a0d1:

  scripts/buildhistory-diff: drop use of distutils (2022-02-25 22:14:02 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

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


