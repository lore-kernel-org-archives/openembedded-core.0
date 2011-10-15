Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF12t-0006jI-Rw
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:00:48 +0200
Received: by bkat8 with SMTP id t8so3087329bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WXFPwbS1IeRzFL8WmKjPb64a3dS5hRtc+0CqL21cO1c=;
	b=sp/yGCgTZFN2MJAcDo4eDHW/bUwbhyTscEIsMoZODbfg6m7byEdky9/qrq1On15ApL
	DK+xfVUD5hxlIJ7Q7Za/7rrf76lODDsJtU3kvqL+O3kbWAKzqa4X0UVi3Nn0in9ehvin
	BiLe5vQ2MuNk4+scMvwLDddamlCofIvloYnjc=
Received: by 10.223.7.18 with SMTP id b18mr10029091fab.31.1318672501250;
	Sat, 15 Oct 2011 02:55:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n18sm9332072fah.2.2011.10.15.02.54.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 02:54:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Oct 2011 11:54:50 +0200
Message-Id: <1318672491-31826-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 1/2] mesa: package gl/egl/osmesa to separate packages
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
X-List-Received-Date: Sat, 15 Oct 2011 10:00:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 06ebb75..b8f2289 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -38,7 +38,16 @@ EXTRA_OECONF = "--enable-glu \
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-PACKAGES =+ "libglu libglu-dev"
-
+PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
+FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
+FILES_libosmesa = "${libdir}/libOSMesa.so.*"
+
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
+FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
+FILES_libegl-dbg += "${libdir}/egl/.debug/*"
-- 
1.7.7



