Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifP-0004Yv-8E
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:47 +0200
Received: by mail-yx0-f175.google.com with SMTP id 17so3397593yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QsF2s9DXq93VZQQyWxWehQWzgQW7eEwJL2BeRTHXV4U=;
	b=utm9+A/pVIorINuR+Iu8Ij/6638ZF+mmRE0iLwkKZ954GkIa1NdNqDxjJBReYu35b1
	9yG8J+whJ0tHkj4A+01aPY1BE1X9YyuetgZ4g4A4/aFDs2OKbp1v9HeFu4ZfCAt0ytE6
	I6SfP2qAD0ELgvUeWRQWFZWcxeTCB1EfH07XY=
Received: by 10.223.13.148 with SMTP id c20mr1207609faa.77.1317648556715;
	Mon, 03 Oct 2011 06:29:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h16sm21269699fab.19.2011.10.03.06.29.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:33 +0200
Message-Id: <d15cb86430bc80ff83e74ccfdce503ff58b81f3d.1317648040.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 02/30] xorg-app-common: merge some changes from meta-oe
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:47 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* use BPN directly instead of XORG_PN
* fix depends
* fix packaging
* add INC_PR (used by recipes in meta-oe now, but should be used here
  too)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
1.7.7



