Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285EEC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:11:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DwBb9u6O;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385466; x=1673921466;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sVE+BuRR03Gw08PSTaV6zshqsW9p6Va46d8yZbFXkZ0=;
  b=DwBb9u6OZ7Y9fJnS3K5FDMbOfSPT5m6174hzNbjORpTNR5I9bnZ2yAYu
   gr/C3vAVLVeTtXQ1IPkLZOEk3GHLctN9zBY+8X5Nmek3WCoi/v5BZYbEm
   npDYBz+QuwakEPOlvq4hX1lVYuGD+8VyIohsMCDkoEmVhC2Pn5ZcdnfBM
   RpFlePE+gecKAka8JZFVZMHizqQ4CDSSLmph8+1csJmx8ze1NoWhniFcg
   Myo2G/iJK+ZyIgh6/7IUo58tyJoXj3p+jDcCnMmdR7ZtMW0VXm54QsM44
   Aon6VHf9/wqtWeRqK9n+9FOMgjju/uG+q9oWxx5PlifB4QvyInVQIkT35
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094308"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094308"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:11:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220769"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:11:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/12] go: upgrade 1.16.10 -> 1.16.13
Date: Mon, 17 Jan 2022 10:10:32 +0800
Message-Id: 
 <5a904f0fd02613664aa8c03d6d4935a68c01bf35.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:11:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160631

From: Sakib Sajal <sakib.sajal@windriver.com>

Release 1.16.13 includes fixes for CVE-2021-44716 and CVE-2021-44717.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.10.inc => go-1.16.13.inc}   | 4 ++--
 ...o-binary-native_1.16.10.bb => go-binary-native_1.16.13.bb} | 4 ++--
 ...cross-canadian_1.16.10.bb => go-cross-canadian_1.16.13.bb} | 0
 .../go/{go-cross_1.16.10.bb => go-cross_1.16.13.bb}           | 0
 .../go/{go-crosssdk_1.16.10.bb => go-crosssdk_1.16.13.bb}     | 0
 .../go/{go-native_1.16.10.bb => go-native_1.16.13.bb}         | 0
 .../go/{go-runtime_1.16.10.bb => go-runtime_1.16.13.bb}       | 0
 meta/recipes-devtools/go/{go_1.16.10.bb => go_1.16.13.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.10.inc => go-1.16.13.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.10.bb => go-binary-native_1.16.13.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.10.bb => go-cross-canadian_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.10.bb => go-cross_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.10.bb => go-crosssdk_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.10.bb => go-native_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.10.bb => go-runtime_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.10.bb => go_1.16.13.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.10.inc b/meta/recipes-devtools/go/go-1.16.13.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.16.10.inc
rename to meta/recipes-devtools/go/go-1.16.13.inc
index 7549ffc211..46c6528dc4 100644
--- a/meta/recipes-devtools/go/go-1.16.10.inc
+++ b/meta/recipes-devtools/go/go-1.16.13.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.10"
+PV = "1.16.13"
 FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5"
+SRC_URI[main.sha256sum] = "b0926654eaeb01ef43816638f42d7b1681f2d3f41b9559f07735522b7afad41a"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb b/meta/recipes-devtools/go/go-binary-native_1.16.13.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.13.bb
index 4866c9f847..6e498a17be 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "414cd18ce1d193769b9e97d2401ad718755ab47816e13b2a1cde203d263b55cf"
-SRC_URI[go_linux_arm64.sha256sum] = "bfe1d4b82626c742b4690a832ca59a21e3d702161556f3c0ed26dffb368927e9"
+SRC_URI[go_linux_amd64.sha256sum] = "275fc03c90c13b0bbff13125a43f1f7a9f9c00a0d5a9f2d5b16dbc2fa2c6e12a"
+SRC_URI[go_linux_arm64.sha256sum] = "3dd8e14837105cbfedf7124c7f8c524ce492748c370036c7316ef99e18d116d7"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.10.bb b/meta/recipes-devtools/go/go-cross_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.10.bb
rename to meta/recipes-devtools/go/go-cross_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.10.bb b/meta/recipes-devtools/go/go-native_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.10.bb
rename to meta/recipes-devtools/go/go-native_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.10.bb b/meta/recipes-devtools/go/go-runtime_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go_1.16.10.bb b/meta/recipes-devtools/go/go_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.10.bb
rename to meta/recipes-devtools/go/go_1.16.13.bb
-- 
2.34.1


