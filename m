Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DBFA979164
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 12:56:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2018 05:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,364,1531810800"; d="scan'208";a="88108038"
Received: from mjamduna-mobl4.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.164.232])
	by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2018 05:56:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 20:56:31 +0800
Message-Id: <20180912125632.21152-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] python3{,native}: update to 3.5.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2018 12:56:35 -0000

Includes changes:

76aa2c0a9a bpo-33216: Clarify the documentation for CALL_FUNCTION_* (#8338)
1b141b9553 Doc: Backport language switcher (bpo-33700, bpo-31045) (#8048)
f381cfe07d [3.5] bpo-33001: Prevent buffer overrun in os.symlink (GH-5989) (#5991)
937ac1fe06 [3.5] bpo-32981: Fix catastrophic backtracking vulns (GH-5955) (#6034)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python3-native_3.5.5.bb => python3-native_3.5.6.bb}      | 4 ++--
 .../python/{python3_3.5.5.bb => python3_3.5.6.bb}             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.5.5.bb => python3-native_3.5.6.bb} (96%)
 rename meta/recipes-devtools/python/{python3_3.5.5.bb => python3_3.5.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-native_3.5.5.bb
rename to meta/recipes-devtools/python/python3-native_3.5.6.bb
index b231542f46..46b3cf398d 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
@@ -26,8 +26,8 @@ file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 file://regen-all.patch \
 "
 
-SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
-SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
+SRC_URI[md5sum] = "f5a99f765e765336a3ebbb2a24ca2be3"
+SRC_URI[sha256sum] = "f55cde04f521f273c7cba08912921cc5642cfc15ca7b22d5829f0aff4371155f"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
 
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.5.5.bb
rename to meta/recipes-devtools/python/python3_3.5.6.bb
index 15ec7d7fda..13599c9216 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -43,8 +43,8 @@ SRC_URI += "\
             file://ftplib.patch \
             file://signal.patch \
            "
-SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
-SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
+SRC_URI[md5sum] = "f5a99f765e765336a3ebbb2a24ca2be3"
+SRC_URI[sha256sum] = "f55cde04f521f273c7cba08912921cc5642cfc15ca7b22d5829f0aff4371155f"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
 
-- 
2.17.1


