Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3B08B6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:50:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h69so10060966pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UTPuHWzLvs/ZCe5P0BY30bHEYgYw1W0YvyFGo55arg8=;
	b=DmXOO5AYI9wf/39qZWlzsVE9biWO7eGAoe58uEPAPBHLGmDmKrAeIzx/hWjdKyUQXN
	GqS49wM3YCMDBQ1gZXuAGOdYQV2gGIUvwlGPJB/07DwH7UUbtIUg8STNVrwnx1vNagmw
	AUGxRCD8vlktDsp2u5vR8CYRHYbEUD9zfJEdYK9n4p5mPhUTBdgflMDGHv+0pbdWRHQC
	qxYOWjqMOyECiNtdAyeqbUj11elST0u3bgNr5QMrY1MHWHfc38mnESrUPQ7UvB5OfVVd
	kD3z2dkVzsk7x6sNghT/YhgkyxKuMHKwWkaCQEANxCSq92gqjkJqLHMajDBw24csvxkB
	MS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UTPuHWzLvs/ZCe5P0BY30bHEYgYw1W0YvyFGo55arg8=;
	b=sbRyVbhwYo/p3l35+/D2O4yWI7fjoTImpu5nxXRkrjf81hZq6fYgNNcY3Nkr4+aBhs
	gOPn0xF4doj5XyXNo5RkkWFU+OjFlRqh5Jy1qSqDppEpT5wjJkHFJ/gRv5JlZVSF+jZc
	5AcXxZQbanNO8rnlm6o4hw1S/Nd2qvmWv2zXhImwcPZLPPkySiBrMfTAGXtB8H2ffjtQ
	59cUAd2O5oDkFIr7qN24/rufj3HpASd6snGR4x0QYl3lOJH0bSSBlzrfUFTRbDYwU4NC
	Wcq741Egl4c/teg1TXJZBiDGG7D6RNNZRfPgqhK9U5SUgxrHKbe7mrrYk9Nnh6Ut8eOK
	nbOQ==
X-Gm-Message-State: ALQs6tAu2l2o+mVaYRUSO3Nk1JEZ8FNn/SRCsEhvRMMp93kU62T+4ncR
	IvrcocRbejgVCIGRvjvcLbngsw==
X-Google-Smtp-Source: AIpwx49Sr1fKA0O+ER+tzrWLmZVsFDilxEPOuZ3VLQbmJRKMw2QALPr6wG7H0uFFj0LNlNAxQlWjmA==
X-Received: by 10.101.71.138 with SMTP id e10mr11390266pgs.47.1523861433737;
	Sun, 15 Apr 2018 23:50:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	o13sm2388362pgn.54.2018.04.15.23.50.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:50:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:50:11 -0700
Message-Id: <20180416065014.29385-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/4] libssp-nonshared: Add recipe
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
X-List-Received-Date: Mon, 16 Apr 2018 06:50:33 -0000

libssp-nonshared is a minimal gcc runtime piece which is needed
on non-glibc systems which do implement libssp APIs in libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libssp-nonshared.bb    | 39 ++++++++++++++++
 .../musl/libssp-nonshared/ssp-local.c         | 45 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c

diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
new file mode 100644
index 0000000000..3afab30fa2
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
+	${CC} ${CPPFLAGS} ${CFLAGS} -c ssp-local.c -o ssp-local.o
+	${AR} r libssp_nonshared.a ssp-local.o
+}
+do_install() {
+	install -Dm 0644 ${B}/libssp_nonshared.a ${D}${base_libdir}/libssp_nonshared.a
+}
+
+PACKAGES = "${PN}"
+FILES_${PN} = "${base_libdir}/libssp_nonshared.a"
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
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


