Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9kq0-0003Yb-T3
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:46:17 +0200
Received: by mail-iy0-f175.google.com with SMTP id y10so2705988iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 15:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=xgxB5ffxxmEgPgPzaWx9oo0/tYRgWLH9H5X/dpbdZKw=;
	b=WNl26odjXk11rBNAScx6HqqCg6C9UfiakIBbIRjNfWi91xNG2xbnLweCnJHS+JZbmc
	njjxfDlm9qrp3rwIUcWNhWNPXJSnq0H8a6E07rjXCBeyLUnes6Adpv1wEN4GDJ5OGB6Z
	npl0H31r+MEBRkM6tJDqoMLRg6caLQbzawuuJKZSHl5G0WlhyytGlAojqt9IxMiXT7pE
	sGwUC6kYzL8Xu6nDxqiBUnJdhkEhbm1ZE9FG02sNQyotrnbAYgwcLWfXEuPg+A8k9jmZ
	b0945tOIxghraePp2Xwm6AnBt0WkzrTAM6OAMTwWlwcdSCoJ2Blnbv/Ac3unQ8P8/al8
	kpGQ==
Received: by 10.50.41.169 with SMTP id g9mr5490197igl.4.1346970832646;
	Thu, 06 Sep 2012 15:33:52 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id n5sm8157066igw.13.2012.09.06.15.33.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 15:33:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 15:32:47 -0700
