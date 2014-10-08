Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id A47736AC7B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 03:00:16 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fp1so6034142pdb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 20:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uGM1GAxsnX/JajXEmW4WAzMA0V6NfrazcwTfJ7mdcmw=;
	b=ai6WuRgCz2Q/tK+Ito+02L3il+XQ008uO8Su/Gm5233L8u1TtWPJdOYsoSWataKKN5
	C/pttKjgQzuSfS6rojrDw78eb4kAoklot8nJv667ad640r0E/ZTiFcydXZii3YTvxc64
	NxATK9XDaovzvQgjpddWXqycjnPPK0U/XTP/CVHjEcU99L6bMS7IGV602Qxs9k3FjFT1
	lltIsaFu76EN5eU0iqUNj45nzqfhdSXfe+yOWZJWzR1O1M9FLJc+PjDoDyQsuqIhZ9O6
	SPS9iD8Y6X8MPwQ9VcSEH67rA7Cs3tkcCcHJnxcs/M7PZBmNhddGhy+nMqaqGVZRTM3a
	P9Gg==
X-Received: by 10.69.18.234 with SMTP id gp10mr1218070pbd.149.1412737217891;
	Tue, 07 Oct 2014 20:00:17 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ge5sm17088167pbc.81.2014.10.07.20.00.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 20:00:16 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Oct 2014 20:00:12 -0700
Message-Id: <1412737213-4248-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 1/2] clutter-1.0: upgrade to v1.20.0
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
X-List-Received-Date: Wed, 08 Oct 2014 03:00:18 -0000

* The 1.19.x series were "snapshots" and not stable releases.
* This is the first stable release beyond the 1.18.x series.
* Tested on nuc with core-image-weston.

ANNOUNCEMENT:
https://mail.gnome.org/archives/clutter-list/2014-September/msg00007.html

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb | 8 --------
 meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
deleted file mode 100644
index 452e7ee..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require clutter-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI[archive.md5sum] = "471f5ea423e20d4140c7771873daef29"
-SRC_URI[archive.sha256sum] = "f9fe12e6148426063c90e67dfaeb56013bf1aea224ef502223d13eab6c1add63"
-
-SRC_URI += "file://install-examples.patch"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
new file mode 100644
index 0000000..7898810
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
@@ -0,0 +1,8 @@
+require clutter-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[archive.md5sum] = "a8a33a57a944c6d7c7c013ce9aa3222b"
+SRC_URI[archive.sha256sum] = "cc940809e6e1469ce349c4bddb0cbcc2c13c087d4fc15cda9278d855ee2d1293"
+
+SRC_URI += "file://install-examples.patch"
-- 
1.9.3


