Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.87.1587556990592476277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 05:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; 
   d="scan'208";a="89494564"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 20:03:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DF5AD46B5FA0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 19:52:36 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 20:03:11 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 20:03:19 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.7 -> 1.8.8
Date: Wed, 22 Apr 2020 13:02:56 -0700
Message-ID: <20200422200258.84579-2-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
References: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DF5AD46B5FA0.A79B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.7.bb => msmtp_1.8.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.7.bb => msmtp_1.8.8.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.7.bb b/meta/recipes-extended/msmtp/msmtp_1.8.8.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.8.7.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.8.bb
index 729d0ed146..ca359a1507 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.7.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.8.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "4cf3d000b24fc8769e9fd8ec8b3cf1fb"
-SRC_URI[sha256sum] = "9a53bcdc244ec5b1a806934ecc7746d9d09db581f587bedf597e9da2f48c51f1"
+SRC_URI[md5sum] = "016e432d12e12dc5d73960e2bc67f0fb"
+SRC_URI[sha256sum] = "eccb53e48f025f7e6f60210316df61cf6097a491728341c1e375fc1acc6459e5"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.17.1



