Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6181877E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w625lTUi028349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:29 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:10 +0800
Message-ID: <f9bfd3dd250b26c62e1666bda50ffc6e47ff079b.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] man-pages: 4.14 -> 4.16
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:28 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_4.14.bb => man-pages_4.16.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.14.bb => man-pages_4.16.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.14.bb b/meta/recipes-extended/man-pages/man-pages_4.16.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_4.14.bb
rename to meta/recipes-extended/man-pages/man-pages_4.16.bb
index 4ce0b13..0fa124f 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.14.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.16.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "82bd2d05c4d0dba5e7a90d39c9555197"
-SRC_URI[sha256sum] = "aeebc6b09a11e7f7bbc98f3984fe8b8b2bde9d2f5f9dcbd4348a9e0d93704238"
+SRC_URI[md5sum] = "d1fb8ba312a1c15e0bfda911a98c5544"
+SRC_URI[sha256sum] = "d38b0460bf3f35c95faf7f8cf52dac1216d86a47866f5e5f2fda88c61da04960"
 
 inherit manpages
 
-- 
2.7.4


