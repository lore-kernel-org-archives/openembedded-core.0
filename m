Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SQQyb-0002zC-5B
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 00:27:49 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 May 2012 00:17:57 +0200
Message-Id: <1336169877-29276-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-4.6: disable cloog, change syntax to disable ppl
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
X-List-Received-Date: Fri, 04 May 2012 22:27:49 -0000

* Backported from 523df15bcc21e1749771cca757613f3520243b8e
  as suggested by Khem.

* Original commit message:

  If build system has those libraries installed
  gcc configure will pick them up. We want
  consistent builds so we disable them since we
  do not (yet) support them

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 74843ae..0f56670 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r26"
+PR = "r27"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -93,7 +93,8 @@ EXTRA_OECONF_BASE = " --enable-lto \
 			--disable-libmudflap \
 			--with-system-zlib \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
-			--without-ppl \
+			--with-ppl=no \
+			--with-cloog=no \
 			--enable-cheaders=c_global "
 
 EXTRA_OECONF_INITIAL = "--disable-libmudflap \
-- 
1.7.9.5



