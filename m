Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1546AC433FE
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504021"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504021"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298213"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 20/33] go: upgrade 1.16.8 -> 1.16.10
Date: Thu,  9 Dec 2021 09:29:19 +0800
Message-Id: 
 <e3dcea6b05a9ef64a4d28f250e53eadc6981dec9.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159421

From: Pavel Zhukov <pavel.zhukov@huawei.com>

The release includes fixes for CVE-2021-41771 and CVE-2021-41772

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69c68f470e8e12456a4d9abf2d1c33b857e4ea37)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc}    | 4 ++--
 ...go-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} | 4 ++--
 ...-cross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} | 0
 .../go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb}            | 0
 .../go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb}      | 0
 .../go/{go-native_1.16.8.bb => go-native_1.16.10.bb}          | 0
 .../go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb}        | 0
 meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb}      | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.8.bb => go-native_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.8.inc b/meta/recipes-devtools/go/go-1.16.10.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.16.8.inc
rename to meta/recipes-devtools/go/go-1.16.10.inc
index 925bf46965..7549ffc211 100644
--- a/meta/recipes-devtools/go/go-1.16.8.inc
+++ b/meta/recipes-devtools/go/go-1.16.10.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.8"
+PV = "1.16.10"
 FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
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


