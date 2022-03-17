Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9591C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 07:35:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.7632.1647502518263805547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 00:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EVWW31pE;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647502518; x=1679038518;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TaaKGA0p4XGZ4Fo3nlPe72Lxox0RudGIao0mXSQQ7/Q=;
  b=EVWW31pEtBtmLCeL05N70BhHBkk3Fem9B5o2OxOcJj6+DkUNE4Wz6wU7
   +750CpltGmYdgAdv50Aovbi3QXd5pV8XRuLGKoGmiTcsapDX0fJ4Lbau0
   znyjvEa7ioi3fJPxqX+Rt5jt248DrEHRN03LkudW4jeSA4wwZ4SrAeiBx
   qJHGUnN918dxcSZhdt2AUTEDEtwSZYpqsidBODepqNr3VSS2sPAH5nM8D
   DOqbHZWhFTRdRb7qnApJjKOx5IQcA5svi12XMW7MDV3JKTssSYIjt8KPk
   0h7mgqql94MSjx8Uzi6XFS1DIqqrR38RRJ7t5kiJQQyQlZKXfT7LU9s+w
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236750496"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400";
   d="scan'208";a="236750496"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 00:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400";
   d="scan'208";a="581208461"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2022 00:35:16 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 3/4] go: upgrade 1.16.13 -> 1.16.14
Date: Thu, 17 Mar 2022 15:32:46 +0800
Message-Id: <20220317073247.4117889-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317073247.4117889-1-chee.yang.lee@intel.com>
References: <20220317073247.4117889-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 07:35:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163374

From: Sakib Sajal <sakib.sajal@windriver.com>

go 1.16.14 release includes fix for CVE-2022-23806.

(From OE-Core rev: 7b5723ae41b7fcdc73a24f04ec0cda4fba8f8622)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
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
2.25.1


