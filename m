Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F65D6D092
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417478"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:24 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:14 +0200
Message-Id: <627195712a0071384e29642b3888edfaf570800b.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/7] git: upgrade to 1.8.4.2
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../git/{git_1.8.3.4.bb => git_1.8.4.2.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.3.4.bb => git_1.8.4.2.bb} (67%)

diff --git a/meta/recipes-devtools/git/git_1.8.3.4.bb b/meta/recipes-devtools/git/git_1.8.4.2.bb
similarity index 67%
rename from meta/recipes-devtools/git/git_1.8.3.4.bb
rename to meta/recipes-devtools/git/git_1.8.4.2.bb
index 124a98e..d162702 100644
--- a/meta/recipes-devtools/git/git_1.8.3.4.bb
+++ b/meta/recipes-devtools/git/git_1.8.4.2.bb
@@ -1,8 +1,8 @@
 require git.inc
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "80eec3201a5d012913d287b85adaee8e"
-SRC_URI[sha256sum] = "dfa2cdf2df92b4abe956b1e7586030381c4e39e89161ab789a660d8d1f24d9d9"
+SRC_URI[md5sum] = "6f63d103465b86ca0ebe4189ea54731c"
+SRC_URI[sha256sum] = "6732278ce4870b314cfd83500ec15d5ee7a868be5b96549022d6f0972bf3dd2a"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


