Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id B1CF26AC00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 06:16:08 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 6c63_74e2_cdbf6e17_d6f5_4a5f_9c41_23a9f06594da;
	Wed, 03 Aug 2016 15:16:05 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id D6675AC00D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 15:16:04 +0900 (JST)
Received: from g01jpexchyt38.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	2655558421B for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 15:16:04 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt38.g01.fujitsu.local (10.128.193.68) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 3 Aug 2016 15:16:03 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2016 15:16:40 +0900
Message-ID: <1470205000-6321-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] curl: upgrade to 7.50.0
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
X-List-Received-Date: Wed, 03 Aug 2016 06:16:10 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.49.1.bb => curl_7.50.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.49.1.bb => curl_7.50.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.49.1.bb b/meta/recipes-support/curl/curl_7.50.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.49.1.bb
rename to meta/recipes-support/curl/curl_7.50.0.bb
index db9dc1a..6a5be25 100644
--- a/meta/recipes-support/curl/curl_7.49.1.bb
+++ b/meta/recipes-support/curl/curl_7.50.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6bb1f7af5b58b30e4e6414b8c1abccab"
-SRC_URI[sha256sum] = "eb63cec4bef692eab9db459033f409533e6d10e20942f4b060b32819e81885f1"
+SRC_URI[md5sum] = "9e463ff8fdc1b5daa81c850c514980ec"
+SRC_URI[sha256sum] = "608dfe2db77f48db792c387e7791aca55a25f0b42385707ad927164199ecfa9a"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.7.4


