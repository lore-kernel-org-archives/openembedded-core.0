Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.32339.1613985263487441737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 01:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: E/FtH3eAY2sbSNTU/hFuvzacsBxS2nBa4EoYPicUy248jrmLCV07YzgBdeu+Izr91fKVEw2M2M
 94Kqv0y1T1ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="248440872"
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; 
   d="scan'208";a="248440872"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 01:14:22 -0800
IronPort-SDR: UaMXdzSvxL9gJfQU+XobBw0YY2AEMdw0DlRfTnJFbkwZVxWmB5OSNGVP+lvKDgieYSST2PsLxw
 BnL140iIgF2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; 
   d="scan'208";a="514728663"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga004.jf.intel.com with ESMTP; 22 Feb 2021 01:14:22 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][gatesgarth] go: Update to 1.15.8
Date: Mon, 22 Feb 2021 17:14:21 +0800
Message-Id: <20210222091421.83012-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b724599e29808014f5d9c1fdc70d20abab9b3e5)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
 ...{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index abe74e5eb7..7c8190f68c 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.6"
+PV = "1.15.8"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
+SRC_URI[main.sha256sum] = "540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.8.bb
index 622557ad2b..df697e2781 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844"
-SRC_URI[go_linux_arm64.sha256sum] = "f87515b9744154ffe31182da9341d0a61eb0795551173d242c8cad209239e492"
+SRC_URI[go_linux_amd64.sha256sum] = "d3379c32a90fdf9382166f8f48034c459a8cc433730bc9476d39d9082c94583b"
+SRC_URI[go_linux_arm64.sha256sum] = "0e31ea4bf53496b0f0809730520dee98c0ae5c530f3701a19df0ba0a327bf3d2"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.17.1

