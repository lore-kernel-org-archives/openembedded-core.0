Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DE7FE65C5B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 16:04:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2016 08:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="910511012"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 09 Dec 2016 08:04:41 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BBB2A6A4006;
	Fri,  9 Dec 2016 08:03:53 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 18:04:26 +0200
Message-Id: <1481299466-9485-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-find-native-sysroot: create usage output
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2016 16:04:43 -0000

Created usage output for oe-find-native-sysroot script.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-find-native-sysroot | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 81d62b8..13a5c46 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -30,6 +30,20 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
+if [ "$1" = '--help' -o "$1" = '-h' ] ; then
+    echo 'Usage: oe-find-native-sysroot [-h|--help]'
+    echo ''
+    echo 'OpenEmbedded find-native-sysroot - helper script to set'
+    echo 'environment variables OECORE_NATIVE_SYSROOT and PSEUDO'
+    echo 'to the path of the native sysroot directory and pseudo'
+    echo 'executable binary'
+    echo ''
+    echo 'options:'
+    echo '  -h, --help          show this help message and exit'
+    echo ''
+    exit 2
+fi
+
 if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
     BITBAKE=`which bitbake 2> /dev/null`
     if [ "x$BITBAKE" != "x" ]; then
-- 
2.1.4


