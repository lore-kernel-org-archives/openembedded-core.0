Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu5S-0005YU-OF
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:36:18 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EQAKBx93uZeQjmRQu5Sw3//kmgESQ0ofVral7oPysBU=;
	b=EnfJovjJV+OdMNllveX4i2BK2tmCR/arbgj3wd+2YWBgMaUHCo8e7/dZkp8/0YUeFF
	oyf2GoSuURdtR97oizFKVnETIpNShNF5U3mX5CSVgS/KIe9QmU7TNyXED7hwzPo6giZz
	OFfUuYzB92mh5qhCd7yvow2Zl8hhaTxgXtpWI=
Received: by 10.204.145.211 with SMTP id e19mr8894677bkv.55.1321029003090;
	Fri, 11 Nov 2011 08:30:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm9609635bkb.8.2011.11.11.08.30.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:30:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:44 +0100
Message-Id: <ada5f3bb531072e713e2017989c3f8df3a55c075.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 08/22] mesa: package gl/egl/osmesa to separate packages
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
X-List-Received-Date: Fri, 11 Nov 2011 16:36:18 -0000

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
1.7.8.rc1



