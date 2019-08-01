Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 65AA87F573
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 17:19:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zxqt1tBQz3J
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 19:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564679994;
	bh=8b+ucgzKuxM9VCmTHwHlOmkfrcwT4GNuwViXUvnvKV8=;
	h=From:To:Subject:Date:From;
	b=hrgWMe2RdPsV8dXQEfYl1ruZx9vcMJ/fCjh3/2pVavHb1EsPIt1QZ264ywNhSLHH0
	Nvk5VGTVTJP8Gq7b8MjsZ/+GTAKISLe1gBfGQHrbGY8CZHUUNJexQbiWk95dv5hdnZ
	Xj5PTOUPi53BB/VmlwtasKD6ZrFDwJJchN5seg9eDWgS1xCegJCnkp0LamDToFEgad
	ZJNEqyaBBMfkiRSG8bq35FfHIu/IXviIbwHO87qtmq9eCvHQ38HJRswJuOYSFzYbPL
	LIxRBkPPhTFRmbmDonThzMvqwBlhu9kr8IRSLJ2UxPQVYsnMt8BUNlY01t/cWCWDoN
	XnZKpnaIgYShCsDv9qbJT3/+IYge9YM+AxoHvb7iyVHc6N7CNkcnOwwGx3Wkn6AMBu
	mC1M4+YLwJLADACxCsQz5gJGisfeFGuPYZtN40GuTOB+fB7CgIXZOgS7t5DPVa9JvO
	xMHdTlo9J62qg7smkl4wGPcGoRERJPkZjJGPIPasHZvSDMiX7IbpV/5W4hUvBCOJIB
	MFZ6kiX+GnsVg5C8B1EQTW/JxegiWLgaDpONDGLKsujiLfm7KkcpXHHt63DavIQJi0
	g5Fr4wPI2ndhaCGXGhl/pUsHgYsQUCUo65JpyeBrE1ibHf7jUFnI50+Xook+31eY9N
	sL6PBQOfJ219V8RYgJWI/4Yo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2019 20:19:53 +0300
Message-Id: <20190801171953.11331-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Use GNU_MIRROR in more recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2019 17:19:54 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-bsp/grub/grub2.inc             | 2 +-
 meta/recipes-devtools/gdb/gdb-8.3.inc       | 2 +-
 meta/recipes-support/libmpc/libmpc_1.1.0.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 13e21d75bb..9544b36884 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -11,7 +11,7 @@ SECTION = "bootloaders"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
diff --git a/meta/recipes-devtools/gdb/gdb-8.3.inc b/meta/recipes-devtools/gdb/gdb-8.3.inc
index a5ef936fbf..070c17d4a1 100644
--- a/meta/recipes-devtools/gdb/gdb-8.3.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
-SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
+SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0001-gdbserver-ctrl-c-handling.patch \
            file://0002-make-man-install-relative-to-DESTDIR.patch \
            file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
diff --git a/meta/recipes-support/libmpc/libmpc_1.1.0.bb b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
index 2d25d388f1..1e48c576d4 100644
--- a/meta/recipes-support/libmpc/libmpc_1.1.0.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
@@ -3,7 +3,7 @@ require libmpc.inc
 DEPENDS = "gmp mpfr"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
-SRC_URI = "https://ftp.gnu.org/gnu/mpc/mpc-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
 SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
-- 
2.17.1


