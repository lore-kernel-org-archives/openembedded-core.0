Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRn-0006IE-57
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734220345"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:55:15 -0700
Message-Id: <ce5a5b738541e18cc84540b3205d4cca6ea2943b.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Sat, 9 Apr 2011 21:33:50 +0800
Date: Fri, 15 Apr 2011 23:55:15 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 42/58] pango: upgrade from 1.28.3 to 1.28.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2011 06:57:36 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../{pango-1.28.3 => pango-1.28.4}/no-tests.patch  |    4 ++++
 .../pango/{pango_1.28.3.bb => pango_1.28.4.bb}     |    4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango-1.28.3 => pango-1.28.4}/no-tests.patch (72%)
 rename meta/recipes-graphics/pango/{pango_1.28.3.bb => pango_1.28.4.bb} (50%)

diff --git a/meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch b/meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
similarity index 72%
rename from meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch
rename to meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
index 4a74d8c..6d9e74b 100644
--- a/meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch
+++ b/meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Inappropriate [ disable tests make sense in embedded, but not appropriate for upstream]
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
 Index: pango-1.22.2/Makefile.am
 ===================================================================
 --- pango-1.22.2.orig/Makefile.am
diff --git a/meta/recipes-graphics/pango/pango_1.28.3.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
similarity index 50%
rename from meta/recipes-graphics/pango/pango_1.28.3.bb
rename to meta/recipes-graphics/pango/pango_1.28.4.bb
index 228aae7..600f00b 100644
--- a/meta/recipes-graphics/pango/pango_1.28.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -6,7 +6,7 @@ PR = "r0"
 
 SRC_URI += "file://no-tests.patch"
 
-SRC_URI[archive.md5sum] = "caa74baea47e7e16bc73c89f9089d522"
-SRC_URI[archive.sha256sum] = "5e278bc9430cc7bb00270f183360d262c5006b51248e8b537ea904573f200632"
+SRC_URI[archive.md5sum] = "3f3989700f04e9117d30544a9078b3a0"
+SRC_URI[archive.sha256sum] = "7eb035bcc10dd01569a214d5e2bc3437de95d9ac1cfa9f50035a687c45f05a9f"
 
 #PARALLEL_MAKE = ""
-- 
1.7.1.1



