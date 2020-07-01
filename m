Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.15964.1593586941309158220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 00:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616839"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 15:01:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id BE0C54CE4BDE
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2020 14:51:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 15:01:50 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gtk+3: upgrade 3.24.20 -> 3.24.21
Date: Wed, 1 Jul 2020 15:01:47 +0800
Message-ID: <1593586907-23161-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593586907-23161-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586907-23161-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: BE0C54CE4BDE.A7822
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-gnome/gtk+/{gtk+3_3.24.20.bb => gtk+3_3.24.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.20.bb => gtk+3_3.24.21.bb} (84%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
index e5744a4b05..70c0e66db7 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[md5sum] = "b302acc0a4b42e2980ef18628f9ce951"
-SRC_URI[sha256sum] = "2dac69f716e8d04ba7a95091589e2baaec95dcace932cb15839163db479b1df3"
+SRC_URI[md5sum] = "95afed6c860d27de827db66434d681da"
+SRC_URI[sha256sum] = "aeea6ae7cd35e83dfc7699be716519faefca346c62e784dd1a37d9df94c08f52"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.17.1



