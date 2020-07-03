Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web12.6424.1593765832637953108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 01:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0638hnOJ016430
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jul 2020 10:43:50 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.59])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 0638hn5G019988;
	Fri, 3 Jul 2020 10:43:49 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D6BD798021E;
	Fri,  3 Jul 2020 10:43:48 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] dropbear: update to 2020.80
Date: Fri,  3 Jul 2020 10:42:16 +0200
Message-Id: <20200703084216.17911-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200703084216.17911-1-andrej.valek@siemens.com>
References: <20200703084216.17911-1-andrej.valek@siemens.com>

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/dropbear/dropbear_2020.79.bb | 3 ---
 meta/recipes-core/dropbear/dropbear_2020.80.bb | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2020.79.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2020.80.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2020.79.bb b/meta/recipes-core/dropbear/dropbear_2020.79.bb
deleted file mode 100644
index 43a17bf1e5..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2020.79.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require dropbear.inc
-
-SRC_URI[sha256sum] = "084f00546b1610a3422a0773e2c04cbe1a220d984209e033b548b49f379cc441"
diff --git a/meta/recipes-core/dropbear/dropbear_2020.80.bb b/meta/recipes-core/dropbear/dropbear_2020.80.bb
new file mode 100644
index 0000000000..bc805c64b2
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2020.80.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "63527580ca47706b70046f87bb9d14fe"
+SRC_URI[sha256sum] = "d927941b91f2da150b2033f1a88b6a47999bf0afb1493a73e9216cffdb5d7949"
-- 
2.11.0

