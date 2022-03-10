Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552B5C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 01:34:45 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.4855.1646876083852487315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 17:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NTXFevz9;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646876083; x=1678412083;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GIc7i4azlk/h/ZiwDWHLwRsaaZ99Wi49qHzUaX/8ccs=;
  b=NTXFevz92XhPgiYln0ei3eOFzDAbyOKxqfXubSTZUpHkn9VP+wTZy/QK
   HEVkVg7znTt4JxIsW+vj+CoVcEltluoQTZ9FQquBof0/UKU/edfYiKjCs
   I5v3Tz6KV99d411pfz9lweYTpVj16nH5rNikDNSGox7757NNwKWigVCZv
   X+9i2sPoujLCoyzL5oviLGeKm6RrcXpyVgEJr/I4RHLwUjaG0YXOJiv4d
   JDVQhHycu80S5JIOYLQXweXLnbgAFxFhmTZKF5VyO9myolQnktVYvJNYZ
   cQ9vsJXO3qUdnpBQtBPrARZoFRhz2MrvZW1Y7m84ruUY9K9hF2HgOxNJ4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237302141"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400";
   d="scan'208";a="237302141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 17:34:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400";
   d="scan'208";a="781290216"
Received: from jeffreyy-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.125])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 17:34:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/25] Pull request (cover letter only)
Date: Thu, 10 Mar 2022 09:34:36 +0800
Message-Id: <cover.1646875963.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 01:34:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162998

The following changes since commit eeae63c343c8ebd418679915ee20aa8c02fa0fdc:

  uninative: Upgrade to 3.5 (2022-02-22 14:22:25 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Alexander Kanavin (3):
  ruby: update 3.0.2 -> 3.0.3
  libarchive: upgrade 3.5.1 -> 3.5.2
  devtool: explicitly set main or master branches in upgrades when
    available

Bruce Ashfield (4):
  linux-yocto/5.10: features/zram: remove CONFIG_ZRAM_DEF_COMP
  linux-yocto/5.10: update to v5.10.101
  linux-yocto/5.10: Fix ramoops/ftrace
  linux-yocto/5.10: update to v5.10.103

Joe Slater (1):
  zip: modify when match.S is built

Lee Chee Yang (2):
  libarchive : update to 3.5.3
  ghostscript: fix CVE-2021-45949

Oleksandr Ocheretnyi (1):
  kernel-devsrc: do not copy Module.symvers file during install

Oleksandr Suvorov (1):
  depmodwrapper-cross: add config directory option

Peter Kjellerstedt (1):
  selftest: recipetool: Correct the URI for socat

Richard Purdie (3):
  perl: Improve and update module RPDEPENDS
  libxml-parser-perl: Add missing RDEPENDS
  expat: Upgrade 2.4.6 -> 2.4.7

Robert Yang (2):
  quilt: Disable external sendmail for deterministic build
  cups: Add --with-dbusdir to EXTRA_OECONF for deterministic build

Ross Burton (4):
  coreutils: remove obsolete ignored CVE list
  cve-check: get_cve_info should open the database read-only
  Revert "cve-check: add lockfile to task"
  asciidoc: update git repository

Tean Cunningham (1):
  rootfs-postcommands: amend systemd_create_users add user to group
    check

wangmy (2):
  harfbuzz: upgrade 2.9.0 -> 2.9.1
  wireless-regdb: upgrade 2021.08.28 -> 2022.02.18

 meta/classes/cve-check.bbclass                |   4 +-
 meta/classes/rootfs-postcommands.bbclass      |   8 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |   2 +-
 meta/recipes-core/coreutils/coreutils_8.32.bb |   3 -
 .../expat/{expat_2.4.6.bb => expat_2.4.7.bb}  |   2 +-
 .../perl/files/perl-rdepends.txt              | 338 ++++++++++++++++--
 .../perl/libxml-parser-perl_2.46.bb           |   1 +
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  12 +-
 meta/recipes-devtools/quilt/quilt.inc         |   3 +-
 .../ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb}     |   4 +-
 .../asciidoc/asciidoc_9.1.0.bb                |   2 +-
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../ghostscript/CVE-2021-45949.patch          |  68 ++++
 .../ghostscript/ghostscript_9.54.0.bb         |   1 +
 ...ibarchive_3.5.1.bb => libarchive_3.5.3.bb} |   2 +-
 .../0001-configure-use-correct-CPP.patch      |  47 +++
 ...002-configure-support-PIC-code-build.patch |  34 ++
 meta/recipes-extended/zip/zip_3.0.bb          |   2 +
 .../{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb}  |   2 +-
 .../kmod/depmodwrapper-cross_1.0.bb           |   4 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 ....08.28.bb => wireless-regdb_2022.02.18.bb} |   2 +-
 scripts/lib/devtool/upgrade.py                |  15 +-
 26 files changed, 526 insertions(+), 73 deletions(-)
 rename meta/recipes-core/expat/{expat_2.4.6.bb => expat_2.4.7.bb} (91%)
 rename meta/recipes-devtools/ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb} (93%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.5.1.bb => libarchive_3.5.3.bb} (96%)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb} (95%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} (94%)

-- 
2.35.1


