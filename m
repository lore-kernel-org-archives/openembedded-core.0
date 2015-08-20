Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BBDF065CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:11:55 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 20 Aug 2015 13:11:52 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 9C1C128BA20;
	Thu, 20 Aug 2015 13:11:52 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Aug 2015 13:11:27 +0200
Message-ID: <1440069087-10139-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] man-pages: update to 4.02
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
X-List-Received-Date: Thu, 20 Aug 2015 11:11:59 -0000
Content-Type: text/plain

4.01 -> 4.02

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../man-pages/{man-pages_4.01.bb => man-pages_4.02.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.01.bb => man-pages_4.02.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.01.bb b/meta/recipes-extended/man-pages/man-pages_4.02.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.01.bb
rename to meta/recipes-extended/man-pages/man-pages_4.02.bb
index f6a5c49..1b90a44 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.02.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "575f4e8920166b1433c329bb621819d1"
-SRC_URI[sha256sum] = "ba89f3453982fae6c699a877368d51ee27883b4de709e753eee3783b447a8381"
+SRC_URI[md5sum] = "93df3279798a3345bb2c709584c83639"
+SRC_URI[sha256sum] = "42324f9ed47c89a43cb37b6bb0d5fbcad44838eee45cd394e181c98d038c49ff"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.9.1


