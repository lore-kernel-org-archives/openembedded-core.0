Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5369.1585792025118393837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363779"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:47:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3909049DF12A
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2020 09:36:46 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:47:04 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:47:12 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] elfutils: upgrade 0.178 -> 0.179
Date: Thu, 2 Apr 2020 02:16:57 -0700
Message-ID: <1585819019-28752-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3909049DF12A.A04FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../elfutils/{elfutils_0.178.bb => elfutils_0.179.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.178.bb => elfutils_0.179.bb} (97%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.178.bb b/meta/recipes-devtools/elfutils/elfutils_0.179.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.178.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.179.bb
index c500ae3c19..1da95ec1de 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.178.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.179.bb
@@ -40,8 +40,8 @@ SRC_URI_append_libc-musl = " \
            file://0003-musl-utils.patch \
            file://0004-Fix-error-on-musl.patch \
            "
-SRC_URI[md5sum] = "5480d0b7174446aba13a6adde107287f"
-SRC_URI[sha256sum] = "31e7a00e96d4e9c4bda452e1f2cdac4daf8abd24f5e154dee232131899f3a0f2"
+SRC_URI[md5sum] = "8ee56b371b5a7ea081284c44e5164600"
+SRC_URI[sha256sum] = "25a545566cbacaa37ae6222e58f1c48ea4570f53ba991886e2f5ce96e22a23a2"
 
 inherit autotools gettext ptest pkgconfig
 
-- 
2.17.1



