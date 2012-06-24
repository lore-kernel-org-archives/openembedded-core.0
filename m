Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKY-0004YL-2b
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983153"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:37 -0700
Message-Id: <74558d73de5a0944d4909d4c998ea70cc5435660.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 12/14] foomatic-filters: Upgrade to 4.0.16
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ilters_4.0.15.bb => foomatic-filters_4.0.16.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/foomatic/{foomatic-filters_4.0.15.bb => foomatic-filters_4.0.16.bb} (90%)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
similarity index 90%
rename from meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb
rename to meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
index bcf8d1d..5f145b0 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
@@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca
 
 SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1b7efcdc57340915647daa5b5c15b0ef"
-SRC_URI[sha256sum] = "f5b7b67aacedec4c0294d242cbffbe0d7d3cd0fdd2b410c055e818f25ed3bc79"
+SRC_URI[md5sum] = "ec907d9ea17e03bccb91db66e9470586"
+SRC_URI[sha256sum] = "bedc61466c284c8ea0ae95c97d51a873411c6c55338e67831893772465f5434d"
 
 inherit autotools
 
-- 
1.7.7.6



