Return-Path: <swee.aun.khor@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 35E247848E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:18:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 02:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,387,1498546800"; d="scan'208";a="1206695937"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2017 02:18:03 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 19:07:52 -0700
Message-Id: <1502935672-112062-1-git-send-email-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] valgrind: disable build for muslx32
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
X-List-Received-Date: Thu, 17 Aug 2017 09:18:02 -0000

From: sweeaun <swee.aun.khor@intel.com>

Disable build for muslx32.X32 isn't supported by valgrind at this
moment.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index a5c4943..25b4126 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -51,6 +51,7 @@ COMPATIBLE_HOST_armv6 = 'null'
 
 # X32 isn't supported by valgrind at this time
 COMPATIBLE_HOST_linux-gnux32 = 'null'
+COMPATIBLE_HOST_linux-muslx32 = 'null'
 
 # Disable for some MIPS variants
 COMPATIBLE_HOST_mipsarchn32 = 'null'
-- 
2.7.4


