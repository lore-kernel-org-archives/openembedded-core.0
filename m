Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6GO-00071o-0x
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:37:44 +0100
Received: by mail-iy0-f175.google.com with SMTP id j38so4678110iad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qoTSlaEU7YIuic0jCQ4Kyb5s+qd2ToXG3+9Ex57/6lY=;
	b=I3ufoYcnvMBCRc8Ib7gD+1xL9YcXegmOEmTT3nIJLihd2y52NwBRP3jOx/NghMnHxr
	q+wh677F52N/RB5HTK2zE6fxKvrICv9YlF9zttu9Ks+sznUeIyEGQfyBykcFgvScGBUr
	bBRSntoiGvw+1wuEDrPJLRB+zhniK6IeucOcc=
Received: by 10.42.76.66 with SMTP id d2mr3753253ick.7.1323459054953;
	Fri, 09 Dec 2011 11:30:54 -0800 (PST)
Received: from localhost.localdomain (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id wo4sm19305554igc.5.2011.12.09.11.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 11:30:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 11:30:45 -0800
Message-Id: <66bfa997b04bc6dc4c77c5e87f38c86ac3f30d0a.1323458858.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323458858.git.raj.khem@gmail.com>
References: <cover.1323458858.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] qemu-0.15.1: Bump recipes from 0.15.0 to 0.15.1
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
X-List-Received-Date: Fri, 09 Dec 2011 19:37:44 -0000

No other changes (except checksum updates) then git mv were needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{qemu-0.15.0 => qemu-0.15.1}/arm-bgr.patch     |    0
 .../enable-i386-linux-user.patch                   |    0
 .../fallback-to-safe-mmap_min_addr.patch           |    0
 .../fix-configure-checks.patch                     |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/fix-nogl.patch    |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/glflags.patch     |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/init-info.patch   |    0
 .../larger_default_ram_size.patch                  |    0
 .../linker-flags.patch                             |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/no-strip.patch    |    0
 .../opengl-sdl-fix.patch                           |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/powerpc_rom.bin   |  Bin 4096 -> 4096 bytes
 .../qemu-git-qemugl-host.patch                     |    0
 .../qemu-vmware-vga-depth.patch                    |    0
 .../qemugl-allow-glxcontext-release.patch          |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/qemugl-fix.patch  |    0
 .../qemu/{qemu_0.15.0.bb => qemu_0.15.1.bb}        |    6 ++----
 17 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/arm-bgr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fix-configure-checks.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fix-nogl.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/glflags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/linker-flags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/opengl-sdl-fix.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemu-git-qemugl-host.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemu-vmware-vga-depth.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemugl-allow-glxcontext-release.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemugl-fix.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu_0.15.0.bb => qemu_0.15.1.bb} (88%)

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/enable-i386-linux-user.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/enable-i386-linux-user.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/fallback-to-safe-mmap_min_addr.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/fallback-to-safe-mmap_min_addr.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/fix-configure-checks.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/fix-configure-checks.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/fix-nogl.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/fix-nogl.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/glflags.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/glflags.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/glflags.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/glflags.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/init-info.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/init-info.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/init-info.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/init-info.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/larger_default_ram_size.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/larger_default_ram_size.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/linker-flags.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/linker-flags.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/no-strip.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/no-strip.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/no-strip.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/no-strip.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/opengl-sdl-fix.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/opengl-sdl-fix.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_rom.bin b/meta/recipes-devtools/qemu/qemu-0.15.1/powerpc_rom.bin
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_rom.bin
rename to meta/recipes-devtools/qemu/qemu-0.15.1/powerpc_rom.bin
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-git-qemugl-host.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/qemu-git-qemugl-host.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemugl-allow-glxcontext-release.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/qemugl-allow-glxcontext-release.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemugl-fix.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/qemugl-fix.patch
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.0.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
similarity index 88%
rename from meta/recipes-devtools/qemu/qemu_0.15.0.bb
rename to meta/recipes-devtools/qemu/qemu_0.15.1.bb
index e2e1340..7eea924 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,8 +3,6 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r1"
-
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
 
@@ -39,7 +37,7 @@ SRC_URI_append_virtclass-nativesdk = "\
     ${QEMUGLPATCHES} \
     file://glflags.patch \
     "
-SRC_URI[md5sum] = "dbc55b014bcd21b98e347f6a90f7fb6d"
-SRC_URI[sha256sum] = "0197e52dba07aeb6dfe0343b0c2ae08ed374d2cb0af3bb9ec73fed5baa0cb74d"
+SRC_URI[md5sum] = "34f17737baaf1b3495c89cd6d4a607ed"
+SRC_URI[sha256sum] = "7705b14d9b8e4df4a0b1790980e618084261e8daef0672a1aa7a830a0f3db5ba"
 
 S = "${WORKDIR}/qemu-${PV}"
-- 
1.7.5.4



