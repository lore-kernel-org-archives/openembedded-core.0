Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RaZ0Y-00053B-Rq
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:31:27 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95781354"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.215])
	by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 12:24:25 -0800
Message-Id: <49655365aaafa54bd884ecb3d70818ba35154fe4.1323807692.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
Subject: [PATCH 3/5] cogl: update git recipe to 1.8.2
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
X-List-Received-Date: Tue, 13 Dec 2011 20:31:27 -0000

Eventual plan is to start building bleeding git again, so we'd like to keep
the recipe around and relatively up to date.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/cogl_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
index 0702302..7a10dd8 100644
--- a/meta/recipes-graphics/clutter/cogl_git.bb
+++ b/meta/recipes-graphics/clutter/cogl_git.bb
@@ -2,8 +2,9 @@ require cogl.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "0a70a159c65357809740971570b2e301451161b5"
-PV = "1.8.0+git${SRCPV}"
+# the 1.8.2 tag
+SRCREV = "e398e374e2ff0e88bc1d63577a192f8ca04a1cb5"
+PV = "1.8.2+git${SRCPV}"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.7.4



