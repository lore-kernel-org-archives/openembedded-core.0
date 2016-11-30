Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id AD9BE71AEA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:50:47 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id D35B4B806E6; Wed, 30 Nov 2016 22:50:46 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 22:50:46 +0100
Message-Id: <1480542646-26954-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480542646-26954-1-git-send-email-obi@opendreambox.org>
References: <1480542646-26954-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] gptfdisk: put sgdisk into its own package
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

This allows to avoid pulling in ncurses if only sgdisk is needed.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
index d62a903..047aa97 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
@@ -23,4 +23,10 @@ do_install() {
     install -m 0755 fixparts ${D}${sbindir}
 }
 
+PACKAGES =+ "${PN}-sgdisk"
+
+RRECOMMENDS_${PN} = "${PN}-sgdisk"
+
+FILES_${PN}-sgdisk = "${sbindir}/sgdisk"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


