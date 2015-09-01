Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7575E76DE5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:11:27 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so19743696wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eQGi9jdSOVSxAF19uLI4VxbKaCAtEY/IO9j8BWGDxEQ=;
	b=DMDFOBzUhIVicnMyg+lhGYcpAsRXbKH5479nb8m6dGWO0aXKwZLowd4aBqJ69IbaK+
	8fQXdcEJe0M5LNF1uPl4tqBX+ABLEORj+vXa50Q6PHJIb5GxPn+yXobjjcSG8nehTIzx
	GGtcD+GPv/Y0gYDHJA6YFeV3XCvZQ1G9OtLjYroRrS5ZU6ESh8j6J8aV60+1T38rLFJj
	EyotGN7deuMcpaCnoQpGnK9VQ06G3puK8y/Ovo93xSbuApDFVgbvr9jAmK/f9z3fMVck
	H6S5WT3lxQ+vOTlxseN+LXMnGwp6Um1StE6wB6dJAbLNJ3cJEiDaytzzV7fzcUmIsJRl
	p6tg==
X-Received: by 10.194.20.161 with SMTP id o1mr38182757wje.32.1441127487106;
	Tue, 01 Sep 2015 10:11:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cw8sm28116618wjb.49.2015.09.01.10.11.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 10:11:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 19:11:40 +0200
Message-Id: <1441127500-30420-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [fido][PATCH] gnome: move introspection options to gnomebase
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Sep 2015 17:11:28 -0000

From: Ross Burton <ross.burton@intel.com>

The gnome class is really a convenience class to include other classes, so move
the introspection arguments into gnomebase.bbclass.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gnome.bbclass     | 4 ----
 meta/classes/gnomebase.bbclass | 3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
index 0de22dd..c6202bb 100644
--- a/meta/classes/gnome.bbclass
+++ b/meta/classes/gnome.bbclass
@@ -1,5 +1 @@
 inherit gnomebase gtk-icon-cache gconf mime
-
-EXTRA_OECONF += "--disable-introspection"
-
-UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 6ca13cb..fa8f88d 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -28,3 +28,6 @@ do_install_append() {
 	rm -f ${D}${datadir}/applications/*.cache
 }
 
+EXTRA_OECONF += "--disable-introspection"
+
+UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
-- 
2.5.0


