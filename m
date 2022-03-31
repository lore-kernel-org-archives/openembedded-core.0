Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F329C43219
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7386.1648734471130321746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=UV01Qbx7;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734474; x=1680270474;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d/JuRZ7jLDjeJsvEB0emymNc/m9EFOs6uWWbXhu8MIU=;
  b=UV01Qbx7E8Ree2rAKYqi9fpXuMAMPPCAflTJ4DO3E3hmUhQsQhUo9DaZ
   Euc+A8LvoUUU/BmkZWLQbUDkDoKIuUVkTftETxYlGPHpWcnc/6XlIEmIH
   y1DDOHhK2D5loWUsak47qxZVj+MAk/LIrnfcuN3+wqABZmIITPdmVaAun
   j6mm8XlDEo7DXW0FPCgLcMo+P976rWzUDmRvk9qMSt20lARbbN5l9BQJR
   JGOUShrNQTsduWGxIhksBpLnzyNlqDSQbj9fmG3XMQb/NKQLqPqaw7EAv
   pNDSm9L+rrk3Cz6RwkejC8J6NA2cAeAhFta8LAn19xkQhXDkrB5m3jMQM
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551804"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551804"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542144"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/20] go: update to 1.16.15
Date: Thu, 31 Mar 2022 21:47:12 +0800
Message-Id: 
 <3462c7680137a9ef5f683161d39caf19f87a932a.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163821

From: Chee Yang Lee <chee.yang.lee@intel.com>

go1.16.15 (released 2022-03-03) includes a security fix to the regexp/syntax package, as well as bug fixes to the compiler, runtime, the go command, and to the net package. See the Go 1.16.15 milestone on our issue tracker for detai
ls.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.14.inc => go-1.16.15.inc}   | 4 ++--
 ...o-binary-native_1.16.14.bb => go-binary-native_1.16.15.bb} | 4 ++--
 ...cross-canadian_1.16.14.bb => go-cross-canadian_1.16.15.bb} | 0
 .../go/{go-cross_1.16.14.bb => go-cross_1.16.15.bb}           | 0
 .../go/{go-crosssdk_1.16.14.bb => go-crosssdk_1.16.15.bb}     | 0
 .../go/{go-native_1.16.14.bb => go-native_1.16.15.bb}         | 0
 .../go/{go-runtime_1.16.14.bb => go-runtime_1.16.15.bb}       | 0
 meta/recipes-devtools/go/{go_1.16.14.bb => go_1.16.15.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.14.inc => go-1.16.15.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.14.bb => go-binary-native_1.16.15.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.14.bb => go-cross-canadian_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.14.bb => go-cross_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.14.bb => go-crosssdk_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.14.bb => go-native_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.14.bb => go-runtime_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.14.bb => go_1.16.15.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.14.inc b/meta/recipes-devtools/go/go-1.16.15.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.16.14.inc
rename to meta/recipes-devtools/go/go-1.16.15.inc
index 6482c6fa7c..8b1ad22bcc 100644
--- a/meta/recipes-devtools/go/go-1.16.14.inc
+++ b/meta/recipes-devtools/go/go-1.16.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.14"
+PV = "1.16.15"
 FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -18,7 +18,7 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
 "
-SRC_URI[main.sha256sum] = "467898cd3a216de54dcb9014f541efe77e9b79a7154dbc1fd2dd778b0c63fb56"
+SRC_URI[main.sha256sum] = "90a08c689279e35f3865ba510998c33a63255c36089b3ec206c912fc0568c3d3"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.14.bb b/meta/recipes-devtools/go/go-binary-native_1.16.15.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.14.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.15.bb
index 419fc4ffcf..ba11ee5695 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.14.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.15.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "f4f5f02eb6809ac5bf19b5ad517b23504fd5fc036f6487651968ad36aa7a20e0"
-SRC_URI[go_linux_arm64.sha256sum] = "5e59056e36704acb25809bcdb27191f27593cb7aba4d716b523008135a1e764a"
+SRC_URI[go_linux_amd64.sha256sum] = "77c782a633186d78c384f972fb113a43c24be0234c42fef22c2d8c4c4c8e7475"
+SRC_URI[go_linux_arm64.sha256sum] = "c2f27f0ce5620a9bc2ff3446165d1974ef94e9b885ec12dbfa3c07e0e198b7ce"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.14.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.14.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.15.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.14.bb b/meta/recipes-devtools/go/go-cross_1.16.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.14.bb
rename to meta/recipes-devtools/go/go-cross_1.16.15.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.14.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.14.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.15.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.14.bb b/meta/recipes-devtools/go/go-native_1.16.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.14.bb
rename to meta/recipes-devtools/go/go-native_1.16.15.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.14.bb b/meta/recipes-devtools/go/go-runtime_1.16.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.14.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.15.bb
diff --git a/meta/recipes-devtools/go/go_1.16.14.bb b/meta/recipes-devtools/go/go_1.16.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.14.bb
rename to meta/recipes-devtools/go/go_1.16.15.bb
-- 
2.35.1


