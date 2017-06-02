Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id C041477794
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:58:15 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym03.jp.fujitsu.com with smtp
	id 1b7d_d406_26e33cd2_e4ff_4941_a9d2_7a05ff55bd80;
	Fri, 02 Jun 2017 15:58:11 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id C17F8AC01C7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:58:10 +0900 (JST)
Received: from G01JPEXCHYT17.g01.fujitsu.local
	(G01JPEXCHYT17.g01.fujitsu.local [10.128.194.56])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	B878046E55E for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:58:09 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT17.g01.fujitsu.local (10.128.194.56) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 2 Jun 2017 15:58:09 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Jun 2017 15:59:27 +0900
Message-ID: <1496386767-20989-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] lzip: Upgrade 1.18 -> 1.19
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
X-List-Received-Date: Fri, 02 Jun 2017 06:58:17 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/lzip/{lzip_1.18.bb => lzip_1.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.18.bb => lzip_1.19.bb} (88%)

diff --git a/meta/recipes-extended/lzip/lzip_1.18.bb b/meta/recipes-extended/lzip/lzip_1.19.bb
similarity index 88%
rename from meta/recipes-extended/lzip/lzip_1.18.bb
rename to meta/recipes-extended/lzip/lzip_1.19.bb
index c1dc8ce..099b364 100644
--- a/meta/recipes-extended/lzip/lzip_1.18.bb
+++ b/meta/recipes-extended/lzip/lzip_1.19.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3838567460ce4a10143de4bccc64fe1c"
-SRC_URI[sha256sum] = "47f9882a104ab05532f467a7b8f4ddbb898fa2f1e8d9d468556d6c2d04db14dd"
+SRC_URI[md5sum] = "4dd8790d7528440d034fc713a8680bd3"
+SRC_URI[sha256sum] = "ffadc4f56be1bc0d3ae155ec4527bd003133bdc703a753b2cc683f610e646ba9"
 
 CONFIGUREOPTS = "\
     '--srcdir=${S}' \
-- 
1.9.1


