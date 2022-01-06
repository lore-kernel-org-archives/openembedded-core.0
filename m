Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0C0C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 23:57:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.214.1641513474090840818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 15:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=QeV5WcsA;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641513474; x=1673049474;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UXSxiKNO4Wm4+5uWCiEQ71NtK4pV9wQlVOnKUFmclVA=;
  b=QeV5WcsA8wnSE4k19w+VNhHctsBEKNyyp07mleSA9n/f3IwEOnaY6i7a
   F0XPGDRPMLoXAwUrOq+zMPjlAk0sZMeJY5mDwNgLwMAfZt1wizgUwla7L
   1g9FUWk9ySYzSB1cHpNU8dubq/ovp8bLSCLa9SELJlSlPodKIu3NEib+i
   v+tjwTZqLl7b4tBQ03xfwteev10uQzK3hzP5dEHPei9kpzR3l7F5Z3YXB
   wDSkRAQSjX22OpOXo1xqJQZIj0zwToQixyfSsM3rOkMgP6dQRV8D3w26t
   J6pt3Y2KADvZaamL/P2H4YNWyZ1CnLthxfa7wnM8p9JHZaDUxIx+kbo10
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242963702"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600";
   d="scan'208";a="242963702"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 15:57:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600";
   d="scan'208";a="471110096"
Received: from iho1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.230.146])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 15:57:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/24] Pull request
Date: Fri,  7 Jan 2022 07:57:30 +0800
Message-Id: <cover.1641513374.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 23:57:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160245

Please merge these changes.

Thanks,

Anuj

The following changes since commit f6791df317e66b2d3fa88d3a038d888d4512305a:

  libpcre/libpcre2: correct SRC_URI (2021-12-10 12:45:13 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Anuj Mittal (2):
  busybox: upgrade 1.33.1 -> 1.33.2
  xserver-xorg: update CVE_PRODUCT

Bruce Ashfield (8):
  linux-yocto/5.10: update to v5.10.84
  linux-yocto/5.10: update to v5.10.85
  linux-yocto/5.10: update to v5.10.87
  linux-yocto/5.4: update to v5.4.159
  linux-yocto/5.4: update to v5.4.162
  linux-yocto/5.4: update to v5.4.163
  linux-yocto/5.4: update to v5.4.165
  linux-yocto/5.4: update to v5.4.167

Chaitanya Vadrevu (1):
  python3-pyelftools: Depend on debugger, pprint

Kai Kang (4):
  xserver-xorg: fix CVE-2021-4008
  xserver-xorg: fix CVE-2021-4009
  xserver-xorg: fix CVE-2021-4010
  xserver-xorg: fix CVE-2021-4011

Richard Purdie (3):
  oeqa/selftest/bbtests: Use YP sources mirror instead of GNU
  webkitgtk: Add reproducibility fix
  openssl: Add reproducibility fix

Ross Burton (1):
  vim: upgrade to 8.2 patch 3752

Steve Sakoman (2):
  selftest: skip virgl test on centos 8 entirely
  selftest: skip virgl test on fedora 34 entirely

Sundeep KOKKONDA (1):
  binutils: Fix CVE-2021-45078

pgowda (1):
  binutils: CVE-2021-42574

wangmy (1):
  linux-firmware: upgrade 20211027 -> 20211216

 meta/lib/oeqa/selftest/cases/bbtests.py       |    2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |    4 +
 .../openssl/openssl/reproducibility.patch     |   22 +
 .../openssl/openssl_1.1.1l.bb                 |    1 +
 ...ab_1.33.0.bb => busybox-inittab_1.33.2.bb} |    0
 .../{busybox_1.33.1.bb => busybox_1.33.2.bb}  |    2 +-
 .../binutils/binutils-2.36.inc                |    2 +
 .../binutils/0001-CVE-2021-42574.patch        | 2006 +++++++++++++++++
 .../binutils/0001-CVE-2021-45078.patch        |  255 +++
 .../python/python3-pyelftools_0.27.bb         |    2 +
 .../xorg-xserver/xserver-xorg.inc             |    2 +-
 .../xserver-xorg/CVE-2021-4008.patch          |   59 +
 .../xserver-xorg/CVE-2021-4009.patch          |   50 +
 .../xserver-xorg/CVE-2021-4010.patch          |   39 +
 .../xserver-xorg/CVE-2021-4011.patch          |   40 +
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |    4 +
 ...20211027.bb => linux-firmware_20211216.bb} |    4 +-
 .../linux/linux-yocto-rt_5.10.bb              |    6 +-
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |    8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |   24 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 .../webkit/webkitgtk/reproducibility.patch    |   22 +
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |    1 +
 ...src-Makefile-improve-reproducibility.patch |   13 +-
 .../vim/files/CVE-2021-3778.patch             |   34 -
 .../vim/files/CVE-2021-3872.patch             |   57 -
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch |  207 --
 .../vim/files/disable_acl_header_check.patch  |   15 +-
 .../vim/files/no-path-adjust.patch            |    8 +-
 meta/recipes-support/vim/files/racefix.patch  |    6 +-
 ...m-add-knob-whether-elf.h-are-checked.patch |   13 +-
 meta/recipes-support/vim/vim.inc              |   14 +-
 34 files changed, 2577 insertions(+), 381 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch
 rename meta/recipes-core/busybox/{busybox-inittab_1.33.0.bb => busybox-inittab_1.33.2.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.33.1.bb => busybox_1.33.2.bb} (95%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3872.patch
 delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

-- 
2.33.1


