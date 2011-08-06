Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpabP-0000Nc-Jz
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 08:43:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 23:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,327,1309762800"; d="scan'208";a="35941163"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 23:38:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 23:38:41 -0700
Message-Id: <a3ba62867c0f23a8ed12d9b024bd47944b594f56.1312612601.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 5/9] gtk-icon-cache bbclass: don't assing to global RDEPENDS
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
X-List-Received-Date: Sat, 06 Aug 2011 06:43:20 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Only the package with the icons needs it

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/gtk-icon-cache.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 4142d0e..5d8ef34 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -37,9 +37,9 @@ python populate_packages_append () {
 			continue
 
 		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
-		rdepends = bb.data.getVar('RDEPENDS', d, 1)
+		rdepends = bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
 		rdepends += "hicolor-icon-theme"
-		bb.data.setVar('RDEPENDS', rdepends, d)
+		bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)
 	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
 		
-- 
1.7.3.4



