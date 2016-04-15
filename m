Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBAD6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:09 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id fn8so4658572igb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=c82XyIwg8MACGPR+PTG5pkmFrghXcNUUFM5dsv0oQCU=;
	b=ckScETt3gOlyyHFg4UZepQBGveG+MEukSNHCWkoA27R4tCabBVEO/u5z6Q0SD+/o1w
	NUXyKQFAwa4qnrwS7RejmsfbCtfUHE8cRJu/lzO4o0gPj++XpL/5uOOBofKzYgofKkYM
	WfNjm7dnQ8ARfomwt8P9wFHFmCCwIk25lxatFNyU42ExD7Z82ttAJv4tBynJMd2y6ZX7
	UP7nYtm+sJ2H2XCKKkH0JlIoB+fEXLylXoZp12fQZ8VqWQ7C4FclzK1OvvD/iYCxUdoZ
	4IYyCOZhoEcHi/8XESM08jEEI7qXFWAfJx8ACh5WyIzwtUAUS5D01sWl13WQKlcepyIj
	a/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c82XyIwg8MACGPR+PTG5pkmFrghXcNUUFM5dsv0oQCU=;
	b=ghQPUyf+x/z4VkVTJyqAKhrYwOdG1FH1+MiZ/gILhQd66ADH9b55/FJM37jm+QkI9y
	P/VY8/GfJRd01cD0PWOD97syNIwa+5oXLgdDa/0ynIQWfIPpjt9HeY4+3YE27Cau7IK4
	EJvolt517QF4nuKvdiEo3SEZl9ef+p4ISB7cq7u3Hjxdnqno9evIb42haOxQREVLmtpL
	6r3iUZSVbQsUf3y4gI5Ovf/W0ihujclrZaEu407vZzMkAApxFcRHzDDT78wH6DVwbIve
	/rb6cgCSSClkKYJPKh+atvvn+aZ3OwngBurQLKsMTdbMvwkuuRW/GGYByfzS0yzZKGJO
	K5Aw==
X-Gm-Message-State: AOPr4FXAx0sPRhVep65p2fNUhBaMadtzaFyYtWIe97UdpihEpPA1dKUDpsyTUDjuSVWhgA==
X-Received: by 10.50.93.138 with SMTP id cu10mr7909511igb.96.1460764810745;
	Fri, 15 Apr 2016 17:00:10 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:09 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:53 -0700
Message-Id: <1460764798-12701-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
References: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [2.2][PATCH 2/7] pixman: update 0.32.8 -> 0.34.0
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch | 144 ---------------------
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |  65 ----------
 .../xorg-lib/pixman/mips-export-revert.patch       |  22 ----
 .../{pixman_0.32.8.bb => pixman_0.34.0.bb}         |   7 +-
 4 files changed, 2 insertions(+), 236 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.8.bb => pixman_0.34.0.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
