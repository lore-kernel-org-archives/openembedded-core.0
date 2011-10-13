Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJb2-00043l-I0
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:37:08 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8qXQm74NW4b70jePBlw5YSvNI89fbi65TReLUWLh1Rc=;
	b=uWXyp/L9PfY12ELwRA3N/QxdvXUDMfkZOpbGl5PxeeyprY1FzpAgzz4wPw9dWULp84
	/MkILadE0L6P/cOpvcoLbLSNfJ9SVbWVVYFNIw8T0qWkoNCrp2cyNl0Cxb1Uc9xBAwZc
	yNHoK/f/+VHD0qjqOY7TTKNnM3hLIkQlKzOK4=
Received: by 10.204.156.1 with SMTP id u1mr2425274bkw.18.1318505487042;
	Thu, 13 Oct 2011 04:31:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm3297644bka.0.2011.10.13.04.31.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:31:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:24 +0200
Message-Id: <80203f26760f13006c67fc036488e666153c5b29.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 06/20] mesa-common: add common LIC_FILES_CHKSUM for newer mesa versions
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
X-List-Received-Date: Thu, 13 Oct 2011 11:37:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc   |    1 +
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb  |    2 --
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb |    2 --
 3 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index b3d1c8f..fb9a216 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -10,6 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2;name=mesalib \
            ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaDemos-${PV}.tar.bz2;name=mesademos "
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 6fc8d95..5f15091 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -1,7 +1,5 @@
 include mesa-common.inc
 
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
-
 PROTO_DEPS = "xf86driproto glproto dri2proto"
 LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat \
             libxml2-native"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index 1e0d95e..8b83378 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -7,8 +7,6 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
 SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
 
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
-
 PROTO_DEPS = "xf86driproto glproto"
 LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
 
-- 
1.7.7



