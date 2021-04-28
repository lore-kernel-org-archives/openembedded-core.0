Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.9240.1619600629347247547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ACmCnBa1lO4X8gBeCImLungqjBa1yeYIsi2QD?=
 =?us-ascii?q?101hICF9WObwra+Ttd4c0gL5jytUZWE4lbm7Sc69aF7V6JId2+gsFJi4Wg2Ogg?=
 =?us-ascii?q?aVBaFkqbDv2jjxXxD5n9Qtt5tIV4hbJJnOAUNhjcD8iTPId+oI5NWc6qiniaP/?=
 =?us-ascii?q?4h5WLT1CUK1r4wdnBgvzKCQfL2N7LKE0G5aG6s1MqyDIQwVzUu2AGnIHU+Lfzu?=
 =?us-ascii?q?ekqLvaZ3c9ayIP2U2liDOl76PCCB6I3hsSeCMn+8ZazUH11yjw5qCuqJiAu3zh?=
 =?us-ascii?q?/l6WyY9XltvnwsZCA8LJqvF9EESLti+YIL55U7nHhi08vf20gWxa7eXkklMxOd?=
 =?us-ascii?q?hp8XPNciWQqRvp4QPp1zEj8BbZuCSlqEqmscrkXyg7FsYEoYpYdyHS400msMo5?=
 =?us-ascii?q?/7lM2wuixuBqJCKFjCLg/MLJSh0vskK1pEApmekVg2cacaZ2Us4okbAi?=
X-IronPort-AV: E=Sophos;i="5.82,257,1613404800"; 
   d="scan'208";a="107669073"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Apr 2021 17:03:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E35814D0B891
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 17:03:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 17:03:40 +0800
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libjitterentropy: upgrade 3.0.1 -> 3.0.2
Date: Wed, 28 Apr 2021 17:02:48 +0800
Message-ID: <1619600568-22344-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619600568-22344-1-git-send-email-wangmy@fujitsu.com>
References: <1619600568-22344-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E35814D0B891.A4937
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libjitterentropy_3.0.1.bb => libjitterentropy_3.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.0.1.bb => libjitterentropy_3.0.2.bb} (95%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb
similarity index 95%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb
index 197bb787ac..8e39974ef3 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c69090e97c8fd6372d03099c0a5bc382 \
                     file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
-SRCREV = "747bf030b0ea9c44548b4e29bcfab7ae416675fc"
+SRCREV = "a0c51e21c2d4322681a320a22de5e2ef13c08196"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.25.1



