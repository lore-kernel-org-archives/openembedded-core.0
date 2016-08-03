Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 81FD773211
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 07:52:44 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 4282_1928_1cba6d30_e3d1_4dfe_ba94_6ea5dc44b0a5;
	Wed, 03 Aug 2016 16:52:40 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 19082AC0054
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 16:52:40 +0900 (JST)
Received: from g01jpexchkw37.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	744AF32849D for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 16:52:39 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw37.g01.fujitsu.local (10.0.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 3 Aug 2016 16:52:39 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2016 16:53:17 +0900
Message-ID: <1470210797-7056-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] libgcrypt: upgrade to 1.7.2
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
X-List-Received-Date: Wed, 03 Aug 2016 07:52:47 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../libgcrypt/{libgcrypt_1.7.0.bb => libgcrypt_1.7.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.7.0.bb => libgcrypt_1.7.2.bb} (14%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb
similarity index 14%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb
index 37637f6..8931d18 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb
@@ -1,4 +1,4 @@
 require libgcrypt.inc
 
-SRC_URI[md5sum] = "0a4d2d94b69832c780599f38280b2450"
-SRC_URI[sha256sum] = "07f88053ac9f7cfd35c2d404954b1e370818b757fd202ef2a5d4f398c11b7b06"
+SRC_URI[md5sum] = "b28de2eaf8fc0c916c76ab67be5a3790"
+SRC_URI[sha256sum] = "70c8e439420823505b39addbf51c469ef0df5a1372fa1d7d33ec9261079d08e2"
-- 
2.7.4


