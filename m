Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.30571.1590739893203848257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 01:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343165"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:11:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1A7954BCC89E
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 16:11:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:11:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [OE-core] [PATCH] python3-pygobject:upgrade 3.34.0 -> 3.36.1
Date: Sat, 30 May 2020 01:11:21 +0800
Message-ID: <1590772282-43066-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1A7954BCC89E.A5F9D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ython3-pygobject_3.34.0.bb => python3-pygobject_3.36.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.34.0.bb => python3-pygobject_3.36.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
index 6babf0cae8..0a34d4373f 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[md5sum] = "ca1dc4f31c1d6d283758e8f315a88ab6"
-SRC_URI[sha256sum] = "87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdacf5271a"
+SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
+SRC_URI[sha256sum] = "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-- 
2.17.1



