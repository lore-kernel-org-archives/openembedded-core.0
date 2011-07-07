Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QevJN-00034K-PI
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 22:36:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 13:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,495,1304319600"; d="scan'208";a="22782106"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 13:25:43 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 13:25:36 -0700
Message-Id: <2a720e9cc911c208867069308121000c36312ca4.1310070283.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310070283.git.nitin.a.kamble@intel.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/7] gmp: upgrade from 5.0.1 to 5.0.2
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
X-List-Received-Date: Thu, 07 Jul 2011 20:36:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gmp/{gmp_5.0.1.bb => gmp_5.0.2.bb}             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gmp/{gmp_5.0.1.bb => gmp_5.0.2.bb} (67%)

diff --git a/meta/recipes-support/gmp/gmp_5.0.1.bb b/meta/recipes-support/gmp/gmp_5.0.2.bb
similarity index 67%
rename from meta/recipes-support/gmp/gmp_5.0.1.bb
rename to meta/recipes-support/gmp/gmp_5.0.2.bb
index 2d8ac78..03fef45 100644
--- a/meta/recipes-support/gmp/gmp_5.0.1.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
@@ -8,5 +8,5 @@ SRC_URI_append += "file://sh4-asmfix.patch \
                    file://use-includedir.patch "
 
 
-SRC_URI[md5sum] = "6bac6df75c192a13419dfd71d19240a7"
-SRC_URI[sha256sum] = "a2a610f01fd3298dc08c87bf30498c2402590e1bcb227fc40b15ee6d280939fb"
+SRC_URI[md5sum] = "0bbaedc82fb30315b06b1588b9077cd3"
+SRC_URI[sha256sum] = "dbc2db76fdd4e99f85d5e35aa378ed62c283e0d586b91bd8703aff75a7804c28"
-- 
1.7.4.4



