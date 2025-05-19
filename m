Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E276C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 18:30:36 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2447.1747679433060122084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 11:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZSq4J3oQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23278ce78efso994905ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747679432; x=1748284232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8YUne8yYxffqTUt621Wbp7l8KWWEQQe6C+YNMdJ+Iks=;
        b=ZSq4J3oQcGTVYXvBtccSTorNEUhQ6Scy4Hw/oWG39XU+HIuoQBkM2yCBKgtFEOb95s
         0FNfZODNO2V8RL45ivkWlAAUB+O+8ubw46X43lL0DuD+84qynt/TENK51kgMiaMbzo2W
         7rKxUZEMzqUPp3sSYL0lI+Z1XMrAciq5H8MCrFloAOCCAX5NocMx/FT/SuK3B+TuocUI
         MPoxi/JLJrzfimJwDhTsp4pmosEOvId9GbXiy1nRULuYrJB5tj1dstCqQKG2drv5PCAl
         5o43iUHk0Z8JRZy+WpKK7/+MGlSkz5jG463yjJM9c1sHE5w61S9I4RxTVB+GgkF9OBtQ
         LC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679432; x=1748284232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YUne8yYxffqTUt621Wbp7l8KWWEQQe6C+YNMdJ+Iks=;
        b=oIM6AMmagB4L8BgGyJ5hCnp4/32pt/Cp31AvgNpYS5xo2Qt5qslAfcAxv5nhzVVTlv
         bEmXtYNTPbpiyq80jNSHkqQ4S8Spo4IHbDMobf5PUDTLUoGaCv8SPYlnIMKFjZiaAU6z
         T8MQijetQ7PGpHAaN29+wQ+8Sst0hFcr6iw8aRCnAGRroTQUP15jB+IeJyQOkiVMIlDb
         /w5c4Lkfw5kOEFyLkNpSXaT+hfXZ0D2AvxdFegYQHjSQPJ02T4+Od84aG1zgFKPMaG9t
         qMoXMWtHnZl8tKLpimTFVkCWWWSPfmrSCHckAI/V4foOgGazfkEdxEkMGW3biHJxJnT1
         RmaA==
X-Gm-Message-State: AOJu0Ywh9yAsF/8eLXuqKFK82FouMr2JuGbSKxcAZp+wuI9P0YH7fgSU
	1grnfO4ZawsuIMTSJHcta8vFxiHqcQV/mHzLd/Hlrs7SvW9VszJZYPB3QDSr7voW
X-Gm-Gg: ASbGncuDrN4/3I3CZhE43Q3dXhjVjMUgA056hbb7XU8FzBLKFwEOJZBJ+kx4+mZymPF
	h0q2TlurFWUOqBiFCnw6ZzDC8bHSHAIs1qmezv85hY58pTHLPqgQIblkm938ZCBISHki5gMUE+v
	JNIKydp2QdOV4bTayKwG2WQPg/PIali4mV1Rlm7wcrTY4QwATLZTHnk6fHPUQHexiSl4jtulDtD
	anrhNz1LqafPLjCidMxx24w/ddqoMQ5Y8I4oq6k0WD4VA0o4Ys5zXF1/sfLOAFc74sP355LGY4m
	05hSx6cdecUzkoSbN8dsc3CzGptls4h64vBOIbCzU+4=
X-Google-Smtp-Source: AGHT+IGyRUJDSP7Yvr4tJ6GQUtQndNBXf9lqGVyErZTHQ5mahkpS8aNnJ5NPoEoKkFqqit2+eobZbA==
X-Received: by 2002:a17:903:f90:b0:22d:b243:2fee with SMTP id d9443c01a7336-231d44e6835mr162668785ad.13.1747679432120;
        Mon, 19 May 2025 11:30:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e27e62aasm59856265ad.31.2025.05.19.11.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 11:30:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcc: Fix wrong code generation in atomic intrinsics for arm
Date: Mon, 19 May 2025 11:30:29 -0700
Message-ID: <20250519183029.1517865-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 18:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216867

From: Jeroen Hofstee <jhofstee@victronenergy.com>

This is seen with QT code

Error: ARM register expected -- `ldrex r1,[s16]'

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Combine, sign-offs into single patch and keep patch numbering in order

 meta/recipes-devtools/gcc/gcc-15.1.inc        |  1 +
 ...-validate-mem_noofs_operand-PR120351.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
index 864c6091a6b..8543d9f7d07 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -69,6 +69,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch
new file mode 100644
index 00000000000..3f324fdc223
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch
@@ -0,0 +1,95 @@
+From bb7adc5dab8bcee2ef1c0d2af370ea77c49bb5c5 Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com>
+Date: Mon, 19 May 2025 16:19:39 +0100
+Subject: [PATCH] arm: fully validate mem_noofs_operand [PR120351]
+
+It's not enough to just check that a memory operand is of the form
+mem(reg); after RA we also need to validate the register being used.
+The safest way to do this is to call memory_operand.
+
+	PR target/120351
+
+gcc/ChangeLog:
+
+	* config/arm/predicates.md (mem_noofs_operand): Also check the op
+	is a valid memory_operand.
+
+gcc/testsuite/ChangeLog:
+
+	* gcc.target/arm/pr120351.c: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=e5bb7a328eb71daa02d15b48d3a6c6b8cd24abc5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/arm/predicates.md            |  3 +-
+ gcc/testsuite/gcc.target/arm/pr120351.c | 47 +++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr120351.c
+
+diff --git a/gcc/config/arm/predicates.md b/gcc/config/arm/predicates.md
+index 75c06d9be25..655f60312de 100644
+--- a/gcc/config/arm/predicates.md
++++ b/gcc/config/arm/predicates.md
+@@ -907,7 +907,8 @@
+ 
+ (define_predicate "mem_noofs_operand"
+   (and (match_code "mem")
+-       (match_code "reg" "0")))
++       (match_code "reg" "0")
++       (match_operand 0 "memory_operand")))
+ 
+ (define_predicate "call_insn_operand"
+   (ior (and (match_code "symbol_ref")
+diff --git a/gcc/testsuite/gcc.target/arm/pr120351.c b/gcc/testsuite/gcc.target/arm/pr120351.c
+new file mode 100644
+index 00000000000..d8e9d73275c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/pr120351.c
+@@ -0,0 +1,47 @@
++/* { dg-do assemble } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-add-options arm_neon } */
++/* { dg-additional-options "-O2" } */
++
++
++typedef struct A
++{
++  int f1;
++} A;
++
++__inline void ref (A* x)
++{
++  __atomic_fetch_add(&x->f1, 1, 0);
++}
++
++typedef struct B
++{
++  A *d;
++  int *ptr;
++} B;
++
++void insertOne (B*, B*);
++
++void init (B *);
++__inline void copy (B *p, B *q)
++{
++  p->d  = q->d;
++  p->ptr = q->ptr;
++  ref (p->d);
++}
++
++__inline void emplace(B* x)
++{
++  B dummy;
++  B _tmp;
++  init (&dummy);
++  copy (&_tmp, &dummy);
++  insertOne(x, &_tmp);
++}
++
++void testing ()
++{
++  B test;
++  init (&test);
++  emplace(&test);
++}

