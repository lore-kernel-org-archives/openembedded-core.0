Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE0o-0006Nm-K8
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:15:06 +0200
Received: by ywf7 with SMTP id 7so3898572ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yQEgwiMDuXOkZzX6ePf0cYmvb+gitR3+3fm6O3Iqgi8=;
	b=UM0QprXy56fS7aIdf4mDJxGd0dshQkd4mM/rSWfAAWG5kLyjn/+ecB0HHXWsEJNm6d
	1wXZ6eWfgMBX6gqEQI1+dnbY/MpZJ1W5bUEg/QGsOAXcRWAHwCUmy7hbpAZI0wHhD9SW
	gqUmvXvnDkhV2g0C9I6A6HYBwzDvthH3XEz1I=
Received: by 10.223.85.139 with SMTP id o11mr11980179fal.0.1318007364731;
	Fri, 07 Oct 2011 10:09:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm13635871faf.7.2011.10.07.10.09.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:09:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:24 +0200
Message-Id: <a3289b6f0dac21d127ea12074eee723f40143c9a.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 29/31] mesa-dri-glsl-native: drop recipe which wasn't usefull since 7.8.2 was removed
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
X-List-Received-Date: Fri, 07 Oct 2011 17:15:06 -0000

* it will be added again with 7.11 but with different content (builtin_compiler, instead of glsl)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../mesa/mesa-dri-glsl-native_7.8.2.bb             |   27 --------------------
 1 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb

diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
deleted file mode 100644
index d6f2c33..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "gl shader language specific build from mesa-dri"
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://apps/compile.c;endline=26;md5=27c2833286ce9566b162bcbe21d5b267"
-PR = "r0"
-
-DEPENDS = "makedepend-native"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6be2d343a0089bfd395ce02aaf8adb57"
-SRC_URI[sha256sum] = "505bf418dceba05837f4ea1b1972b9620c35f8cb94bc4d1e6d573c15f562576d"
-
-S = "${WORKDIR}/Mesa-7.8.2/src/glsl/"
-
-inherit native
-
-# use default config for native build
-do_configure_prepend() {
-	ln -s ${S}/../../configs/default ${S}/../../configs/current
-}
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 755 ${S}/apps/compile ${D}/${bindir}/glsl-compile
-}
-- 
1.7.7



