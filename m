Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RaZ0X-00053B-H7
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:31:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95781352"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.215])
	by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 12:24:23 -0800
Message-Id: <741eea0e75830ee2bc0ff1789a13f07130318b68.1323807692.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
Subject: [PATCH 1/5] cogl: upgrade to latest stable cogl 1.8.2
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
X-List-Received-Date: Tue, 13 Dec 2011 20:31:25 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/{cogl_1.8.0.bb => cogl_1.8.2.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{cogl_1.8.0.bb => cogl_1.8.2.bb} (59%)

diff --git a/meta/recipes-graphics/clutter/cogl_1.8.0.bb b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
similarity index 59%
rename from meta/recipes-graphics/clutter/cogl_1.8.0.bb
rename to meta/recipes-graphics/clutter/cogl_1.8.2.bb
index 02ed67c..d99c443 100644
--- a/meta/recipes-graphics/clutter/cogl_1.8.0.bb
+++ b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "http://source.clutter-project.org/sources/cogl/1.8/${BPN}-${PV}.tar.bz2 \
 	   file://macro-versions.patch"
 
-SRC_URI[md5sum] = "cd18c28bf3dd0008b072cb9c5eed7821"
-SRC_URI[sha256sum] = "5ed9ee014367058a63d99a13e3fcc8cb8c6acb19ece00195c6df034fd8d8d8c7"
+SRC_URI[md5sum] = "3145cbf7ff162c33065ea4421c047e2f"
+SRC_URI[sha256sum] = "8b647b51a4fa93034fcd74ffe86b3d4c919b0e54789108f6d065414e6162ab73"
-- 
1.7.7.4



