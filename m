Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1596.1587368585376890553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 00:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,405,1580745600"; 
   d="scan'208";a="89267066"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Apr 2020 15:43:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A4A150A9969
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 15:32:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Apr 2020 15:42:57 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] liburcu: upgrade 0.11.1 -> 0.12.0
Date: Tue, 21 Apr 2020 00:26:49 +0800
Message-ID: <1587400009-93003-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4A4A150A9969.A7447
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../liburcu/{liburcu_0.11.1.bb => liburcu_0.12.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.11.1.bb => liburcu_0.12.0.bb} (83%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.11.1.bb b/meta/recipes-support/liburcu/liburcu_0.12.0.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.11.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.12.0.bb
index 6a517e6f29..0c20abe6d5 100644
--- a/meta/recipes-support/liburcu/liburcu_0.11.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.12.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "91c75d5902127f94ab556ce039b369ca"
-SRC_URI[sha256sum] = "92b9971bf3f1c443edd6c09e7bf5ff3b43531e778841f16377a812c8feeb3350"
+SRC_URI[md5sum] = "d923a42ce38e33e883313003c8afd559"
+SRC_URI[sha256sum] = "409b1be506989e1d26543194df1a79212be990fe5d4fd84f34f019efed989f97"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.17.1



