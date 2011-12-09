Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ4LO-0002Op-4p
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:34:46 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so2538752yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 09:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=89vVqT0uVariU0nw/HQhOIWuDM1FWC5iH2pwuPhIsnA=;
	b=yCusTUvlSLpAUgw62DWko3x3tcbp1J9/vu0xw3RHRQ/WO9muP0y9W3ezry0YT1GZJT
	TyHqPqD6mlANKQEbnKMuZ05YeE8I/mUnQeB6BO3SE2PLo1eEUmu1DXUfl1dNsobZX0X2
	JjBayncxyIXwyzvAdKkufYRFadSXUoq3QEDNs=
Received: by 10.236.181.161 with SMTP id l21mr13498069yhm.110.1323451675902;
	Fri, 09 Dec 2011 09:27:55 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l11sm25562627anm.22.2011.12.09.09.27.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 09:27:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 17:27:33 +0000
Message-Id: <d7f185bc48a4f90c11076e22b1ea216176f7f885.1323451575.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
Subject: [PATCH 3/5] connman: drop git version
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
X-List-Received-Date: Fri, 09 Dec 2011 17:34:46 -0000

This was clearly unused as dbusperms.patch cannot be fetched by this
recipe and noone noticed the build failures caused by it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../connman/connman-0.75/dbusperms.patch           |   14 --------------
 meta/recipes-connectivity/connman/connman_git.bb   |   11 -----------
 2 files changed, 0 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_git.bb

diff --git a/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch b/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
deleted file mode 100644
index c331654..0000000
--- a/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/src/connman-dbus.conf
-===================================================================
---- git.orig/src/connman-dbus.conf	2009-05-26 00:34:35.000000000 +0100
-+++ git/src/connman-dbus.conf	2009-05-26 00:34:48.000000000 +0100
-@@ -10,6 +10,6 @@
-         <allow send_destination="org.moblin.connman"/>
-     </policy>
-     <policy context="default">
--        <deny send_destination="org.moblin.connman"/>
-+        <allow send_destination="org.moblin.connman"/>
-     </policy>
- </busconfig>
diff --git a/meta/recipes-connectivity/connman/connman_git.bb b/meta/recipes-connectivity/connman/connman_git.bb
deleted file mode 100644
index 54ac4a5..0000000
--- a/meta/recipes-connectivity/connman/connman_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require connman.inc
-
-SRCREV = "36e877dece72577a3ae6197eafd505d0e6e0c1d2"
-PV       = "0.47+git${SRCPV}"
-PR       = "r17"
-S        = "${WORKDIR}/git"
-
-SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git;protocol=git \
-            file://dbusperms.patch \
-            file://connman "
-
-- 
1.7.2.5



