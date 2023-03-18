Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28DAC61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 11:59:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.4889.1679140750075052873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 04:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=VAMwzm+5;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679140751; x=1710676751;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=f3l9BYYkhy4BJ5d9qutaiP8Q5i3PMM2ibV9mjY9MWu0=;
  b=VAMwzm+5/U80qOltmiFntNYbblo1or374v0v2sg11lyfEhCNpt6cNGh3
   mUhIQ7jNC4vmp8gFOk08SCg6E2Mn4gMlbv8CAqr/G0Wf+3XCRVFNwDGVF
   DsUSflksbDB28lr7HsLJy0xtk/bGf0JhsRAkjDSCyUOGhbHA1abybSl6j
   SjlOPBbbqC+hHokcjIFv/rh/Mur+RBe3dx15Rd18b/XvoN53K0tWE6+np
   MSr3T8WN2spnexV0aYsUgcnotgrEVD3MsbqurY8XWocggHxE/NKEwVY9z
   7i5AwVZjoWE2LEM29hhID0/ijgWsbApYm1vYnAdn+rJp3ZHADnRRAxms4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339964108"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="339964108"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 04:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009965056"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="1009965056"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2023 04:59:10 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [langdale][patch 3/3] go: upgrade to 1.19.7
Date: Sat, 18 Mar 2023 19:58:59 +0800
Message-Id: <20230318115859.3071237-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230318115859.3071237-1-chee.yang.lee@intel.com>
References: <20230318115859.3071237-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 11:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178787

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2022-41722 CVE-2022-41723 CVE-2022-41724
CVE-2022-41725 CVE-2023-24532

Release notes:

go1.19.5 (released 2023-01-10) includes fixes to the compiler, the
linker, and the crypto/x509, net/http, sync/atomic, and syscall
packages. See the Go 1.19.5 milestone on our issue tracker for details.

go1.19.6 (released 2023-02-14) includes security fixes to the
crypto/tls, mime/multipart, net/http, and path/filepath packages, as
well as bug fixes to the go command, the linker, the runtime, and the
crypto/x509, net/http, and time packages. See the Go 1.19.6 milestone on
our issue tracker for details.

go1.19.7 (released 2023-03-07) includes a security fix to the
crypto/elliptic package, as well as bug fixes to the linker, the
runtime, and the crypto/x509 and syscall packages. See the Go 1.19.7
milestone on our issue tracker for details.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/go/{go-1.19.4.inc => go-1.19.7.inc}     | 2 +-
 ...{go-binary-native_1.19.4.bb => go-binary-native_1.19.7.bb} | 4 ++--
 ...o-cross-canadian_1.19.4.bb => go-cross-canadian_1.19.7.bb} | 0
 .../go/{go-cross_1.19.4.bb => go-cross_1.19.7.bb}             | 0
 .../go/{go-crosssdk_1.19.4.bb => go-crosssdk_1.19.7.bb}       | 0
 .../go/{go-native_1.19.4.bb => go-native_1.19.7.bb}           | 0
 .../go/{go-runtime_1.19.4.bb => go-runtime_1.19.7.bb}         | 0
 meta/recipes-devtools/go/{go_1.19.4.bb => go_1.19.7.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.4.inc => go-1.19.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.4.bb => go-binary-native_1.19.7.bb} (84%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.4.bb => go-cross-canadian_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.4.bb => go-cross_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.4.bb => go-crosssdk_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.4.bb => go-native_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.4.bb => go-runtime_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.4.bb => go_1.19.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.4.inc b/meta/recipes-devtools/go/go-1.19.7.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.19.4.inc
rename to meta/recipes-devtools/go/go-1.19.7.inc
index 49349ba6ec..7d76f34bdf 100644
--- a/meta/recipes-devtools/go/go-1.19.4.inc
+++ b/meta/recipes-devtools/go/go-1.19.7.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368"
+SRC_URI[main.sha256sum] = "775bdf285ceaba940da8a2fe20122500efd7a0b65dbcee85247854a8d7402633"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.4.bb b/meta/recipes-devtools/go/go-binary-native_1.19.7.bb
similarity index 84%
rename from meta/recipes-devtools/go/go-binary-native_1.19.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.7.bb
index f1208d183a..0e2c8f1b24 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.7.bb
@@ -9,8 +9,8 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "c9c08f783325c4cf840a94333159cc937f05f75d36a8b307951d5bd959cf2ab8"
-SRC_URI[go_linux_arm64.sha256sum] = "9df122d6baf6f2275270306b92af3b09d7973fb1259257e284dba33c0db14f1b"
+SRC_URI[go_linux_amd64.sha256sum] = "7a75720c9b066ae1750f6bcc7052aba70fa3813f4223199ee2a2315fd3eb533d"
+SRC_URI[go_linux_arm64.sha256sum] = "071ea7bf386fdd08df524859b878d99fc359e491e7ad65c1c1cc55b67972c882"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.4.bb b/meta/recipes-devtools/go/go-cross_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.4.bb
rename to meta/recipes-devtools/go/go-cross_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.4.bb b/meta/recipes-devtools/go/go-native_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.4.bb
rename to meta/recipes-devtools/go/go-native_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.4.bb b/meta/recipes-devtools/go/go-runtime_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go_1.19.4.bb b/meta/recipes-devtools/go/go_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.4.bb
rename to meta/recipes-devtools/go/go_1.19.7.bb
-- 
2.37.3


