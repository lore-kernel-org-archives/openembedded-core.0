Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SQIQ0-0007XS-2T
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 15:19:32 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 15:09:44 +0200
Message-Id: <1336136984-11129-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-4.6: explicitly disable ppl
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
X-List-Received-Date: Fri, 04 May 2012 13:19:32 -0000

* Fixes the following error after a system library upgrade
| .../mipsel-oe-linux/4.6.4/cc1: error while loading shared libraries: libppl.so.10: cannot open shared object file: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* This patch is based on the denzil branch.

 meta/recipes-devtools/gcc/gcc-4.6.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 020e21b..74843ae 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r25"
+PR = "r26"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -93,6 +93,7 @@ EXTRA_OECONF_BASE = " --enable-lto \
 			--disable-libmudflap \
 			--with-system-zlib \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
+			--without-ppl \
 			--enable-cheaders=c_global "
 
 EXTRA_OECONF_INITIAL = "--disable-libmudflap \
-- 
1.7.9.5



