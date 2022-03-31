Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A2EC433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:55 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.7229.1648734469557928964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=a99NkNkL;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734469; x=1680270469;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D+HcUrHxAzA4kasZhgSz4mAMOEgCUDcifNa4apEfrTk=;
  b=a99NkNkLUlKB7TDZWhzCkdkSrUiARcvqyBwGgRVHsUoKnF1T2eBksMnx
   DGKph5+vbT4j1C5uXGD9DOlz5kc0pttJhrhqJEX4798roR9+S2yZcQ8dY
   e+AHYu9vOmXprw+FqWfXwRF5txi/pib/orWqbmIzyGWAeVCasGG196RN8
   PRGqg8JJWjLYnHSJFM/GTZiedPdMormQHVNvZoYW/wrKEGImbddURF1MT
   Lj1qmendBH2sXp0jfapa93l7p5qjrYoGzjpTHhxrihWTkuFbWFayt55lg
   Z70dQxKq3per3ZTThq3f3Y9GXM20nFWWr8oql3jd9sdH9rkUOmS9oJt8K
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551767"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551767"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542046"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/20] Patch review
Date: Thu, 31 Mar 2022 21:47:05 +0800
Message-Id: <cover.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:47:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163823

Final set of changes before 3.3.6 is built. Please review.

No issues seen while testing on autobuilder:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3452

Thanks,

Anuj

The following changes since commit bcef80623f015c006778edee5cf40dad063e51db:

  wic: Use custom kernel path if provided (2022-03-15 23:00:09 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (1):
  mobile-broadband-provider-info: upgrade 20201225 -> 20210805

Anuj Mittal (1):
  lttng-modules: upgrade 2.12.7 -> 2.12.8

Bruce Ashfield (5):
  linux-yocto: nohz_full boot arg fix
  linux-yocto/5.10: split vtpm for more granular inclusion
  linux-yocto/5.10: cfg/debug: add configs for kcsan
  linux-yocto-rt/5.10: update to -rt61
  linux-yocto/5.10: update to v5.10.107

Changhyeok Bae (1):
  mobile-broadband-provider-info: upgrade 20210805 -> 20220315

Chee Yang Lee (2):
  webkitgtk : update to 2.30.6
  go: update to 1.16.15

Joe Slater (2):
  libxml2: Fix CVE-2022-23308
  zip: modify when match.S is built

Li Wang (1):
  flac: fix CVE-2021-0561

Mingli Yu (2):
  epiphany: fix CVEs
  python3-numpy: fix CVE-2021-41496

Minjae Kim (2):
  gnu-config: update SRC_URI
  virglrenderer: update SRC_URI

Ovidiu Panait (1):
  openssl: upgrade 1.1.1l -> 1.1.1n

Ross Burton (1):
  zlib: backport the fix for CVE-2018-25032

wangmy (1):
  linux-firmware: upgrade 20220209 -> 20220310

 .../mobile-broadband-provider-info_git.bb     |   7 +-
 .../{openssl_1.1.1l.bb => openssl_1.1.1n.bb}  |   3 +-
 .../CVE-2022-23308-fix-regression.patch       |  99 +++
 .../libxml/libxml2/CVE-2022-23308.patch       | 209 ++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 .../zlib/zlib/CVE-2018-25032.patch            | 347 +++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 .../gnu-config/gnu-config_git.bb              |   2 +-
 .../go/{go-1.16.14.inc => go-1.16.15.inc}     |   4 +-
 ...1.16.14.bb => go-binary-native_1.16.15.bb} |   4 +-
 ....16.14.bb => go-cross-canadian_1.16.15.bb} |   0
 ...o-cross_1.16.14.bb => go-cross_1.16.15.bb} |   0
 ...ssdk_1.16.14.bb => go-crosssdk_1.16.15.bb} |   0
 ...native_1.16.14.bb => go-native_1.16.15.bb} |   0
 ...ntime_1.16.14.bb => go-runtime_1.16.15.bb} |   0
 .../go/{go_1.16.14.bb => go_1.16.15.bb}       |   0
 .../python-numpy/files/CVE-2021-41496.patch   |  64 ++
 .../python-numpy/python3-numpy_1.20.1.bb      |   1 +
 .../0001-configure-use-correct-CPP.patch      |  47 ++
 ...002-configure-support-PIC-code-build.patch |  34 +
 meta/recipes-extended/zip/zip_3.0.bb          |   2 +
 .../recipes-gnome/epiphany/epiphany_3.38.2.bb |   1 +
 .../files/encode-untrusted-data.patch         | 707 ++++++++++++++++++
 .../virglrenderer/virglrenderer_0.8.2.bb      |   2 +-
 ...20220209.bb => linux-firmware_20220310.bb} |   6 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 ...ules_2.12.7.bb => lttng-modules_2.12.8.bb} |   2 +-
 .../flac/flac/CVE-2021-0561.patch             |  41 +
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |   1 +
 ...ebkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb} |   2 +-
 32 files changed, 1592 insertions(+), 34 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (98%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
 rename meta/recipes-devtools/go/{go-1.16.14.inc => go-1.16.15.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.14.bb => go-binary-native_1.16.15.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.14.bb => go-cross-canadian_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.14.bb => go-cross_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.14.bb => go-crosssdk_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.14.bb => go-native_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.14.bb => go-runtime_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.14.bb => go_1.16.15.bb} (100%)
 create mode 100644 meta/recipes-devtools/python-numpy/files/CVE-2021-41496.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/encode-untrusted-data.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (99%)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.7.bb => lttng-modules_2.12.8.bb} (94%)
 create mode 100644 meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb} (98%)

-- 
2.35.1


