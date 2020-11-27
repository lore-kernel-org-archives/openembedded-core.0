Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.15636.1606460938736882925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 23:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101811162"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 15:08:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 349074CE5CDD
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 15:08:50 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 15:08:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libcap-ng: upgrade 0.8 -> 0.8.1
Date: Fri, 27 Nov 2020 15:08:48 +0800
Message-ID: <1606460928-122329-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 349074CE5CDD.A1AC3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libcap-ng-python_0.8.bb => libcap-ng-python_0.8.1.bb}      | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.8.bb => libcap-ng_0.8.1.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.bb => libcap-ng-python_0.8.1.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.bb => libcap-ng_0.8.1.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.1.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.1.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 3d25b4cbd9..a312b602ff 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -11,6 +11,6 @@ SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch \
 "
 
-SRC_URI[sha256sum] = "f14d23b60ae1465b032e4e8cbd4112006572c69a6017d55d5d3c6aad622a9e21"
+SRC_URI[sha256sum] = "f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb
-- 
2.25.1



