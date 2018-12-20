Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A198F6C474
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:35:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBKFYXbk002254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:35:10 -0800
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Dec 2018 07:35:00 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Dec 2018 10:34:54 -0500
Message-ID: <1545320094-21504-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] man-pages: use alternatives to resolve crypt.3 conflict
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
X-List-Received-Date: Thu, 20 Dec 2018 15:35:19 -0000
Content-Type: text/plain

From: mark asselstine <masselst@yow-cube2.wrs.com>

To fix:

  Error: Transaction check error:
    file /usr/share/man/man3/crypt.3 conflicts between attempted installs
    of libcrypt-doc-4.4.1-r0.core2_64 and man-pages-4.16-r0.core2_64

This issue came about after commit 59be9254df9f [libxcrypt: Upgrade to
4.4.1 release].

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-extended/man-pages/man-pages_4.16.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.16.bb b/meta/recipes-extended/man-pages/man-pages_4.16.bb
index a64587c..1f14c89 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.16.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.16.bb
@@ -31,6 +31,7 @@ FILES_${PN} = "${mandir}/*"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "passwd.5 getspnam.3"
+ALTERNATIVE_${PN} = "passwd.5 getspnam.3 crypt.3"
 ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
 ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
-- 
2.7.4


