Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.5316.1585792032269412661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363797"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:47:16 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C39149DF12A
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2020 09:36:53 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:47:11 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:47:19 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] xserver-xorg: upgrade 1.20.7 -> 1.20.8
Date: Thu, 2 Apr 2020 02:16:59 -0700
Message-ID: <1585819019-28752-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585819019-28752-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585819019-28752-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7C39149DF12A.A3812
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{xserver-xorg_1.20.7.bb => xserver-xorg_1.20.8.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.7.bb => xserver-xorg_1.20.8.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 998b98a76c..3f7fbe85b8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            "
-SRC_URI[md5sum] = "d2e96355ad47244c675bce38db2b48a9"
-SRC_URI[sha256sum] = "bd5986f010f34f5b3d6bc99fe395ecb1e0dead15a26807e0c832701809a06ea1"
+SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
+SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
 
 CFLAGS += "-fcommon"
 
-- 
2.17.1



