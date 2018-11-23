Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7358E6C694
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:31:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAN7UkoQ023407
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 23:30:56 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 23:30:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 15:47:22 +0800
Message-ID: <fae0cb1d7ed9ea08f98762a2329e422513699032.1542959097.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542959097.git.hongxu.jia@windriver.com>
References: <cover.1542959097.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libgcrypt: upgrade 1.8.3 -> 1.8.4
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
X-List-Received-Date: Fri, 23 Nov 2018 07:31:05 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgcrypt/{libgcrypt_1.8.3.bb => libgcrypt_1.8.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.3.bb => libgcrypt_1.8.4.bb} (93%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
similarity index 93%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
index cefa836..fda68a2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
@@ -22,8 +22,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
 "
-SRC_URI[md5sum] = "3139c2402e844985a67fb288a930534d"
-SRC_URI[sha256sum] = "66ec90be036747602f2b48f98312361a9180c97c68a690a5f376fa0f67d0af7c"
+SRC_URI[md5sum] = "fbfdaebbbc6d7e5fbbf6ffdb3e139573"
+SRC_URI[sha256sum] = "f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.7.4


