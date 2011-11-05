Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3h-00065F-RX
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625144"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:57 -0700
Message-Id: <f631844a0a954f5dd49a742d86921efe298858d7.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/28] qemugl: switch to new git repo
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:39 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

The qemugl git repository is now on yoctoproject.org.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/mesa/qemugl_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
index 1658759..e3552ec 100644
--- a/meta/recipes-graphics/mesa/qemugl_git.bb
+++ b/meta/recipes-graphics/mesa/qemugl_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "virtual/libx11 xproto glproto libxfixes"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 
-SRC_URI = "git://git.o-hand.com/qemugl.git;protocol=git \
+SRC_URI = "git://git.yoctoproject.org/qemugl;protocol=git \
            file://versionfix.patch \
            file://remove-x11r6-lib-dir.patch \
            file://call_opengl_fix.patch"
-- 
1.7.6.4



