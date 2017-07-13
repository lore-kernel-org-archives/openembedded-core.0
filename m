Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id E090A78195
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 08:33:23 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 4cb7_5ce5_7505894f_c161_4abc_81cf_fc0c403ceb4d;
	Thu, 13 Jul 2017 17:33:21 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id DBFFEAC0106
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 17:33:20 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
	(G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	9BC96BD6494 for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 17:33:19 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 13 Jul 2017 17:33:17 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jul 2017 17:34:51 +0900
Message-ID: <1499934891-19201-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] apr: 1.5.2 -> 1.6.2
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
X-List-Received-Date: Thu, 13 Jul 2017 08:33:24 -0000
Content-Type: text/plain

Update apr from 1.5.2 to 1.6.2

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-support/apr/{apr_1.5.2.bb => apr_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr_1.5.2.bb => apr_1.6.2.bb} (96%)

diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.6.2.bb
similarity index 96%
rename from meta/recipes-support/apr/apr_1.5.2.bb
rename to meta/recipes-support/apr/apr_1.6.2.bb
index 992b561..e2eed53 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.6.2.bb
@@ -21,8 +21,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
 "
 
-SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
-SRC_URI[sha256sum] = "7d03ed29c22a7152be45b8e50431063736df9e1daa1ddf93f6a547ba7a28f67a"
+SRC_URI[md5sum] = "e81a851967c79b5ce9bfbc909e4bf735"
+SRC_URI[sha256sum] = "09109cea377bab0028bba19a92b5b0e89603df9eab05c0f7dbd4dd83d48dcebd"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest
 
-- 
2.7.4



