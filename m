Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R9Ypv-00086q-18
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 10:52:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2011 01:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57526053"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 01:47:17 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 16:42:54 +0800
Message-Id: <f023894c78e888259486d407ea88430335247db9.1317371971.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317371971.git.edwin.zhai@intel.com>
References: <cover.1317371971.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317371971.git.edwin.zhai@intel.com>
References: <cover.1317371971.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] oprofileui: Update SRCREV to reflect recent accpeted patches by upstream
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
X-List-Received-Date: Fri, 30 Sep 2011 08:52:51 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-kernel/oprofile/oprofileui_git.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index 0047748..2b56981 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -1,12 +1,10 @@
 require oprofileui.inc
 
-SRCREV = "0c3c32fa754c1d0b70e65767ea7048914f776396"
+SRCREV = "b3116a4f80ae64bd280e6434d66f33ed492d449a"
 PV = "0.0+git${SRCPV}"
-PR = "r4"
+PR = "r0"
 
 S = "${WORKDIR}/git"
 
 # Oprofileui at http://labs.o-hand.com/oprofileui/ is not maintained now.
-SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git \
-           file://migrate-from-gnomevfs-to-gio.patch \
-           file://dso_linking_change_build_fix.patch "
+SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git"
-- 
1.7.1



