Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2A56FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 09:23:10 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 4fdb_2d32_cc15a715_ba97_44ff_a5b0_4285604f0d17;
	Mon, 14 Dec 2015 18:23:06 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 427A0AC022F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:23:06 +0900 (JST)
Received: from g01jpexchkw36.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	8F489BD656D for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:23:05 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw36.g01.fujitsu.local (10.0.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 14 Dec 2015 18:23:05 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 18:24:12 +0900
Message-ID: <1450085052-20113-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] wget: Upgrade 1.16.3 -> 1.17
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
X-List-Received-Date: Mon, 14 Dec 2015 09:23:14 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/wget/{wget_1.16.3.bb => wget_1.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.16.3.bb => wget_1.17.bb} (58%)

diff --git a/meta/recipes-extended/wget/wget_1.16.3.bb b/meta/recipes-extended/wget/wget_1.17.bb
similarity index 58%
rename from meta/recipes-extended/wget/wget_1.16.3.bb
rename to meta/recipes-extended/wget/wget_1.17.bb
index 5c34a42..10434d3 100644
--- a/meta/recipes-extended/wget/wget_1.16.3.bb
+++ b/meta/recipes-extended/wget/wget_1.17.bb
@@ -3,7 +3,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "f61d9011b99f824106a5d5a05dd0f63d"
-SRC_URI[sha256sum] = "9f1c6d09d7148c1c2d9fd0ea655dcf4dcc407deb2db32d4126251ca0245cb670"
+SRC_URI[md5sum] = "c4c4727766f24ac716936275014a0536"
+SRC_URI[sha256sum] = "3e04ad027c5b6ebd67c616eec13e66fbedb3d4d8cbe19cc29dadde44b92bda55"
 
 require wget.inc
-- 
1.8.4.2


