Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A595C35295
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ab8EJkLp;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169707; x=1680705707;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9Yw5rO+qbn1dAnDCR/eUSCERLZmmcT/8OgKTeO+2rqs=;
  b=ab8EJkLpou53juqx1k+Rt7QzL+N0PDVQIAxMKmlY9FBwlQQaNWj2NCmJ
   2Yt9okqFcocWW8/ynGBrVB3S5Bod+d7pwthblyaKF7cqlnsBd8uKuASjt
   /xUlpLK3EdcuEq3uxIIFNNE+38jqAn30GFXd/sbiuPCzPGyXr55eaf7Q3
   oFMUbc10PvU4du1HUGgw3SStVSbBH+19hvS7ghEJCDM+DC4k8o0lyrWB9
   wf6FKnGmxH4o0RJbpGTNakj1Ff55C1d9XFNNJzRUSpHlY8PGNtfjvOamv
   SAJP5NjVfmxRjt3W1DN7RgiZbuKgsEyL+MHHC7OPUJnlhaZsAA76My1dR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348645"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348645"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953504"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/22] Patch review
Date: Tue,  5 Apr 2022 22:41:19 +0800
Message-Id: <cover.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164018

Next set of changes to be merged in honister. Please review.

No issues seen while testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3476

Thanks,

Anuj

The following changes since commit ebca8f3ac9372b7ebb3d39e8f7f930b63b481448:

  build-appliance-image: Update to honister head revision (2022-03-24 11:05:30 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

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

Richard Purdie (3):
  toaster: Fix broken overrides usage
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
 meta/classes/toaster.bbclass                  |   6 +-
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
 30 files changed, 996 insertions(+), 265 deletions(-)
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


