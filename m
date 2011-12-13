Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RaZ0Y-00053B-6g
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:31:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95781353"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.215])
	by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 12:24:24 -0800
Message-Id: <e9dfe23dbb4ff3b76f866cc165e1021b59d35e89.1323807692.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
Subject: [PATCH 2/5] clutter: upgrade to 1.8.2
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
X-List-Received-Date: Tue, 13 Dec 2011 20:31:26 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../{clutter-1.8_1.8.0.bb => clutter-1.8_1.8.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.8_1.8.0.bb => clutter-1.8_1.8.2.bb} (83%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.2.bb
similarity index 83%
rename from meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
rename to meta/recipes-graphics/clutter/clutter-1.8_1.8.2.bb
index 7deac9e..f76201e 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.2.bb
@@ -23,5 +23,5 @@ do_configure_prepend () {
 	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
 
-SRC_URI[md5sum] = "71454425366d9a49948cdd2af9eafc89"
-SRC_URI[sha256sum] = "79cd42c9a208b1bd2e2a0866ad7eb047a00835beabb401e99737af846812119c"
+SRC_URI[md5sum] = "29a238fa11da2f56c40de0eb04424aaf"
+SRC_URI[sha256sum] = "5e6abf6440e6be8130fd7a6b449e1789e4318f61b17f06323ba1b58dc143bc8b"
-- 
1.7.7.4



