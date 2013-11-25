Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E57436DC02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2013 05:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337177"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:12 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:50:58 +0200
Message-Id: <9a70f501b296aadcceae48d281bdea17c2f9f3c9.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/9] tar: upgrade to 1.27.1
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:16 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ve_1.27.bb => tar-replacement-native_1.27.1.bb} |    0
 .../tar/{tar-1.27 => tar}/remove-gets.patch        |    0
 .../tar/{tar_1.27.bb => tar_1.27.1.bb}             |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.27.bb => tar-replacement-native_1.27.1.bb} (100%)
 rename meta/recipes-extended/tar/{tar-1.27 => tar}/remove-gets.patch (100%)
 rename meta/recipes-extended/tar/{tar_1.27.bb => tar_1.27.1.bb} (53%)

diff --git a/meta/recipes-extended/tar/tar-replacement-native_1.27.bb b/meta/recipes-extended/tar/tar-replacement-native_1.27.1.bb
similarity index 100%
rename from meta/recipes-extended/tar/tar-replacement-native_1.27.bb
rename to meta/recipes-extended/tar/tar-replacement-native_1.27.1.bb
diff --git a/meta/recipes-extended/tar/tar-1.27/remove-gets.patch b/meta/recipes-extended/tar/tar/remove-gets.patch
similarity index 100%
rename from meta/recipes-extended/tar/tar-1.27/remove-gets.patch
rename to meta/recipes-extended/tar/tar/remove-gets.patch
diff --git a/meta/recipes-extended/tar/tar_1.27.bb b/meta/recipes-extended/tar/tar_1.27.1.bb
similarity index 53%
rename from meta/recipes-extended/tar/tar_1.27.bb
rename to meta/recipes-extended/tar/tar_1.27.1.bb
index 6cf6f70..439bb50 100644
--- a/meta/recipes-extended/tar/tar_1.27.bb
+++ b/meta/recipes-extended/tar/tar_1.27.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI += "file://remove-gets.patch \
            "
 
-SRC_URI[md5sum] = "74f51434bfb7756bd571a0f718b171ae"
-SRC_URI[sha256sum] = "2238c5c63c7ecaccc962f10482d76875b45cedfed69138ed852a88e344af3c7b"
+SRC_URI[md5sum] = "490e074dd7e71f553df8357a7ef9bdcf"
+SRC_URI[sha256sum] = "9b0fb3ce8512059337add0da5f8f0f7d7647f2201f5ece24581d620ea60337c6"
-- 
1.7.9.5


