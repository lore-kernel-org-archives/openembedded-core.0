Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.1370.1632356255839641514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 17:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18N0HYJn017912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 17:17:35 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 22 Sep 2021 17:17:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 22 Sep 2021 17:17:34 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 22 Sep 2021 17:17:33 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go: upgrade 1.16.7 -> 1.16.8
Date: Wed, 22 Sep 2021 20:17:31 -0400
Message-ID: <20210923001731.32084-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc}     | 4 ++--
 ...{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} | 4 ++--
 ...o-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} | 0
 .../go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb}             | 0
 .../go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb}       | 0
 .../go/{go-native_1.16.7.bb => go-native_1.16.8.bb}           | 0
 .../go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.7.bb => go-native_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.7.inc b/meta/recipes-devtools/go/go-1.16.8.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.16.7.inc
rename to meta/recipes-devtools/go/go-1.16.8.inc
index 9eca1caeeb..acc2300a28 100644
--- a/meta/recipes-devtools/go/go-1.16.7.inc
+++ b/meta/recipes-devtools/go/go-1.16.8.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.7"
+PV = "1.16.8"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -18,7 +18,7 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
 "
-SRC_URI[main.sha256sum] = "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
+SRC_URI[main.sha256sum] = "8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.7.bb b/meta/recipes-devtools/go/go-binary-native_1.16.8.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.8.bb
index cb54c2868e..926222089d 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.8.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04"
-SRC_URI[go_linux_arm64.sha256sum] = "63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac"
+SRC_URI[go_linux_amd64.sha256sum] = "f32501aeb8b7b723bc7215f6c373abb6981bbc7e1c7b44e9f07317e1a300dce2"
+SRC_URI[go_linux_arm64.sha256sum] = "430dbe185417204f6788913197ab3b189b6deae9c9b524f262858e53dab239c2"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.7.bb b/meta/recipes-devtools/go/go-cross_1.16.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.7.bb
rename to meta/recipes-devtools/go/go-cross_1.16.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.8.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.7.bb b/meta/recipes-devtools/go/go-native_1.16.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.7.bb
rename to meta/recipes-devtools/go/go-native_1.16.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.7.bb b/meta/recipes-devtools/go/go-runtime_1.16.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.8.bb
diff --git a/meta/recipes-devtools/go/go_1.16.7.bb b/meta/recipes-devtools/go/go_1.16.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.7.bb
rename to meta/recipes-devtools/go/go_1.16.8.bb
-- 
2.33.0

