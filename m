Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D71C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 17:07:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.111.1646154442705340516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 09:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 221H7Lxf004081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 09:07:22 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 1 Mar 2022 09:07:21 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 1 Mar 2022 09:07:21 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] go: upgrade 1.16.13 -> 1.16.14
Date: Tue, 1 Mar 2022 12:07:15 -0500
Message-ID: <20220301170715.10331-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 17:07:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162566

go 1.16.14 release includes fix for CVE-2022-23806.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
 rename meta/recipes-devtools/go/{go-1.16.13.inc => go-1.16.14.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.13.bb => go-binary-native_1.16.14.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.13.bb => go-cross-canadian_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.13.bb => go-cross_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.13.bb => go-crosssdk_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.13.bb => go-native_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.13.bb => go-runtime_1.16.14.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.13.bb => go_1.16.14.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.13.inc b/meta/recipes-devtools/go/go-1.16.14.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.16.13.inc
rename to meta/recipes-devtools/go/go-1.16.14.inc
index 8675afc3bb..6482c6fa7c 100644
--- a/meta/recipes-devtools/go/go-1.16.13.inc
+++ b/meta/recipes-devtools/go/go-1.16.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.13"
+PV = "1.16.14"
 FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -18,7 +18,7 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
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
2.33.0


