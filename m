Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C0B1274D83
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p9-v6so13545471pgc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P8Cy9yHP3ospqj4iqrCq+T6yKLla2F2ZQaID7cLQDKo=;
	b=fQRYDzhxji9z0n9IvFrjffamYBtQMquy/7u0r2aUjVOCYntUyPjVPnMRmR9Uu9xYf7
	/5B0KwDaSeg0VC35YuGqWQmkeQPoqKGhB+4p5+iMDEmXFig1E8FZ43l/FqbxhNDMJXPr
	Subhc7+LKloDewbCEOcUU183BHDg4xQ0aG510emTi1fVzdGZavKLafx6vZa0R5ly/Vqs
	C3UeCH1LqfHauT7vXSOQWzELbzDjIZuQmvRGd+tnQIqPUZ9H/xYYc+LfXG2DnDB5EZB0
	NWKCiL77fjVi8ihgNAd/OmG8MFDKj5MvHA0RM3PZs2NykaFU6BQoT4yiU3gnI5Pg+KW9
	CQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P8Cy9yHP3ospqj4iqrCq+T6yKLla2F2ZQaID7cLQDKo=;
	b=f1y8Svd8nfiMq7pMblTc6nLYk7lNsBOXhtd4jtbCpKHj9N91OPrPeDiiwzFNKEikos
	D4g5EpJBHjTqCyDrzIxUXDrEuwCkjqBwelNcdpv8aTJ2GpRly7MpDa3zXCw1IopnootD
	KvV7tied71TX0PNUPCCmpYOmoCxz8jHcdIxjc4ZBgFeBr61UMnUnrqsXUq7hQGhu37ti
	AjmNWdfvIcIdf6Ci625AyQcnWy3c+Sv/sbwnd4ELY7aBP4lMVHUZWR8o4axcVci9jUAi
	hLqujiX7z0fEtQq2WDz+AgK/FuhKvH3mvY/F+EtOBAkn+nCpWHHOo2ct/LL6XGlhymiy
	Bq6w==
X-Gm-Message-State: ALQs6tC/3WBdPQUoPeVBfCAus+k1jcREbx8fPmOKHK4APBwypQ23uuNk
	EmqiLgnDWcVDvcSdh14PGK7p1A==
X-Google-Smtp-Source: AB8JxZoj8kitg8kfEbZvOflwODUuKdmc14EAuD+Ce31xXkE0iKkLX6DBSfKYm7sp1t6L/Kg3scl7MQ==
X-Received: by 10.98.130.140 with SMTP id w134mr20922935pfd.138.1525479264406; 
	Fri, 04 May 2018 17:14:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:13:55 -0700
Message-Id: <3e03f5a27608290b623503497c1885cf72d6b18d.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 01/27] libssp-nonshared: Add recipe
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
X-List-Received-Date: Sat, 05 May 2018 00:14:24 -0000

libssp-nonshared is a minimal gcc runtime piece which is needed
on non-glibc systems which do implement libssp APIs in libc

Use PIE flags to compile libssp_nonshared.a so it works with
security flags on as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libssp-nonshared.bb    | 39 ++++++++++++++++
 .../musl/libssp-nonshared/ssp-local.c         | 45 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c

diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
new file mode 100644
index 0000000000..458eafef52
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
+	${CC} ${CPPFLAGS} ${CFLAGS} -fPIE -c ssp-local.c -o ssp-local.o
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


