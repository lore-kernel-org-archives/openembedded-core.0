Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.87.1587556990592476277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 05:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; 
   d="scan'208";a="89494543"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 20:03:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F92C4BCC883
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 19:52:32 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 20:03:07 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 20:03:15 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.10 -> 0.7.11
Date: Wed, 22 Apr 2020 13:02:55 -0700
Message-ID: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7F92C4BCC883.A2C1F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libsolv/{libsolv_0.7.10.bb => libsolv_0.7.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.10.bb => libsolv_0.7.11.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.11.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.7.10.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.11.bb
index 265a27c00d..764eb0df88 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.11.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "605dd2645ef899e2b7c95709476fb51e28d7e378"
+SRCREV = "102ac552669181d3e43731aa275bdbbc7ddcb94c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1



