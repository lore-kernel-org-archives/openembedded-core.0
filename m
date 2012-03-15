Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S8JLT-0006lZ-SU
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 23:40:31 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 23:31:43 +0100
Message-Id: <1331850703-3074-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] Revert "scripts/bitbake: ensure user is in build directory"
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
X-List-Received-Date: Thu, 15 Mar 2012 22:40:32 -0000

This reverts commit b4df1c7c79b5c801658bcf890ba3a8eab3d83189, because
it breaks setups where oe-core scripts aren't used, e.g. for a shared
tmp directory.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019136.html
---
 scripts/bitbake |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 45c8697..dda3b26 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -47,11 +47,6 @@ float_test() {
 # but earlier versions do not
 float_test "$TARVERSION > 1.23" && needtar="0"
 
-if [ "`pwd`" != "$BUILDDIR" ] ; then
-    echo "BitBake must be run from your build directory: $BUILDDIR"
-    exit 1
-fi
-
 buildpseudo="1"
 if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
     PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
-- 
1.7.5.4



