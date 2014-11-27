Return-Path: <michael.jones@matrix-vision.de>
X-Greylist: delayed 535 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Nov 2014 16:32:59 UTC
Received: from mail1.matrix-vision.com (mail1.matrix-vision.com [78.46.91.79])
	by mail.openembedded.org (Postfix) with ESMTP id CDE8A7190D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 16:32:59 +0000 (UTC)
Received: from polydeuces (g1-2.matrix-vision.com [80.152.153.235])
	(using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail1.matrix-vision.com (Postfix) with ESMTPSA id A47FE761A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:24:04 +0100 (CET)
Received: from drogo (drogo.intern.matrix-vision.de [192.168.10.20])
	by polydeuces (Postfix) with ESMTP id 4460732153
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:24:04 +0100 (CET)
Received: from polydeuces (polydeuces.intern.matrix-vision.de [192.168.5.51])
	by thyone.g1.matrix-vision.de (AvMailGate-3.2.1.26) id 1497-ihilxH; 
	Thu, 27 Nov 2014 16:24:03 -0000
Received: by polydeuces (Postfix, from userid 108)
	id B7A513215D; Thu, 27 Nov 2014 17:24:03 +0100 (CET)
Received: from michael-HP.intern.matrix-vision.de
	(host65-101.intern.matrix-vision.de [192.168.65.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by polydeuces (Postfix) with ESMTPSA id A24D932153;
	Thu, 27 Nov 2014 17:24:03 +0100 (CET)
From: Michael Jones <michael.jones@matrix-vision.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 17:21:53 +0100
Message-Id: <1417105314-29318-2-git-send-email-michael.jones@matrix-vision.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1417105314-29318-1-git-send-email-michael.jones@matrix-vision.de>
References: <1417105314-29318-1-git-send-email-michael.jones@matrix-vision.de>
X-MV-Disclaimer: true (polydeuces)
X-AntiVirus: checked by Avira MailGate (version: 3.2.1.26; AVE: 8.3.26.26;
	VDF: 7.11.189.40; host: thyone); id=1497-ihilxH
X-AV-Checked: ClamAV using ClamSMTP (sao)
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 69870 [Nov 27 2014]
X-KLMS-AntiSpam-Version: 5.5.3
X-KLMS-AntiSpam-Envelope-From: michael.jones@matrix-vision.de
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Moebius-Timestamps: 3238071, 3238111, 0
X-KLMS-AntiSpam-Info: LuaCore: 88 2014-11-27_18-23-14
	e9e3345370e5acf1d8dc237095fbb5e25828eab3
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, 2014/11/27 11:02:47
X-KLMS-AntiVirus: Kaspersky Security 8.0 for Linux Mail Server, version
	8.0.1.705, bases: 2014/11/27 11:08:00 #9998603;
	khse: 2014-03-12 13:55:01
X-KLMS-AntiVirus-Status: Clean, skipped
Subject: [PATCH 2/3] image.bbclass: whitespace
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
X-List-Received-Date: Thu, 27 Nov 2014 16:33:02 -0000

Don't mix tabs and spaces
---
 meta/classes/image.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d27abc9..82e977c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -193,12 +193,12 @@ read_only_rootfs_hook () {
 	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
-	        # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
+		# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
 			sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
 		fi
-	        # Run populate-volatile.sh at rootfs time to set up basic files
-	        # and directories to support read-only rootfs.
+		# Run populate-volatile.sh at rootfs time to set up basic files
+		# and directories to support read-only rootfs.
 		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
-- 
1.9.1


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Uwe Furtner, Erhard Meier

