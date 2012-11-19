Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaKXR-00043w-75
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 07:08:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2012 21:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,276,1352102400"; d="scan'208";a="221530194"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2012 21:54:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2012 21:54:34 -0800
Message-Id: <afe45cb6fb5acc8b05dd76ae839441332cfe0c26.1353304234.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
Subject: [PATCH 01/17] sysstat: Update to 10.1.2
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
X-List-Received-Date: Mon, 19 Nov 2012 06:09:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{sysstat_10.1.1.bb => sysstat_10.1.2.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.1.bb => sysstat_10.1.2.bb} (44%)

diff --git a/meta/recipes-extended/sysstat/sysstat_10.1.1.bb b/meta/recipes-extended/sysstat/sysstat_10.1.2.bb
similarity index 44%
rename from meta/recipes-extended/sysstat/sysstat_10.1.1.bb
rename to meta/recipes-extended/sysstat/sysstat_10.1.2.bb
index 54b0226..6f22f0c 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.1.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.1.2.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "8250cdcbc4a959c8a05e4186fbd13d84"
-SRC_URI[sha256sum] = "119c7a23c5597d6d0df0b229c54984a35f357ecbd1c96da8cef4d105e8dfdacf"
+SRC_URI[md5sum] = "c40626b96cc2b4cf303cbcf1efc96eba"
+SRC_URI[sha256sum] = "c68bc2b4b436812f45e6d440a3ac106fa2a77c5cfc9d4ba7d4e7f9ded7bffab4"
-- 
1.7.7.6



