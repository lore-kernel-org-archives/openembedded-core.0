Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.3460.1585100617988134149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; 
   d="scan'208";a="87206043"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 09:43:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3A149406AB15
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 09:33:26 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 09:43:35 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 09:43:45 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gsettings-desktop-schemas: upgrade 3.34.0 -> 3.36.0
Date: Tue, 24 Mar 2020 23:47:51 -0700
Message-ID: <1585118872-33976-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585118872-33976-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585118872-33976-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3A149406AB15.AFAB5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-schemas_3.34.0.bb => gsettings-desktop-schemas_3.36.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.34.0.bb => gsettings-desktop-schemas_3.36.0.bb} (80%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.0.bb
similarity index 80%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.0.bb
index eea578bb6b..a68175dc84 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.0.bb
@@ -13,6 +13,6 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "9759ef53fb2e53fc8d19190e58f2c332"
-SRC_URI[archive.sha256sum] = "288b04260f7040b0e004a8d59c773cfb4e32df4f1b4a0f9d705c51afccc95ead"
+SRC_URI[archive.md5sum] = "697db9e6b2ae058f8a0d0b023e32ceac"
+SRC_URI[archive.sha256sum] = "764ab683286536324533a58d4e95fc57f81adaba7d880dd0ebbbced63e960ea6"
 SRC_URI += "file://0001-Do-not-skip-gir-installation-for-cross-compiling.patch"
-- 
2.17.1



