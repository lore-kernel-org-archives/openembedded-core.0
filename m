Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5106.1602733660197684156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 20:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,377,1596470400"; 
   d="scan'208";a="100178319"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Oct 2020 11:47:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EE1A648990F4
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 11:47:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Oct 2020 11:47:30 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] classes: Fixed the problem of undefined variables when compiling meta-toolchain.
Date: Thu, 15 Oct 2020 11:47:29 +0800
Message-ID: <1602733649-10508-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EE1A648990F4.A07A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

The product name when compiling meta-toolchain is:
poky-glibc-x86_64-${IMAGE_BASENAME}-cortexa57-qemuarm64-toolchain-3.1+snapshot.host.manifest
poky-glibc-x86_64-${IMAGE_BASENAME}-cortexa57-qemuarm64-toolchain-3.1+snapshot.target.manifest
poky-glibc-x86_64-${IMAGE_BASENAME}-cortexa57-qemuarm64-toolchain-3.1+snapshot.testdata.json
poky-glibc-x86_64--cortexa57-qemuarm64-toolchain-3.1+snapshot.sh

inherit image-artifact-names to solve this problem.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 61b31d5e5e..49b1833265 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,4 +1,4 @@
-inherit meta image-postinst-intercepts
+inherit meta image-postinst-intercepts image-artifact-names
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
2.25.1



