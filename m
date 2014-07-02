Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 97BB365D33
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 11:25:47 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 2 Jul 2014
	13:25:39 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 5143D288F30;
	Wed,  2 Jul 2014 13:25:39 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 13:25:30 +0200
Message-ID: <1404300330-4094-2-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404300330-4094-1-git-send-email-maxin.john@enea.com>
References: <1404300330-4094-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 2/2] libtasn1: update to 4.0
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
X-List-Received-Date: Wed, 02 Jul 2014 11:25:48 -0000
Content-Type: text/plain

Bump version to 4.0

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/gnutls/{libtasn1_3.5.bb => libtasn1_4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_3.5.bb => libtasn1_4.0.bb} (82%)

diff --git a/meta/recipes-support/gnutls/libtasn1_3.5.bb b/meta/recipes-support/gnutls/libtasn1_4.0.bb
similarity index 82%
rename from meta/recipes-support/gnutls/libtasn1_3.5.bb
rename to meta/recipes-support/gnutls/libtasn1_4.0.bb
index 0c0ebcd..289833ec 100644
--- a/meta/recipes-support/gnutls/libtasn1_3.5.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "62c76352d0e17df1c082fe1c38bad5cf"
-SRC_URI[sha256sum] = "d7fcffbc08b6413533b817d4ede5c2eadcb3dcb21c71cc91de6ece25191519ed"
+SRC_URI[md5sum] = "d3d2d9bce3b6668b9827a9df52635be1"
+SRC_URI[sha256sum] = "41d044f7644bdd1c4f8a5c15ac1885ca1fcbf32f5f6dd4760a19278b979857fe"
 
 inherit autotools texinfo binconfig lib_package
 
-- 
1.9.1


