Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6695.1594198373890904543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 01:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925565"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:52:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E18A64CE3F11
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 16:52:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:52:44 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] glib-2.0: upgrade 2.64.3 -> 2.64.4
Date: Wed, 8 Jul 2020 16:52:38 +0800
Message-ID: <1594198359-42354-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594198359-42354-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1594198359-42354-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E18A64CE3F11.A4676
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.64.3.bb => glib-2.0_2.64.4.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.64.3.bb => glib-2.0_2.64.4.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.64.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb
index 2e5f7a0e2a..e4c834caf2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb
@@ -20,8 +20,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "ccc48e58545cac45f5b3df3b8aeaff13"
-SRC_URI[sha256sum] = "fe9cbc97925d14c804935f067a3ad77ef55c0bbe9befe68962318f5a767ceb22"
+SRC_URI[md5sum] = "0a4f67e9a9d729976e2f797e36fc1a57"
+SRC_URI[sha256sum] = "f7e0b325b272281f0462e0f7fff25a833820cac19911ff677251daf6d87bce50"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.17.1



