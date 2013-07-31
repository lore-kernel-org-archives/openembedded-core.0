Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA6DC6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884363"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:02 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:46 +0300
Message-Id: <ba7354f53c1fabf4f577063260941d6b8d6ae7c8.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 02/13] git: upgrade to 1.8.3.4
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:15 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../git/{git_1.8.3.bb => git_1.8.3.4.bb}           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.3.bb => git_1.8.3.4.bb} (67%)

diff --git a/meta/recipes-devtools/git/git_1.8.3.bb b/meta/recipes-devtools/git/git_1.8.3.4.bb
similarity index 67%
rename from meta/recipes-devtools/git/git_1.8.3.bb
rename to meta/recipes-devtools/git/git_1.8.3.4.bb
index 0295919..124a98e 100644
--- a/meta/recipes-devtools/git/git_1.8.3.bb
+++ b/meta/recipes-devtools/git/git_1.8.3.4.bb
@@ -1,8 +1,8 @@
 require git.inc
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "d91b6099fb6763cf92c696977a247060"
-SRC_URI[sha256sum] = "f1d3c6d683f8f15035a8d0f3eb30ed160ff6607111dfc6026d8836307aebc53a"
+SRC_URI[md5sum] = "80eec3201a5d012913d287b85adaee8e"
+SRC_URI[sha256sum] = "dfa2cdf2df92b4abe956b1e7586030381c4e39e89161ab789a660d8d1f24d9d9"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


