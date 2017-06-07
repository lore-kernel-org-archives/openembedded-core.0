Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 2612A71BA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 04:58:49 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 4e57_2730_0ec4f7c1_317d_4892_af91_5ead65e0a460;
	Wed, 07 Jun 2017 13:58:41 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id D0981AC007F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 13:58:40 +0900 (JST)
Received: from G01JPEXCHKW15.g01.fujitsu.local
	(G01JPEXCHKW15.g01.fujitsu.local [10.0.194.54])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	C5CB932848E for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 13:58:39 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW15.g01.fujitsu.local (10.0.194.54) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 7 Jun 2017 13:58:40 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jun 2017 14:00:00 +0900
Message-ID: <1496811600-24484-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] man-pages: Upgrade to 4.11
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
X-List-Received-Date: Wed, 07 Jun 2017 04:58:50 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../man-pages/{man-pages_4.10.bb => man-pages_4.11.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.10.bb => man-pages_4.11.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.10.bb b/meta/recipes-extended/man-pages/man-pages_4.11.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.10.bb
rename to meta/recipes-extended/man-pages/man-pages_4.11.bb
index de8d3b9..a3077a9 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.10.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.11.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "fa03cff75c7cee5a0fd5db3456aea43a"
-SRC_URI[sha256sum] = "5995444d589a1ab83ae1220a4446ee09b3dadb6ce7037162ea75874ebcb2c040"
+SRC_URI[md5sum] = "408300ed09d1ad5938070158b21da1d1"
+SRC_URI[sha256sum] = "e6db91a24e68c7c765b7b8e60f1591ed1049bc2dc3143db779eae4838b89d195"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.9.1


