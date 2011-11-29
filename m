Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8H-0005pV-A2
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419458"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:42 -0800
Message-Id: <c2f88c658b73da67d93312591b3e67b42f629fe3.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/23] runqemu: look for *-image* to be more flexible for image names
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:41 -0000

We can't just look for *image* since it will catch up bzimage

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 31e9822..4adeace 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -114,7 +114,7 @@ while [ $i -le $# ]; do
                 usage
             fi
             ;;
-        *-image-*)
+        *-image*)
             if [ -z "$ROOTFS" ]; then
                 if [ -f "$arg" ]; then
                     process_filename $arg
@@ -307,7 +307,7 @@ findimage() {
 
     # Sort rootfs candidates by modification time - the most
     # recently created one is the one we most likely want to boot.
-    filenames=`ls -t $where/*core-image*$machine.$extension 2>/dev/null | xargs`
+    filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
     for name in $filenames; do
         if [[ "$name" =~ core-image-sato-sdk ||
               "$name" =~ core-image-sato     ||
-- 
1.7.6.4



