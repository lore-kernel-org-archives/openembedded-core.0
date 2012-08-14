Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCY-0000ex-8k
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181344"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:17 +0300
Message-Id: <be621b44d184eb77bc19078c3180e6b5ca3065d4.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 30/64] time: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:32 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/time/time.inc    |    8 +-------
 meta/recipes-extended/time/time_1.7.bb |    2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/time/time.inc b/meta/recipes-extended/time/time.inc
index 8e35843..028da7c 100644
--- a/meta/recipes-extended/time/time.inc
+++ b/meta/recipes-extended/time/time.inc
@@ -8,11 +8,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 inherit update-alternatives
 
-do_install_append () {
-        mv ${D}${bindir}/time ${D}${bindir}/time.${BPN}
-}
-
-ALTERNATIVE_NAME = "time"
-ALTERNATIVE_LINK = "${bindir}/time"
-ALTERNATIVE_PATH = "${bindir}/time.${BPN}"
+ALTERNATIVE_${PN} = "time"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/time/time_1.7.bb b/meta/recipes-extended/time/time_1.7.bb
index c38608f..92c5353 100644
--- a/meta/recipes-extended/time/time_1.7.bb
+++ b/meta/recipes-extended/time/time_1.7.bb
@@ -1,6 +1,6 @@
 require time.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
 	   file://debian.patch"
-- 
1.7.7.6



