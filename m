Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 15D4F7FDBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:00:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id t14so1794278plr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TmsiGe6OmJp5jLP06gHIjo5j1E0pp3iltGxLEe+Clt0=;
	b=rUpJ7h3XUHs0uB/uF9vscgDegrOKqsFem9j6mxE6XJ3Kir6GHBTspcsX1ZPaGf9yPi
	KVFQ2lXmBIk1nvurE+zqVzJg7aVOCtRL/z2MClslUB4msl6eRow/By0Fd0uBus0YNZ9q
	tFDZNx5AtiTwyyjv8xFVgWTddoZAsIWwnFmkHV+uVKGUpRbdSV/uOCZsioX+p+ln5J6R
	HEMwZCbiVdERxekCSFX+lnO1eHP3ZSpu+i7C3diSLsCtkSQvhsHQ7mknlGDC1P20urjy
	fLFU7LyNftuYIP/GwP9MEMT1US+qU0ws0wBiRhSfFmHE4gKFOLsdz+U8Dk8xkdPk+Z4v
	gPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TmsiGe6OmJp5jLP06gHIjo5j1E0pp3iltGxLEe+Clt0=;
	b=UiwvugG8DwGcR6at9mVl6qXdHR76oiN2Sxssr4j6XVpa8UUCK3eXTgiVuwk6OmjOkO
	nCmuESBmGnSI7GS7rgXXg7BdCX6dWOZb+WJBrEFKopNufCJcI3T7jSf4IAOms+al19pO
	lPtgFgsR6k+3owVUwV3FYdHm6Iz4BKtxP6S/rYIVnP0lFi7GvFyhH9g1KGWMCoIwGNSw
	z6lspDP94o1NQIwxTGlrMEKm3MbQsj9LudjR1G7gNidw7vCo9O2D1W4Zo76SEAtgs1zl
	LZyazv1ul2RvjdS17Qg8Ld1kemIs6xUXM2Jh2eiogAxvveWJX9kzCFkZjckMpDiyuWet
	1r8w==
X-Gm-Message-State: APjAAAXFsOPfiOAT14ZhIQB1rwB90/Rxnjar7nqFmvArHotLTibv6x7x
	7ctxHJLuMQScffCp5jArccWrJ1Lsl4k=
X-Google-Smtp-Source: APXvYqyjQKollo245rd1q49R7wUhqLGdm0Ki4zWnG79Ir8nh/lsP9sbMybJGnM8nD2AxyyQuVomc5g==
X-Received: by 2002:a17:902:524:: with SMTP id
	33mr18392032plf.241.1579809642746; 
	Thu, 23 Jan 2020 12:00:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	y38sm3806967pgk.33.2020.01.23.12.00.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:00:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 12:00:41 -0800
Message-Id: <9899541657a4c7c096850eb48b2949c2e42daab0.1579809439.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579809439.git.raj.khem@gmail.com>
References: <cover.1579809439.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libucontext: Add recipe
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
X-List-Received-Date: Thu, 23 Jan 2020 20:00:42 -0000
Content-Transfer-Encoding: 8bit

Help musl based systems provide ucontext APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-pass-LDFLAGS-to-link-step.patch      | 31 ++++++++++
 meta/recipes-core/musl/libucontext_git.bb     | 62 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
 create mode 100644 meta/recipes-core/musl/libucontext_git.bb

diff --git a/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch b/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
new file mode 100644
index 0000000000..0ab8caf3e6
--- /dev/null
+++ b/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
@@ -0,0 +1,31 @@
+From 12d45d250d08e96e889e38e77273c3ef73e6fc97 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Nov 2019 15:07:35 -0800
+Subject: [PATCH] pass LDFLAGS to link step
+
+This helps to use OE specific linker flags and fixes
+
+do_package_qa: QA Issue: No GNU_HASH in the ELF binary
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8a605fd..d1c9637 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,7 @@ ${LIBUCONTEXT_STATIC_NAME}: ${LIBUCONTEXT_OBJ}
+ 
+ ${LIBUCONTEXT_NAME}: ${LIBUCONTEXT_OBJ}
+ 	$(CC) -o ${LIBUCONTEXT_NAME} -Wl,-soname,${LIBUCONTEXT_SONAME} \
+-		-shared ${LIBUCONTEXT_OBJ}
++		-shared ${LIBUCONTEXT_OBJ} ${LDFLAGS}
+ 
+ ${LIBUCONTEXT_SONAME}: ${LIBUCONTEXT_NAME}
+ 	ln -sf ${LIBUCONTEXT_NAME} ${LIBUCONTEXT_SONAME}
+-- 
+2.24.0
+
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
new file mode 100644
index 0000000000..72e15aa9a4
--- /dev/null
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -0,0 +1,62 @@
+# Copyright (C) 2019 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "ucontext implementation featuring glibc-compatible ABI"
+HOMEPAGE = "https://github.com/kaniini/libucontext"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=864cc1445419406b7093e8e531c9515e"
+SECTION = "libs"
+DEPENDS = ""
+
+PV = "0.1.3+${SRCPV}"
+SRCREV = "e6b4d7516dae9b200e94fcfcb9ebc9331389655f"
+SRC_URI = "git://code.foxkit.us/adelie/libucontext.git;protocol=https \
+           file://0001-pass-LDFLAGS-to-link-step.patch \
+"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = ".*-musl.*"
+
+valid_archs = "\
+i386 x86 \
+ppc powerpc powerpc64 ppc64  \
+arm aarch64 \
+s390 \
+"
+
+def map_kernel_arch(a, d):
+    import re
+
+    valid_archs = d.getVar('valid_archs').split()
+
+    if   re.match('(i.86|athlon)$', a):         return 'x86'
+    elif re.match('x86.64$', a):                return 'x86_64'
+    elif re.match('armeb$', a):                 return 'arm'
+    elif re.match('aarch64$', a):               return 'aarch64'
+    elif re.match('aarch64_be$', a):            return 'aarch64'
+    elif re.match('aarch64_ilp32$', a):         return 'aarch64'
+    elif re.match('aarch64_be_ilp32$', a):      return 'aarch64'
+    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
+    elif re.match('p(pc|owerpc)', a):           return 'ppc'
+    elif re.match('p(pc64|owerpc64)', a):       return 'ppc64'
+    elif re.match('riscv64$', a):               return 'riscv64'
+    elif a in valid_archs:                      return a
+    else:
+        if not d.getVar("TARGET_OS").startswith("linux"):
+            return a
+        bb.error("cannot map '%s' to a linux kernel architecture" % a)
+
+export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
+
+CFLAGS += "-Iarch/${ARCH}"
+
+EXTRA_OEMAKE = "CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+
+do_compile() {
+    oe_runmake ARCH=${ARCH}
+}
+
+do_install() {
+    oe_runmake ARCH="${ARCH}" DESTDIR="${D}" install
+}
-- 
2.25.0


