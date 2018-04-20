Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56BF274613
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 16:34:01 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w21-v6so5545760plq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9VteVIZC6xV5NGMqWIGNW7zaM7BqsV3zHAMrEpVXE0U=;
	b=hejPSt7GTgg/s7xhhbkQ4b1kUzJV92eRY0FKfOIs09WPKKOg0UV9MJ4uvS4K0NvJor
	5986187kmIUqxeeDZEQUxEPfu9Ovw+lTap46Y6cjh2GJEI4Fl9JBu3IhOrDT2eCJ4Cgn
	FrPRjtGskGKMeQ+zDYu7YS2hieXcmLxHKXb17llI6ieM0dfFWhh5yUyilQwKkybRs3fg
	hIB+rpUxTAYP5JHIwaqByTINiyFGNEsTWtJWksqNdrCh2Afvv4gWiIE2HhZ1tfqJG6S/
	QpWQrCe8x/cPAsRPYbFT7/hQ8VLJQwxStQRXHse5EBfld4TQR6cuPM1JGqda0Hv/3ysF
	5E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9VteVIZC6xV5NGMqWIGNW7zaM7BqsV3zHAMrEpVXE0U=;
	b=CwiWOSaG7qoyuW0dTtTLxASrrCmDtQg9GY9DrCahreF43DjReIius3yPQQGiVP+JpB
	6jynqslg5IUoxkiIBDdvPzSWzdO9fDlvOeByu398B3sp0IT83W2lxVf2Qy54za/An8iJ
	h0BnuwPYK78ORdtGbvuyG2occtOACMmxx5w3hhEZcqvYjDvFtVm4KVyowwaeUzKHxIkM
	1sr1BdcSgEhvrLCuYM+XbbFDjhpvCE8LTS0rELvE7r2yyKUoRVTeHEgGDV+L3Sc7YWx1
	wQFFGngE6SzyCWgj7EqOcy+9lI3tjIqd4YaeNj9dS5IWRAJIipnRUhpzLFaDMWWz/ODo
	8BrQ==
X-Gm-Message-State: ALQs6tAZdfAHa1oSZVjNE0XBz0XOo7s89RLGmlSLull5wzeYBBsxUqHa
	iBlKi3dizrRJi/RQKIeIJBp/KA==
X-Google-Smtp-Source: AIpwx4+V5djEkt+CrOpGvqpZMkOj3EmEBnqfHNWHgYCTypD7C6bhqZw3tmXSFhriOBhzsy8iorYwRA==
X-Received: by 2002:a17:902:822:: with SMTP id
	31-v6mr3148913plk.172.1524242042001; 
	Fri, 20 Apr 2018 09:34:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	204sm13450925pgf.61.2018.04.20.09.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 09:34:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 09:33:49 -0700
Message-Id: <20180420163354.12065-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH V2 1/6] libssp-nonshared: Add recipe
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
X-List-Received-Date: Fri, 20 Apr 2018 16:34:01 -0000

libssp-nonshared is a minimal gcc runtime piece which is needed
on non-glibc systems which do implement libssp APIs in libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Package into staticdev package

 meta/recipes-core/musl/libssp-nonshared.bb    | 39 ++++++++++++++++
 .../musl/libssp-nonshared/ssp-local.c         | 45 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c

diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
new file mode 100644
index 0000000000..00a0a3d411
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


