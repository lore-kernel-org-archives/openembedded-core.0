Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE09C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:47 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.13304.1635347862317087601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456914"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:46 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617271"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 34/36] go: upgrade 1.16.7 -> 1.16.8
Date: Wed, 27 Oct 2021 23:16:42 +0800
Message-Id: 
 <5b6c68759f28fd684be316b3a5e33f41e4107f7b.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157549

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 97a2f406635f51bad1ab070f018a6466209f257b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.31.1


