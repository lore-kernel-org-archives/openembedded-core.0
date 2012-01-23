Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFuX-0007au-52
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 10:10:00 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so268074eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 01:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZffPpW3hRDJWrm0OpPtpos1YOq6LM4WlZH482NqDNmQ=;
	b=JT0NaP2WrN+4tM+U0a94GLX3Zvk+CaaZT+tk4cFur/Ly20yy/Dc9qOI+5lcSa1/LYJ
	IYCjyZEkNl7h0fLpTY9/eypDgiu2edTqWS5tNdAQ4I2q+77TqIs9+WSXTQ9CxS2zkj7O
	MivHDAdlRuTk3qwY6b5D2tRgdbdxT3Frvqlbc=
Received: by 10.213.14.147 with SMTP id g19mr1443429eba.126.1327309335255;
	Mon, 23 Jan 2012 01:02:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c16sm51425165eei.1.2012.01.23.01.02.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 01:02:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:02:06 +0100
Message-Id: <270ca47d8e51e9ce6e10bf0ddc17fe8a4cf3f33b.1327309289.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1327309289.git.Martin.Jansa@gmail.com>
References: <cover.1327309289.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] initscripts: add shebang where it was missing completely
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
X-List-Received-Date: Mon, 23 Jan 2012 09:10:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |    1 +
 .../initscripts/initscripts-1.0/checkfs.sh         |    1 +
 .../initscripts/initscripts-1.0/checkroot.sh       |    1 +
 .../initscripts/initscripts-1.0/hostname.sh        |    1 +
 .../initscripts/initscripts-1.0/mountall.sh        |    1 +
 .../initscripts/initscripts-1.0/mountnfs.sh        |    1 +
 .../initscripts/initscripts-1.0/umountnfs.sh       |    1 +
 7 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index ab18ad9..d9e8ffa 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          bootmisc
 # Required-Start:    $local_fs mountvirtfs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
index 91897d4..6286945 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          checkfs
 # Required-Start:    checkroot
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index 02697ce..ac21ee4 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          checkroot
 # Required-Start:    udev
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
index 4399ee7..fb58c9c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          hostname
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index 9d4f97b..94bae42 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          mountall
 # Required-Start:    mountvirtfs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index 46c58b1..859fc9e 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          mountnfs
 # Required-Start:    $local_fs $network $portmap
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
index a4fb821..15d1f73 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          umountnfs
 # Required-Start:
-- 
1.7.8.4



