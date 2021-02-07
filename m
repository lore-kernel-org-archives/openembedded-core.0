Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.17591.1612681879514444281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 23:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,159,1610380800"; 
   d="scan'208";a="104291363"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Feb 2021 15:11:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6358E4CE6033
	for <openembedded-core@lists.openembedded.org>; Sun,  7 Feb 2021 15:11:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 7 Feb 2021 15:11:11 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.34.0 -> 3.34.1
Date: Sun, 7 Feb 2021 15:11:13 +0800
Message-ID: <1612681873-58787-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6358E4CE6033.A66CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../sqlite/{sqlite3_3.34.0.bb => sqlite3_3.34.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.34.0.bb => sqlite3_3.34.1.bb} (70%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.34.0.bb b/meta/recipes-support/sqlite/sqlite3_3.34.1.bb
similarity index 70%
rename from meta/recipes-support/sqlite/sqlite3_3.34.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.34.1.bb
index 19996fc064..fe5adb221e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.34.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.34.1.bb
@@ -3,8 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "bf6db7fae37d51754737747aaaf413b4d6b3b5fbacd52bdb2d0d6e5b2edd9aee"
+SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "2a3bca581117b3b88e5361d0ef3803ba6d8da604b1c1a47d902ef785c1b53e89"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.25.1



