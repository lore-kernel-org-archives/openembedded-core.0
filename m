Return-Path: <j.remmet@phytec.de>
Received: from root.phytec.de (mail.tricorecenter.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 23A276013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 14:24:11 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id C1528A00310
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 16:25:23 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016070716241054-63645 ;
	Thu, 7 Jul 2016 16:24:10 +0200 
From: Jan Remmet <j.remmet@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 7 Jul 2016 16:21:44 +0200
Message-Id: <1467901304-46789-1-git-send-email-j.remmet@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 07.07.2016 16:24:10,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 07.07.2016 16:24:10,
	Serialize complete at 07.07.2016 16:24:10
X-TNEFEvaluated: 1
Subject: [PATCH] mtd-utils: build also for nativesdk
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
X-List-Received-Date: Thu, 07 Jul 2016 14:24:14 -0000

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index cd9ae06..8a3afaf 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -39,7 +39,7 @@ FILES_mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/j
 FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
 FILES_mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # git/.compr.c.dep:46: warning: NUL character seen; rest of line ignored
 # git/.compr.c.dep:47: *** missing separator.  Stop.
-- 
1.9.1


