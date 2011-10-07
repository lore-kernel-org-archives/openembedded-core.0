Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDxA-0005ei-6a
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:11:20 +0200
Received: by yxj17 with SMTP id 17so3903734yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qkKl8FIVgIEhO8Flljfv+gAgqcO8329r+PhkrxsRPIs=;
	b=qjyrO08vBXcVzo+vU28ILvLQ+pGSAm+0t9lwfxN/Cl7pdBJSV3gHR1yXAZLqS9s+Lk
	+HShNrUtenofoOdCL79xZF1USK3p/yBWC/vODen5KJBawjhJPAAANDS/Wu8XzjEY73CF
	0jrdBWaNjNMHu/2PLNA1meAwIlsTW3oIWTAV8=
Received: by 10.223.14.153 with SMTP id g25mr9574987faa.6.1318007142522;
	Fri, 07 Oct 2011 10:05:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w14sm13602465fae.13.2011.10.07.10.05.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:05:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:04:57 +0200
Message-Id: <50599f80ccd16909e8df49699c01bb14ae79faa4.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 02/31] xserver-xorg: remove old git recipe
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
X-List-Received-Date: Fri, 07 Oct 2011 17:11:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg_git.bb               |   25 --------------------
 1 files changed, 0 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
deleted file mode 100644
index beef06a..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require xserver-xorg.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-SRCREV = "6689e8add183835274a70ee013e5d3bc8023681f"
-PE = "1"
-PR = "r3"
-PV = "1.10+git${SRCPV}"
-
-PROTO_DEPS += "xf86driproto dri2proto"
-
-DEPENDS += "font-util"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/xserver;protocol=git;branch=master \
-           file://crosscompile.patch; \
-           file://fix_macros1.patch;"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
-
-EXTRA_OECONF += "--enable-dri --enable-dri2 --enable-dga"
-
-S = "${WORKDIR}/git"
-- 
1.7.7



