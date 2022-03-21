Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91A6C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 13:40:39 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.30466.1647870036256317774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Zq7YKD9M;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647870038; x=1679406038;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vN1/s4zZmLF9sFsOsQBD3g1pcEG+gtrfNbIyDv6sGCo=;
  b=Zq7YKD9MzM+J2P/Hs+K+io94OElZPgQC+ylDJfJFNtNuAdwubIpiPAh+
   BpWt4ZfToUO95ES5HMRfcWK/3Qb5fR1HHu9qgxEhsswOLVX0P0x4kaFP/
   IpCYfyCwQyQyVN9u98ZOg2ATnWMINovJcnuG2MVRvU/mW8U8ctNsvUNin
   s6+Ax1B2d8t4cdh8stzZvoequRU76/8s7I7xGHmjqlGwm2alK4TfULyQq
   JuQrutInW5SrdKXSRz0esUFczW+RpovOVtiV/WhBjWLRDGRoBQpeP7dar
   zW4qTzQQTL6uJqxsqzAWkY3BwBWgR/9IAnOtF8artpwvEA9EDsTOBTQU1
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="239711186"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400";
   d="scan'208";a="239711186"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400";
   d="scan'208";a="648567816"
Received: from ttan5-mobl2.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.237.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 2/3] go: upgrade 1.16.13 -> 1.16.14
Date: Mon, 21 Mar 2022 21:40:25 +0800
Message-Id: 
 <676614ca3f72242f41263e793de104f3b324f5bb.1647869680.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647869680.git.anuj.mittal@intel.com>
References: <cover.1647869680.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 13:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163505

From: Sakib Sajal <sakib.sajal@windriver.com>

go 1.16.14 release includes fix for CVE-2022-23806.

(From OE-Core rev: 7b5723ae41b7fcdc73a24f04ec0cda4fba8f8622)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.13.inc => go-1.16.14.inc}   | 4 ++--
 ...o-binary-native_1.16.13.bb => go-binary-native_1.16.14.bb} | 4 ++--
 ...cross-canadian_1.16.13.bb => go-cross-canadian_1.16.14.bb} | 0
 .../go/{go-cross_1.16.13.bb => go-cross_1.16.14.bb}           | 0
 .../go/{go-crosssdk_1.16.13.bb => go-crosssdk_1.16.14.bb}     | 0
 .../go/{go-native_1.16.13.bb => go-native_1.16.14.bb}         | 0
 .../go/{go-runtime_1.16.13.bb => go-runtime_1.16.14.bb}       | 0
 meta/recipes-devtools/go/{go_1.16.13.bb => go_1.16.14.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.13.inc => go-1.16.14.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.13.bb => go-binary-native_1.16.14.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.13.bb => go-cross-canadian_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.13.bb => go-cross_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.13.bb => go-crosssdk_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.13.bb => go-native_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.13.bb => go-runtime_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.13.bb => go_1.16.14.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.13.inc b/meta/recipes-devtools/go/go-1.16.14.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.16.13.inc
rename to meta/recipes-devtools/go/go-1.16.14.inc
index 46c6528dc4..c6445bccff 100644
--- a/meta/recipes-devtools/go/go-1.16.13.inc
+++ b/meta/recipes-devtools/go/go-1.16.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.13"
+PV = "1.16.14"
 FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "b0926654eaeb01ef43816638f42d7b1681f2d3f41b9559f07735522b7afad41a"
+SRC_URI[main.sha256sum] = "467898cd3a216de54dcb9014f541efe77e9b79a7154dbc1fd2dd778b0c63fb56"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.13.bb b/meta/recipes-devtools/go/go-binary-native_1.16.14.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.13.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.14.bb
index 6e498a17be..419fc4ffcf 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.13.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.14.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "275fc03c90c13b0bbff13125a43f1f7a9f9c00a0d5a9f2d5b16dbc2fa2c6e12a"
-SRC_URI[go_linux_arm64.sha256sum] = "3dd8e14837105cbfedf7124c7f8c524ce492748c370036c7316ef99e18d116d7"
+SRC_URI[go_linux_amd64.sha256sum] = "f4f5f02eb6809ac5bf19b5ad517b23504fd5fc036f6487651968ad36aa7a20e0"
+SRC_URI[go_linux_arm64.sha256sum] = "5e59056e36704acb25809bcdb27191f27593cb7aba4d716b523008135a1e764a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.14.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.13.bb b/meta/recipes-devtools/go/go-cross_1.16.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.13.bb
rename to meta/recipes-devtools/go/go-cross_1.16.14.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.13.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.13.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.14.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.13.bb b/meta/recipes-devtools/go/go-native_1.16.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.13.bb
rename to meta/recipes-devtools/go/go-native_1.16.14.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.13.bb b/meta/recipes-devtools/go/go-runtime_1.16.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.13.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.14.bb
diff --git a/meta/recipes-devtools/go/go_1.16.13.bb b/meta/recipes-devtools/go/go_1.16.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.13.bb
rename to meta/recipes-devtools/go/go_1.16.14.bb
-- 
2.35.1


