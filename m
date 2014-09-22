Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 148726FE3B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:36:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id BA1C73161195;
	Mon, 22 Sep 2014 13:36:19 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:35:18 +0200
Message-Id: <1411385721-22264-7-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 6/9] documentation.conf: document IMAGE_BOOT_FILES
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
X-List-Received-Date: Mon, 22 Sep 2014 11:36:19 -0000

Document IMAGE_BOOT_FILES variable.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index dd55685..66ec093 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -204,6 +204,7 @@ ICECC_USER_CLASS_BL[doc] = "Identifies user classes that you do not want the Ice
 ICECC_USER_PACKAGE_BL[doc] = "Identifies user recipes that you do not want the Icecream distributed compile support to consider."
 ICECC_USER_PACKAGE_WL[doc] = "Identifies user recipes that use an empty PARALLEL_MAKE variable that you want to force remote distributed compilation on using the Icecream distributed compile support."
 IMAGE_BASENAME[doc] = "The base name of image output files."
+IMAGE_BOOT_FILES[doc] = "Whitespace separated list of files from ${DEPLOY_DIR_IMAGE} to place in boot partition. Entries will be installed under a same name as the source file. To change the destination file name, pass a desired name after a semicolon (eg. u-boot.img;uboot)."
 IMAGE_CLASSES[doc] = "A list of classes that all images should inherit."
 IMAGE_FEATURES[doc] = "The primary list of features to include in an image. Configure this variable in an image recipe."
 IMAGE_FSTYPES[doc] = "Formats of root filesystem images that you want to have created."
-- 
1.9.0


