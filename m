Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAig2-0005Ww-A0
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:26 +0200
Received: by bke11 with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PE77Biukpofsk8fc/PwRIZoa77fpAj/4xoNOsN3bqes=;
	b=liigYNf5+uUiFkdt++il52Bhoh+Kh40H55E+c5glHIPag3Tcnl0+g8chN552R+zGMc
	H/k3igzQcnx1XiNKDVSGKjW5PHjXOawI5UNzCkQG98cjokEz0SKdtQw6CTuqbebTil4C
	0ySLDEbp+CYSgwLwMrgidkMGUo4jFSI/fNCSs=
Received: by 10.204.13.143 with SMTP id c15mr273211bka.22.1317648589243;
	Mon, 03 Oct 2011 06:29:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex8sm13238835bkc.2.2011.10.03.06.29.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:37 +0200
Message-Id: <d078b4d7631404328d557e34334e82305b6521ac.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 06/30] xserver/mesa: Bump PR after libdrm packaging changes
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:26 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    2 +-
 .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |    2 +-
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |    2 +-
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
index aac7a1c..68f89a2 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
@@ -8,7 +8,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat
 
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://crossfix.patch \
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index c4132d7..9e32d0a 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -13,7 +13,7 @@ DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
 
 SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
 PV = "7.7+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
index ea57140..035e39c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
@@ -7,7 +7,7 @@ PROTO_DEPS += "xf86driproto dri2proto"
 DEPENDS += "font-util"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://crosscompile.patch"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
index adefcdb..066ff13 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 SRCREV = "6689e8add183835274a70ee013e5d3bc8023681f"
 PE = "1"
-PR = "r0"
+PR = "r1"
 PV = "1.10+git${SRCPV}"
 
 PROTO_DEPS += "xf86driproto dri2proto"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
index f9b3a64..5575c0f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
@@ -2,7 +2,7 @@ require xserver-xf86-lite.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "font-util"
 
-- 
1.7.7



