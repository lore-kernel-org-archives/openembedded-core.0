Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 996B57268B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 05:10:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBN5A9Dc006365
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:10:09 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Dec 2014 21:10:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Dec 2014 13:09:57 +0800
Message-ID: <4edb9a1fd93002151829840bdc29f88ebc7d39da.1419309149.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419309149.git.hongxu.jia@windriver.com>
References: <cover.1419309149.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] pax-utils: upgrade to 0.9.2
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
X-List-Received-Date: Tue, 23 Dec 2014 05:10:08 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../pax-utils/{pax-utils_0.8.1.bb => pax-utils_0.9.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.8.1.bb => pax-utils_0.9.2.bb} (83%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
similarity index 83%
rename from meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
index 79e58ba..ac14306 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bc42279c5aff3682c12be40f72805cec"
-SRC_URI[sha256sum] = "844ff25b1a11bcef92ef34b22f576f226a772b67196818656f8874513438f5b9"
+SRC_URI[md5sum] = "34c41888cec67759c21333bef13e950c"
+SRC_URI[sha256sum] = "578801df0661b1b7b8fed0ce4a9859239f919fd37529907681e51091a1bcb4de"
 
 RDEPENDS_${PN} += "bash"
 
-- 
1.9.1


