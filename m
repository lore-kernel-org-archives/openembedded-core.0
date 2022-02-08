Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFBFC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 01:28:56 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.5448.1644283734496886270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 17:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=P6C+kvPp;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644283734; x=1675819734;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=44eHENQoN5ActDCYNhwx0GAVTtNR3xmQSxHmisKWoqs=;
  b=P6C+kvPpoZ6c28FfnhMqexNX+SO5TeRkfPrNKN6dtoeuHxNWw3U9SVTV
   QzMg0EI24Qb6xrt5XJrbdIL30zAeTcg3QCJza2LzRVqW9EknrJ6ERwdcW
   p0Ye+vR9l0PIcNxIngy6YRJ2qjR0Mx4aUvdsWCdJ1PKUfV23cKCFaX31a
   5JKFK91oqLFSVN0oIAZLsh0IlocWqVjTukg8r//VtUsP87KrPTOFECwHW
   RmpFBqD2wkDWVqUWNd/xnvs79YrMaV8h7GhGwb+azBMvDpBkIg61JfPqz
   ZE3v6Cd4FLqoLmXK4D4azCx4urcIt/DmR2+/gPuUg4DaaXDQVmUGtvSX6
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="247682384"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600";
   d="scan'208";a="247682384"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 17:28:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600";
   d="scan'208";a="700671812"
Received: from koonwang-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.238.62])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 17:28:52 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/17] Pull request (cover letter only)
Date: Tue,  8 Feb 2022 09:28:47 +0800
Message-Id: <cover.1644283642.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 01:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161471

The following changes since commit 2d3c5b078feb34cb729902292d2805c9288ebc4c:

  glibc : Fix CVE-2022-23219 (2022-01-25 11:11:18 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Alexander Kanavin (1):
  libusb1: correct SRC_URI

Bruce Ashfield (3):
  kernel: introduce python3-dtschema-wrapper
  linux-yocto/5.10: update to v5.10.92
  linux-yocto/5.10: update to v5.10.93

Carlos Rafael Giani (1):
  libxml2: Backport python3-lxml workaround patch

Kory Maincent (1):
  icu: fix make_icudata dependencies

Peter Kjellerstedt (2):
  sstate: A third fix for for touching files inside pseudo
  insane.bbclass: Correct package_qa_check_empty_dirs()

Pgowda (2):
  glibc : Fix CVE-2021-3998
  glibc : Fix CVE-2021-3999

Richard Purdie (1):
  sstate: Improve failure to obtain archive message/handling

Ross Burton (5):
  tiff: backport fix for CVE-2022-22844
  yocto-check-layer: add debug output for the layers that were found
  expat: upgrade to 2.4.4
  vim: upgrade to patch 4269
  core-image-sato-sdk: allocate more memory when in qemu

Rudolf J Streif (1):
  linux-firmware: Add CLM blob to linux-firmware-bcm4373 package

 meta/classes/insane.bbclass                   |   2 +-
 meta/classes/sstate.bbclass                   |  18 +-
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../expat/{expat_2.4.3.bb => expat_2.4.4.bb}  |   2 +-
 .../glibc/glibc/0001-CVE-2021-3998.patch      | 282 ++++++++++++++
 .../glibc/glibc/0001-CVE-2021-3999.patch      |  36 ++
 .../glibc/glibc/0002-CVE-2021-3998.patch      | 138 +++++++
 .../glibc/glibc/0002-CVE-2021-3999.patch      | 357 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |   4 +
 .../0002-Work-around-lxml-API-abuse.patch     | 213 +++++++++++
 meta/recipes-core/libxml/libxml2_2.9.12.bb    |   1 +
 .../python3-dtschema-wrapper/dt-doc-validate  |  20 +
 .../dtc/python3-dtschema-wrapper/dt-mk-schema |  20 +
 .../dtc/python3-dtschema-wrapper/dt-validate  |  20 +
 .../dtc/python3-dtschema-wrapper_2021.10.bb   |  17 +
 .../linux-firmware/linux-firmware_20211216.bb |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |  43 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   3 +-
 .../images/core-image-sato-sdk.bb             |   3 +
 meta/recipes-support/icu/icu_69.1.bb          |   2 +-
 meta/recipes-support/libusb/libusb1_1.0.24.bb |   6 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/yocto-check-layer                     |  13 +
 26 files changed, 1211 insertions(+), 33 deletions(-)
 rename meta/recipes-core/expat/{expat_2.4.3.bb => expat_2.4.4.bb} (91%)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch

-- 
2.34.1


