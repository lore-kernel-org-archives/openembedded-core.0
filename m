Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web10.7343.1593770816325469749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 03:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 063A6q2m012397
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jul 2020 12:06:53 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.57])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 063A6qe3030676;
	Fri, 3 Jul 2020 12:06:52 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B9BAB98021E;
	Fri,  3 Jul 2020 12:06:51 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v2] dropbear: update to 2020.80
Date: Fri,  3 Jul 2020 12:06:01 +0200
Message-Id: <20200703100601.22887-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200703084216.17911-2-andrej.valek@siemens.com>
References: <20200703084216.17911-2-andrej.valek@siemens.com>

License-Update: changed date and added info about existence LICENSE files
 in libtomcrypt and libtommath folders
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/dropbear/dropbear.inc        | 2 +-
 meta/recipes-core/dropbear/dropbear_2020.79.bb | 3 ---
 meta/recipes-core/dropbear/dropbear_2020.80.bb | 3 +++
 3 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2020.79.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2020.80.bb

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 240e328ed2..080ee26b2e 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -5,7 +5,7 @@ SECTION = "console/network"
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=da58928b5d844c6667963cb5a109272d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
 
 DEPENDS = "zlib virtual/crypt"
 RPROVIDES_${PN} = "ssh sshd"
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
index 0000000000..088c71cb99
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2020.80.bb
@@ -0,0 +1,3 @@
+require dropbear.inc
+
+SRC_URI[sha256sum] = "d927941b91f2da150b2033f1a88b6a47999bf0afb1493a73e9216cffdb5d7949"
-- 
2.11.0

