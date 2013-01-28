Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4O-0003nR-Gu
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769980"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:50 -0800
Message-Id: <d3903b238e62aaca455596c68c4c8d96a8dda460.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 03/13] sysstat: Update to 10.1.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 09:32:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sysstat/{sysstat_10.1.2.bb => sysstat_10.1.3.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.2.bb => sysstat_10.1.3.bb} (44%)

diff --git a/meta/recipes-extended/sysstat/sysstat_10.1.2.bb b/meta/recipes-extended/sysstat/sysstat_10.1.3.bb
similarity index 44%
rename from meta/recipes-extended/sysstat/sysstat_10.1.2.bb
rename to meta/recipes-extended/sysstat/sysstat_10.1.3.bb
index 6f22f0c..c02b77b 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.1.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.1.3.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "${INC_PR}.0"
+SRC_URI[md5sum] = "e08b5665956930ad12b10ed6e0a08b10"
+SRC_URI[sha256sum] = "1f31c2b60cdc3d7aecd9bba589183f3c48ddd3ce8c15e75c6d09718cb7a496b6"
 
-SRC_URI[md5sum] = "c40626b96cc2b4cf303cbcf1efc96eba"
-SRC_URI[sha256sum] = "c68bc2b4b436812f45e6d440a3ac106fa2a77c5cfc9d4ba7d4e7f9ded7bffab4"
+PR = "${INC_PR}.0"
-- 
1.8.0.2



