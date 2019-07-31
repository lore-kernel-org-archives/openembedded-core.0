Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E393B7F367
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 04:55:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jul 2019 21:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,328,1559545200"; d="scan'208";a="183549157"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2019 21:55:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 12:55:27 +0800
Message-Id: <20190731045527.11885-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] python: CVE-2019-9947 is same as CVE-2019-9740
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
X-List-Received-Date: Wed, 31 Jul 2019 04:55:30 -0000
Content-Transfer-Encoding: 8bit

See:
https://bugs.python.org/issue30458

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python/CVE-2019-9740.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python/CVE-2019-9740.patch b/meta/recipes-devtools/python/python/CVE-2019-9740.patch
index 066ac68290..95f43e0387 100644
--- a/meta/recipes-devtools/python/python/CVE-2019-9740.patch
+++ b/meta/recipes-devtools/python/python/CVE-2019-9740.patch
@@ -31,6 +31,7 @@ Notes on backport to Python 2.7:
 
 Upstream-Status: Backport
 CVE: CVE-2019-9740
+CVE: CVE-2019-9947
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
  Lib/httplib.py                                | 16 ++++++
-- 
2.21.0


