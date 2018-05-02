Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF916011A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 17:36:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j11so12371988pff.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4B6gRjxWukcyKw1uXHIL7W9BBV7aquIWyB5gGb3xgM4=;
	b=XJAikwp99WXofOLnO1EhYCJ+tvQkNDcG9ugb2XgDa2+BMsACdTqmv+tlXZRg9fF5zl
	JmZuJCKOLxuPwKa2ptlddRIjH23ZErQ+Tkmxh1DBkmJhd4c2P5GQfOgX2Kk5j6pWm0OT
	ON64+PHEBb+tov+y7d7kL61b2G8IHqACb7HhCNQlpUheBRJdY6WXpzVSETu+MaVSgTp3
	39VOHALdqMeekSRXLDBpkS3nit6h4f4ZhOhHWCSesrkgYDDXJBt04NNt5ghmHAo9Xxn3
	D5zCqfT6IxFh6ENDkz40CwarRy45hRnpsR0TfMe4W3naIDhlUzVSt7ahVu9hevRm5/Ko
	va6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4B6gRjxWukcyKw1uXHIL7W9BBV7aquIWyB5gGb3xgM4=;
	b=Bp3LnxX2uRz0BQRWD1IBmtVCOiKSgld1uyLvHfbZr4QffoEHRkBDQRgaPM4S279FTC
	QUEjdo+wXWyBzIHW/KAWOpnNCHdIC8fpORX+Pll9I7HqkLqiGpnBw5ZtwjENOVMgdXfO
	LHGiC/Ljq9e88VdBvmtg6JjzawXarT4r9lXiBWfgBnEKdE7kuy47Lw7wDAgwvOteFuc0
	slptYA5BGa1Ge6rJ7yGl2gUfo32UCz6QsUHP84Jt4WYOvhzXuFFwS99W+QQZEw7l0oiN
	cdiZEbxF3WEDhGl/t7Ownlmp3EGBLZGFS2VH249XlTUcsPo5ZwTxe/tpLumwdny1gegC
	ob8Q==
X-Gm-Message-State: ALQs6tC6xsBtN+Ov2VYj8fx6zIsDVpEq1DNighRhgAdVPsc5HBJLLUTw
	Q73e6GWkGSIWmqSh6LEgitxGyw==
X-Google-Smtp-Source: AB8JxZoHK0h/+sRkCQPIZybd5ny+jYZanN0hjPBxjWw/O5Y4L/GIgVkSyuL+ZMBFKDSC2+QN7cve4A==
X-Received: by 2002:a65:4dc7:: with SMTP id q7-v6mr7114978pgt.48.1525282611662;
	Wed, 02 May 2018 10:36:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::52a0])
	by smtp.gmail.com with ESMTPSA id
	f78sm25551172pfk.138.2018.05.02.10.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 May 2018 10:36:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2018 10:36:47 -0700
Message-Id: <20180502173647.15043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH V2 01/27] libssp-nonshared: Add recipe
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
X-List-Received-Date: Wed, 02 May 2018 17:36:52 -0000

libssp-nonshared is a minimal gcc runtime piece which is needed
on non-glibc systems which do implement libssp APIs in libc

Use PIC for libssp_nonshared.a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Compile as PIC

 meta/recipes-core/musl/libssp-nonshared.bb    | 39 ++++++++++++++++
 .../musl/libssp-nonshared/ssp-local.c         | 45 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c

diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
new file mode 100644
index 0000000000..07ac569c7e
--- /dev/null
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Minimal libssp_nonshared.a must needed for ssp to work with gcc on musl"
+LICENSE = "GPL-3.0-with-GCC-exception"
+LIC_FILES_CHKSUM = "file://ssp-local.c;beginline=1;endline=32;md5=c06d391208c0cfcbc541a6728ed65cc4"
+SECTION = "libs"
+
+SRC_URI = "file://ssp-local.c"
+
+PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
+
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+           virtual/${TARGET_PREFIX}gcc-initial \
+"
+
+do_configure[noexec] = "1"
+
+S = "${WORKDIR}"
+
+do_compile() {
+	${CC} ${CPPFLAGS} ${CFLAGS} -fPIC -c ssp-local.c -o ssp-local.o
+	${AR} r libssp_nonshared.a ssp-local.o
+}
+do_install() {
+	install -Dm 0644 ${B}/libssp_nonshared.a ${D}${base_libdir}/libssp_nonshared.a
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
+RDEPENDS_${PN}-staticdev = ""
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-staticdev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-core/musl/libssp-nonshared/ssp-local.c b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
new file mode 100644
index 0000000000..8f51afa2c1
--- /dev/null
+++ b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
@@ -0,0 +1,45 @@
+/* Stack protector support.
+   Copyright (C) 2005-2018 Free Software Foundation, Inc.
+
+This file is part of GCC.
+
+GCC is free software; you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free
+Software Foundation; either version 3, or (at your option) any later
+version.
+
+In addition to the permissions in the GNU General Public License, the
+Free Software Foundation gives you unlimited permission to link the
+compiled version of this file into combinations with other programs,
+and to distribute those combinations without any restriction coming
+from the use of this file.  (The General Public License restrictions
+do apply in other respects; for example, they cover modification of
+the file, and distribution when not linked into a combine
+executable.)
+
+GCC is distributed in the hope that it will be useful, but WITHOUT ANY
+WARRANTY; without even the implied warranty of MERCHANTABILITY or
+FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+for more details.
+
+Under Section 7 of GPL version 3, you are granted additional
+permissions described in the GCC Runtime Library Exception, version
+3.1, as published by the Free Software Foundation.
+
+You should have received a copy of the GNU General Public License and
+a copy of the GCC Runtime Library Exception along with this program;
+see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+<http://www.gnu.org/licenses/>.  */
+
+extern void __stack_chk_fail (void);
+
+/* Some targets can avoid loading a GP for calls to hidden functions.
+   Using this entry point may avoid the load of a GP entirely for the
+   function, making the overall code smaller.  */
+
+void
+__attribute__((visibility ("hidden")))
+__stack_chk_fail_local (void)
+{
+  __stack_chk_fail ();
+}
-- 
2.17.0


