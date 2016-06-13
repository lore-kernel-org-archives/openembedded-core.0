Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECCAE6FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D9GrXb019348
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 02:16:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:34 -0400
Message-ID: <57412d939b4a054eced8491e2cb7afc30d2c64b1.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] pax-utils: upgrade to 1.1.6
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:53 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../pax-utils/{pax-utils_1.1.5.bb => pax-utils_1.1.6.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.5.bb => pax-utils_1.1.6.bb} (89%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
similarity index 89%
rename from meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
index a887c03..5cc5463 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "bc3614322eaf88f167a608ae85d6b207"
-SRC_URI[sha256sum] = "2945b3e4df2e0dc95800bfbd3d88ab2243b2ee4ff064bbfc75734f6d9d986a89"
+SRC_URI[md5sum] = "96f56a5a10ed50f2448c5ccebd27764f"
+SRC_URI[sha256sum] = "f5436c517bea40f7035ec29a6f34034c739b943f2e3a080d76df5dfd7fd41b12"
 
 RDEPENDS_${PN} += "bash"
 
-- 
2.8.1


