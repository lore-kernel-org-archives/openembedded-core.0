Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.11202.1591181605059911476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 03:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93757611"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 18:53:23 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1F8A34BCC8BF
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2020 18:53:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 18:53:22 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 2/2] dbus-test: upgrade 1.12.16 -> 1.12.18
Date: Wed, 3 Jun 2020 18:53:20 +0800
Message-ID: <1591181600-15442-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1F8A34BCC8BF.A5CB9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.18.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.18.bb} (95%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.16.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.18.bb
index bea0e74ed0..0063dcce67 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
-SRC_URI[sha256sum] = "54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80"
+SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
+SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.17.1