Message-Id: <bd393b81f8adce4fd484d57407e667f5e1b03a18.1346970617.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
References: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346970617.git.raj.khem@gmail.com>
References: <cover.1346970617.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] qemu: Update from 0.15 to 1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 22:46:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Forward port the patches which were not applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 --
 .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 ---
 ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 --
 .../qemu-0.15.1/ppc-s500-set-invalid-mask.patch    |  610 --------------------
 .../qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch |   12 +-
 .../enable-i386-linux-user.patch                   |    0
 .../fallback-to-safe-mmap_min_addr.patch           |    0
 .../fix-configure-checks.patch                     |   18 +-
 .../{qemu-0.15.1 => qemu-1.2.0}/init-info.patch    |    0
 .../larger_default_ram_size.patch                  |    0
 .../{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch |   14 +-
 .../{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch     |    0
 .../{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin    |  Bin 4096 -> 4096 bytes
 .../qemu-vmware-vga-depth.patch                    |   70 +--
 .../qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb}         |   18 +-
 15 files changed, 54 insertions(+), 841 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch (75%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fix-configure-checks.patch (59%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch (64%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/qemu-vmware-vga-depth.patch (61%)
 rename meta/recipes-devtools/qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb} (57%)

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
deleted file mode 100644
index d64d76f..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Backport
-
-From 7c0a3409627604c111d5c5e1ce4e0224c2b56315 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
-Date: Tue, 4 Oct 2011 05:14:52 +0000
-Subject: [PATCH] ppc64: Fix linker script
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Since commit 8733f609 (Fix linker scripts) linking on Linux/ppc64 fails:
-
-  LINK  ppc64-linux-user/qemu-ppc64
-/usr/lib64/gcc/powerpc64-suse-linux/4.3/../../../../powerpc64-suse-linux/bin/ld:/home/afaerber/qemu/ppc64.ld:84: syntax error
-collect2: ld gab 1 als Ende-Status zurück
-make[1]: *** [qemu-ppc64] Fehler 1
-make: *** [subdir-ppc64-linux-user] Fehler 2
-
-Fix by removing a leftover line in the ppc64 linker script.
-
-Cc: Gerd Hoffmann <kraxel@redhat.com>
-Cc: Blue Swirl <blauwirbel@gmail.com>
-Signed-off-by: Andreas Färber <afaerber@suse.de>
-Signed-off-by: Alexander Graf <agraf@suse.de>
----
- ppc64.ld |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ppc64.ld b/ppc64.ld
-index 0059ee5..0a7c0dd 100644
---- a/ppc64.ld
-+++ b/ppc64.ld
-@@ -81,8 +81,8 @@ SECTIONS
-   .sdata2         : { *(.sdata2 .sdata2.* .gnu.linkonce.s2.*) }
-   .sbss2          : { *(.sbss2 .sbss2.* .gnu.linkonce.sb2.*) }
-   .eh_frame_hdr : { *(.eh_frame_hdr) }
--*(.gcc_except_table.*) } /* Adjust the address for the data segment.  We want to
--adjust up to +     the same address within the page on the next page up.  */
-+  /* Adjust the address for the data segment.  We want to adjust up to
-+     the same address within the page on the next page up.  */
-   . = ALIGN (0x10000) - ((0x10000 - .) & (0x10000 - 1)); . = DATA_SEGMENT_ALIGN
- (0x10000, 0x1000);   /* Exception handling  */
-   .eh_frame       : { KEEP (*(.eh_frame)) }
--- 
-1.7.10
-
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
deleted file mode 100644
index 405d557..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From a4d1f142542935b90d2eb30f3aead4edcf455fe6 Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Sat, 7 Jan 2012 15:20:11 +0100
-Subject: [PATCH 1/1] target-i386: fix {min,max}{pd,ps,sd,ss} SSE2 instructions
-
-minpd, minps, minsd, minss and maxpd, maxps, maxsd, maxss SSE2
-instructions have been broken when switching target-i386 to softfloat.
-It's not possible to use comparison instructions on float types anymore
-to softfloat, so use the floatXX_lt function instead, as the
-float_XX_min and float_XX_max functions can't be used due to the Intel
-specific behaviour.
-
-As it implements the correct NaNs behaviour, let's remove the
-corresponding entry from the TODO.
-
-It fixes GDM screen display on Debian Lenny.
-
-Thanks to Peter Maydell and Jason Wessel for their analysis of the
-problem.
-
-Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
----
- target-i386/TODO      |    1 -
- target-i386/ops_sse.h |    9 +++++++--
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-This fixes scrollbar issues in matchbox-terminal/vte on qemux86-64 and
-files not appearing in pcmanfm, as well as glib/gobject errors to do with gdoubles
-on the console [YOCTO #1906]
-
-Upstream-Status: Backport
-
-Index: qemu-0.15.1/target-i386/TODO
-===================================================================
---- qemu-0.15.1.orig/target-i386/TODO	2011-10-12 16:41:43.000000000 +0000
-+++ qemu-0.15.1/target-i386/TODO	2012-04-19 07:30:38.704073075 +0000
-@@ -15,7 +15,6 @@
- - DRx register support
- - CR0.AC emulation
- - SSE alignment checks
--- fix SSE min/max with nans
- 
- Optimizations/Features:
- 
-Index: qemu-0.15.1/target-i386/ops_sse.h
-===================================================================
---- qemu-0.15.1.orig/target-i386/ops_sse.h	2011-10-12 16:41:43.000000000 +0000
-+++ qemu-0.15.1/target-i386/ops_sse.h	2012-04-19 07:30:38.712073076 +0000
-@@ -584,10 +584,15 @@
- #define FPU_SUB(size, a, b) float ## size ## _sub(a, b, &env->sse_status)
- #define FPU_MUL(size, a, b) float ## size ## _mul(a, b, &env->sse_status)
- #define FPU_DIV(size, a, b) float ## size ## _div(a, b, &env->sse_status)
--#define FPU_MIN(size, a, b) (a) < (b) ? (a) : (b)
--#define FPU_MAX(size, a, b) (a) > (b) ? (a) : (b)
- #define FPU_SQRT(size, a, b) float ## size ## _sqrt(b, &env->sse_status)
- 
-+/* Note that the choice of comparison op here is important to get the
-+ * special cases right: for min and max Intel specifies that (-0,0),
-+ * (NaN, anything) and (anything, NaN) return the second argument.
-+ */
-+#define FPU_MIN(size, a, b) float ## size ## _lt(a, b, &env->sse_status) ? (a) : (b)
-+#define FPU_MAX(size, a, b) float ## size ## _lt(b, a, &env->sse_status) ? (a) : (b)
-+
- SSE_HELPER_S(add, FPU_ADD)
- SSE_HELPER_S(sub, FPU_SUB)
- SSE_HELPER_S(mul, FPU_MUL)
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
deleted file mode 100644
index 2ccc663..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Backport
-commit 13a16f1d91fc7a46b65b22a33f6ffea1b826a097 
-in git://git.qemu.org/qemu.git master
-
-From 13a16f1d91fc7a46b65b22a33f6ffea1b826a097 Mon Sep 17 00:00:00 2001
-From: Peter Maydell <peter.maydell@linaro.org>
-Date: Thu, 16 Feb 2012 09:56:10 +0000
-Subject: [PATCH] hw/pl031: Actually raise interrupt on timer expiry
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix a typo in pl031_interrupt() which meant we were setting a bit
-in the interrupt mask rather than the interrupt status register
-and thus not actually raising an interrupt. This fix allows the
-rtctest program from the kernel's Documentation/rtc.txt to pass
-rather than hanging.
-
-Reported-by: Daniel Forsgren <daniel.forsgren@enea.com>
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-Acked-by: Andreas Färber <afaerber@suse.de>
----
- hw/pl031.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/hw/pl031.c b/hw/pl031.c
-index 05b5b11..69abc4f 100644
---- a/hw/pl031.c
-+++ b/hw/pl031.c
-@@ -76,7 +76,7 @@ static void pl031_interrupt(void * opaque)
- {
-     pl031_state *s = (pl031_state *)opaque;
- 
--    s->im = 1;
-+    s->is = 1;
-     DPRINTF("Alarm raised\n");
-     pl031_update(s);
- }
--- 
-1.7.4.1
-
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
deleted file mode 100644
index 4c2134b..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
+++ /dev/null
@@ -1,610 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-X-Git-Url: http://git.qemu.org/?p=qemu.git;a=blobdiff_plain;f=target-ppc%2Ftranslate.c;h=99e995c7b6094b0651d176f9b813525b44b7a74e;hp=1e362fc2385faeca53d0c1de37ccd7a7379202da;hb=70560da79d5be611bd7867f9c590847702c61fb5;hpb=bdcf9d6cd4ff987e58ba4f311ba7b1a33cf3ce5e
-
-Index: qemu-0.15.1/target-ppc/translate.c
-===================================================================
---- qemu-0.15.1.orig/target-ppc/translate.c	2011-10-12 09:41:43.000000000 -0700
-+++ qemu-0.15.1/target-ppc/translate.c	2012-07-20 08:14:33.192405920 -0700
-@@ -196,8 +196,10 @@
- } DisasContext;
- 
- struct opc_handler_t {
--    /* invalid bits */
--    uint32_t inval;
-+    /* invalid bits for instruction 1 (Rc(opcode) == 0) */
-+    uint32_t inval1;
-+    /* invalid bits for instruction 2 (Rc(opcode) == 1) */
-+    uint32_t inval2;
-     /* instruction type */
-     uint64_t type;
-     /* extended instruction type */
-@@ -469,7 +471,23 @@
-     .opc3 = op3,                                                              \
-     .pad  = { 0, },                                                           \
-     .handler = {                                                              \
--        .inval   = invl,                                                      \
-+        .inval1  = invl,                                                      \
-+        .type = _typ,                                                         \
-+        .type2 = _typ2,                                                       \
-+        .handler = &gen_##name,                                               \
-+        .oname = stringify(name),                                             \
-+    },                                                                        \
-+    .oname = stringify(name),                                                 \
-+}
-+#define GEN_OPCODE_DUAL(name, op1, op2, op3, invl1, invl2, _typ, _typ2)       \
-+{                                                                             \
-+    .opc1 = op1,                                                              \
-+    .opc2 = op2,                                                              \
-+    .opc3 = op3,                                                              \
-+    .pad  = { 0, },                                                           \
-+    .handler = {                                                              \
-+        .inval1  = invl1,                                                     \
-+        .inval2  = invl2,                                                     \
-         .type = _typ,                                                         \
-         .type2 = _typ2,                                                       \
-         .handler = &gen_##name,                                               \
-@@ -484,7 +502,7 @@
-     .opc3 = op3,                                                              \
-     .pad  = { 0, },                                                           \
-     .handler = {                                                              \
--        .inval   = invl,                                                      \
-+        .inval1  = invl,                                                      \
-         .type = _typ,                                                         \
-         .type2 = _typ2,                                                       \
-         .handler = &gen_##name,                                               \
-@@ -500,7 +518,22 @@
-     .opc3 = op3,                                                              \
-     .pad  = { 0, },                                                           \
-     .handler = {                                                              \
--        .inval   = invl,                                                      \
-+        .inval1  = invl,                                                      \
-+        .type = _typ,                                                         \
-+        .type2 = _typ2,                                                       \
-+        .handler = &gen_##name,                                               \
-+    },                                                                        \
-+    .oname = stringify(name),                                                 \
-+}
-+#define GEN_OPCODE_DUAL(name, op1, op2, op3, invl1, invl2, _typ, _typ2)       \
-+{                                                                             \
-+    .opc1 = op1,                                                              \
-+    .opc2 = op2,                                                              \
-+    .opc3 = op3,                                                              \
-+    .pad  = { 0, },                                                           \
-+    .handler = {                                                              \
-+        .inval1  = invl1,                                                     \
-+        .inval2  = invl2,                                                     \
-         .type = _typ,                                                         \
-         .type2 = _typ2,                                                       \
-         .handler = &gen_##name,                                               \
-@@ -514,7 +547,7 @@
-     .opc3 = op3,                                                              \
-     .pad  = { 0, },                                                           \
-     .handler = {                                                              \
--        .inval   = invl,                                                      \
-+        .inval1  = invl,                                                      \
-         .type = _typ,                                                         \
-         .type2 = _typ2,                                                       \
-         .handler = &gen_##name,                                               \
-@@ -541,7 +574,8 @@
- }
- 
- static opc_handler_t invalid_handler = {
--    .inval   = 0xFFFFFFFF,
-+    .inval1  = 0xFFFFFFFF,
-+    .inval2  = 0xFFFFFFFF,
-     .type    = PPC_NONE,
-     .type2   = PPC_NONE,
-     .handler = gen_invalid,
-@@ -6672,7 +6706,7 @@
- #endif
- }
- 
--#define GEN_SPE(name0, name1, opc2, opc3, inval, type)                        \
-+#define GEN_SPE(name0, name1, opc2, opc3, inval0, inval1, type)         \
- static void glue(gen_, name0##_##name1)(DisasContext *ctx)                    \
- {                                                                             \
-     if (Rc(ctx->opcode))                                                      \
-@@ -7395,35 +7429,35 @@
-     tcg_temp_free_i64(tmp);
- }
- 
--GEN_SPE(evaddw,         speundef,      0x00, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evaddiw,        speundef,      0x01, 0x08, 0x00000000, PPC_SPE);
--GEN_SPE(evsubfw,        speundef,      0x02, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evsubifw,       speundef,      0x03, 0x08, 0x00000000, PPC_SPE);
--GEN_SPE(evabs,          evneg,         0x04, 0x08, 0x0000F800, PPC_SPE); ////
--GEN_SPE(evextsb,        evextsh,       0x05, 0x08, 0x0000F800, PPC_SPE); ////
--GEN_SPE(evrndw,         evcntlzw,      0x06, 0x08, 0x0000F800, PPC_SPE); ////
--GEN_SPE(evcntlsw,       brinc,         0x07, 0x08, 0x00000000, PPC_SPE); //
--GEN_SPE(evmra,          speundef,      0x02, 0x13, 0x0000F800, PPC_SPE);
--GEN_SPE(speundef,       evand,         0x08, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evandc,         speundef,      0x09, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evxor,          evor,          0x0B, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evnor,          eveqv,         0x0C, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evmwumi,        evmwsmi,       0x0C, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(evmwumia,       evmwsmia,      0x1C, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(evmwumiaa,      evmwsmiaa,     0x0C, 0x15, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evorc,         0x0D, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evnand,         speundef,      0x0F, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evsrwu,         evsrws,        0x10, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evsrwiu,        evsrwis,       0x11, 0x08, 0x00000000, PPC_SPE);
--GEN_SPE(evslw,          speundef,      0x12, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evslwi,         speundef,      0x13, 0x08, 0x00000000, PPC_SPE);
--GEN_SPE(evrlw,          evsplati,      0x14, 0x08, 0x00000000, PPC_SPE); //
--GEN_SPE(evrlwi,         evsplatfi,     0x15, 0x08, 0x00000000, PPC_SPE);
--GEN_SPE(evmergehi,      evmergelo,     0x16, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evmergehilo,    evmergelohi,   0x17, 0x08, 0x00000000, PPC_SPE); ////
--GEN_SPE(evcmpgtu,       evcmpgts,      0x18, 0x08, 0x00600000, PPC_SPE); ////
--GEN_SPE(evcmpltu,       evcmplts,      0x19, 0x08, 0x00600000, PPC_SPE); ////
--GEN_SPE(evcmpeq,        speundef,      0x1A, 0x08, 0x00600000, PPC_SPE); ////
-+GEN_SPE(evaddw,      speundef,    0x00, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE); ////
-+GEN_SPE(evaddiw,     speundef,    0x01, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE);
-+GEN_SPE(evsubfw,     speundef,    0x02, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE); ////
-+GEN_SPE(evsubifw,    speundef,    0x03, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE);
-+GEN_SPE(evabs,       evneg,       0x04, 0x08, 0x0000F800, 0x0000F800, PPC_SPE); ////
-+GEN_SPE(evextsb,     evextsh,     0x05, 0x08, 0x0000F800, 0x0000F800, PPC_SPE); ////
-+GEN_SPE(evrndw,      evcntlzw,    0x06, 0x08, 0x0000F800, 0x0000F800, PPC_SPE); ////
-+GEN_SPE(evcntlsw,    brinc,       0x07, 0x08, 0x0000F800, 0x00000000, PPC_SPE); //
-+GEN_SPE(evmra,       speundef,    0x02, 0x13, 0x0000F800, 0xFFFFFFFF, PPC_SPE);
-+GEN_SPE(speundef,    evand,       0x08, 0x08, 0xFFFFFFFF, 0x00000000, PPC_SPE); ////
-+GEN_SPE(evandc,      speundef,    0x09, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE); ////
-+GEN_SPE(evxor,       evor,        0x0B, 0x08, 0x00000000, 0x00000000, PPC_SPE); ////
-+GEN_SPE(evnor,       eveqv,       0x0C, 0x08, 0x00000000, 0x00000000, PPC_SPE); ////
-+GEN_SPE(evmwumi,     evmwsmi,     0x0C, 0x11, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(evmwumia,    evmwsmia,    0x1C, 0x11, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(evmwumiaa,   evmwsmiaa,   0x0C, 0x15, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,    evorc,       0x0D, 0x08, 0xFFFFFFFF, 0x00000000, PPC_SPE); ////
-+GEN_SPE(evnand,      speundef,    0x0F, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE); ////
-+GEN_SPE(evsrwu,      evsrws,      0x10, 0x08, 0x00000000, 0x00000000, PPC_SPE); ////
-+GEN_SPE(evsrwiu,     evsrwis,     0x11, 0x08, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(evslw,       speundef,    0x12, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE); ////
-+GEN_SPE(evslwi,      speundef,    0x13, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE);
-+GEN_SPE(evrlw,       evsplati,    0x14, 0x08, 0x00000000, 0x0000F800, PPC_SPE); //
-+GEN_SPE(evrlwi,      evsplatfi,   0x15, 0x08, 0x00000000, 0x0000F800, PPC_SPE);
-+GEN_SPE(evmergehi,   evmergelo,   0x16, 0x08, 0x00000000, 0x00000000, PPC_SPE); ////
-+GEN_SPE(evmergehilo, evmergelohi, 0x17, 0x08, 0x00000000, 0x00000000, PPC_SPE); ////
-+GEN_SPE(evcmpgtu,    evcmpgts,    0x18, 0x08, 0x00600000, 0x00600000, PPC_SPE); ////
-+GEN_SPE(evcmpltu,    evcmplts,    0x19, 0x08, 0x00600000, 0x00600000, PPC_SPE); ////
-+GEN_SPE(evcmpeq,     speundef,    0x1A, 0x08, 0x00600000, 0xFFFFFFFF, PPC_SPE); ////
- 
- /* SPE load and stores */
- static inline void gen_addr_spe_imm_index(DisasContext *ctx, TCGv EA, int sh)
-@@ -7782,74 +7816,74 @@
- 
- /* Multiply and add - TODO */
- #if 0
--GEN_SPE(speundef,       evmhessf,      0x01, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhossf,      0x03, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(evmheumi,       evmhesmi,      0x04, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhesmf,      0x05, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(evmhoumi,       evmhosmi,      0x06, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhosmf,      0x07, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhessfa,     0x11, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhossfa,     0x13, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(evmheumia,      evmhesmia,     0x14, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhesmfa,     0x15, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(evmhoumia,      evmhosmia,     0x16, 0x10, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhosmfa,     0x17, 0x10, 0x00000000, PPC_SPE);
--
--GEN_SPE(speundef,       evmwhssf,      0x03, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(evmwlumi,       speundef,      0x04, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(evmwhumi,       evmwhsmi,      0x06, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwhsmf,      0x07, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwssf,       0x09, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwsmf,       0x0D, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwhssfa,     0x13, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(evmwlumia,      speundef,      0x14, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(evmwhumia,      evmwhsmia,     0x16, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwhsmfa,     0x17, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwssfa,      0x19, 0x11, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwsmfa,      0x1D, 0x11, 0x00000000, PPC_SPE);
--
--GEN_SPE(evadduiaaw,     evaddsiaaw,    0x00, 0x13, 0x0000F800, PPC_SPE);
--GEN_SPE(evsubfusiaaw,   evsubfssiaaw,  0x01, 0x13, 0x0000F800, PPC_SPE);
--GEN_SPE(evaddumiaaw,    evaddsmiaaw,   0x04, 0x13, 0x0000F800, PPC_SPE);
--GEN_SPE(evsubfumiaaw,   evsubfsmiaaw,  0x05, 0x13, 0x0000F800, PPC_SPE);
--GEN_SPE(evdivws,        evdivwu,       0x06, 0x13, 0x00000000, PPC_SPE);
--
--GEN_SPE(evmheusiaaw,    evmhessiaaw,   0x00, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhessfaaw,   0x01, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(evmhousiaaw,    evmhossiaaw,   0x02, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhossfaaw,   0x03, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(evmheumiaaw,    evmhesmiaaw,   0x04, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhesmfaaw,   0x05, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(evmhoumiaaw,    evmhosmiaaw,   0x06, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhosmfaaw,   0x07, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(evmhegumiaa,    evmhegsmiaa,   0x14, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhegsmfaa,   0x15, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(evmhogumiaa,    evmhogsmiaa,   0x16, 0x14, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhogsmfaa,   0x17, 0x14, 0x00000000, PPC_SPE);
--
--GEN_SPE(evmwlusiaaw,    evmwlssiaaw,   0x00, 0x15, 0x00000000, PPC_SPE);
--GEN_SPE(evmwlumiaaw,    evmwlsmiaaw,   0x04, 0x15, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwssfaa,     0x09, 0x15, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwsmfaa,     0x0D, 0x15, 0x00000000, PPC_SPE);
--
--GEN_SPE(evmheusianw,    evmhessianw,   0x00, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhessfanw,   0x01, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(evmhousianw,    evmhossianw,   0x02, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhossfanw,   0x03, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(evmheumianw,    evmhesmianw,   0x04, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhesmfanw,   0x05, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(evmhoumianw,    evmhosmianw,   0x06, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhosmfanw,   0x07, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(evmhegumian,    evmhegsmian,   0x14, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhegsmfan,   0x15, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(evmhigumian,    evmhigsmian,   0x16, 0x16, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmhogsmfan,   0x17, 0x16, 0x00000000, PPC_SPE);
--
--GEN_SPE(evmwlusianw,    evmwlssianw,   0x00, 0x17, 0x00000000, PPC_SPE);
--GEN_SPE(evmwlumianw,    evmwlsmianw,   0x04, 0x17, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwssfan,     0x09, 0x17, 0x00000000, PPC_SPE);
--GEN_SPE(evmwumian,      evmwsmian,     0x0C, 0x17, 0x00000000, PPC_SPE);
--GEN_SPE(speundef,       evmwsmfan,     0x0D, 0x17, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhessf,      0x01, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);//
-+GEN_SPE(speundef,       evmhossf,      0x03, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmheumi,       evmhesmi,      0x04, 0x10, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhesmf,      0x05, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhoumi,       evmhosmi,      0x06, 0x10, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhosmf,      0x07, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhessfa,     0x11, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhossfa,     0x13, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmheumia,      evmhesmia,     0x14, 0x10, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhesmfa,     0x15, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhoumia,      evmhosmia,     0x16, 0x10, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhosmfa,     0x17, 0x10, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+
-+GEN_SPE(speundef,       evmwhssf,      0x03, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmwlumi,       speundef,      0x04, 0x11, 0x00000000, 0xFFFFFFFF, PPC_SPE);
-+GEN_SPE(evmwhumi,       evmwhsmi,      0x06, 0x11, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwhsmf,      0x07, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwssf,       0x09, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwsmf,       0x0D, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwhssfa,     0x13, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmwlumia,      speundef,      0x14, 0x11, 0x00000000, 0xFFFFFFFF, PPC_SPE);
-+GEN_SPE(evmwhumia,      evmwhsmia,     0x16, 0x11, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwhsmfa,     0x17, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwssfa,      0x19, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwsmfa,      0x1D, 0x11, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+
-+GEN_SPE(evadduiaaw,     evaddsiaaw,    0x00, 0x13, 0x0000F800, 0x0000F800, PPC_SPE);
-+GEN_SPE(evsubfusiaaw,   evsubfssiaaw,  0x01, 0x13, 0x0000F800, 0x0000F800, PPC_SPE);
-+GEN_SPE(evaddumiaaw,    evaddsmiaaw,   0x04, 0x13, 0x0000F800, 0x0000F800, PPC_SPE);
-+GEN_SPE(evsubfumiaaw,   evsubfsmiaaw,  0x05, 0x13, 0x0000F800, 0x0000F800, PPC_SPE);
-+GEN_SPE(evdivws,        evdivwu,       0x06, 0x13, 0x00000000, 0x00000000, PPC_SPE);
-+
-+GEN_SPE(evmheusiaaw,    evmhessiaaw,   0x00, 0x14, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhessfaaw,   0x01, 0x14, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhousiaaw,    evmhossiaaw,   0x02, 0x14, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhossfaaw,   0x03, 0x14, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmheumiaaw,    evmhesmiaaw,   0x04, 0x14, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhesmfaaw,   0x05, 0x14, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhoumiaaw,    evmhosmiaaw,   0x06, 0x14, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhosmfaaw,   0x07, 0x14, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhegumiaa,    evmhegsmiaa,   0x14, 0x14, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhegsmfaa,   0x15, 0x14, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhogumiaa,    evmhogsmiaa,   0x16, 0x14, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhogsmfaa,   0x17, 0x14, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+
-+GEN_SPE(evmwlusiaaw,    evmwlssiaaw,   0x00, 0x15, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(evmwlumiaaw,    evmwlsmiaaw,   0x04, 0x15, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwssfaa,     0x09, 0x15, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwsmfaa,     0x0D, 0x15, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+
-+GEN_SPE(evmheusianw,    evmhessianw,   0x00, 0x16, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhessfanw,   0x01, 0x16, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhousianw,    evmhossianw,   0x02, 0x16, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhossfanw,   0x03, 0x16, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmheumianw,    evmhesmianw,   0x04, 0x16, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhesmfanw,   0x05, 0x16, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhoumianw,    evmhosmianw,   0x06, 0x16, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhosmfanw,   0x07, 0x16, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhegumian,    evmhegsmian,   0x14, 0x16, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhegsmfan,   0x15, 0x16, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmhigumian,    evmhigsmian,   0x16, 0x16, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmhogsmfan,   0x17, 0x16, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+
-+GEN_SPE(evmwlusianw,    evmwlssianw,   0x00, 0x17, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(evmwlumianw,    evmwlsmianw,   0x04, 0x17, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwssfan,     0x09, 0x17, 0xFFFFFFFF, 0x00000000, PPC_SPE);
-+GEN_SPE(evmwumian,      evmwsmian,     0x0C, 0x17, 0x00000000, 0x00000000, PPC_SPE);
-+GEN_SPE(speundef,       evmwsmfan,     0x0D, 0x17, 0xFFFFFFFF, 0x00000000, PPC_SPE);
- #endif
- 
- /***                      SPE floating-point extension                     ***/
-@@ -8110,20 +8144,20 @@
- GEN_SPEFPUOP_COMP_64(evfststeq);
- 
- /* Opcodes definitions */
--GEN_SPE(evfsadd,        evfssub,       0x00, 0x0A, 0x00000000, PPC_SPE_SINGLE); //
--GEN_SPE(evfsabs,        evfsnabs,      0x02, 0x0A, 0x0000F800, PPC_SPE_SINGLE); //
--GEN_SPE(evfsneg,        speundef,      0x03, 0x0A, 0x0000F800, PPC_SPE_SINGLE); //
--GEN_SPE(evfsmul,        evfsdiv,       0x04, 0x0A, 0x00000000, PPC_SPE_SINGLE); //
--GEN_SPE(evfscmpgt,      evfscmplt,     0x06, 0x0A, 0x00600000, PPC_SPE_SINGLE); //
--GEN_SPE(evfscmpeq,      speundef,      0x07, 0x0A, 0x00600000, PPC_SPE_SINGLE); //
--GEN_SPE(evfscfui,       evfscfsi,      0x08, 0x0A, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(evfscfuf,       evfscfsf,      0x09, 0x0A, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(evfsctui,       evfsctsi,      0x0A, 0x0A, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(evfsctuf,       evfsctsf,      0x0B, 0x0A, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(evfsctuiz,      speundef,      0x0C, 0x0A, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(evfsctsiz,      speundef,      0x0D, 0x0A, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(evfststgt,      evfststlt,     0x0E, 0x0A, 0x00600000, PPC_SPE_SINGLE); //
--GEN_SPE(evfststeq,      speundef,      0x0F, 0x0A, 0x00600000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsadd,   evfssub,   0x00, 0x0A, 0x00000000, 0x00000000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsabs,   evfsnabs,  0x02, 0x0A, 0x0000F800, 0x0000F800, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsneg,   speundef,  0x03, 0x0A, 0x0000F800, 0xFFFFFFFF, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsmul,   evfsdiv,   0x04, 0x0A, 0x00000000, 0x00000000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfscmpgt, evfscmplt, 0x06, 0x0A, 0x00600000, 0x00600000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfscmpeq, speundef,  0x07, 0x0A, 0x00600000, 0xFFFFFFFF, PPC_SPE_SINGLE); //
-+GEN_SPE(evfscfui,  evfscfsi,  0x08, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfscfuf,  evfscfsf,  0x09, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsctui,  evfsctsi,  0x0A, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsctuf,  evfsctsf,  0x0B, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsctuiz, speundef,  0x0C, 0x0A, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE); //
-+GEN_SPE(evfsctsiz, speundef,  0x0D, 0x0A, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE); //
-+GEN_SPE(evfststgt, evfststlt, 0x0E, 0x0A, 0x00600000, 0x00600000, PPC_SPE_SINGLE); //
-+GEN_SPE(evfststeq, speundef,  0x0F, 0x0A, 0x00600000, 0xFFFFFFFF, PPC_SPE_SINGLE); //
- 
- /* Single precision floating-point operations */
- /* Arithmetic */
-@@ -8178,20 +8212,20 @@
- GEN_SPEFPUOP_COMP_32(efststeq);
- 
- /* Opcodes definitions */
--GEN_SPE(efsadd,         efssub,        0x00, 0x0B, 0x00000000, PPC_SPE_SINGLE); //
--GEN_SPE(efsabs,         efsnabs,       0x02, 0x0B, 0x0000F800, PPC_SPE_SINGLE); //
--GEN_SPE(efsneg,         speundef,      0x03, 0x0B, 0x0000F800, PPC_SPE_SINGLE); //
--GEN_SPE(efsmul,         efsdiv,        0x04, 0x0B, 0x00000000, PPC_SPE_SINGLE); //
--GEN_SPE(efscmpgt,       efscmplt,      0x06, 0x0B, 0x00600000, PPC_SPE_SINGLE); //
--GEN_SPE(efscmpeq,       efscfd,        0x07, 0x0B, 0x00600000, PPC_SPE_SINGLE); //
--GEN_SPE(efscfui,        efscfsi,       0x08, 0x0B, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(efscfuf,        efscfsf,       0x09, 0x0B, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(efsctui,        efsctsi,       0x0A, 0x0B, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(efsctuf,        efsctsf,       0x0B, 0x0B, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(efsctuiz,       speundef,      0x0C, 0x0B, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(efsctsiz,       speundef,      0x0D, 0x0B, 0x00180000, PPC_SPE_SINGLE); //
--GEN_SPE(efststgt,       efststlt,      0x0E, 0x0B, 0x00600000, PPC_SPE_SINGLE); //
--GEN_SPE(efststeq,       speundef,      0x0F, 0x0B, 0x00600000, PPC_SPE_SINGLE); //
-+GEN_SPE(efsadd,   efssub,   0x00, 0x0B, 0x00000000, 0x00000000, PPC_SPE_SINGLE); //
-+GEN_SPE(efsabs,   efsnabs,  0x02, 0x0B, 0x0000F800, 0x0000F800, PPC_SPE_SINGLE); //
-+GEN_SPE(efsneg,   speundef, 0x03, 0x0B, 0x0000F800, 0xFFFFFFFF, PPC_SPE_SINGLE); //
-+GEN_SPE(efsmul,   efsdiv,   0x04, 0x0B, 0x00000000, 0x00000000, PPC_SPE_SINGLE); //
-+GEN_SPE(efscmpgt, efscmplt, 0x06, 0x0B, 0x00600000, 0x00600000, PPC_SPE_SINGLE); //
-+GEN_SPE(efscmpeq, efscfd,   0x07, 0x0B, 0x00600000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(efscfui,  efscfsi,  0x08, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(efscfuf,  efscfsf,  0x09, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(efsctui,  efsctsi,  0x0A, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(efsctuf,  efsctsf,  0x0B, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE); //
-+GEN_SPE(efsctuiz, speundef, 0x0C, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE); //
-+GEN_SPE(efsctsiz, speundef, 0x0D, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE); //
-+GEN_SPE(efststgt, efststlt, 0x0E, 0x0B, 0x00600000, 0x00600000, PPC_SPE_SINGLE); //
-+GEN_SPE(efststeq, speundef, 0x0F, 0x0B, 0x00600000, 0xFFFFFFFF, PPC_SPE_SINGLE); //
- 
- /* Double precision floating-point operations */
- /* Arithmetic */
-@@ -8265,22 +8299,22 @@
- GEN_SPEFPUOP_COMP_64(efdtsteq);
- 
- /* Opcodes definitions */
--GEN_SPE(efdadd,         efdsub,        0x10, 0x0B, 0x00000000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdcfuid,       efdcfsid,      0x11, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdabs,         efdnabs,       0x12, 0x0B, 0x0000F800, PPC_SPE_DOUBLE); //
--GEN_SPE(efdneg,         speundef,      0x13, 0x0B, 0x0000F800, PPC_SPE_DOUBLE); //
--GEN_SPE(efdmul,         efddiv,        0x14, 0x0B, 0x00000000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdctuidz,      efdctsidz,     0x15, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdcmpgt,       efdcmplt,      0x16, 0x0B, 0x00600000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdcmpeq,       efdcfs,        0x17, 0x0B, 0x00600000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdcfui,        efdcfsi,       0x18, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdcfuf,        efdcfsf,       0x19, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdctui,        efdctsi,       0x1A, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdctuf,        efdctsf,       0x1B, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdctuiz,       speundef,      0x1C, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdctsiz,       speundef,      0x1D, 0x0B, 0x00180000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdtstgt,       efdtstlt,      0x1E, 0x0B, 0x00600000, PPC_SPE_DOUBLE); //
--GEN_SPE(efdtsteq,       speundef,      0x1F, 0x0B, 0x00600000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdadd,    efdsub,    0x10, 0x0B, 0x00000000, 0x00000000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdcfuid,  efdcfsid,  0x11, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdabs,    efdnabs,   0x12, 0x0B, 0x0000F800, 0x0000F800, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdneg,    speundef,  0x13, 0x0B, 0x0000F800, 0xFFFFFFFF, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdmul,    efddiv,    0x14, 0x0B, 0x00000000, 0x00000000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdctuidz, efdctsidz, 0x15, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdcmpgt,  efdcmplt,  0x16, 0x0B, 0x00600000, 0x00600000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdcmpeq,  efdcfs,    0x17, 0x0B, 0x00600000, 0x00180000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdcfui,   efdcfsi,   0x18, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdcfuf,   efdcfsf,   0x19, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdctui,   efdctsi,   0x1A, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdctuf,   efdctsf,   0x1B, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdctuiz,  speundef,  0x1C, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdctsiz,  speundef,  0x1D, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdtstgt,  efdtstlt,  0x1E, 0x0B, 0x00600000, 0x00600000, PPC_SPE_DOUBLE); //
-+GEN_SPE(efdtsteq,  speundef,  0x1F, 0x0B, 0x00600000, 0xFFFFFFFF, PPC_SPE_DOUBLE); //
- 
- static opcode_t opcodes[] = {
- GEN_HANDLER(invalid, 0x00, 0x00, 0x00, 0xFFFFFFFF, PPC_NONE),
-@@ -9049,84 +9083,84 @@
- GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
- 
- #undef GEN_SPE
--#define GEN_SPE(name0, name1, opc2, opc3, inval, type)                        \
--GEN_HANDLER(name0##_##name1, 0x04, opc2, opc3, inval, type)
--GEN_SPE(evaddw,         speundef,      0x00, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evaddiw,        speundef,      0x01, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evsubfw,        speundef,      0x02, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evsubifw,       speundef,      0x03, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evabs,          evneg,         0x04, 0x08, 0x0000F800, PPC_SPE),
--GEN_SPE(evextsb,        evextsh,       0x05, 0x08, 0x0000F800, PPC_SPE),
--GEN_SPE(evrndw,         evcntlzw,      0x06, 0x08, 0x0000F800, PPC_SPE),
--GEN_SPE(evcntlsw,       brinc,         0x07, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evmra,          speundef,      0x02, 0x13, 0x0000F800, PPC_SPE),
--GEN_SPE(speundef,       evand,         0x08, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evandc,         speundef,      0x09, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evxor,          evor,          0x0B, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evnor,          eveqv,         0x0C, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evmwumi,        evmwsmi,       0x0C, 0x11, 0x00000000, PPC_SPE),
--GEN_SPE(evmwumia,       evmwsmia,      0x1C, 0x11, 0x00000000, PPC_SPE),
--GEN_SPE(evmwumiaa,      evmwsmiaa,     0x0C, 0x15, 0x00000000, PPC_SPE),
--GEN_SPE(speundef,       evorc,         0x0D, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evnand,         speundef,      0x0F, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evsrwu,         evsrws,        0x10, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evsrwiu,        evsrwis,       0x11, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evslw,          speundef,      0x12, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evslwi,         speundef,      0x13, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evrlw,          evsplati,      0x14, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evrlwi,         evsplatfi,     0x15, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evmergehi,      evmergelo,     0x16, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evmergehilo,    evmergelohi,   0x17, 0x08, 0x00000000, PPC_SPE),
--GEN_SPE(evcmpgtu,       evcmpgts,      0x18, 0x08, 0x00600000, PPC_SPE),
--GEN_SPE(evcmpltu,       evcmplts,      0x19, 0x08, 0x00600000, PPC_SPE),
--GEN_SPE(evcmpeq,        speundef,      0x1A, 0x08, 0x00600000, PPC_SPE),
--
--GEN_SPE(evfsadd,        evfssub,       0x00, 0x0A, 0x00000000, PPC_SPE_SINGLE),
--GEN_SPE(evfsabs,        evfsnabs,      0x02, 0x0A, 0x0000F800, PPC_SPE_SINGLE),
--GEN_SPE(evfsneg,        speundef,      0x03, 0x0A, 0x0000F800, PPC_SPE_SINGLE),
--GEN_SPE(evfsmul,        evfsdiv,       0x04, 0x0A, 0x00000000, PPC_SPE_SINGLE),
--GEN_SPE(evfscmpgt,      evfscmplt,     0x06, 0x0A, 0x00600000, PPC_SPE_SINGLE),
--GEN_SPE(evfscmpeq,      speundef,      0x07, 0x0A, 0x00600000, PPC_SPE_SINGLE),
--GEN_SPE(evfscfui,       evfscfsi,      0x08, 0x0A, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(evfscfuf,       evfscfsf,      0x09, 0x0A, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(evfsctui,       evfsctsi,      0x0A, 0x0A, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(evfsctuf,       evfsctsf,      0x0B, 0x0A, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(evfsctuiz,      speundef,      0x0C, 0x0A, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(evfsctsiz,      speundef,      0x0D, 0x0A, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(evfststgt,      evfststlt,     0x0E, 0x0A, 0x00600000, PPC_SPE_SINGLE),
--GEN_SPE(evfststeq,      speundef,      0x0F, 0x0A, 0x00600000, PPC_SPE_SINGLE),
--
--GEN_SPE(efsadd,         efssub,        0x00, 0x0B, 0x00000000, PPC_SPE_SINGLE),
--GEN_SPE(efsabs,         efsnabs,       0x02, 0x0B, 0x0000F800, PPC_SPE_SINGLE),
--GEN_SPE(efsneg,         speundef,      0x03, 0x0B, 0x0000F800, PPC_SPE_SINGLE),
--GEN_SPE(efsmul,         efsdiv,        0x04, 0x0B, 0x00000000, PPC_SPE_SINGLE),
--GEN_SPE(efscmpgt,       efscmplt,      0x06, 0x0B, 0x00600000, PPC_SPE_SINGLE),
--GEN_SPE(efscmpeq,       efscfd,        0x07, 0x0B, 0x00600000, PPC_SPE_SINGLE),
--GEN_SPE(efscfui,        efscfsi,       0x08, 0x0B, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(efscfuf,        efscfsf,       0x09, 0x0B, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(efsctui,        efsctsi,       0x0A, 0x0B, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(efsctuf,        efsctsf,       0x0B, 0x0B, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(efsctuiz,       speundef,      0x0C, 0x0B, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(efsctsiz,       speundef,      0x0D, 0x0B, 0x00180000, PPC_SPE_SINGLE),
--GEN_SPE(efststgt,       efststlt,      0x0E, 0x0B, 0x00600000, PPC_SPE_SINGLE),
--GEN_SPE(efststeq,       speundef,      0x0F, 0x0B, 0x00600000, PPC_SPE_SINGLE),
--
--GEN_SPE(efdadd,         efdsub,        0x10, 0x0B, 0x00000000, PPC_SPE_DOUBLE),
--GEN_SPE(efdcfuid,       efdcfsid,      0x11, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdabs,         efdnabs,       0x12, 0x0B, 0x0000F800, PPC_SPE_DOUBLE),
--GEN_SPE(efdneg,         speundef,      0x13, 0x0B, 0x0000F800, PPC_SPE_DOUBLE),
--GEN_SPE(efdmul,         efddiv,        0x14, 0x0B, 0x00000000, PPC_SPE_DOUBLE),
--GEN_SPE(efdctuidz,      efdctsidz,     0x15, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdcmpgt,       efdcmplt,      0x16, 0x0B, 0x00600000, PPC_SPE_DOUBLE),
--GEN_SPE(efdcmpeq,       efdcfs,        0x17, 0x0B, 0x00600000, PPC_SPE_DOUBLE),
--GEN_SPE(efdcfui,        efdcfsi,       0x18, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdcfuf,        efdcfsf,       0x19, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdctui,        efdctsi,       0x1A, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdctuf,        efdctsf,       0x1B, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdctuiz,       speundef,      0x1C, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdctsiz,       speundef,      0x1D, 0x0B, 0x00180000, PPC_SPE_DOUBLE),
--GEN_SPE(efdtstgt,       efdtstlt,      0x1E, 0x0B, 0x00600000, PPC_SPE_DOUBLE),
--GEN_SPE(efdtsteq,       speundef,      0x1F, 0x0B, 0x00600000, PPC_SPE_DOUBLE),
-+#define GEN_SPE(name0, name1, opc2, opc3, inval0, inval1, type) \
-+    GEN_OPCODE_DUAL(name0##_##name1, 0x04, opc2, opc3, inval0, inval1, type, PPC_NONE)
-+GEN_SPE(evaddw,      speundef,    0x00, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evaddiw,     speundef,    0x01, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evsubfw,     speundef,    0x02, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evsubifw,    speundef,    0x03, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evabs,       evneg,       0x04, 0x08, 0x0000F800, 0x0000F800, PPC_SPE),
-+GEN_SPE(evextsb,     evextsh,     0x05, 0x08, 0x0000F800, 0x0000F800, PPC_SPE),
-+GEN_SPE(evrndw,      evcntlzw,    0x06, 0x08, 0x0000F800, 0x0000F800, PPC_SPE),
-+GEN_SPE(evcntlsw,    brinc,       0x07, 0x08, 0x0000F800, 0x00000000, PPC_SPE),
-+GEN_SPE(evmra,       speundef,    0x02, 0x13, 0x0000F800, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(speundef,    evand,       0x08, 0x08, 0xFFFFFFFF, 0x00000000, PPC_SPE),
-+GEN_SPE(evandc,      speundef,    0x09, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evxor,       evor,        0x0B, 0x08, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evnor,       eveqv,       0x0C, 0x08, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evmwumi,     evmwsmi,     0x0C, 0x11, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evmwumia,    evmwsmia,    0x1C, 0x11, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evmwumiaa,   evmwsmiaa,   0x0C, 0x15, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(speundef,    evorc,       0x0D, 0x08, 0xFFFFFFFF, 0x00000000, PPC_SPE),
-+GEN_SPE(evnand,      speundef,    0x0F, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evsrwu,      evsrws,      0x10, 0x08, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evsrwiu,     evsrwis,     0x11, 0x08, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evslw,       speundef,    0x12, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evslwi,      speundef,    0x13, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE),
-+GEN_SPE(evrlw,       evsplati,    0x14, 0x08, 0x00000000, 0x0000F800, PPC_SPE),
-+GEN_SPE(evrlwi,      evsplatfi,   0x15, 0x08, 0x00000000, 0x0000F800, PPC_SPE),
-+GEN_SPE(evmergehi,   evmergelo,   0x16, 0x08, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evmergehilo, evmergelohi, 0x17, 0x08, 0x00000000, 0x00000000, PPC_SPE),
-+GEN_SPE(evcmpgtu,    evcmpgts,    0x18, 0x08, 0x00600000, 0x00600000, PPC_SPE),
-+GEN_SPE(evcmpltu,    evcmplts,    0x19, 0x08, 0x00600000, 0x00600000, PPC_SPE),
-+GEN_SPE(evcmpeq,     speundef,    0x1A, 0x08, 0x00600000, 0xFFFFFFFF, PPC_SPE),
-+
-+GEN_SPE(evfsadd,     evfssub,     0x00, 0x0A, 0x00000000, 0x00000000, PPC_SPE_SINGLE),
-+GEN_SPE(evfsabs,     evfsnabs,    0x02, 0x0A, 0x0000F800, 0x0000F800, PPC_SPE_SINGLE),
-+GEN_SPE(evfsneg,     speundef,    0x03, 0x0A, 0x0000F800, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+GEN_SPE(evfsmul,     evfsdiv,     0x04, 0x0A, 0x00000000, 0x00000000, PPC_SPE_SINGLE),
-+GEN_SPE(evfscmpgt,   evfscmplt,   0x06, 0x0A, 0x00600000, 0x00600000, PPC_SPE_SINGLE),
-+GEN_SPE(evfscmpeq,   speundef,    0x07, 0x0A, 0x00600000, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+GEN_SPE(evfscfui,    evfscfsi,    0x08, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(evfscfuf,    evfscfsf,    0x09, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(evfsctui,    evfsctsi,    0x0A, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(evfsctuf,    evfsctsf,    0x0B, 0x0A, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(evfsctuiz,   speundef,    0x0C, 0x0A, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+GEN_SPE(evfsctsiz,   speundef,    0x0D, 0x0A, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+GEN_SPE(evfststgt,   evfststlt,   0x0E, 0x0A, 0x00600000, 0x00600000, PPC_SPE_SINGLE),
-+GEN_SPE(evfststeq,   speundef,    0x0F, 0x0A, 0x00600000, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+
-+GEN_SPE(efsadd,      efssub,      0x00, 0x0B, 0x00000000, 0x00000000, PPC_SPE_SINGLE),
-+GEN_SPE(efsabs,      efsnabs,     0x02, 0x0B, 0x0000F800, 0x0000F800, PPC_SPE_SINGLE),
-+GEN_SPE(efsneg,      speundef,    0x03, 0x0B, 0x0000F800, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+GEN_SPE(efsmul,      efsdiv,      0x04, 0x0B, 0x00000000, 0x00000000, PPC_SPE_SINGLE),
-+GEN_SPE(efscmpgt,    efscmplt,    0x06, 0x0B, 0x00600000, 0x00600000, PPC_SPE_SINGLE),
-+GEN_SPE(efscmpeq,    efscfd,      0x07, 0x0B, 0x00600000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(efscfui,     efscfsi,     0x08, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(efscfuf,     efscfsf,     0x09, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(efsctui,     efsctsi,     0x0A, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(efsctuf,     efsctsf,     0x0B, 0x0B, 0x00180000, 0x00180000, PPC_SPE_SINGLE),
-+GEN_SPE(efsctuiz,    speundef,    0x0C, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+GEN_SPE(efsctsiz,    speundef,    0x0D, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+GEN_SPE(efststgt,    efststlt,    0x0E, 0x0B, 0x00600000, 0x00600000, PPC_SPE_SINGLE),
-+GEN_SPE(efststeq,    speundef,    0x0F, 0x0B, 0x00600000, 0xFFFFFFFF, PPC_SPE_SINGLE),
-+
-+GEN_SPE(efdadd,      efdsub,      0x10, 0x0B, 0x00000000, 0x00000000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdcfuid,    efdcfsid,    0x11, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdabs,      efdnabs,     0x12, 0x0B, 0x0000F800, 0x0000F800, PPC_SPE_DOUBLE),
-+GEN_SPE(efdneg,      speundef,    0x13, 0x0B, 0x0000F800, 0xFFFFFFFF, PPC_SPE_DOUBLE),
-+GEN_SPE(efdmul,      efddiv,      0x14, 0x0B, 0x00000000, 0x00000000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdctuidz,   efdctsidz,   0x15, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdcmpgt,    efdcmplt,    0x16, 0x0B, 0x00600000, 0x00600000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdcmpeq,    efdcfs,      0x17, 0x0B, 0x00600000, 0x00180000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdcfui,     efdcfsi,     0x18, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdcfuf,     efdcfsf,     0x19, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdctui,     efdctsi,     0x1A, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdctuf,     efdctsf,     0x1B, 0x0B, 0x00180000, 0x00180000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdctuiz,    speundef,    0x1C, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_DOUBLE),
-+GEN_SPE(efdctsiz,    speundef,    0x1D, 0x0B, 0x00180000, 0xFFFFFFFF, PPC_SPE_DOUBLE),
-+GEN_SPE(efdtstgt,    efdtstlt,    0x1E, 0x0B, 0x00600000, 0x00600000, PPC_SPE_DOUBLE),
-+GEN_SPE(efdtsteq,    speundef,    0x1F, 0x0B, 0x00600000, 0xFFFFFFFF, PPC_SPE_DOUBLE),
- 
- #undef GEN_SPEOP_LDST
- #define GEN_SPEOP_LDST(name, opc2, sh)                                        \
-@@ -9456,11 +9490,19 @@
-                          opc3(ctx.opcode), ctx.opcode, ctx.nip - 4, (int)msr_ir);
-             }
-         } else {
--            if (unlikely((ctx.opcode & handler->inval) != 0)) {
-+            uint32_t inval;
-+
-+            if (unlikely(handler->type & (PPC_SPE | PPC_SPE_SINGLE | PPC_SPE_DOUBLE) && Rc(ctx.opcode))) {
-+                inval = handler->inval2;
-+            } else {
-+                inval = handler->inval1;
-+            }
-+
-+            if (unlikely((ctx.opcode & inval) != 0)) {
-                 if (qemu_log_enabled()) {
-                     qemu_log("invalid bits: %08x for opcode: "
-                              "%02x - %02x - %02x (%08x) " TARGET_FMT_lx "\n",
--                             ctx.opcode & handler->inval, opc1(ctx.opcode),
-+                             ctx.opcode & inval, opc1(ctx.opcode),
-                              opc2(ctx.opcode), opc3(ctx.opcode),
-                              ctx.opcode, ctx.nip - 4);
-                 }
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/arm-bgr.patch
similarity index 75%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/arm-bgr.patch
index a8fe65a..f3ebde6 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch
+++ b/meta/recipes-devtools/qemu/qemu-1.2.0/arm-bgr.patch
@@ -11,20 +11,20 @@ RP 16/9/2011
 
 Upstream-Status: Pending
 
-Index: qemu-0.14.0/hw/pl110.c
+Index: qemu-1.2.0/hw/pl110.c
 ===================================================================
---- qemu-0.14.0.orig/hw/pl110.c	2011-09-16 14:45:34.228668514 +0100
-+++ qemu-0.14.0/hw/pl110.c	2011-09-16 15:17:22.458671206 +0100
-@@ -141,7 +141,11 @@
+--- qemu-1.2.0.orig/hw/pl110.c	2012-09-06 14:07:27.619821133 -0700
++++ qemu-1.2.0/hw/pl110.c	2012-09-06 14:12:07.699829648 -0700
+@@ -168,7 +168,11 @@
          fprintf(stderr, "pl110: Bad color depth\n");
          exit(1);
      }
 -    if (s->cr & PL110_CR_BGR)
 +
-+    if (s->versatile && s->bpp == BPP_16)
++    if (s->version && s->bpp == BPP_16)
 +        /* Code assumes BPP_16 == 565 and BGR is never set on the versatile in 565 mode */
 +        bpp_offset = 0;
 +    else if (s->cr & PL110_CR_BGR)
          bpp_offset = 0;
      else
-         bpp_offset = 18;
+         bpp_offset = 24;
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/enable-i386-linux-user.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/enable-i386-linux-user.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/enable-i386-linux-user.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/fallback-to-safe-mmap_min_addr.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/fallback-to-safe-mmap_min_addr.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/fallback-to-safe-mmap_min_addr.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/fix-configure-checks.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/fix-configure-checks.patch
similarity index 59%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/fix-configure-checks.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/fix-configure-checks.patch
index 96881bb..ef77c92 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/fix-configure-checks.patch
+++ b/meta/recipes-devtools/qemu/qemu-1.2.0/fix-configure-checks.patch
@@ -8,15 +8,15 @@ Patch from Paul Eggleton, Comments by RP 28/11/10
 
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: qemu-0.14.0/configure
+Index: qemu-1.2.0/configure
 ===================================================================
---- qemu-0.14.0.orig/configure
-+++ qemu-0.14.0/configure
-@@ -229,6 +229,7 @@ QEMU_CFLAGS="-Wstrict-prototypes -Wredun
+--- qemu-1.2.0.orig/configure	2012-09-05 07:03:06.000000000 -0700
++++ qemu-1.2.0/configure	2012-09-06 13:55:07.007793823 -0700
+@@ -281,6 +281,7 @@
+ QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
  QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
- QEMU_CFLAGS="-D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
- QEMU_INCLUDES="-I. -I\$(SRC_PATH)"
+ QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/fpu"
 +QEMU_CFLAGS="$QEMU_CFLAGS $CFLAGS"
- LDFLAGS="-g $LDFLAGS"
- 
- # make source path absolute
+ if test "$debug_info" = "yes"; then
+     CFLAGS="-g $CFLAGS"
+     LDFLAGS="-g $LDFLAGS"
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/init-info.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/init-info.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/init-info.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/init-info.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/larger_default_ram_size.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/larger_default_ram_size.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/larger_default_ram_size.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/larger_default_ram_size.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/linker-flags.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/linker-flags.patch
similarity index 64%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/linker-flags.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/linker-flags.patch
index c0d1e55..0106ae2 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/linker-flags.patch
+++ b/meta/recipes-devtools/qemu/qemu-1.2.0/linker-flags.patch
@@ -10,14 +10,14 @@ JL - 15/06/10
 
 Upstream-Status: Inappropriate [configuration]
 
-Index: qemu-0.14.0/Makefile.target
+Index: qemu-1.2.0/Makefile.target
 ===================================================================
---- qemu-0.14.0.orig/Makefile.target
-+++ qemu-0.14.0/Makefile.target
-@@ -218,7 +218,7 @@ obj-$(CONFIG_REALLY_VIRTFS) += virtio-9p
- obj-y += rwhandler.o
- obj-$(CONFIG_KVM) += kvm.o kvm-all.o
- obj-$(CONFIG_NO_KVM) += kvm-stub.o
+--- qemu-1.2.0.orig/Makefile.target	2012-09-05 07:03:06.000000000 -0700
++++ qemu-1.2.0/Makefile.target	2012-09-06 13:42:24.819764288 -0700
+@@ -130,7 +130,7 @@
+ obj-$(CONFIG_HAVE_CORE_DUMP) += dump.o
+ obj-$(CONFIG_NO_GET_MEMORY_MAPPING) += memory_mapping-stub.o
+ obj-$(CONFIG_NO_CORE_DUMP) += dump-stub.o
 -LIBS+=-lz
 +LIBS+=-lz -lX11 -ldl
  
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/no-strip.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/no-strip.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/no-strip.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/no-strip.patch
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/powerpc_rom.bin b/meta/recipes-devtools/qemu/qemu-1.2.0/powerpc_rom.bin
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/powerpc_rom.bin
rename to meta/recipes-devtools/qemu/qemu-1.2.0/powerpc_rom.bin
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch
similarity index 61%
rename from meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
rename to meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch
index c4c5424..a1b8035 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
+++ b/meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch
@@ -4,11 +4,11 @@
 
 Upstream-Status: Pending
 
-Index: qemu-0.14.0/console.h
+Index: qemu-1.2.0/console.h
 ===================================================================
---- qemu-0.14.0.orig/console.h
-+++ qemu-0.14.0/console.h
-@@ -171,6 +171,12 @@ struct DisplayAllocator {
+--- qemu-1.2.0.orig/console.h	2012-09-06 14:12:23.371832381 -0700
++++ qemu-1.2.0/console.h	2012-09-06 14:12:23.627832390 -0700
+@@ -171,6 +171,12 @@
      void (*free_displaysurface)(DisplaySurface *surface);
  };
  
@@ -21,7 +21,7 @@ Index: qemu-0.14.0/console.h
  struct DisplayState {
      struct DisplaySurface *surface;
      void *opaque;
-@@ -178,6 +184,7 @@ struct DisplayState {
+@@ -178,6 +184,7 @@
  
      struct DisplayAllocator* allocator;
      struct DisplayChangeListener* listeners;
@@ -29,7 +29,7 @@ Index: qemu-0.14.0/console.h
  
      void (*mouse_set)(int x, int y, int on);
      void (*cursor_define)(QEMUCursor *cursor);
-@@ -229,6 +236,12 @@ static inline void register_displaychang
+@@ -233,6 +240,12 @@
      ds->listeners = dcl;
  }
  
@@ -42,47 +42,35 @@ Index: qemu-0.14.0/console.h
  static inline void dpy_update(DisplayState *s, int x, int y, int w, int h)
  {
      struct DisplayChangeListener *dcl = s->listeners;
-Index: qemu-0.14.0/hw/vmware_vga.c
+Index: qemu-1.2.0/hw/vmware_vga.c
 ===================================================================
---- qemu-0.14.0.orig/hw/vmware_vga.c
-+++ qemu-0.14.0/hw/vmware_vga.c
-@@ -1001,8 +1001,9 @@ static void vmsvga_update_display(void *
-     }
- }
- 
--static void vmsvga_reset(struct vmsvga_state_s *s)
-+static void vmsvga_reset(void *parm)
- {
-+    struct vmsvga_state_s *s = (struct vmsvga_state_s *)parm;
-     s->index = 0;
-     s->enable = 0;
-     s->config = 0;
-@@ -1207,6 +1208,8 @@ static const VMStateDescription vmstate_
- 
- static void vmsvga_init(struct vmsvga_state_s *s, int vga_ram_size)
+--- qemu-1.2.0.orig/hw/vmware_vga.c	2012-09-06 14:12:23.371832381 -0700
++++ qemu-1.2.0/hw/vmware_vga.c	2012-09-06 14:18:05.595845288 -0700
+@@ -1081,6 +1081,8 @@
+ static void vmsvga_init(struct vmsvga_state_s *s,
+                         MemoryRegion *address_space, MemoryRegion *io)
  {
 +    DisplayPostCallback *dpc;
 +
      s->scratch_size = SVGA_SCRATCH_SIZE;
-     s->scratch = qemu_malloc(s->scratch_size * 4);
+     s->scratch = g_malloc(s->scratch_size * 4);
  
-@@ -1224,7 +1227,10 @@ static void vmsvga_init(struct vmsvga_st
-     vga_init(&s->vga);
+@@ -1098,6 +1100,10 @@
+     vga_common_init(&s->vga);
+     vga_init(&s->vga, address_space, io, true);
      vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
- 
--    vmsvga_reset(s);
-+    dpc = qemu_mallocz(sizeof(DisplayPostCallback));
++    dpc = g_malloc0(sizeof(DisplayPostCallback));
 +    dpc->postcall = vmsvga_reset;
 +    dpc->parm = s;
 +    register_displaypostcallback(s->vga.ds, dpc);
- }
  
- static void pci_vmsvga_map_ioport(PCIDevice *pci_dev, int region_num,
-Index: qemu-0.14.0/qemu-common.h
+     s->depth = ds_get_bits_per_pixel(s->vga.ds);
+     s->bypp = ds_get_bytes_per_pixel(s->vga.ds);
+Index: qemu-1.2.0/qemu-common.h
 ===================================================================
---- qemu-0.14.0.orig/qemu-common.h
-+++ qemu-0.14.0/qemu-common.h
-@@ -241,6 +241,7 @@ typedef struct DisplayState DisplayState
+--- qemu-1.2.0.orig/qemu-common.h	2012-09-06 14:12:23.371832381 -0700
++++ qemu-1.2.0/qemu-common.h	2012-09-06 14:12:23.643832391 -0700
+@@ -250,6 +250,7 @@
  typedef struct DisplayChangeListener DisplayChangeListener;
  typedef struct DisplaySurface DisplaySurface;
  typedef struct DisplayAllocator DisplayAllocator;
@@ -90,19 +78,19 @@ Index: qemu-0.14.0/qemu-common.h
  typedef struct PixelFormat PixelFormat;
  typedef struct TextConsole TextConsole;
  typedef TextConsole QEMUConsole;
-Index: qemu-0.14.0/vl.c
+Index: qemu-1.2.0/vl.c
 ===================================================================
---- qemu-0.14.0.orig/vl.c
-+++ qemu-0.14.0/vl.c
-@@ -1920,6 +1920,7 @@ int main(int argc, char **argv, char **e
+--- qemu-1.2.0.orig/vl.c	2012-09-06 14:12:23.371832381 -0700
++++ qemu-1.2.0/vl.c	2012-09-06 14:17:32.635844142 -0700
+@@ -2352,6 +2352,7 @@
      char boot_devices[33] = "cad"; /* default to HD->floppy->CD-ROM */
      DisplayState *ds;
      DisplayChangeListener *dcl;
 +    DisplayPostCallback *dpc;
      int cyls, heads, secs, translation;
-     QemuOpts *hda_opts = NULL, *opts;
+     QemuOpts *hda_opts = NULL, *opts, *machine_opts;
      QemuOptsList *olist;
-@@ -3101,6 +3102,13 @@ int main(int argc, char **argv, char **e
+@@ -3699,6 +3700,13 @@
  
      /* display setup */
      dpy_resize(ds);
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
similarity index 57%
rename from meta/recipes-devtools/qemu/qemu_0.15.1.bb
rename to meta/recipes-devtools/qemu/qemu_1.2.0.bb
index f4c86f0..55ac532 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
@@ -3,13 +3,8 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r11"
-
-FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
-FILESDIR = "${WORKDIR}"
-
 SRC_URI = "\
-    http://wiki.qemu.org/download/qemu-${PV}.tar.gz \
+    http://wiki.qemu.org/download/qemu-${PV}.tar.bz2 \
     file://powerpc_rom.bin \
     file://no-strip.patch \
     file://linker-flags.patch \
@@ -18,16 +13,9 @@ SRC_URI = "\
     file://fallback-to-safe-mmap_min_addr.patch \
     file://larger_default_ram_size.patch \
     file://arm-bgr.patch \
-    file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
-    file://0001-ppc64-Fix-linker-script.patch \
-    file://ppc-s500-set-invalid-mask.patch \
-    file://hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch \
     "
-
-SRC_URI[md5sum] = "34f17737baaf1b3495c89cd6d4a607ed"
-SRC_URI[sha256sum] = "7705b14d9b8e4df4a0b1790980e618084261e8daef0672a1aa7a830a0f3db5ba"
-
-S = "${WORKDIR}/qemu-${PV}"
+SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
+SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
 
 do_configure_prepend_virtclass-nativesdk() {
 	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
-- 
1.7.9.5



