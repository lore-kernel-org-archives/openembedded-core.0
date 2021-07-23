Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8563.1627048433852348350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 06:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0CAD720006;
	Fri, 23 Jul 2021 13:53:51 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] oe-setup-builddir: update YP docs and OE URLs
Date: Fri, 23 Jul 2021 15:53:48 +0200
Message-Id: <20210723135348.87531-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the link to the YP docs
and proposes to access the OE website through https

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/oe-setup-builddir | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 30eaa8efbe..75f63f5680 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -113,10 +113,10 @@ if [ ! -z "$SHOWYPDOC" ]; then
     cat <<EOM
 The Yocto Project has extensive documentation about OE including a reference
 manual which can be found at:
-    http://yoctoproject.org/documentation
+    https://docs.yoctoproject.org
 
 For more information about OpenEmbedded see their website:
-    http://www.openembedded.org/
+    https//www.openembedded.org/
 
 EOM
 #    unset SHOWYPDOC
-- 
2.25.1

