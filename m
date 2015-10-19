Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.com [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8F242770B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:17:42 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id BC6C1A00491
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:17:53 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101910173681-42259 ;
	Mon, 19 Oct 2015 10:17:36 +0200 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 10:15:37 +0200
Message-Id: <1445242541-41638-4-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 10:17:37,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 10:17:37,
	Serialize complete at 19.10.2015 10:17:37
Subject: [PATCH 3/7] linux-dtb.inc: remove unneeded 'cd'
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
X-List-Received-Date: Mon, 19 Oct 2015 08:17:42 -0000

Signed-off-by: Stefan Christ <s.christ@phytec.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index d73792a..0095155 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -51,9 +51,7 @@ do_deploy_append() {
 			fi
 			install -d ${DEPLOYDIR}
 			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
-			cd ${DEPLOYDIR}
-			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
-			cd -
+			ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
 }
-- 
1.9.1


