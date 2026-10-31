Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3745.1793405764296349130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Xygi02xN;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so10822605e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405762; x=1794010562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uj4yrA/E8e+7y4d/wFq0im6DjGnF52e1slDHxjvr9NM=;
        b=Xygi02xNWstclPuiaeWBpBcyDtTDtITyC6JtDgvJ5lmPnPKsXzoV7imdNuhn15VBWI
         twu8afK5QbO3C2F6kCqBIyaM7i989rycMRSeIkXZyM0/JZpFvgqyhlx8u88A7nzRfcXv
         bOxR3zvsNwq7oBpjKrmGucvATZEy2amxOnJ7N+rH4el/qheOCHudu/437a1mGvWMdCe4
         r4ZyR+J2+zd9hHxrBMxrarhFBVT0QM0E/qYkaLeTs1EQaFI5hecf3hk6tZP7q1+LN4rS
         1tfxj/OuHLXXlEVL9z1RGejDR4qMVRygWHds/7fbP5XUenLzAzFUW42l0ZN8+gC5FR9P
         HSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405762; x=1794010562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uj4yrA/E8e+7y4d/wFq0im6DjGnF52e1slDHxjvr9NM=;
        b=jaE7MMBkNToGEKgMP1leylmkHBcd9pBBYwBJAEPM8spS4+v1HSZ9hvbKKwXt1RtIFZ
         wQTUg8WPm8rrQgiqCjAO2CC2ufmoYQ4M5T8lgqGUBAKVc2MBeLBx1t7uRNxsW2XniNvd
         7xJ7JlOwOrwvNXwh9Yd9YEPczZ+GSYHasTx7NjpubSEqOzgWO653WQF6z+r7+oSiu5sm
         P6rkd0uhfpNGk/VW9XPMHWNhIHl2gaLlR86egwYjruo38jQ+SjQnZFUGn0kKkSjaXdiw
         DndAhpLAMaBrRljS65xWfPw7fU/xZXLTm+VvprtKBdAEVfqInXl23TqdCQ/EOuhv0sGD
         mALg==
X-Gm-Message-State: AFq9FYLwZkuA5QVdVaBgL0KVpgyRiPle+ViaRZo/i7jgqS1vug27fclh
	uS0bzrzUQQDU9oNFnu5lAe0rGallSZm3XiOk/nWKPPyd8Oj50DXw0uQc1hu/0P8C/pqpcggmxeA
	DT7BeyKI=
X-Gm-Gg: AYBFou1vocIF7YQqPq+3HNNY7cH3RjN6pi7EH8F6H8Oa78sYBTZnSCC4VGYM0B/EmBr
	REYWYn76/5Tnc0qkQpKseCxzeYUimpqNjtrKq3vaRjyZDsh1/yx+TLTCzxVj0ZhS2ycOVRhGVsx
	lZbd9tAj3nowXN9FbWF9rKFdzYB/zbxR3POFyrcBtrp2POAsfPpeN75r79Meg8otJHTJQgZRu1s
	Xbjuox9Z1EUPH9BotKnSNLeM+ARVHAXYLEKLWeyreZwAvs/ju0xdKvfbylHK59XUMXAlcgW8w6k
	0udOZ3IpwjTA8vp9dvxvR9aOTm8odiYJw/2dUPCWjffDrLbmVhtd35ENO8MHt5iQ7VFDl7HwRLS
	wZp1qNTny6ndxvyoerP5NXIhQFI3lTmZIs2BLW7/Z0lFglEibt5JkmrauWJsDeSGWvb5oG0t2+k
	+go+uICD4bzHfQ64XUL00xg+gozPFajXy1g/D5/QQA65BxsUB02H04n1mcxttfXWIUJXUGF4PyM
	53exb9NGlmbBQkpAgKkCNbuiW3xoTkcE/Idhs/SD90zbuwKSCSbxZuWqGXeOwi/cvgteB1Trt+n
	BVAQao5CHwOoOKnC2CVbfw/lqk9JK1WyENmNGrYmlq1FcZW4v3GWTCPNxxnCLIZ533demDVFSd1
	Sizwjq8Q4nNPEUDHXCwqclSlXZLg9Gw==
