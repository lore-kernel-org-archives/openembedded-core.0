Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1486.1793986361863078915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IoRTrJio;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ecbfea5f51so323567e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986361; x=1794591161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDhEWO18MKU8WKrMKeMpDYCCVNLUn9W+bJyUoWa8RlI=;
        b=IoRTrJiovvIu+mAAbAwiDvTX0V0P5fsbwwYSO1yKqVVVLlwjM6mnrUaeXHaDd4j5yw
         S4v+F9qSFTQRqRS67232sKK+v72kwAGLWIDQJMbNXHHIaOVfBNQPHnfPnsHiKbu3Rj0U
         W1ntFGWrXjMLKNmBGe9WAf+VhQy+Hf5g8lJ1ZrRkll4/ObfJk+Fd9pMs14Vk9z/S0k6n
         dKUR1p/co5i+8NGmW4eJDMWL8IVFLxqS56vwVtg9AfOtVTsvhv2TG9N1QVKlYFVtBIWE
         tDvhzPwBYOgFBIZRoLsjFCKFaW0PwLnCGHB4cNeJzfh4FXpdG7z/LJcFSRatnQukKWCR
         i/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986361; x=1794591161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDhEWO18MKU8WKrMKeMpDYCCVNLUn9W+bJyUoWa8RlI=;
        b=vZ+zDrctkpv3GSigYjWL9NjDO+SNrQ0+DIz8EExGlX/ElpDKUegbwuIt1lWDYLGIo2
         XcT+l0ha3kzAkMs6kih+is2IYE9h/IagZPjo82YEpdTPlyBdilBMYK1G9ld6iUqB1U9C
         Saq9FYue6G2G8ZxaruZt5GaYi9j99yKeeL0UMS4hYkAXaXQTecv7olM/gju5jm9ghIyq
         EV2TOg5r4LjTKrnbL/XsD9Bjqd0Au9NWHiaJ+TFwLR529whhj5RGVOOZSETFRSADbZoW
         CaJd5D0bC9YnZUUodsXJMIyQ0DbguCx2q7BmSF8avqtUluni9GncgDK0V/7wli3/uYXv
         aKvw==
X-Gm-Message-State: APuU4Z9nBVwZB5/YF0xWD2zyZYLE8nLD6C3uWhJGovdETL6gwHV6urjC
	FWw/5goQqIorqp4DalEgycYTBqmm7Wsu88GxnSmMdhFSOSplOZ1m9k4n
X-Gm-Gg: AYBFou3fekbuYeeiEn8D0T8cMuXASXvA0TM8I1iKQcVZS+5wJVs7PRHZzBXLGQyVn6a
	ikGQ2T2GXG8+RH0uKP7bbG9SWunWfEjlcyN1q1s4zaE4SJK7AVSRix2n6dciNqwhHqOM4zNKd8y
	gsMaxJw7Rwx09IyrJ+fVuImF02K/OXd1BI1zIMX9k5YznDGpE7JujmF1KLdfUjwIrKWsJMm+LNo
	VGJjShPw69LBSMuAjXuo0+PdquLMQz2Gv7eZ4YQ27/Olx3GbppeKjdnSHqbzethJ3owoz1IU/Dp
	oWVHibvAtcGIQ5rvPNeyMIwUyYbF7x3KBXgfX5Vk+9fF6ooHF9P8M3zX1AKcVcmJcYPfNYu4FXg
	Jo6eEdXi94QpIuRhaFbObSakyHnhHb9hwr9qjENaPnKuD3TsognBh0jqhn5gkJ0smfYhPDaUXti
	cr4XuOGh4H+NT96dy/KaAKuzVDM0J3ZG8/nJ5P6rOqvblGP7O0ah5UqYHuGAGZsRTtTRuMPIY58
	sq4b8uy9Lq9CcaQw1th46QawtSu00BFNJsQEu2wt3svZXOLXhGZM/QInYPHdBffUr9MHvglR0RA
	KY+75k7MWYNOQG8XIq/dZCfAtvkGF5U4fQeBX4IXz33mjgLT1jGtkBa+sZqCXE1YWlXfbQ9VqsD
	X2onwRJxWT0kxx4inGr9t+Mj9dRsZonbbnQ4aFLVzIeqHXXIJ+/uqVWxMBNfHGwaOJoSeDjdLKi
	xdMEo4oEJf9UvrslKMYDVCYqWnh7t5Vp+NTRYHlVCwwFE4Ei4=
