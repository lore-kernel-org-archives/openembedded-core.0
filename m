Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hm-0006Z6-Na
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980258"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:28 -0700
Message-Id: <3e095165800862a588e1a1ad58c570b4890f78ad.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/32] qemu: modify search paths for libgl
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:48 -0000

From: Anders Darander <anders@chargestorm.se>

On e.g. Debian libql is found under /usr/lib/x86_64-linux-gnu/libGL.so.
Use a wildcard to match different locations, as uname -i only return unknown on Debian.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e5414ff..86c7d2c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,7 +26,7 @@ do_configure_prepend_virtclass-native() {
 
     test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so && libgl='yes'
     test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so && libgl='yes'
-    test -e /usr/lib/`uname -i`-linux-gnu/libGL.so -a -e /usr/lib/`uname -i`-linux-gnu/libGLU.so && libgl='yes'
+    test -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so && libgl='yes'
 
     test -e /usr/lib/pkgconfig/sdl.pc -o -e /usr/lib64/pkgconfig/sdl.pc -o -e /usr/include/SDL/SDL.h && libsdl='yes'
 
-- 
1.7.6



