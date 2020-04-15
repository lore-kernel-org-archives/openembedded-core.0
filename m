Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.6762.1586915560727218271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 18:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; 
   d="scan'208";a="89044115"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:52:44 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AEFBF406AB15
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 09:42:10 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:52:38 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Apr 2020 09:52:46 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ed: upgrade 1.15 -> 1.16
Date: Wed, 15 Apr 2020 01:33:38 -0700
Message-ID: <1586939618-29727-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586939618-29727-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586939618-29727-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: AEFBF406AB15.A566F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.15.bb => ed_1.16.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.15.bb => ed_1.16.bb} (71%)

diff --git a/meta/recipes-extended/ed/ed_1.15.bb b/meta/recipes-extended/ed/ed_1.16.bb
similarity index 71%
rename from meta/recipes-extended/ed/ed_1.15.bb
rename to meta/recipes-extended/ed/ed_1.16.bb
index 886c3ddcab..f383007b59 100644
--- a/meta/recipes-extended/ed/ed_1.15.bb
+++ b/meta/recipes-extended/ed/ed_1.16.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.gnu.org/software/ed/"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
-                    file://ed.h;endline=20;md5=8af8e7dc7275dca05ce6c9e7ece7aec8 \
-                    file://main.c;endline=17;md5=d4dd6a62c502712358ca18551f978781 \
+                    file://ed.h;endline=20;md5=0226a8dd88c76afba773f2f0f7c83f5e \
+                    file://main.c;endline=17;md5=ebd4aff86dc9fa5027d55bc5191746b9 \
                     "
 
 SECTION = "base"
@@ -18,8 +18,8 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[md5sum] = "d3aaeb5eb032142948d7a2f98a24899b"
-SRC_URI[sha256sum] = "ad4489c0ad7a108c514262da28e6c2a426946fb408a3977ef1ed34308bdfd174"
+SRC_URI[md5sum] = "ab480d982289064ca040bc5c75fceffd"
+SRC_URI[sha256sum] = "cfc07a14ab048a758473ce222e784fbf031485bcd54a76f74acfee1f390d8b2c"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.17.1



