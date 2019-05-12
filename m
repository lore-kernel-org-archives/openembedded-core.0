Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC33F7E07D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:17:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4C8H5kQ018103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:17:06 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:17:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:22 +0800
Message-ID: <a8b0b93137089a0a8d470edc2a073c25f1f7573f.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] man-pages: upgrade 4.16 -> 5.01
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
X-List-Received-Date: Sun, 12 May 2019 08:17:06 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_4.16.bb => man-pages_5.01.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.16.bb => man-pages_5.01.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.16.bb b/meta/recipes-extended/man-pages/man-pages_5.01.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_4.16.bb
rename to meta/recipes-extended/man-pages/man-pages_5.01.bb
index 1f14c89..28525f4 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.16.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.01.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "d1fb8ba312a1c15e0bfda911a98c5544"
-SRC_URI[sha256sum] = "d38b0460bf3f35c95faf7f8cf52dac1216d86a47866f5e5f2fda88c61da04960"
+SRC_URI[md5sum] = "38abead776a506109e128ab96bcbbe58"
+SRC_URI[sha256sum] = "070bef794c6826b3fb3965d1a2efdb46c25cb37c06c715987f88a50906cd5b6f"
 
 inherit manpages
 
-- 
2.7.4


