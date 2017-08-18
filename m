Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 71FC6783D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 12:38:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 05:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,392,1498546800"; d="scan'208";a="891389068"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2017 05:38:22 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6EEF35806E0;
	Fri, 18 Aug 2017 05:38:21 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 15:38:16 +0300
Message-Id: <1503059896-31732-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] cve-check-tool: Fix progress bar patch for curl 7.55
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
X-List-Received-Date: Fri, 18 Aug 2017 12:38:21 -0000

CURL_FORMAT_OFF_T does not seem to exist anymore, use
CURL_FORMAT_CURL_OFF_T instead. This works with old and new curl.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../files/0001-print-progress-in-percent-when-downloading-CVE-db.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
index 0510e3a..8ea6f68 100644
--- a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
+++ b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
@@ -38,7 +38,7 @@ index 06d4b30..0fe6d76 100644
 +        if (dltotal && percent && percent->end >= percent->start) {
 +                unsigned int diff = percent->end - percent->start;
 +                if (diff) {
-+                        fprintf(stderr,"completed: "CURL_FORMAT_OFF_T"%%\r", percent->start + (diff * dlnow / dltotal));
++                        fprintf(stderr,"completed: %"CURL_FORMAT_CURL_OFF_T"%%\r", percent->start + (diff * dlnow / dltotal));
 +                }
 +        }
 +
-- 
2.1.4


