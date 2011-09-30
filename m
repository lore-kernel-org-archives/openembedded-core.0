Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9XbH-0005dc-1L
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:39 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506871bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=j9S/n4rvrmJauAFWkbXojgPyuD1lDG6a4vha6lHRw34=;
	b=cYxYIBfmxBvHEmpCZglcLhxQVPzVDir3qf00j0NKxlUfMhzrhhQs7ZxJKSeQUG1P//
	ytcpf4Tw0gvcO+Z4mjIm8G25WS+7zCXZ9LsRnvMTyqXdzpLVjxd3vJnfiT2MEzulQLBM
	+7L+sqmWfRnOfYCAYX00jqBfgx3OpiXOYzm4g=
Received: by 10.204.142.81 with SMTP id p17mr1534854bku.185.1317367692751;
	Fri, 30 Sep 2011 00:28:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m18sm3919640bkt.12.2011.09.30.00.28.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:28:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:17 +0200
Message-Id: <6b55c7aa32a4875efcaf7f19f6b59ade82d6bac0.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/13] xorg-app-common: merge some changes from meta-oe
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
X-List-Received-Date: Fri, 30 Sep 2011 07:33:39 -0000

* use BPN directly instead of XORG_PN
* fix depends
* fix packaging
* add INC_PR (used by recipes in meta-oe now, but should be used here
  too)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 4add357..86e5c23 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -3,14 +3,14 @@ HOMEPAGE = "http://www.x.org/"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/apps"
 LICENSE = "MIT-X"
-DEPENDS = "util-macros virtual/libx11"
+DEPENDS = "util-macros-native virtual/libx11"
 
-XORG_PN = "${BPN}"
+INC_PR = "r5"
 
-SRC_URI = "${XORG_MIRROR}/individual/app/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
-S = "${WORKDIR}/${XORG_PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools pkgconfig
 
-FILES_${PN} += "  /usr/lib/X11/${XORG_PN}"
+FILES_${PN} += "  /usr/lib/X11/${BPN} /usr/share/X11/app-defaults/"
-- 
1.7.6.1



