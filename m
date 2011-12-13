Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RaSzr-00061s-9W
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 15:06:20 +0100
Received: by eekb15 with SMTP id b15so3028438eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=077Z8xXdKMuU18g3eldm01u6yorXvfaom2i5kg2WAgM=;
	b=fIm0SU9wWKTXUjeHrSclPGewVv7eCygbWvdPyCQ1YvRZfCGv1Xd3Rq0Ylhp0mNWAOL
	4xYgFh/WtHXNjVTBDG1XIZSR8RbD38QvcWcCbdoNtJsn+ipPH5vthEVIFgHUwY0P2A0Q
	mBs8glCc3ZvcuEGZtVMU2xN0xrgQiVcU6PVh0=
Received: by 10.14.12.147 with SMTP id 19mr4223707eez.151.1323784763962;
	Tue, 13 Dec 2011 05:59:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm32188188eeh.0.2011.12.13.05.59.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 05:59:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 14:59:13 +0100
Message-Id: <f62734520b4996df6a49cc7be7d60e2af934447e.1323784347.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <cover.1323784347.git.Martin.Jansa@gmail.com>
References: <cover.1323784347.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 1/3] qt4: use armv6 override instead of armv6-vfp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 14:06:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb |    4 ++--
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index 6b9f97a..1d7104c 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,9 +1,9 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
-QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
 QT_CONFIG_FLAGS += " \
  -exceptions \
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 0db090f..3263c93 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,9 +1,9 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
-QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
 QT_CONFIG_FLAGS += " \
  -no-embedded \
-- 
1.7.8



