Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E939B73D23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOYOY026739
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:30 -0700
Message-ID: <41846402c06843f9a70c1ed99b68e167f3c88e91.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] man-pages: 3.76 -> 3.82
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:34 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{man-pages_3.76.bb => man-pages_3.82.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.76.bb => man-pages_3.82.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.76.bb b/meta/recipes-extended/man-pages/man-pages_3.82.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_3.76.bb
rename to meta/recipes-extended/man-pages/man-pages_3.82.bb
index ed8a15f..7c1a7dc 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.76.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.82.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "d00cf09677caefc3e827737afc565583"
-SRC_URI[sha256sum] = "eff558c13b61a46136994514b3ec00a74dcf00414d3bde4f0edca80a36d36359"
+SRC_URI[md5sum] = "ce4bffb9982d197bf35b59d0a12453ca"
+SRC_URI[sha256sum] = "9c22781f485d00e6b258dcaaf1efd220fee9f8d4ce59cd881b062be06be5efe8"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.9.5


