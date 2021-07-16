Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494664"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494664"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075544"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 19/28] go: upgrade 1.16.3 -> 1.16.4
Date: Fri, 16 Jul 2021 10:42:17 +0800
Message-Id: <966ae80290b1a2daef87cf1ee2f176a8317c7c95.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e280a596293976ac835b557dcaaa56972682480)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.3.inc => go-1.16.4.inc}     | 4 ++--
 ...{go-binary-native_1.16.3.bb => go-binary-native_1.16.4.bb} | 4 ++--
 ...o-cross-canadian_1.16.3.bb => go-cross-canadian_1.16.4.bb} | 0
 .../go/{go-cross_1.16.3.bb => go-cross_1.16.4.bb}             | 0
 .../go/{go-crosssdk_1.16.3.bb => go-crosssdk_1.16.4.bb}       | 0
 .../go/{go-native_1.16.3.bb => go-native_1.16.4.bb}           | 0
 .../go/{go-runtime_1.16.3.bb => go-runtime_1.16.4.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.3.bb => go_1.16.4.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.3.inc => go-1.16.4.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.3.bb => go-binary-native_1.16.4.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.3.bb => go-cross-canadian_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.3.bb => go-cross_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.3.bb => go-crosssdk_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.3.bb => go-native_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.3.bb => go-runtime_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.3.bb => go_1.16.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.3.inc b/meta/recipes-devtools/go/go-1.16.4.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.3.inc
rename to meta/recipes-devtools/go/go-1.16.4.inc
index ebd25a5eaa..71c17de310 100644
--- a/meta/recipes-devtools/go/go-1.16.3.inc
+++ b/meta/recipes-devtools/go/go-1.16.4.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.3"
+PV = "1.16.4"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
+SRC_URI[main.sha256sum] = "ae4f6b6e2a1677d31817984655a762074b5356da50fb58722b99104870d43503"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.3.bb b/meta/recipes-devtools/go/go-binary-native_1.16.4.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.4.bb
index d01a2bd8f1..8c046e8e53 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
-SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
+SRC_URI[go_linux_amd64.sha256sum] = "7154e88f5a8047aad4b80ebace58a059e36e7e2e4eb3b383127a28c711b4ff59"
+SRC_URI[go_linux_arm64.sha256sum] = "8b18eb05ddda2652d69ab1b1dd1f40dd731799f43c6a58b512ad01ae5b5bba21"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.3.bb b/meta/recipes-devtools/go/go-cross_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.3.bb
rename to meta/recipes-devtools/go/go-cross_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.3.bb b/meta/recipes-devtools/go/go-native_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.3.bb
rename to meta/recipes-devtools/go/go-native_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.3.bb b/meta/recipes-devtools/go/go-runtime_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go_1.16.3.bb b/meta/recipes-devtools/go/go_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.3.bb
rename to meta/recipes-devtools/go/go_1.16.4.bb
-- 
2.31.1

