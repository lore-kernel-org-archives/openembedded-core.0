Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKT-0004YL-Sd
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983139"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:27 -0700
Message-Id: <7997e412b4193568278d3a99cd015f8761315863.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 02/14] psmisc: Update to 22.19
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../psmisc/{psmisc_22.16.bb => psmisc_22.19.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_22.16.bb => psmisc_22.19.bb} (42%)

diff --git a/meta/recipes-extended/psmisc/psmisc_22.16.bb b/meta/recipes-extended/psmisc/psmisc_22.19.bb
similarity index 42%
rename from meta/recipes-extended/psmisc/psmisc_22.16.bb
rename to meta/recipes-extended/psmisc/psmisc_22.19.bb
index 8ff3eee..7c34de9 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.16.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.19.bb
@@ -1,7 +1,7 @@
 require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-PR = "r2"
+PR = "r0"
 
-SRC_URI[md5sum] = "d52caf26159c905574c2ce4bd792b9ee"
-SRC_URI[sha256sum] = "ae426d7238e5353fdf51b1d313897c2bbed0023e66e5b4af2be9cd03d87a9d01"
+SRC_URI[md5sum] = "38563b4760ffce54b0eadf99cb5b16e8"
+SRC_URI[sha256sum] = "e112ccadd4694c98f5ea4a02cd6944fdc5a2a1985f20e2b3f74f4dbca83a2a31"
-- 
1.7.7.6