X-Received: by 2002:a05:600c:1d02:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ac16bc4731mr94404375e9.8.1793405762393;
        Fri, 30 Oct 2026 17:16:02 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/55] glibc: patch CVE-2026-97399
Date: Sat, 31 Oct 2026 01:14:54 +0100
Message-ID: <a73d9143a8b7b06026dc400eb50072096f020ee1.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249108
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0048-CVE-2026-97399.patch     | 128 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch

diff --git a/meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch b/meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch
new file mode 100644
index 00000000000..c5aec0802c9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch
@@ -0,0 +1,128 @@
+From f247c0a2fb5b3e48a771d2d23efc9a45c64e957d Mon Sep 17 00:00:00 2001
+From: Sachin Monga <smonga@linux.ibm.com>
+Date: Thu, 1 Oct 2026 00:51:23 +0530
+Subject: [PATCH] powerpc: Fix one byte overread in strncasecmp (bug 34683,
+ CVE-2026-97399)
+
+The Power8 strncasecmp (strcasecmp.S with USE_AS_STRNCASECMP) touches
+s1[n]/s2[n] in three places when the first n bytes compare equal and
+contain no NUL: L(loop) preloads the next byte before its bdnz;
+L(loop1) increments then loads before its bdnz; and L(bytebybyte) loads
+s1[0]/s2[0] before checking r5. A caller that maps exactly n readable bytes
+can get SIGSEGV if byte n falls on an unmapped page.
+
+The L(bytebybyte) site was identified by Florian Weimer; the
+original AISLE report covered only the two loops.
+
+Fix all three sites: guard L(bytebybyte) with a r5 == 0 check, split the
+bdnz/load pairs in L(loop) and L(loop1) so the load only runs when the
+count is still positive, and preload rCHAR1/rCHAR2 in L(lessthan4) after
+confirming r5 != 0.  strcasecmp is unaffected; its generated code is
+unchanged.
+
+Add string/test-strncasecmp-nonarray.c, built on the test-Xncmp-nonarray.c
+skeleton: maps a PROT_NONE page past both buffers and sweeps all start
+offsets and lengths.  Runs as an xtest.
+
+Reported-by: AISLE in partnership with Red Hat
+Suggested-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit e622f82ea8797704ac8f761f88ed3e429e97fedd)
+
+CVE: CVE-2026-97399
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f247c0a2fb5b3e48a771d2d23efc9a45c64e957d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ string/Makefile                               |  4 +--
+ string/test-strncasecmp-nonarray.c            |  4 +++
+ sysdeps/powerpc/powerpc64/power8/strcasecmp.S | 25 +++++++++++++++----
+ 3 files changed, 26 insertions(+), 7 deletions(-)
+ create mode 100644 string/test-strncasecmp-nonarray.c
+
+diff --git a/string/Makefile b/string/Makefile
+index c83b195e2e..d7437cd915 100644
+--- a/string/Makefile
++++ b/string/Makefile
+@@ -238,8 +238,8 @@ endif
+ # This test allocates a lot of memory and can run for a long time.
+ xtests += tst-strcoll-overflow
+ 
+-# This test runs for a long time.
+-xtests += test-strncmp-nonarray
++# These tests run for a long time.
++xtests += test-strncasecmp-nonarray test-strncmp-nonarray
+ 
+ # This test needs libdl.
+ ifeq (yes,$(build-shared))
+diff --git a/string/test-strncasecmp-nonarray.c b/string/test-strncasecmp-nonarray.c
+new file mode 100644
+index 0000000000..d68e58d5ec
+--- /dev/null
++++ b/string/test-strncasecmp-nonarray.c
+@@ -0,0 +1,4 @@
++#define TEST_IDENTIFIER strncasecmp
++#define TEST_NAME "strncasecmp"
++typedef char CHAR;
++#include "test-Xncmp-nonarray.c"
+diff --git a/sysdeps/powerpc/powerpc64/power8/strcasecmp.S b/sysdeps/powerpc/powerpc64/power8/strcasecmp.S
+index 7ce53407b8..838b8bf75f 100644
+--- a/sysdeps/powerpc/powerpc64/power8/strcasecmp.S
++++ b/sysdeps/powerpc/powerpc64/power8/strcasecmp.S
+@@ -355,6 +355,14 @@ L(bytebybyte):
+ 	offset and string descriptors are only updated in the end
+ 	of loop unrolling. */
+ 	ld	rLOC, LOCALE_CTYPE_TOLOWER(rLOC)
++#ifdef USE_AS_STRNCASECMP
++	/* This entry point can be reached from the vector loop with
++	   r5 == 0 (the last vector chunk ended exactly at the `n'
++	   boundary).  Do not read s1[0]/s2[0] in that case: those
++	   bytes are s1[n]/s2[n], one past the caller's bound.  */
++	cmpdi	cr7, r5, 0
++	beq	cr7, L(retnull)
++#endif
+ 	lbz	rCHAR1, 0(rSTR1)	/* Load char from s1 */
+ 	lbz	rCHAR2, 0(rSTR2)	/* Load char from s2 */
+ #ifdef USE_AS_STRNCASECMP
+@@ -405,19 +413,23 @@ L(loop):
+ 	cmpw	cr1, rLWR1, rLWR2
+ 	crorc	4*cr1+eq,eq,4*cr1+eq
+ 	beq     cr1, L(done)
++#ifdef USE_AS_STRNCASECMP
++	/* Test the remaining count before touching the next byte. */
++	bdnz	L(loop_load)
++	b	L(lessthan4)
++L(loop_load):
++#endif
+ 	lbz	rCHAR1, 0(rSTR1)	/* Load char from s1 */
+ 	lbz	rCHAR2, 0(rSTR2)	/* Load char from s2 */
+-#ifdef USE_AS_STRNCASECMP
+-	bdnz	L(loop)
+-#else
+ 	b	L(loop)
+-#endif
+ #ifdef USE_AS_STRNCASECMP
+ L(lessthan4):
+ 	clrldi	r5, r5, 62
+ 	cmpdi	cr7, r5, 0
+ 	beq	cr7, L(retnull)
+ 	mtctr	r5
++	lbz	rCHAR1, 0(rSTR1)
++	lbz	rCHAR2, 0(rSTR2)
+ L(loop1):
+ 	cmpdi	rCHAR1, 0
+ 	sldi	rADDR1, rCHAR1, 2
+@@ -427,11 +439,14 @@ L(loop1):
+ 	cmpw	cr1, rLWR1, rLWR2
+ 	crorc	4*cr1+eq,eq,4*cr1+eq
+ 	beq	cr1, L(done)
++	bdnz	L(loop1_load)
++	b	L(retnull)
++L(loop1_load):
+ 	addi	rSTR1, rSTR1, 1
+ 	addi	rSTR2, rSTR2, 1
+ 	lbz	rCHAR1, 0(rSTR1)
+ 	lbz	rCHAR2, 0(rSTR2)
+-	bdnz	L(loop1)
++	b	L(loop1)
+ #endif
+ L(done):
+ 	subf	r0, rLWR2, rLWR1
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 0fe9c41662b..09ac0fc53f7 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -76,6 +76,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0041-CVE-2026-18374-02.patch \
            file://0042-CVE-2026-8674.patch \
            file://0047-CVE-2026-89092.patch \
+           file://0048-CVE-2026-97399.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
