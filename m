Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id B335B7FF24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:48 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id s64so4043115pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=d/SZiT0mQoYwjPZP2rCC/SkCsZH/AiAqRkpto87usb8=;
	b=rz7O4bB5KjH+uLDGZsDykYYbaTs5+/bNQWI7DRvz/qwdKPKCltDS4Q0Jxhg3z/wlDd
	44QcFNUxdgj2YaWuFg1AJt2PR4+O1eUHcXj9gCybQL1tUJxQEPFIOxMGBmVo2MQqSY/N
	ITIz0DorugEUUMwHBTrnuV/iG17pbNT7Evy3zU5RxTV1Mlc7qn6F6WDFM9KlHHFeABRN
	8Mca8B7+FfiWGIHfzkuXJ9GSeXIFDeqySmGDapHdhQmwJaIbKbsx5zSiJpf9VFOzhL89
	82ZR1zPQgI0/w1q+mXalIYWCl/Y1128W0PLUqRmfc/IeL5JqkZPxhnKOsYKZGqUduIvr
	BjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d/SZiT0mQoYwjPZP2rCC/SkCsZH/AiAqRkpto87usb8=;
	b=rkkwXUKEgesnvE+ck7Ky8cdpsesfOJHEoNYLfX2zk7r2dIp+E927a+Bm9r53v1m31y
	t8t5njckzf95lX3FGDfCiXxi9XH0beZyFkA6+cryYqbKvWfm6L4ixLyc7jmVs9RoBeWJ
	F/7FtsQ1EWrYzVM+Yi1GCNCsLNdqPA+5shfGOEhLpjRRoL3yXNjwlJq86WQA4rapdOab
	c6xFFs95uJrakrSS3YAnNgsVsCubcWDwHQD2THs+cTLZDC0HVKcv8bdwmWvEPToXfOSE
	lza2HWQqmHhEm4KZmdGPXwQZdTvPT/SsuDnIpgduPcuTCf1dQ8yYjl0LWFm6QVJVVDbU
	6b9w==
X-Gm-Message-State: APjAAAUfl5z21N8bo/+GBLq6z3ZCmxsPYdebtzfCi36/O8r9P862xoyZ
	GF3PXlp0FuG0om3Ex+cXoXF29eWJ/XU=
X-Google-Smtp-Source: APXvYqy/sbZziMP8mm11PXBW907zyEl4NKH2Tkc70qxcmFfaEOsZVu1ZEhQkUZC0CrO2T9QddAHJuQ==
X-Received: by 2002:a63:30c:: with SMTP id 12mr15495520pgd.276.1580066869326; 
	Sun, 26 Jan 2020 11:27:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:38 -0800
Message-Id: <92e35b405cd06d2fe886788f7058e3a2075ff82c.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] libucontext: Add recipe
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:48 -0000
Content-Transfer-Encoding: 8bit

Help musl based systems provide ucontext APIs, these APIs are used in
some common applications e.g. chromium browser

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-pass-LDFLAGS-to-link-step.patch      | 31 ++++++++++
 meta/recipes-core/musl/libucontext_git.bb     | 62 +++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
 create mode 100644 meta/recipes-core/musl/libucontext_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 01afc25b93..a80e85a2f6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -386,6 +386,7 @@ RECIPE_MAINTAINER_pn-libtirpc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
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


