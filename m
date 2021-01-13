Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.5348.1610526745128739404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 00:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; 
   d="scan'208";a="103437399"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 16:32:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 24B7F4CE4B3E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 16:32:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 16:32:07 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ed: upgrade 1.16 -> 1.17
Date: Wed, 13 Jan 2021 16:32:01 +0800
Message-ID: <1610526721-21345-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 24B7F4CE4B3E.A3981
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.16.bb => ed_1.17.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.16.bb => ed_1.17.bb} (71%)

diff --git a/meta/recipes-extended/ed/ed_1.16.bb b/meta/recipes-extended/ed/ed_1.17.bb
similarity index 71%
rename from meta/recipes-extended/ed/ed_1.16.bb
rename to meta/recipes-extended/ed/ed_1.17.bb
index f383007b59..50d86c8853 100644
--- a/meta/recipes-extended/ed/ed_1.16.bb
+++ b/meta/recipes-extended/ed/ed_1.17.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.gnu.org/software/ed/"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
-                    file://ed.h;endline=20;md5=0226a8dd88c76afba773f2f0f7c83f5e \
-                    file://main.c;endline=17;md5=ebd4aff86dc9fa5027d55bc5191746b9 \
+                    file://ed.h;endline=20;md5=b72aa5eaafef318c6bfc37f858469113 \
+                    file://main.c;endline=17;md5=2c93e24f4db3528a00a24c7df5618e41 \
                     "
 
 SECTION = "base"
@@ -18,8 +18,8 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[md5sum] = "ab480d982289064ca040bc5c75fceffd"
-SRC_URI[sha256sum] = "cfc07a14ab048a758473ce222e784fbf031485bcd54a76f74acfee1f390d8b2c"
+SRC_URI[md5sum] = "894748c9bbf35cb7c599f5317b1a8cdb"
+SRC_URI[sha256sum] = "71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.25.1



