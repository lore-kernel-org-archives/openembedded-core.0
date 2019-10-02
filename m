Return-Path: <alessio.bogani@elettra.eu>
Received: from spamalot.elettra.eu (spamalot.elettra.trieste.it
	[140.105.206.208])
	by mail.openembedded.org (Postfix) with ESMTP id BA67C7E3BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 18:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with ESMTP id
	816954410DF_D94EAD2B for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 18:22:10 +0000 (GMT)
Received: from unknown-host by spamalot.elettra.eu with queue id 784388
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Oct 2019 18:22:08 GMT
Received: from voltumna.elettra.trieste.it (voltumna.elettra.trieste.it
	[192.168.205.44])
	by spamalot.elettra.eu (Sophos Email Appliance) with ESMTP id
	7B24443E586_D94EAD0F; Wed,  2 Oct 2019 18:22:08 +0000 (GMT)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 20:22:06 +0200
X-Mailer: git-send-email 2.17.1
X-SASI-RCODE: 200
Message-Id: <20191002182210.816954410DF_D94EAD2B@spamalot.elettra.eu>
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [PATCH] rootfs-postcommands: Replace an hard-coded value
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
X-List-Received-Date: Wed, 02 Oct 2019 18:22:11 -0000

Replace an hard-coded value ".rootfs" with the appropriate bitbake
variable IMAGE_NAME_SUFFIX.

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 88f75d0f44..2f171836fa 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -29,7 +29,7 @@ APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro
 ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
 
 # Write manifest
-IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
+IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
-- 
2.17.1


