Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RTWKO-0005kb-OA
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 11:14:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2011 02:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,564,1315206000"; d="scan'208";a="94942818"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2011 02:08:13 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 18:08:11 +0800
Message-Id: <1a0942490d103eab0a5041806613ae16b963ae1b.1322128489.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
Subject: [PATCH 1/4] runqemu: look for *image* to be more flexible for image names
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
X-List-Received-Date: Thu, 24 Nov 2011 10:14:49 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 31e9822..a9a362f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -114,7 +114,7 @@ while [ $i -le $# ]; do
                 usage
             fi
             ;;
-        *-image-*)
+        *image*)
             if [ -z "$ROOTFS" ]; then
                 if [ -f "$arg" ]; then
                     process_filename $arg
@@ -307,7 +307,7 @@ findimage() {
 
     # Sort rootfs candidates by modification time - the most
     # recently created one is the one we most likely want to boot.
-    filenames=`ls -t $where/*core-image*$machine.$extension 2>/dev/null | xargs`
+    filenames=`ls -t $where/*image*$machine.$extension 2>/dev/null | xargs`
     for name in $filenames; do
         if [[ "$name" =~ core-image-sato-sdk ||
               "$name" =~ core-image-sato     ||
-- 
1.7.6



