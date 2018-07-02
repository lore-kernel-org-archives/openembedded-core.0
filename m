Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E68277E44
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w625lQWG022571
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:26 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:08 +0800
Message-ID: <b5b354ed2410f0ba7ff6298b1ead11d3252147f1.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] man-db: 2.8.2 -> 2.8.3
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:25 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/man-db/{man-db_2.8.2.bb => man-db_2.8.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.2.bb => man-db_2.8.3.bb} (90%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.2.bb b/meta/recipes-extended/man-db/man-db_2.8.3.bb
similarity index 90%
rename from meta/recipes-extended/man-db/man-db_2.8.2.bb
rename to meta/recipes-extended/man-db/man-db_2.8.3.bb
index 797f770..412e572 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
                     file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz"
-SRC_URI[md5sum] = "300788c0939a3b41d50302b04f730fa3"
-SRC_URI[sha256sum] = "45bdff87df888ddd93dc2a68abca91a2012d6e08333a8fc7c0dfefe9cbde0c5c"
+SRC_URI[md5sum] = "6f3055e18fdd1ce5cbbdb30403991ec7"
+SRC_URI[sha256sum] = "5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac"
 
 DEPENDS = "libpipeline gdbm groff-native"
 
-- 
2.7.4


