Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2498.1590624421378066185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 17:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,442,1583164800"; 
   d="scan'208";a="93237510"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 May 2020 08:07:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EE2174BCC8B4
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 08:06:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 May 2020 08:06:58 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] xf86-input-libinput: upgrade 0.29.0 -> 0.30.0
Date: Thu, 28 May 2020 17:06:56 +0800
Message-ID: <1590656816-18327-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: EE2174BCC8B4.A3B5F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...input-libinput_0.29.0.bb => xf86-input-libinput_0.30.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.29.0.bb => xf86-input-libinput_0.30.0.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.29.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.29.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
index f87083e575..d02988caa4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.29.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "d600e8e2e30747b8ce49ec5294ff0ab6"
-SRC_URI[sha256sum] = "c28b56a21754b972db31798e6a4cf4dc9d69208d08f8fe41701a94def5e94bee"
+SRC_URI[md5sum] = "11dcfa2cc39f790731a9545fcdeea717"
+SRC_URI[sha256sum] = "f9c7f9fd41ae14061e0e9c3bd45fa170e5e21027a2bc5810034e1e748db996c0"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.17.1



