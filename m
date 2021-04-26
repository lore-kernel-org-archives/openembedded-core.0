Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TSfGFG0YmCbgNgHwp0uP5lAOCWZ7oNFTqqhxm8U0/dmMDzNECpLnSqoc5+KtrALgdUt0GYqfZQ
 bU96d8/bHwzA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818231"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818231"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:49 -0700
IronPort-SDR: RYRCjqIGUig736uMYiF7G8+bWizhFtqbhZka6ZmwDkBT1dlutW5MpNZJWlasBlTVD0kR/O/AmF
 hI9faE64h23w==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067458"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:48 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 40/64] go: upgrade 1.16.2 -> 1.16.3
Date: Mon, 26 Apr 2021 08:53:11 +0800
Message-Id: <b4c312c72c180c26691af83c0df43384e533dca5.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

This is bugfix release in 1.16 series [1]

[1] https://github.com/golang/go/issues?q=milestone%3AGo1.16.3+label%3ACherryPickApproved

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84188e7b78aa40b168b526fa5d681a8a21d3b77c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc}     | 4 ++--
 ...{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} | 4 ++--
 ...o-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} | 0
 .../go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb}             | 0
 .../go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb}       | 0
 .../go/{go-native_1.16.2.bb => go-native_1.16.3.bb}           | 0
 .../go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.2.bb => go-native_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.2.inc
rename to meta/recipes-devtools/go/go-1.16.3.inc
index e65caf8197..ebd25a5eaa 100644
--- a/meta/recipes-devtools/go/go-1.16.2.inc
+++ b/meta/recipes-devtools/go/go-1.16.3.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.2"
+PV = "1.16.3"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
+SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.3.bb
index 4fb060173c..d01a2bd8f1 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
-SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
+SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
+SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.2.bb b/meta/recipes-devtools/go/go-cross_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.2.bb b/meta/recipes-devtools/go/go-native_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-native_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.2.bb b/meta/recipes-devtools/go/go-runtime_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtools/go/go_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.2.bb
rename to meta/recipes-devtools/go/go_1.16.3.bb
-- 
2.30.2

