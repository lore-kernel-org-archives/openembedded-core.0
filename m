Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.15569.1606460210878961136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 22:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101810661"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 14:56:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5D63D4CE5CE1
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 14:56:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 14:56:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] hdparm: upgrade 9.58 -> 9.60
Date: Fri, 27 Nov 2020 14:56:18 +0800
Message-ID: <1606460178-122019-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5D63D4CE5CE1.A3971
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../hdparm/{hdparm_9.58.bb => hdparm_9.60.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.58.bb => hdparm_9.60.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.58.bb b/meta/recipes-extended/hdparm/hdparm_9.60.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.58.bb
rename to meta/recipes-extended/hdparm/hdparm_9.60.bb
index e47dedae89..41f70b403f 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.58.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.60.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "4652c49cf096a64683c05f54b4fa4679"
-SRC_URI[sha256sum] = "9ae78e883f3ce071d32ee0f1b9a2845a634fc4dd94a434e653fdbef551c5e10f"
+SRC_URI[md5sum] = "25a791d47236c58801f8b27074f3ef93"
+SRC_URI[sha256sum] = "8397739c73e44d5ab96c4aef28fa9c0147276d53a1b5657ce04c4565cf6635cc"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.25.1



