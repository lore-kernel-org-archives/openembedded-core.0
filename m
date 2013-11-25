Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8AD6DC02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2013 05:51:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337224"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:16 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:51:01 +0200
Message-Id: <be487eb2d3117bf658ad999b75a0678f421f7145.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 6/9] git: upgrade to 1.8.4.4
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:23 -0000

From: Upgrade Helper <uh@not.set>

---
 .../git/{git_1.8.4.2.bb => git_1.8.4.4.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.4.2.bb => git_1.8.4.4.bb} (67%)

diff --git a/meta/recipes-devtools/git/git_1.8.4.2.bb b/meta/recipes-devtools/git/git_1.8.4.4.bb
similarity index 67%
rename from meta/recipes-devtools/git/git_1.8.4.2.bb
rename to meta/recipes-devtools/git/git_1.8.4.4.bb
index d162702..cdcd894 100644
--- a/meta/recipes-devtools/git/git_1.8.4.2.bb
+++ b/meta/recipes-devtools/git/git_1.8.4.4.bb
@@ -1,8 +1,8 @@
 require git.inc
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "6f63d103465b86ca0ebe4189ea54731c"
-SRC_URI[sha256sum] = "6732278ce4870b314cfd83500ec15d5ee7a868be5b96549022d6f0972bf3dd2a"
+SRC_URI[md5sum] = "c07ea15d5d0c31544de265f567d6e5ef"
+SRC_URI[sha256sum] = "44392f5bfcb17aa943338469ddafd94a9091f8b33eb5d3a2abb60f2bb61d1a73"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


