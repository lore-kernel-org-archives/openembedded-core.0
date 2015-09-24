Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E8E8A734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 15:34:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 24 Sep 2015 08:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,581,1437462000"; d="scan'208";a="796513357"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 08:34:33 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.68.154])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 030516A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 08:33:36 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 13:48:12 +0300
Message-Id: <1443091692-13018-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] runqemu-export-rootfs: update location of unfsd binary
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
X-List-Received-Date: Thu, 24 Sep 2015 15:34:45 -0000

Update the location of unfsd binary from "/usr/sbin" to "/usr/bin" in
runqemu-export-rootfs

[YOCTO #8315]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 scripts/runqemu-export-rootfs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 40ab201..3dee131 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -46,8 +46,8 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 fi
 . $SYSROOT_SETUP_SCRIPT
 
-if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/sbin/unfsd" ]; then
-	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/sbin/"
+if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd" ]; then
+	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
 
 	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
 		echo "Have you run 'bitbake meta-ide-support'?"
@@ -115,8 +115,8 @@ case "$1" in
 	fi
 
 	echo "Starting User Mode nfsd"
-	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/unfsd $UNFSD_OPTS"
-	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/unfsd $UNFSD_OPTS
+	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS"
+	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS
 	if [ ! $? = 0 ]; then
 		echo "Error starting nfsd"
 		exit 1
-- 
2.4.0


