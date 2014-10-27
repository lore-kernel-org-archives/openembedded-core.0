Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 432B8706D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 07:42:52 +0000 (UTC)
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.14.3/8.14.3) with ESMTP id s9R7gl3k017027
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 08:42:47 +0100
Received: from localhost.localdomain (MD159NTC.ww002.siemens.net
	[139.16.76.77])
	by mail2.siemens.de (8.14.3/8.14.3) with ESMTP id s9R7gkJp002455;
	Mon, 27 Oct 2014 08:42:46 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Oct 2014 08:42:36 +0100
Message-Id: <1414395756-29588-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] image_types.bbclass: Make ubi depend on ubifs
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
X-List-Received-Date: Mon, 27 Oct 2014 07:42:58 -0000

The ubi command assumes the ubifs file is present.
This makes sure this is really the case.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/image_types.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 99a07da..76190fd 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -96,6 +96,8 @@ IMAGE_CMD_ubi () {
 	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}
 	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
 }
+IMAGE_TYPEDEP_ubi = "ubifs"
+
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""
-- 
1.7.10.4


