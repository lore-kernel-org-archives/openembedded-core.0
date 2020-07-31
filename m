Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.12233.1596172966584800319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97199362"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 13:22:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 258914CE1505
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2020 13:22:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 13:22:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sudo:upgrade 1.9.1 -> 1.9.2
Date: Sat, 1 Aug 2020 01:22:40 +0800
Message-ID: <1596216160-3523-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596216160-3523-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596216160-3523-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 258914CE1505.AFB0D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.1.bb => sudo_1.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.1.bb => sudo_1.9.2.bb} (95%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.1.bb b/meta/recipes-extended/sudo/sudo_1.9.2.bb
similarity index 95%
rename from meta/recipes-extended/sudo/sudo_1.9.1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.2.bb
index d6bc1a9c3a..5756b2e146 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.2.bb
@@ -6,7 +6,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "294116cefe10a02773917fc7440d8384b925955bc96a6e0eaa1977c83b34adff"
+SRC_URI[sha256sum] = "7c98d201f181c47152711b9f391e0f6b5545f3ef8926298a3e8bc6288e118314"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1



