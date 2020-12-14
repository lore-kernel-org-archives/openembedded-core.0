Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.30981.1607930524577861355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 23:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,417,1599494400"; 
   d="scan'208";a="102366826"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Dec 2020 15:21:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id F30DB4CE6009
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 15:21:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 14 Dec 2020 15:21:44 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] bash: Rename patch name
Date: Mon, 14 Dec 2020 15:21:34 +0800
Message-ID: <1607930494-36011-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F30DB4CE6009.A1509
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because the name of CVE patch is wrong, cve-check-tool cannot get the correct CVE result. Rename the patch name.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../bash/{bash-CVE-2019-18276.patch => CVE-2019-18276.patch}    | 0
 meta/recipes-extended/bash/bash_5.0.bb                          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/bash/bash/{bash-CVE-2019-18276.patch => CVE-2019-18276.patch} (100%)

diff --git a/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch b/meta/recipes-extended/bash/bash/CVE-2019-18276.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
rename to meta/recipes-extended/bash/bash/CVE-2019-18276.patch
diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index 257a03bd8b..53e05869ce 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://run-ptest \
            file://run-bash-ptests \
            file://fix-run-builtins.patch \
-           file://bash-CVE-2019-18276.patch \
+           file://CVE-2019-18276.patch \
            "
 
 SRC_URI[tarball.md5sum] = "2b44b47b905be16f45709648f671820b"
-- 
2.25.1