deleted file mode 100644
index 4569dca..0000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From a0f53e1dbb3851bb0f0efcfdbd565b05e4be9cac Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 23 Aug 2012 18:10:57 +0200
-Subject: [PATCH 1/2] ARM: qemu related workarounds in cpu features detection
- code
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This was ported from meta-oe's patch [1]. The original pixman patch is found
-at [2].
-
-[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
-[2] http://lists.freedesktop.org/archives/pixman/2011-January/000906.html
-
-Upstream-Status: Inappropriate [other] qemu fix
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- pixman/pixman-arm.c |   82 ++++++++++++++++++++++++++++++++++++++++----------
- 1 files changed, 65 insertions(+), 17 deletions(-)
-
-diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
-index 23374e4..d98bda6 100644
---- a/pixman/pixman-arm.c
-+++ b/pixman/pixman-arm.c
-@@ -129,16 +129,35 @@ detect_cpu_features (void)
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/mman.h>
-+#include <sys/utsname.h>
- #include <fcntl.h>
- #include <string.h>
- #include <elf.h>
- 
-+/*
-+ * The whole CPU capabilities detection is a bit ugly: when running in
-+ * userspace qemu, we see /proc/self/auxv from the host system. To make
-+ * everything even worse, the size of each value is 64-bit when running
-+ * on a 64-bit host system. So the data is totally bogus because we expect
-+ * 32-bit values. As AT_PLATFORM value is used as a pointer, it may cause
-+ * segfault (null pointer dereference on x86-64 host). So in order to be
-+ * on a safe side, we require that AT_PLATFORM value is found only once,
-+ * and it has non-zero value (this is still not totally reliable for a big
-+ * endian 64-bit host system running qemu and may theoretically fail).
-+ */
-+#define ARM_HWCAP_VFP 64
-+#define ARM_HWCAP_IWMMXT 512
-+#define ARM_HWCAP_NEON 4096
-+
- static arm_cpu_features_t
- detect_cpu_features (void)
- {
-     arm_cpu_features_t features = 0;
-     Elf32_auxv_t aux;
-     int fd;
-+    uint32_t hwcap = 0;
-+    const char *plat = NULL;
-+    int plat_cnt = 0;
- 
-     fd = open ("/proc/self/auxv", O_RDONLY);
-     if (fd >= 0)
-@@ -147,32 +166,61 @@ detect_cpu_features (void)
- 	{
- 	    if (aux.a_type == AT_HWCAP)
- 	    {
--		uint32_t hwcap = aux.a_un.a_val;
--
--		/* hardcode these values to avoid depending on specific
--		 * versions of the hwcap header, e.g. HWCAP_NEON
--		 */
--		if ((hwcap & 64) != 0)
--		    features |= ARM_VFP;
--		if ((hwcap & 512) != 0)
--		    features |= ARM_IWMMXT;
--		/* this flag is only present on kernel 2.6.29 */
--		if ((hwcap & 4096) != 0)
--		    features |= ARM_NEON;
-+		hwcap = aux.a_un.a_val;
- 	    }
- 	    else if (aux.a_type == AT_PLATFORM)
- 	    {
--		const char *plat = (const char*) aux.a_un.a_val;
--
--		if (strncmp (plat, "v7l", 3) == 0)
-+		plat = (const char*) aux.a_un.a_val;
-+		plat_cnt++;
-+	    }
-+	}
-+	close (fd);
-+	if (plat == NULL || plat_cnt != 1 || *plat != 'v')
-+	{
-+	    /*
-+	     * Something seems to be really wrong, most likely we are
-+	     * running under qemu. Let's use machine type from "uname" for
-+	     * CPU capabilities detection:
-+	     * http://www.mail-archive.com/qemu-devel at nongnu.org/msg22212.html
-+	     */
-+	    struct utsname u;
-+	    hwcap = 0; /* clear hwcap, because it is bogus */
-+	    if (uname (&u) == 0)
-+	    {
-+		if (strcmp (u.machine, "armv7l") == 0)
-+		{
- 		    features |= (ARM_V7 | ARM_V6);
--		else if (strncmp (plat, "v6l", 3) == 0)
-+		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
-+		    hwcap |= ARM_HWCAP_NEON; /* qemu is supposed to emulate neon */
-+		}
-+		else if (strcmp (u.machine, "armv6l") == 0)
-+		{
- 		    features |= ARM_V6;
-+		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
-+		}
- 	    }
- 	}
--	close (fd);
-+	else if (strncmp (plat, "v7l", 3) == 0)
-+	{
-+	    features |= (ARM_V7 | ARM_V6);
-+	}
-+	else if (strncmp (plat, "v6l", 3) == 0)
-+	{
-+	    features |= ARM_V6;
-+	}
-     }
- 
-+    /* hardcode these values to avoid depending on specific
-+     * versions of the hwcap header, e.g. HWCAP_NEON
-+     */
-+    if ((hwcap & ARM_HWCAP_VFP) != 0)
-+        features |= ARM_VFP;
-+    if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
-+        features |= ARM_IWMMXT;
-+    /* this flag is only present on kernel 2.6.29 */
-+    if ((hwcap & ARM_HWCAP_NEON) != 0)
-+        features |= ARM_NEON;
-+
-     return features;
- }
- 
--- 
-1.7.6.5
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
deleted file mode 100644
index 6b7c1e6..0000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From fcd5eb9bd0e8674a6f4987a8fce7dc1ba8f9320c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 17 Sep 2015 03:08:36 +0200
-Subject: [PATCH] [v3] test: add a check for FE_DIVBYZERO
-
-Some architectures, such as Microblaze and Nios2, currently do not
-implement FE_DIVBYZERO, even though they have <fenv.h> and
-feenableexcept(). This commit adds a configure.ac check to verify
-whether FE_DIVBYZERO is defined or not, and if not, disables the
-problematic code in test/utils.c.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Backport [commit 4297e9058]
----
-Changes v1 -> v2:
-
- * Use the ac_cv_have_decl_FE_DIVBYZERO variable, which is
-   automatically set by AC_CHECK_DECL, to decide whether or not
-   HAVE_FEDIVBYZERO should be defined.
-
-Changes v2 -> v3:
-
- * Use action-if-yes of AC_CHECK_DECL as suggested in
-   http://lists.freedesktop.org/archives/pixman/2014-February/003176.html
----
- configure.ac | 5 +++++
- test/utils.c | 2 ++
- 2 files changed, 7 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index f93cc30..424bfd3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -891,6 +891,11 @@ if test x$have_feenableexcept = xyes; then
-    AC_DEFINE(HAVE_FEENABLEEXCEPT, 1, [Whether we have feenableexcept()])
- fi
- 
-+AC_CHECK_DECL([FE_DIVBYZERO],
-+	[AC_DEFINE(HAVE_FEDIVBYZERO, 1, [Whether we have FE_DIVBYZERO])],
-+	[],
-+	[[#include <fenv.h>]])
-+
- AC_CHECK_FUNC(gettimeofday, have_gettimeofday=yes, have_gettimeofday=no)
- AC_CHECK_HEADER(sys/time.h, have_sys_time_h=yes, have_sys_time_h=no)
- if test x$have_gettimeofday = xyes && test x$have_sys_time_h = xyes; then
-diff --git a/test/utils.c b/test/utils.c
-index 222d4d5..8657966 100644
---- a/test/utils.c
-+++ b/test/utils.c
-@@ -966,9 +966,11 @@ enable_divbyzero_exceptions (void)
- {
- #ifdef HAVE_FENV_H
- #ifdef HAVE_FEENABLEEXCEPT
-+#ifdef HAVE_FEDIVBYZERO
-     feenableexcept (FE_DIVBYZERO);
-+#endif
- #endif
- #endif
- }
- 
- void
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch b/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
deleted file mode 100644
index 14a5fd2..0000000
--- a/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Revert a commit in pixman 0.32.6 which breaks compliation on MIPS machines with
-errors such as:
-
-pixman-0.32.6/pixman/pixman-mips-dspr2-asm.S:4267:
-Error: invalid operands `mflo $14,$ac3'
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
---- b/pixman/pixman-mips-dspr2-asm.h
-+++ a/pixman/pixman-mips-dspr2-asm.h
-@@ -72,10 +72,7 @@
- #define LEAF_MIPS32R2(symbol)                           \
-                 .globl  symbol;                         \
-                 .align  2;                              \
--#ifdef __ELF__
--                .hidden symbol;                         \
-                 .type   symbol, @function;              \
--#endif
-                 .ent    symbol, 0;                      \
- symbol:         .frame  sp, 0, ra;                      \
-                 .set    push;                           \
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
index 553ce36..2915265 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
@@ -30,13 +30,10 @@ EXTRA_OECONF_class-native = "--disable-gtk"
 EXTRA_OECONF_class-nativesdk = "--disable-gtk"
 
 SRC_URI += "\
-            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-            file://mips-export-revert.patch \
 	    file://asm_include.patch \
-	    file://0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch \
 "
 
-SRC_URI[md5sum] = "18d6b62abdb7bc0f8e6b0ddf48986b2c"
-SRC_URI[sha256sum] = "5c63dbb3523fc4d86ed4186677815918a941b7cb390d5eec4f55cb5d66b59fb1"
+SRC_URI[md5sum] = "002a4fcb644ddfcb4b0e4191576a0d59"
+SRC_URI[sha256sum] = "39ba3438f3d17c464b0cb8be006dacbca0ab5aee97ebde69fec7ecdbf85794a0"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
1.9.1


