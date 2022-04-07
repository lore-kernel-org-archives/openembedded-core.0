Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC35C47081
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.3647.1649313806682321215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fNjcy9yD;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649313806; x=1680849806;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OYbuUfvMuhgdBAPFM0iwTGo4Vm7XRs2aWzodMuuliR8=;
  b=fNjcy9yDs65B+Ap36/20dDcAGbd4iPywVr07RAl9xrDR3tDcHpUOKOyd
   F5mhlkRuqpkGdPq5F05WUMFMm7vqfMw0w4BEStX8JslSBIsx4hPRNXG2W
   9QnK06JrfrYJ8p9dZNg1EaPSVuSv3zfg0l2+xIP5weApR+6F/zCjVLxEP
   BXHuH9Q2IzhCI0nULjNpqCqYe+dJdsYvS5getS6AVtB2fUXTKdBow9vN3
   1oblLI6SKS8Y/dcZRyyyuOXqE9DWwgffOzZVBZ8n6hHUCp9O9SNhAvTYL
   CvtC++3Mjxrx0Da7j0LNfsk8TKfhECkK3RZHDnPGKqd7WeevHsdZhJsGl
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="321935944"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400";
   d="scan'208";a="321935944"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 23:43:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400";
   d="scan'208";a="658948302"
Received: from lilichua-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.130.12])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 23:43:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/21] Pull request
Date: Thu,  7 Apr 2022 14:43:19 +0800
Message-Id: <cover.1649313725.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164103

The following changes since commit 47015d6bf767201708b7c7cd5dd06d541c284036:

  toaster: Fix broken overrides usage (2022-04-05 16:41:27 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Bruce Ashfield (5):
  linux-yocto: nohz_full boot arg fix
  linux-yocto/5.10: split vtpm for more granular inclusion
  linux-yocto/5.10: cfg/debug: add configs for kcsan
  linux-yocto-rt/5.10: update to -rt61
  linux-yocto/5.10: update to v5.10.107

Chee Yang Lee (1):
  webkitgtk: update to 2.32.4

Joe Slater (1):
  libxml2: fix CVE-2022-23308 regression

Michael Opdenacker (1):
  conf/machine: fix QEMU x86 sound options

Minjae Kim (2):
  gnu-config: update SRC_URI
  virglrenderer: update SRC_URI

Peter Kjellerstedt (1):
  oe-pkgdata-util: Adapt to the new variable override syntax

Ralph Siemsen (2):
  libxml2: move to gitlab.gnome.org
  libxml2: update to 2.9.13

Richard Purdie (2):
  pseudo: Add patch to workaround paths with crazy lengths
  sanity: Add warning for local hasheqiv server with remote sstate
    mirrors

Ross Burton (5):
  devupstream: fix handling of SRC_URI
  tiff: backport CVE fixes:
  grub: ignore CVE-2021-46705
  oeqa/selftest/devtool: ensure Git username is set before upgrade tests
  zlib: backport the fix for CVE-2018-25032

wangmy (1):
  linux-firmware: upgrade 20220209 -> 20220310

 meta/classes/devupstream.bbclass              |   5 +-
 meta/classes/qemuboot.bbclass                 |   2 +-
 meta/classes/sanity.bbclass                   |   5 +
 .../conf/machine/include/x86/qemuboot-x86.inc |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   8 +
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 .../0002-Work-around-lxml-API-abuse.patch     | 213 -----------
 .../CVE-2022-23308-fix-regression.patch       |  99 +++++
 .../libxml2/libxml-m4-use-pkgconfig.patch     |  16 +-
 .../{libxml2_2.9.12.bb => libxml2_2.9.13.bb}  |  15 +-
 .../zlib/zlib/CVE-2018-25032.patch            | 347 ++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 .../gnu-config/gnu-config_git.bb              |   2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../virglrenderer/virglrenderer_0.9.1.bb      |   2 +-
 ...20220209.bb => linux-firmware_20220310.bb} |   6 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 ...rash-when-reading-a-file-with-multip.patch |  38 ++
 ...ue-380-and-382-heap-buffer-overflow-.patch | 218 +++++++++++
 ...-for-return-value-of-limitMalloc-392.patch |  93 +++++
 ...ag-avoid-calling-memcpy-with-a-null-.patch |  33 ++
 .../0005-fix-the-FPE-in-tiffcrop-393.patch    |  36 ++
 ...x-heap-buffer-overflow-in-tiffcp-278.patch |  57 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   9 +-
 ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch |   2 +-
 ...ebkitgtk_2.32.3.bb => webkitgtk_2.32.4.bb} |   2 +-
 scripts/oe-pkgdata-util                       |   2 +-
 29 files changed, 993 insertions(+), 262 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.12.bb => libxml2_2.9.13.bb} (92%)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (99%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.32.3.bb => webkitgtk_2.32.4.bb} (98%)

-- 
2.35.1


