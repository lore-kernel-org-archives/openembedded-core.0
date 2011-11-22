Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzOA-0003b9-Ua
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292564"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:49 -0800
Message-Id: <269d041c438ef1247c2bda0321f5c870294a454d.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
Subject: [PATCH 06/10] clutter: PROVIDES clutter-1.6
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
X-List-Received-Date: Tue, 22 Nov 2011 23:04:33 -0000

Since the two are API/ABI compatible and this may make things easier for
external layers using clutter.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
index efafbc2..c67ea2a 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
@@ -2,6 +2,9 @@ require recipes-graphics/clutter/clutter.inc
 
 PR = "r2"
 
+# We're API/ABI compatible and this may make things easier for layers
+PROVIDES += "clutter-1.6"
+
 # Internal json-glib was removed in Clutter 1.5.2
 STDDEPENDS += "json-glib cogl atk"
 
-- 
1.7.7.3



