Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 2151 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 May 2017 16:04:35 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 1103260721
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 16:04:35 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v43FSifd004320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 May 2017 17:28:44 +0200
Received: from dev.sbt.siemens.com ([139.16.73.94])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v43FSi3X021400;
	Wed, 3 May 2017 17:28:44 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 17:28:40 +0200
Message-Id: <1493825320-356-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image.bbclass: allow override of image LICENSE
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
X-List-Received-Date: Wed, 03 May 2017 16:04:36 -0000

Currently the LICENSE of every image is hard set to MIT.
This allows this to be overriden in derived images.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..0fc8752 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -9,7 +9,7 @@ TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
 
-LICENSE = "MIT"
+LICENSE ?= "MIT"
 PACKAGES = ""
 DEPENDS += "${MLPREFIX}qemuwrapper-cross depmodwrapper-cross"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
-- 
2.1.4


