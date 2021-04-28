Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9051.1619600493377712927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 02:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AJEL8YKnx57yKAic9ktKTakq5cgDpDfMzimdD?=
 =?us-ascii?q?5ilNYBxZY6WkvuqF9c516TbfjjENVHY83e2RIaXoewK6ybdZ6ZQcVI3CYCDIo2?=
 =?us-ascii?q?2tRbsO0aLDxHnaFzT65qph085bAspDIfnRKXQ/ssrg+gm/FL8bsb262YSln/3X?=
 =?us-ascii?q?wXsobSwCUcFdxjx0AAqaDUF6LTMubfFSKLOm6sVKvDamc3gMB/7LY0UtZfTJpN?=
 =?us-ascii?q?HAifvdDyIuOhhP0mWzpALtwrv7Hx+E5wwZQjNCzJwzmFK16jDR1+GGu/G/xgS0?=
 =?us-ascii?q?7R6x071m3P37ytVCA8SQis8abhXU4zzYArhJavm5pTgw5Nuz4Es3irD30modFv?=
 =?us-ascii?q?U2+3XMZXu0vBeo/wHh1Qwl43jkxUTwuwqZneXJACI9F9FahZ9UNj/Q608bttl6?=
 =?us-ascii?q?165Rm02DsZ4/N2K7oA3No8jPSwpxlle55V4rkesohXRZVocELJ99xLZvhH9oLA?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,257,1613404800"; 
   d="scan'208";a="107669002"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Apr 2021 17:01:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 972D64D0B8AA
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 17:01:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 17:01:19 +0800
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] hdparm: upgrade 9.60 -> 9.61
Date: Wed, 28 Apr 2021 16:59:32 +0800
Message-ID: <1619600372-22241-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619600372-22241-1-git-send-email-wangmy@fujitsu.com>
References: <1619600372-22241-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 972D64D0B8AA.A8181
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hdparm/{hdparm_9.60.bb => hdparm_9.61.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.60.bb => hdparm_9.61.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.60.bb b/meta/recipes-extended/hdparm/hdparm_9.61.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.60.bb
rename to meta/recipes-extended/hdparm/hdparm_9.61.bb
index 41f70b403f..459a62a833 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.60.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.61.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "25a791d47236c58801f8b27074f3ef93"
-SRC_URI[sha256sum] = "8397739c73e44d5ab96c4aef28fa9c0147276d53a1b5657ce04c4565cf6635cc"
+SRC_URI[md5sum] = "3ef06831e83890f0ba48f7a252b93325"
+SRC_URI[sha256sum] = "da1a1c3887f10b8397e8e02013caa61142e0e72cb0d73997421ca2f2f4df5343"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.25.1