X-Received: by 2002:a05:6122:2805:b0:5ea:fae8:e69e with SMTP id 71dfb90a1353d-5ecc43ed9d1mr1529079e0c.11.1793986360376;
        Fri, 06 Nov 2026 09:32:40 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 04/08] kernel-devsrc: add full and tarball PACKAGECONFIG levels
Date: Fri,  6 Nov 2026 12:32:31 -0500
Message-ID: <20261106173235.4155305-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249704
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 'source' PACKAGECONFIG packages what a debugger needs to debug a
kernel built for a specific MACHINE. Other use cases need the entire
tree, either installed in a rootfs or as a package on a feed.

Add two more levels to the same kernel-devsrc tree:

  full:    the whole source tree (without the git metadata), a
           superset of 'source', uncompressed at /usr/src/kernel.
  tarball: the whole tree as /usr/src/kernel-source-<version>.tar.bz2
           instead of uncompressed. It can't be debugged or built
           against, it is a copy to unpack elsewhere.

The scripts in a 'full' tree are not run from it, so unless 'build' is
also enabled, file dependencies are skipped for the package. Otherwise
it pulls in perl, python3, make, etc, and can fail to install when an
interpreter path isn't provided (/bin/awk on usrmerge).

With 'build', the file dependencies are kept, so a few scripts in the
tree that use #!/bin/awk or #!/bin/env (arm64 and x86 awk tools,
selftests) would make kernel-devsrc uninstallable: no package provides
those paths. Point them at ${bindir}, as the 'build' level already does
for the arm64 awk tools. The package QA file-rdeps check doesn't catch
this, since it is skipped for module-base recipes.

With 'build' and the whole tree ('full', or 'tarball' unpacked on the
target), more than 'make scripts prepare' can be built from it (the
kernel itself, modules_install, compressed images and modules, module
signing), so add the tools those run that aren't found by file
dependencies: perl, kmod, cpio, tar, gzip, xz, zstd, lz4 and openssl.
This is a fixed list, not derived from the kernel's configuration.
pahole (for BTF) isn't in oe-core, so it isn't included.

'tarball' adds bzip2 on its own: unpacking the tarball is the only
use of it, and tar runs bzip2 to do that.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 70 ++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3b83fd145c..46337bd79b 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -35,9 +35,20 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 #   source: the source needed to debug a kernel built for a specific
 #           MACHINE, see KERNELDEV_SOURCE_SPINE. No runtime dependencies,
 #           so it can go in a debug rootfs without the build tools.
+#   full:   the whole source tree (a superset of 'source').
+#   tarball: the whole source tree as /usr/src/kernel-source-<version>.tar.bz2,
+#           in place of the uncompressed tree from 'full'. Not usable by
+#           debuggers or for building, it is a copy to unpack elsewhere.
 PACKAGECONFIG ?= "build"
 PACKAGECONFIG[build] = ",,,${KERNELDEV_BUILD_RDEPENDS}"
 PACKAGECONFIG[source] = ",,"
+PACKAGECONFIG[full] = ",,"
+PACKAGECONFIG[tarball] = ",,,bzip2"
+
+# The scripts in a 'full' tree are not run from it, so unless 'build' needs
+# them, don't generate runtime dependencies from their interpreters (perl,
+# python3, make, ...).
+SKIP_FILEDEPS:${PN} = "${@'1' if bb.utils.contains('PACKAGECONFIG', 'full', True, False, d) and not bb.utils.contains_any('PACKAGECONFIG', 'build tarball', True, False, d) else '0'}"
 
 # The curated part of the 'source' level, copied in full along with
 # arch/${ARCH}. The rest (drivers, sound, samples, ...) is not curated: the
@@ -469,6 +480,45 @@ kernel_devsrc_install_source() {
     )
 }
 
