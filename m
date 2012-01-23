Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFuh-0007fB-Vg
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 10:10:08 +0100
Received: by eekd41 with SMTP id d41so914736eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 01:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=E2HAZuKUuQNzbBlbwSCtqmJSm+AJ0mB+HPcRqavqHtQ=;
	b=aP53qT60VTezzV9JnxBhUb89HtGtewxtKGLmd5YQ2r3zbgIeX8lQ93M4R+P+IweRtN
	HLVUHGXK6uStTVjhW3TvqaDA6zLz1ivfsIQvUEqpTZ1cNthjJtdiKuri/yvyfx9ni/IP
	s0towUpt1KPt6s8tdSx8NFPXp8Y4WT64u/4Fg=
Received: by 10.14.32.19 with SMTP id n19mr2640020eea.41.1327309344048;
	Mon, 23 Jan 2012 01:02:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm51335095eef.7.2012.01.23.01.02.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 01:02:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:02:07 +0100
Message-Id: <0d4c0256a6bb0e2f78ff1c8329fdca0124214d36.1327309289.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <270ca47d8e51e9ce6e10bf0ddc17fe8a4cf3f33b.1327309289.git.Martin.Jansa@gmail.com>
References: <270ca47d8e51e9ce6e10bf0ddc17fe8a4cf3f33b.1327309289.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327309289.git.Martin.Jansa@gmail.com>
References: <cover.1327309289.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] initscripts: remove space from shebang, just cosmetics
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
X-List-Received-Date: Mon, 23 Jan 2012 09:10:08 -0000

* at least in initscripts it's consistent now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../initscripts/initscripts-1.0/devpts.sh          |    2 +-
 meta/recipes-core/initscripts/initscripts-1.0/halt |    2 +-
 .../initscripts/initscripts-1.0/reboot             |    2 +-
 .../initscripts/initscripts-1.0/rmnologin.sh       |    2 +-
 .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
 .../initscripts/initscripts-1.0/sendsigs           |    2 +-
 .../initscripts/initscripts-1.0/single             |    2 +-
 .../initscripts/initscripts-1.0/umountfs           |    2 +-
 .../initscripts/initscripts-1.0/urandom            |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh b/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
index 18202ad..c6043fb 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          devpts
 # Required-Start: udev
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/halt b/meta/recipes-core/initscripts/initscripts-1.0/halt
index 021d9be..a56f734 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/halt
+++ b/meta/recipes-core/initscripts/initscripts-1.0/halt
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          halt
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/reboot b/meta/recipes-core/initscripts/initscripts-1.0/reboot
index cf32e95..087d8d5 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/reboot
+++ b/meta/recipes-core/initscripts/initscripts-1.0/reboot
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          reboot
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh b/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
index 417efc2..76de341 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          rmnologin
 # Required-Start:    $remote_fs $all
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index 77aa11c..3d8e850 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          save-rtc
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sendsigs b/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
index 2b0f8f3..34e1b77 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          sendsigs
 # Required-Start:    
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/single b/meta/recipes-core/initscripts/initscripts-1.0/single
index 0cad693..da82d17 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/single
+++ b/meta/recipes-core/initscripts/initscripts-1.0/single
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          single
 # Required-Start:    $local_fs $all killprocs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountfs b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
index 6ad0e43..61324c6 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountfs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          umountfs
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index b6d807c..eb3a7c3 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          urandom
 # Required-Start:    $local_fs mountvirtfs
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 98f5e9b..203c605 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r128"
+PR = "r129"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.8.4



