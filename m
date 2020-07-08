Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6595.1594198370700764791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 01:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925564"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:52:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 382CA49B1116
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 16:52:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:52:41 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] dbus: upgrade 1.12.18 -> 1.12.20
Date: Wed, 8 Jul 2020 16:52:36 +0800
Message-ID: <1594198359-42354-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 382CA49B1116.A209F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../dbus/{dbus-test_1.12.18.bb => dbus-test_1.12.20.bb}       | 0
 meta/recipes-core/dbus/dbus.inc                               | 4 ++--
 meta/recipes-core/dbus/{dbus_1.12.18.bb => dbus_1.12.20.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.18.bb => dbus-test_1.12.20.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.18.bb => dbus_1.12.20.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb b/meta/recipes-core/dbus/dbus-test_1.12.20.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.20.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 3bdb7ea4ff..dcbcc0a9d6 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,8 +10,8 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
-SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
+SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
+SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.18.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.18.bb
rename to meta/recipes-core/dbus/dbus_1.12.20.bb
-- 
2.17.1



