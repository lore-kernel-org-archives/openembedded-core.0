Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7757B77E88
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w625lWgO000804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:32 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:12 +0800
Message-ID: <960a5ff0a2f88d4c613c7ec6e0363c7de307d3ea.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] libgcrypt: 1.8.2 -> 1.8.3
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:31 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgcrypt/{libgcrypt_1.8.2.bb => libgcrypt_1.8.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.2.bb => libgcrypt_1.8.3.bb} (92%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
index b36e653..44728a7 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
@@ -21,8 +21,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
 "
-SRC_URI[md5sum] = "cfb0b5c79eab07686b6898160a407139"
-SRC_URI[sha256sum] = "c8064cae7558144b13ef0eb87093412380efa16c4ee30ad12ecb54886a524c07"
+SRC_URI[md5sum] = "3139c2402e844985a67fb288a930534d"
+SRC_URI[sha256sum] = "66ec90be036747602f2b48f98312361a9180c97c68a690a5f376fa0f67d0af7c"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.7.4


