Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.195.1627059956173595153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 10:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 64F49200005;
	Fri, 23 Jul 2021 17:05:54 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] conf-notes.txt: now suggesting to run 'runqemu qemux86-64'
Date: Fri, 23 Jul 2021 19:05:49 +0200
Message-Id: <20210723170549.93603-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'runqemu qemux86' doesn't work any more.
The "Quick Build" documentation has already been updated
but this message that we get when sourcing "oe-init-build-env"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/conf-notes.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
index 1a9414a040..cfd1f1977b 100644
--- a/meta/conf/conf-notes.txt
+++ b/meta/conf/conf-notes.txt
@@ -11,7 +11,7 @@ Common targets are:
     meta-toolchain
     meta-ide-support
 
-You can also run generated qemu images with a command like 'runqemu qemux86'.
+You can also run generated qemu images with a command like 'runqemu qemux86-64'.
 
 Other commonly useful commands are:
  - 'devtool' and 'recipetool' handle common recipe tasks
-- 
2.25.1

