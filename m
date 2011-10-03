Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiin-0005Ww-JV
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:38:17 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yQEgwiMDuXOkZzX6ePf0cYmvb+gitR3+3fm6O3Iqgi8=;
	b=KENTdk/jHagtZo0nY5YTTG7EFelZQyXFhES/Hj2jXHjKCkxhxmvLRpAXLU/ulzPWJv
	ewFOSh6gskit540EYb1UgRa2zZYFf6TTMQapo1gz9GigfwvWY40f6Z2casUwm84MxT52
	ad4IsA/J+HG4NITOKWUiuUph29TD/s7nz7z1I=
Received: by 10.204.7.70 with SMTP id c6mr9269456bkc.149.1317648767555;
	Mon, 03 Oct 2011 06:32:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l15sm13231437bkw.9.2011.10.03.06.32.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:32:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:59 +0200
Message-Id: <05e4b882a33b013665a192a6560ed09d64da3b86.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 28/30] mesa-dri-glsl-native: drop recipe which wasn't usefull since 7.8.2 was removed
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
X-List-Received-Date: Mon, 03 Oct 2011 13:43:17 -0000

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



