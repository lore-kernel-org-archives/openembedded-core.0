Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web09.5681.1611299766265547091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 23:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,365,1602518400"; 
   d="scan'208";a="103729835"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 15:16:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3E99D4CE603A
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 15:15:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 15:15:54 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] socat: upgrade 1.7.3.4 ->1.7.4.1
Date: Fri, 22 Jan 2021 15:15:46 +0800
Message-ID: <1611299746-47965-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 3E99D4CE603A.A58E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

README updated:
    version updated
    add descrition of platform specifics - Debian

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../socat/{socat_1.7.3.4.bb => socat_1.7.4.1.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.4.bb => socat_1.7.4.1.bb} (90%)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
similarity index 90%
rename from meta/recipes-connectivity/socat/socat_1.7.3.4.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.1.bb
index f3f569d262..5a13af91bc 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
@@ -7,13 +7,13 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "3cca4f8cd9d2d1caabd9cc099451bac9"
-SRC_URI[sha256sum] = "972374ca86f65498e23e3259c2ee1b8f9dbeb04d12c2a78c0c9b5d1cb97dfdfc"
+SRC_URI[md5sum] = "36cad050ecf4981ab044c3fbd75c643f"
+SRC_URI[sha256sum] = "3faca25614e89123dff5045680549ecef519d02e331aaf3c4f5a8f6837c675e9"
 
 inherit autotools
 
-- 
2.25.1



