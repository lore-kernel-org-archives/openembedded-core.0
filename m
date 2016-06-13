Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C088E6FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D9GqNU026866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 02:16:52 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:33 -0400
Message-ID: <332b77edeb669aa776a5313ef0e71de21350de06.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] man-pages: upgrade to 4.06
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:51 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_4.04.bb => man-pages_4.06.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.04.bb => man-pages_4.06.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.04.bb b/meta/recipes-extended/man-pages/man-pages_4.06.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.04.bb
rename to meta/recipes-extended/man-pages/man-pages_4.06.bb
index 65df0aa..b61473c 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.04.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.06.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "901cd52e0ee2a9d7508ae1ab15d5e835"
-SRC_URI[sha256sum] = "bff072462baea8d1b8e4568759324c5ed6c760716fe830bca71129cc09e00668"
+SRC_URI[md5sum] = "ab79fc245336ce0192548e7ccecd4ee6"
+SRC_URI[sha256sum] = "b377960eba7fcc7ea3a7070734a1627105a1ad15dd61ae5443ade863a06e9811"
 
 RDEPENDS_${PN} = "man"
 
-- 
2.8.1


