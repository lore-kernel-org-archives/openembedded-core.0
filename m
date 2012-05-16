Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SUT8p-0007Lr-WC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 03:35:04 +0200
Received: by obhx4 with SMTP id x4so339857obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 18:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=faqAKkcnozJhsYVgBycRQE/DZsSeF0soTVPDoJHO3r8=;
	b=moL8TGMuX7WZD+cj5x+IADgjUYrTwkcxUCk+onlaHD3PR3EOfvuICXccX85aEQ7Nv/
	qWwoqqzu8ri+VEmAWRubznI3bu1kfYoesqnr7Km4tw1y/WkL8ph2KHEN3w5YcTcIxNbD
	AUcbldezCNUYBTOvl3lGYCveA3aCDUQ+TozXqPKQuDeu20QEhKkVtdOPCjZDminpGssd
	4/HVX/K5AMWssa8FRpQKkyTM6PhA9wsC9WgGX1L7+K+mHNdfVM3MZaLFhX2gDm6aKw/b
	RZJSmG71LB2InMnPn9obCNbc5SpRFTXgCRUX3+OMtT3un2qMWwp6yU3rF94rmamji2JR
	eXTA==
Received: by 10.182.167.104 with SMTP id zn8mr951595obb.62.1337131502673;
	Tue, 15 May 2012 18:25:02 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id a6sm767488oeg.7.2012.05.15.18.25.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 18:25:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2012 20:25:23 -0500
Message-Id: <1337131523-8176-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 01:35:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

It's common to provide a non-machine-suffixed link in DEPLOY_DIR_IMAGE, so
let's be consistent and do so here as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a85f130..90af597 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -538,6 +538,7 @@ kernel_do_deploy() {
 	cd ${DEPLOYDIR}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 }
-- 
1.7.7



