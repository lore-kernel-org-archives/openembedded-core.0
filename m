Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 506337214C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 05:17:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAP5HJuj012930
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 24 Nov 2014 21:17:19 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 24 Nov 2014 21:17:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 13:17:14 +0800
Message-ID: <66eb2a74f6aa0b69691242d897df69937414a22b.1416892577.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416892577.git.hongxu.jia@windriver.com>
References: <cover.1416892577.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cracklib: upgrade to 2.9.2
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
X-List-Received-Date: Tue, 25 Nov 2014 05:17:25 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../cracklib/{cracklib_2.9.1.bb => cracklib_2.9.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.1.bb => cracklib_2.9.2.bb} (84%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb b/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
similarity index 84%
rename from meta/recipes-extended/cracklib/cracklib_2.9.1.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.2.bb
index 99ccde3..b66ca54 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
@@ -13,8 +13,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
-SRC_URI[md5sum] = "90536219c520add2ceb3c26f0d7da404"
-SRC_URI[sha256sum] = "408905c2539a97dc8cbbb6d7cd2046cb5647a345b4bda399220d9471be16d156"
+SRC_URI[md5sum] = "559072fdfc095cdb763c4de3471a889e"
+SRC_URI[sha256sum] = "c1c899291d443e99d1aecfbc879e4ac9c0cbc265574f47b487842da11e9759f5"
 
 inherit autotools-brokensep gettext
 
-- 
1.9.1


