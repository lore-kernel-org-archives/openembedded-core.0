Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S266B-00027t-Ik
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056442"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:24 -0800
Message-Id: <4dc225a057a52167e072c9581bea4a173789c83b.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
Subject: [PATCH 06/13] libdrm: Update to version 2.4.31
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../drm/{libdrm_2.4.30.bb => libdrm_2.4.31.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.30.bb => libdrm_2.4.31.bb} (59%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.30.bb b/meta/recipes-graphics/drm/libdrm_2.4.31.bb
similarity index 59%
rename from meta/recipes-graphics/drm/libdrm_2.4.30.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.31.bb
index 5d99916..6aa0542 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.30.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.31.bb
@@ -2,11 +2,11 @@ require libdrm.inc
 
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-SRC_URI[md5sum] = "9f57a68b2c0836b55ebcbc241f6ca175"
-SRC_URI[sha256sum] = "cacea9c157ec824ad278a06f4910659b2f3ae69686518ece8d6967843cddcd56"
+SRC_URI[md5sum] = "b8cf744ec113c6028fe0975b1133b649"
+SRC_URI[sha256sum] = "8fc7e0e5b2f9bf493447a4ef7adc49174a700824457774cb53c1b8f2da866af4"
-- 
1.7.7.6



