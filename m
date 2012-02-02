Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VV-0002Yh-Fv
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486071"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:50 -0800
Message-Id: <4f9e5767b239335c47dbd57da6a21ce1f2bf686d.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 11/14] libdrm: Update to 2.4.30
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
X-List-Received-Date: Thu, 02 Feb 2012 23:56:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../drm/{libdrm_2.4.29.bb => libdrm_2.4.30.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.29.bb => libdrm_2.4.30.bb} (54%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.29.bb b/meta/recipes-graphics/drm/libdrm_2.4.30.bb
similarity index 54%
rename from meta/recipes-graphics/drm/libdrm_2.4.29.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.30.bb
index d02b914..4a6052d 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.29.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.30.bb
@@ -6,5 +6,5 @@ PR = "r0"
 
 SRC_URI += "file://installtests.patch"
 
-SRC_URI[md5sum] = "96d5e3e9edd55f4b016fe3b5dd0a1953"
-SRC_URI[sha256sum] = "e2432dc93e933479132123a1dca382294c30f55bc895bb737b6bdd6f2b8c452e"
+SRC_URI[md5sum] = "9f57a68b2c0836b55ebcbc241f6ca175"
+SRC_URI[sha256sum] = "cacea9c157ec824ad278a06f4910659b2f3ae69686518ece8d6967843cddcd56"
-- 
1.7.6.5



