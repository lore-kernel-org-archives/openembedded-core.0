Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 225F870100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 05:54:09 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 4c71_366b_05cb3d44_103f_4eea_ac6a_1d71013bae2a;
	Wed, 07 Jun 2017 14:54:07 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F649AC0092
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:54:07 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	49B9746E6D6 for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:54:06 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 7 Jun 2017 14:54:05 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jun 2017 14:55:26 +0900
Message-ID: <1496814926-25024-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] hdparm: Upgrade to 9.52
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
X-List-Received-Date: Wed, 07 Jun 2017 05:54:10 -0000
Content-Type: text/plain

1. Upgrade hdparm from 9.51 to 9.52

2. Update the checksum of LIC_FILES_CHKSUM
   The following content is appended to LICENSE.TXT, the licence is still BSD & GPLv2.

       The apt.c file is  Copyright (c) 2009 Jan Friesse <jfriesse@gmail.com>.
       You may use/distribute apt.c freely, under the terms of either
       (your choice) the GNU General Public License version 2,
       or a BSD style license.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.51.bb => hdparm_9.52.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.51.bb => hdparm_9.52.bb} (83%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.51.bb b/meta/recipes-extended/hdparm/hdparm_9.52.bb
similarity index 83%
rename from meta/recipes-extended/hdparm/hdparm_9.51.bb
rename to meta/recipes-extended/hdparm/hdparm_9.52.bb
index fa00927..599cd30 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.51.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.52.bb
@@ -8,7 +8,7 @@ LICENSE_${PN} = "BSD"
 LICENSE_${PN}-dbg = "BSD"
 LICENSE_wiper = "GPLv2"
 
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=495d03e50dc6c89d6a30107ab0df5b03 \
                     file://debian/copyright;md5=a82d7ba3ade9e8ec902749db98c592f3 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
                     file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
@@ -22,8 +22,8 @@ RDEPENDS_wiper = "bash gawk stat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "8fe0a71db02f7ffc602d14a69f766cff"
-SRC_URI[sha256sum] = "1afad8891ecbe644c283f7d725157660ebf8bd5b4d9d67232afd45f83d2d5d91"
+SRC_URI[md5sum] = "410539d0bf3cc247181594581edbfb53"
+SRC_URI[sha256sum] = "c3429cd423e271fa565bf584598fd751dd2e773bb7199a592b06b5a61cec4fb6"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
1.9.1


