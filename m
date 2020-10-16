Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5786.1602814849813915838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 19:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,381,1596470400"; 
   d="scan'208";a="100211470"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Oct 2020 10:20:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A06BF48990D2
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 10:20:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Oct 2020 10:20:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] strace: upgrade 5.8 -> 5.9
Date: Fri, 16 Oct 2020 10:20:42 +0800
Message-ID: <1602814842-29798-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A06BF48990D2.A1B22
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb} (95%)

diff --git a/meta/recipes-devtools/strace/strace_5.8.bb b/meta/recipes-devtools/strace/strace_5.9.bb
similarity index 95%
rename from meta/recipes-devtools/strace/strace_5.8.bb
rename to meta/recipes-devtools/strace/strace_5.9.bb
index 0415588b97..bee2616a44 100644
--- a/meta/recipes-devtools/strace/strace_5.8.bb
+++ b/meta/recipes-devtools/strace/strace_5.9.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch \
            "
-SRC_URI[sha256sum] = "df4a669f7fff9cc302784085bd4b72fab216a426a3f72c892b28a537b71e7aa9"
+SRC_URI[sha256sum] = "39473eb8465546c3e940fb663cb381eba5613160c7302794699d194a4d5d66d9"
 
 inherit autotools ptest
 
-- 
2.25.1



