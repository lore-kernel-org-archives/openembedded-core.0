Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9RP/aKqHaBHNB3rpYrLbPTgM47/Pom1keLSyWBFJ9ccy6O48Cy5ohe0sH0fD9QD9vLEn991yCX
 p1nq5axWFMaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236113"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236113"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:29 -0800
IronPort-SDR: c+zrTTx8WsfnMwnLGlsPpO6+gqx0euyCCONtcXzH/BRwET1Tp/e8fniiao2pIPv7BVJ19V7IkJ
 GYkFLwFD10pQ==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027675"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 26/35] go: upgrade 1.15.2 -> 1.15.3
Date: Wed, 23 Dec 2020 23:18:36 +0800
Message-Id: <144301e10d2639edfbf0bade7cb87a4f6da9c066.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Set PV directly to allow automated version updates between point releases.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84034ea18a9fb1a012a1ecdc3a84296b08d3cc23)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-1.15.inc                         | 5 ++---
 ...go-binary-native_1.15.2.bb => go-binary-native_1.15.3.bb} | 4 ++--
 meta/recipes-devtools/go/go-runtime_1.15.bb                  | 1 +
 meta/recipes-devtools/go/go_1.15.bb                          | 1 +
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.15.2.bb => go-binary-native_1.15.3.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index 97d748b922..a35921c1f8 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,8 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-GO_MINOR = ".2"
-PV .= "${GO_MINOR}"
+PV = "1.15.3"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d"
+SRC_URI[main.sha256sum] = "896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.2.bb b/meta/recipes-devtools/go/go-binary-native_1.15.3.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.3.bb
index ccd2d5ebad..aeab91a80f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "b49fda1ca29a1946d6bb2a5a6982cf07ccd2aba849289508ee0f9918f6bb4552"
-SRC_URI[go_linux_arm64.sha256sum] = "c8ec460cc82d61604b048f9439c06bd591722efce5cd48f49e19b5f6226bd36d"
+SRC_URI[go_linux_amd64.sha256sum] = "010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d"
+SRC_URI[go_linux_arm64.sha256sum] = "b8b88a87ada918ef5189fa5938ef4c46a4f61952a34317612aaac705f4275f80"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-runtime_1.15.bb b/meta/recipes-devtools/go/go-runtime_1.15.bb
index 4eeee65e0c..d6ddb31ed4 100644
--- a/meta/recipes-devtools/go/go-runtime_1.15.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.15.bb
@@ -1,3 +1,4 @@
 export CGO_ENABLED_riscv64 = ""
 require go-${PV}.inc
 require go-runtime.inc
+
diff --git a/meta/recipes-devtools/go/go_1.15.bb b/meta/recipes-devtools/go/go_1.15.bb
index 4bf9dd50b2..cc4c3fe45d 100644
--- a/meta/recipes-devtools/go/go_1.15.bb
+++ b/meta/recipes-devtools/go/go_1.15.bb
@@ -13,3 +13,4 @@ python() {
     if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
 }
+
-- 
2.29.2

