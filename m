Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 038F371AED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:50:47 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id ABECAB81F65; Wed, 30 Nov 2016 22:50:46 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 22:50:45 +0100
Message-Id: <1480542646-26954-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] gptfdisk: fix support for 'large' drives
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
X-List-Received-Date: Wed, 30 Nov 2016 21:50:48 -0000

Make's switch '-e' replaced important compiler flags from the
project's Makefile, i.e. -D_FILE_OFFSET_BITS=64.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
index 8fab28f..d62a903 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "864c8aee2efdda50346804d7e6230407d5f42a8ae754df70404dd8b2fd
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "'CC=${CC}' 'CXX=${CXX}'"
 
 do_install() {
     install -d ${D}${sbindir}
-- 
2.7.4


