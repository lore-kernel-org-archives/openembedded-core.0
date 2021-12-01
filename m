Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A316C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:29 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.88631.1638342986688137482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344605"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344605"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918825"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/14] go: upgrade 1.16.8 -> 1.16.10
Date: Wed,  1 Dec 2021 15:16:05 +0800
Message-Id: 
 <0df36f324a2dc17f18066efc5c130231158b5d24.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159008

From: Pavel Zhukov <pavel.zhukov@huawei.com>

The release includes fixes for CVE-2021-41771 and CVE-2021-41772

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This release also contains a fix for CVE-2021-38297 and the changes are
minor, so backport the uprev rather than manually backporting individual
commits.

CVE: CVE-2021-38297

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc}  | 6 +++---
 ...-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} | 4 ++--
 ...ross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} | 0
 .../go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb}          | 0
 .../go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb}    | 0
 .../go/{go-native_1.16.8.bb => go-native_1.16.10.bb}        | 0
 .../go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb}      | 0
 meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb}    | 0
 8 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc} (86%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.8.bb => go-native_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.8.inc b/meta/recipes-devtools/go/go-1.16.10.inc
similarity index 86%
rename from meta/recipes-devtools/go/go-1.16.8.inc
rename to meta/recipes-devtools/go/go-1.16.10.inc
index acc2300a28..08c85b275b 100644
--- a/meta/recipes-devtools/go/go-1.16.8.inc
+++ b/meta/recipes-devtools/go/go-1.16.10.inc
@@ -1,8 +1,8 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.8"
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
+PV = "1.16.10"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -18,7 +18,7 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
 "
-SRC_URI[main.sha256sum] = "8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98"
+SRC_URI[main.sha256sum] = "a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.8.bb b/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.10.bb
index 926222089d..4866c9f847 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "f32501aeb8b7b723bc7215f6c373abb6981bbc7e1c7b44e9f07317e1a300dce2"
-SRC_URI[go_linux_arm64.sha256sum] = "430dbe185417204f6788913197ab3b189b6deae9c9b524f262858e53dab239c2"
+SRC_URI[go_linux_amd64.sha256sum] = "414cd18ce1d193769b9e97d2401ad718755ab47816e13b2a1cde203d263b55cf"
+SRC_URI[go_linux_arm64.sha256sum] = "bfe1d4b82626c742b4690a832ca59a21e3d702161556f3c0ed26dffb368927e9"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.8.bb b/meta/recipes-devtools/go/go-cross_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.8.bb
rename to meta/recipes-devtools/go/go-cross_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.8.bb b/meta/recipes-devtools/go/go-native_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.8.bb
rename to meta/recipes-devtools/go/go-native_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.8.bb b/meta/recipes-devtools/go/go-runtime_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go_1.16.8.bb b/meta/recipes-devtools/go/go_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.8.bb
rename to meta/recipes-devtools/go/go_1.16.10.bb
-- 
2.33.1


