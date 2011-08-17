Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtgGn-0000P2-G6
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 15:34:57 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	15:30:18 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 15:30:27 +0200
Message-ID: <97b7257b1c43d10d4d90e4eeb09d71304d86da6f.1313587776.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313587776.git.anders@chargestorm.se>
References: <cover.1313587776.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [PATCH 1/2] qemu: modify search paths for libgl
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
X-List-Received-Date: Wed, 17 Aug 2011 13:34:58 -0000
Content-Type: text/plain

On e.g. Debian libql is found under /usr/lib/x86_64-linux-gnu/libGL.so.
Use a wildcard to match different locations, as uname -i only return unknown on Debian.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 85476d6..8a1e934 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,7 +26,7 @@ do_configure_prepend_virtclass-native() {
 
     test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so && libgl='yes'
     test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so && libgl='yes'
-    test -e /usr/lib/`uname -i`-linux-gnu/libGL.so -a -e /usr/lib/`uname -i`-linux-gnu/libGLU.so && libgl='yes'
+    test -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so && libgl='yes'
 
     test -e /usr/lib/pkgconfig/sdl.pc -o -e /usr/lib64/pkgconfig/sdl.pc -o -e /usr/include/SDL/SDL.h && libsdl='yes'
 
-- 
1.7.5.4



