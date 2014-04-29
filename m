Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6543660E24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 09:35:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Apr 2014 02:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,950,1389772800"; d="scan'208";a="531468968"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 02:35:03 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 12:34:54 +0300
Message-Id: <1398764094-12045-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] lighttpd: upgrade to 1.4.35
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
X-List-Received-Date: Tue, 29 Apr 2014 09:35:10 -0000

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../lighttpd/{lighttpd_1.4.33.bb => lighttpd_1.4.35.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.33.bb => lighttpd_1.4.35.bb} (94%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
similarity index 94%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
index 2ea5f85..bcab7d1 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.service \
         "
 
-SRC_URI[md5sum] = "e66b8164e5fc5a6beec0823b697fbe1d"
-SRC_URI[sha256sum] = "2ff2324658c0f90e7d39afd40f08f11ca230903b9019c31a2bbecd8f087f235e"
+SRC_URI[md5sum] = "f7a88130ee9984b421ad8aa80629750a"
+SRC_URI[sha256sum] = "4a71c1f6d8af41ed894b507720c4c17184dc320590013881d5170ca7f15c5bf7"
 
 EXTRA_OECONF = " \
              --without-bzip2 \
-- 
1.9.1


