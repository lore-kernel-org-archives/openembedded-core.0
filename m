Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1004.1629822353115062713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360219"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360219"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658930"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/28] go: upgrade 1.16.5 -> 1.16.7
Date: Wed, 25 Aug 2021 00:25:08 +0800
Message-Id: <47221c39254d2939bfd6f555a43bab5d66354c7c.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.7.inc}     | 4 ++--
 ...{go-binary-native_1.16.5.bb => go-binary-native_1.16.7.bb} | 4 ++--
 ...o-cross-canadian_1.16.5.bb => go-cross-canadian_1.16.7.bb} | 0
 .../go/{go-cross_1.16.5.bb => go-cross_1.16.7.bb}             | 0
 .../go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.16.7.bb}       | 0
 .../go/{go-native_1.16.5.bb => go-native_1.16.7.bb}           | 0
 .../go/{go-runtime_1.16.5.bb => go-runtime_1.16.7.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.5.bb => go_1.16.7.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb => go-binary-native_1.16.7.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb => go-cross-canadian_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.5.bb => go-native_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb => go-runtime_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.16.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools/go/go-1.16.7.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.16.5.inc
rename to meta/recipes-devtools/go/go-1.16.7.inc
index b693315917..ed2d94671b 100644
--- a/meta/recipes-devtools/go/go-1.16.5.inc
+++ b/meta/recipes-devtools/go/go-1.16.7.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.5"
+PV = "1.16.7"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
 "
-SRC_URI[main.sha256sum] = "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
+SRC_URI[main.sha256sum] = "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.7.bb
index b3e2b6a60e..cb54c2868e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
-SRC_URI[go_linux_arm64.sha256sum] = "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
+SRC_URI[go_linux_amd64.sha256sum] = "7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04"
+SRC_URI[go_linux_arm64.sha256sum] = "63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb b/meta/recipes-devtools/go/go-cross_1.16.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
rename to meta/recipes-devtools/go/go-cross_1.16.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb b/meta/recipes-devtools/go/go-native_1.16.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.5.bb
rename to meta/recipes-devtools/go/go-native_1.16.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb b/meta/recipes-devtools/go/go-runtime_1.16.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.7.bb
diff --git a/meta/recipes-devtools/go/go_1.16.5.bb b/meta/recipes-devtools/go/go_1.16.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.5.bb
rename to meta/recipes-devtools/go/go_1.16.7.bb
-- 
2.31.1

