Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D07171AFF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:44:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB71ihpe012898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2016 17:44:43 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Dec 2016 17:44:43 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:45:37 +0800
Message-ID: <e84742f21c96d0083db38ebe6cd9ac946e1fd952.1481075044.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1481075044.git.Qi.Chen@windriver.com>
References: <cover.1481075044.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libarchive: fix ALTERNATIVE_PRIORITY to avoid conflict
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
X-List-Received-Date: Wed, 07 Dec 2016 01:44:43 -0000
Content-Type: text/plain

'tar' utility from tar and bsdtar has the same alternative priority.
'cpio' utility from cpio and bsdcpio has the same alternative priority.

Lower the ALTERNATIVE_PRIORITY to avoid conflict.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/libarchive/libarchive_3.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
index cf66e9d..7917ce7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
@@ -48,7 +48,7 @@ do_configure_prepend() {
 	cp -R ${STAGING_INCDIR_NATIVE}/ext2fs ${WORKDIR}/extra-includes/
 }
 
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "80"
 
 PACKAGES =+ "bsdtar"
 FILES_bsdtar = "${bindir}/bsdtar"
-- 
1.9.1