+# The files of the whole source tree, NUL separated, for 'full' and
+# 'tarball'. Run from ${S}. The git metadata and kernel-meta are left out.
+kernel_devsrc_tree_files() {
+    find . -type d -name '.git*' -prune -o -type d -name '.kernel-meta' -prune -o -type f -print0
+}
+
+# The 'full' level: the whole source tree, without the git metadata.
+kernel_devsrc_install_full() {
+    kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
+
+    # With 'build' also enabled, this runs after it and copies over the
+    # source files it installed (cpio -u). Most are identical, but the
+    # 'build' level's customizations are lost: scripts/package/debian/rules
+    # comes back, and the arm64 awk and python shebang fixups are undone (the
+    # awk ones are redone below). Generated files from ${B} aren't in ${S}, so
+    # they are kept. Skipping the files 'build' installed isn't worth the
+    # complexity: 'full' is meant to be the whole tree.
+    (
+        cd ${S}
+        kernel_devsrc_tree_files | cpio --quiet --null -pdlu $kerneldir/build
+    )
+
+    # The whole tree brings in scripts the 'build' level doesn't copy, and
+    # some use #!/bin/awk or #!/bin/env, which no package provides. Point them
+    # at ${bindir}, keeping their arguments (awk -f). sed -i writes a new file,
+    # so the hardlinks into ${S} are not modified.
+    grep -rlZE '^#! */bin/(awk|env)( |$)' $kerneldir/build | \
+        xargs -0 -r sed -i -E -e '1s,^#! */bin/(awk|env)( |$),#!${bindir}/\1\2,'
+}
+
+# The 'tarball' level: the whole source tree, compressed.
+kernel_devsrc_install_tarball() {
+    (
+        cd ${S}
+        kernel_devsrc_tree_files | \
+            tar --null --no-recursion -cjf ${D}/usr/src/kernel-source-${KERNEL_VERSION}.tar.bz2 --files-from -
+    )
+}
+
 do_install() {
     kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
     install -d $kerneldir
@@ -496,18 +546,25 @@ do_install() {
         kernel_devsrc_install_build
     fi
 
-    # The 'source' level goes in the same tree, at /usr/src/kernel, which is
-    # where the kernel's debug info points.
-    if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'source', '1', '', d)}" ]; then
+    # The source levels go in the same tree, at /usr/src/kernel, which is
+    # where the kernel's debug info points. 'full' is a superset of 'source',
+    # and 'tarball' replaces the uncompressed 'full' tree.
+    if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'full', '1', '', d)}" ] &&
+       [ -z "${@bb.utils.contains('PACKAGECONFIG', 'tarball', '1', '', d)}" ]; then
+        kernel_devsrc_install_full
+    elif [ -n "${@bb.utils.contains('PACKAGECONFIG', 'source', '1', '', d)}" ]; then
         kernel_devsrc_install_source
     fi
+    if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'tarball', '1', '', d)}" ]; then
+        kernel_devsrc_install_tarball
+    fi
     chown -R root:root ${D}
 }
 
 # Ensure we don't race against "make scripts" during cpio
 do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
-FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
+FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH} /usr/src/kernel-source-*.tar.bz2"
 
 # Added to RDEPENDS:${PN} by the 'build' PACKAGECONFIG
 KERNELDEV_BUILD_RDEPENDS = "bc python3-core flex bison ${TCLIBC}-utils gawk"
@@ -521,3 +578,8 @@ KERNELDEV_BUILD_RDEPENDS += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-d
 KERNELDEV_BUILD_RDEPENDS += "gcc-plugins libmpc-dev"
 # 5.13+ needs grep for powerpc
 KERNELDEV_BUILD_RDEPENDS:append:powerpc = " grep"
+# With the whole tree as well ('full', or 'tarball' unpacked on target), more
+# than 'make scripts prepare' can be built: a whole kernel, modules_install,
+# compressed images and modules, module signing.
+KERNELDEV_FULL_BUILD_RDEPENDS = "perl kmod cpio tar gzip xz zstd lz4 openssl"
+KERNELDEV_BUILD_RDEPENDS += "${@bb.utils.contains_any('PACKAGECONFIG', 'full tarball', '${KERNELDEV_FULL_BUILD_RDEPENDS}', '', d)}"
-- 
2.43.0

