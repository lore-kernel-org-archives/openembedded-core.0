Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2F276FF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:36:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7F7a3Hx011685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 15 Aug 2016 00:36:04 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 15 Aug 2016 00:36:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 03:35:57 -0400
Message-ID: <faeb2b06075448d9a14faf6bc149582783531ad7.1471246475.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1471246474.git.hongxu.jia@windriver.com>
References: <cover.1471246474.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] man-pages: upgrade to 4.07
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
X-List-Received-Date: Mon, 15 Aug 2016 07:36:05 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_4.06.bb => man-pages_4.07.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.06.bb => man-pages_4.07.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.06.bb b/meta/recipes-extended/man-pages/man-pages_4.07.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.06.bb
rename to meta/recipes-extended/man-pages/man-pages_4.07.bb
index b61473c..76a3fd8 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.06.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.07.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "ab79fc245336ce0192548e7ccecd4ee6"
-SRC_URI[sha256sum] = "b377960eba7fcc7ea3a7070734a1627105a1ad15dd61ae5443ade863a06e9811"
+SRC_URI[md5sum] = "05ba1cb21e99d02bd7bc1a59378965d2"
+SRC_URI[sha256sum] = "c973351131931f7700f5e9fbf4ef366c43ea7c1515d282e8d5db9c77590c4c93"
 
 RDEPENDS_${PN} = "man"
 
-- 
2.8.1


