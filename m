Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3R-0001do-9F
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396924"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:53 -0700
Message-Id: <d15f628a5fa1b34d51eb6a3a7dfc98b1805548eb.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/22] gcc-4.6: update to 4.6.1 release
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:45 -0000

From: Phil Blundell <philb@gnu.org>

Set SRCREV to match the point at which 4.6.1 was released, update PV appropriately.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 56064b5..8af5369 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r8"
+PR = "r0"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -8,7 +8,7 @@ PR = "r8"
 # on branch then PV should be incremented to 4.6.1+svnr${SRCPV}
 # to reflect that change
 
-PV = "4.6.0+svnr${SRCPV}"
+PV = "4.6.1+svnr${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.6.1 or 4.6.2) has been made
@@ -18,7 +18,7 @@ PV = "4.6.0+svnr${SRCPV}"
 
 BINV = "4.6.1"
 
-SRCREV = 175150
+SRCREV = 175454
 BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
-- 
1.7.3.4



