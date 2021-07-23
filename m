Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.10708.1627056765333677014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 09:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 79286200008;
	Fri, 23 Jul 2021 16:12:43 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] oe-setup-builddir: update YP docs and OE URLs
Date: Fri, 23 Jul 2021 18:12:37 +0200
Message-Id: <20210723161237.92160-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CA+chaQe0K89xQd_Yts5UVbPwOc0AYJtBf0f3xASvmng79zdH_g@mail.gmail.com>
References: <CA+chaQe0K89xQd_Yts5UVbPwOc0AYJtBf0f3xASvmng79zdH_g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the link to the YP docs
and proposes to access the OE website through https

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/oe-setup-builddir | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 30eaa8efbe..5a51fa793f 100755
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
+    https://www.openembedded.org/
 
 EOM
 #    unset SHOWYPDOC
-- 
2.25.1

