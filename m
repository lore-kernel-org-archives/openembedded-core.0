Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9H-0006uJ-0T
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:39:55 +0100
Received: by mail-wi0-f177.google.com with SMTP id hj13so2359897wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=66p64b9UjdIQN8WG2RIMmZgEdDdK/moUFG+CWXzzpsY=;
	b=kCvR2WnGJ2Ywpz38o1V7bKDPM1edWDDnHH9AC8Y4/xVe/sHXa245OZHDoHWSBy1tI/
	KPJrlTxoljEcWoHMbs7WNU0bbQvY1mhvrbXQ3aRX+H0wfhLGSLXTW/DrOp+8ussI3sN9
	wtlzi/N1iQcA7iZm/+GuGfJ2hewUH8ldrq9lBTOxbimHEEUtnqGR8XHRfZFRDdSrVp1a
	z9dFipxwfq2RJ3xDbe2vR+ljkGApnijzqYdc3XdwPMMbwIqtfF/QTVoXsFMZAzPgIfi+
	7ymgXiA3sshfgYHGSMqIyqMRof6u+oL0zOhNRVAicFHOgFBsY7n8cnVRfpJowNUZSAF2
	qCrw==
Received: by 10.180.106.9 with SMTP id gq9mr595825wib.17.1332541860695;
	Fri, 23 Mar 2012 15:31:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm17523554wib.1.2012.03.23.15.30.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:41 +0100
Message-Id: <9b6c113f8c48a45725715cd34f6e2cabe5d700b1.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 02/10] xev: move from meta-demoapps
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
X-List-Received-Date: Fri, 23 Mar 2012 22:39:55 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

* The location where xev was located didn't contain xorg-app-common.inc,
  but still xev requires it. So moving it fixes that issue.
* File checksums and License checksums were also added.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/xorg-app/xev_1.0.3.bb         |    7 -------
 .../recipes-graphics/xorg-app/xev/diet-x11.patch   |    0
 meta/recipes-graphics/xorg-app/xev_1.0.3.bb        |   10 ++++++++++
 3 files changed, 10 insertions(+), 7 deletions(-)
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-app/xev_1.0.3.bb
 rename {meta-demoapps => meta}/recipes-graphics/xorg-app/xev/diet-x11.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-app/xev_1.0.3.bb

diff --git a/meta-demoapps/recipes-graphics/xorg-app/xev_1.0.3.bb b/meta-demoapps/recipes-graphics/xorg-app/xev_1.0.3.bb
deleted file mode 100644
index b7a4070..0000000
--- a/meta-demoapps/recipes-graphics/xorg-app/xev_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-
-DESCRIPTION = "X Event Viewer"
-LICENSE = "MIT"
-PE = "1"
-
-SRC_URI += "file://diet-x11.patch;patch=1"
diff --git a/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
similarity index 100%
rename from meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch
rename to meta/recipes-graphics/xorg-app/xev/diet-x11.patch
diff --git a/meta/recipes-graphics/xorg-app/xev_1.0.3.bb b/meta/recipes-graphics/xorg-app/xev_1.0.3.bb
new file mode 100644
index 0000000..21ba62e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xev_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+LIC_FILES_CHKSUM = "file://xev.c;startline=0;endline=35;md5=db2e69260ca64f1d332efa6ab4b7e2b5"
+DESCRIPTION = "X Event Viewer"
+LICENSE = "MIT"
+PE = "1"
+
+SRC_URI += "file://diet-x11.patch"
+
+SRC_URI[md5sum] = "a9532c3d1683c99bb5df1895cb3a60b1"
+SRC_URI[sha256sum] = "d4ac7ae154ee9733be27a5f55586abb9362c768f5fb8a4fc7fd2645100a9313a"
-- 
1.7.8.5



