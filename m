Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id D28007813F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 05:19:13 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 4b46_61b6_ab863296_de04_4847_a901_19b2db7a0f07;
	Wed, 07 Jun 2017 14:19:10 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B496AC00F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:19:10 +0900 (JST)
Received: from g01jpexchyt36.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	59B216D66DF for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:19:09 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt36.g01.fujitsu.local (10.128.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 7 Jun 2017 14:19:09 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jun 2017 14:20:30 +0900
Message-ID: <1496812830-24761-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] pciutils: Upgrade to 3.5.4
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
X-List-Received-Date: Wed, 07 Jun 2017 05:19:14 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.5.2.bb => pciutils_3.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.5.2.bb => pciutils_3.5.4.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
index 9a7297e..d387fba 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
@@ -13,8 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "1bf5b068bd9f7512e8c68b060b25a1b2"
-SRC_URI[sha256sum] = "3a99141a9f40528d0a0035665a06dc37ddb1ae341658e51b50a76ecf86235efc"
+SRC_URI[md5sum] = "e82537cd2194111c45fa7e684b52252e"
+SRC_URI[sha256sum] = "64293c6ab9318c40ef262b76d87bd9097531759752bac556e50979b1e63cfe66"
 
 inherit multilib_header
 
-- 
1.9.1


