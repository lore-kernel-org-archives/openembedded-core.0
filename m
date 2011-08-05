Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO4-0000dS-0S
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926376"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:27:57 -0700
Message-Id: <9410dc515e47e9d1d2f2aefbca7e117202c4c653.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/14] prelink: Add lib64 dirs to prelink.conf
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:36 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Handle multlib or cases that baselib is lib64.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/prelink/prelink/prelink.conf |    8 ++++----
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink/prelink.conf b/meta/recipes-devtools/prelink/prelink/prelink.conf
index c5a4f4a..ed30c28 100644
--- a/meta/recipes-devtools/prelink/prelink/prelink.conf
+++ b/meta/recipes-devtools/prelink/prelink/prelink.conf
@@ -12,7 +12,7 @@
 -l /usr/bin
 -l /usr/X11R6/bin
 -l /usr/games
--l /usr/local/lib
--l /lib
--l /usr/lib
--l /usr/X11R6/lib
+-l /usr/local/lib{,64}
+-l /lib{,64}
+-l /usr/lib{,64}
+-l /usr/X11R6/lib{,64}
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index c653d4d..bb95da7 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
 PV = "1.0+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
-- 
1.7.3.4



