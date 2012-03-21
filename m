Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATLS-0002fL-U8
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:45:26 +0100
Received: by wibhj13 with SMTP id hj13so6203624wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=66p64b9UjdIQN8WG2RIMmZgEdDdK/moUFG+CWXzzpsY=;
	b=08HO0q/fLfQBDaDJItg2HVOqLliBj0y5nI2ZWdZswF+CNZIL0zzVlJD8/NJxOZZ3JB
	hIx5CknLj16JKg+ekmlhDG4C8LQI4wswVbXE+xKpscrZC9TndBjSlfqec07pHhjcGoFP
	QDZqiJiF0loDTi/P+ApQvkhXrgfTqDCH2ESEKmiNyUlBr2wo9hLlN0sABaaqkjsscpI/
	qVs54wvrwXwmn/6qMXUABOUxMOkg0g+j70wFhEPOGd+F/3r4Fjt0V6QvCgvHX5WmH6ba
	K/PYd/KTaJVP/KFGkcVXyhIL1OSolmm+RZaMQoUarQzQiz0RH7BGREim3qHAm15/arrn
	hHdg==
Received: by 10.180.24.7 with SMTP id q7mr41675728wif.11.1332365792930;
	Wed, 21 Mar 2012 14:36:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm12444544wid.2.2012.03.21.14.36.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:36:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:07 +0100
Message-Id: <64a1f5c5c46e844e12e2b43c356bb16fecee6cde.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/13] xev: move from meta-demoapps
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
X-List-Received-Date: Wed, 21 Mar 2012 21:45:27 -0000

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



