Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70EB271DAE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:46:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v196k6ki003964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Feb 2017 22:46:06 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:46:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:42 -0500
Message-ID: <08c95f9518225eaf0204710cfd0147a9ee4773f1.1486622007.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 09/13] libgpg-error: 1.25 -> 1.26
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
X-List-Received-Date: Thu, 09 Feb 2017 06:46:07 -0000
Content-Type: text/plain

- errorref.txt is part of the documentation so should be in PN-doc.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgpg-error/{libgpg-error_1.25.bb => libgpg-error_1.26.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.25.bb => libgpg-error_1.26.bb} (89%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
similarity index 89%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
index d4ce224..87c4f51 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
 
-SRC_URI[md5sum] = "d9fa545922a5060cbfbd87464bc31686"
-SRC_URI[sha256sum] = "f628f75843433b38b05af248121beb7db5bd54bb2106f384edac39934261320c"
+SRC_URI[md5sum] = "97456709dbbcbb69354317ffe3e347cd"
+SRC_URI[sha256sum] = "4c4bcbc90116932e3acd37b37812d8653b1b189c1904985898e860af818aee69"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
@@ -50,5 +50,6 @@ do_install_append() {
 }
 
 FILES_${PN}-dev += "${bindir}/gpg-error"
+FILES_${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


