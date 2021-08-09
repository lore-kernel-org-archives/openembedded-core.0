Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466881"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466881"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462953"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/23] cve-check: fix comments
Date: Mon,  9 Aug 2021 23:35:47 +0800
Message-Id: <80941c3ae3c2ee8ca48462f20ef5187b26a35247.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This implements various fixes in comments in cve-check.bbclass
In particular, the "whitlisted" typo is important as the "whitelisted"
word is going to be replaced in a near future.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5eecd2bf942254d08c252388594e5ec7ae330f45)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 112ee3379d..7cc2a703db 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -20,7 +20,7 @@
 # the only method to check against CVEs. Running this tool
 # doesn't guarantee your packages are free of CVEs.
 
-# The product name that the CVE database uses.  Defaults to BPN, but may need to
+# The product name that the CVE database uses defaults to BPN, but may need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
@@ -56,11 +56,11 @@ CVE_CHECK_WHITELIST ?= ""
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 
-# Layers to be included 
+# Layers to be included
 CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
 
-# set to "alphabetical" for version using single alphabetical character as increament release
+# set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
 python cve_save_summary_handler () {
@@ -230,7 +230,7 @@ def check_cves(d, patched_cves):
         return ([], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
-    # If the recipe has been whitlisted we return empty lists
+    # If the recipe has been whitelisted we return empty lists
     if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
-- 
2.31.1

