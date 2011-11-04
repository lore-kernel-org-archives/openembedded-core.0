Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO2P-0000OA-5w
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 18:58:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="71264396"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga001.jf.intel.com with ESMTP; 04 Nov 2011 10:52:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:52:28 +0000
Message-Id: <d289eb7c2b2b4ea43e178a6894f645df6b4a11f7.1320429060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429060.git.paul.eggleton@linux.intel.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429060.git.paul.eggleton@linux.intel.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] qemugl: switch to new git repo
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
X-List-Received-Date: Fri, 04 Nov 2011 17:58:45 -0000

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
1.7.5.4



