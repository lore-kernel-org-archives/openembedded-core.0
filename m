Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11537.1792467118338180768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 20:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WjiHwmZ6;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6760488eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 20:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792467117; x=1793071917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0SqTpNt+gDxc2eTQYbNHQQlgZWJ6VR+81m0PrBhH2E=;
        b=WjiHwmZ6u0XjSvVmEDKLXBp1G4QsP6ZBE8qLWvdqUubVWGGlDqAHi+wpqIfhMW92BE
         gTNieLGqC8wEY7+i++yOKWTnfXwQ6LydpamgEUCJ3LFWTUL0wnw6CD5GfMcJgr9wmDHU
         QqGCIPSp0XiBEv5KlF6ia82eQf+aLFSl8HyumEhRgrf6BdZY5Wktg/k/2JMVNAddxpFo
         FYE0/D0k9lsDeEf6rOCg9Mrvbf1wtin/yNVhXOIqzDL3dryi0qKFc6LMZvcZyXlVZ1Lb
         nmK02ziNcTZ4A+ETTi6NadJ/zXG7w2O6jKnfp1jsOwTqLaLpDhygrY40cUFpjiultk5d
         VGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792467117; x=1793071917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0SqTpNt+gDxc2eTQYbNHQQlgZWJ6VR+81m0PrBhH2E=;
        b=M4PCmz2aSS5iYhjZTELb9Sc23E9/kljae/9UOGxyK++okJ3KOHDbCNz9rhRIj/nONn
         cKNtxEOPG8unfRJifrXq75MgOm3jYugJh9j+mY8PpujJ64L4ShjeaPqAS7mYx+UOldlX
         x4YQGRIVVLaEqBk1+iw15/asyPuZGvIp7RDFPVIcjS05l5jxprJZ/s+0IBGdd22Hcmxt
         3FgCAF8EFObhcWVuc7IJ22d98ngr5cAK5cSqsJvJ+uw4q6iRNVZw5nHtIRE7aviU61HZ
         jxivEbbuRgWqeJX2L8aD34muERMcEKi3/aiHR2jMjIv/11HuAB4olXnhSYLXfqqPRhUw
         kCAw==
X-Gm-Message-State: AFq9FYKASvOI5cj0n96HLIjRtSIJl8dNzd+xioXcFz2i76/orWs2Mky/
	jYXLoJEMlmJeQznYkHVUhPzBLa2MN46ZBgidnz0bBscCppVB6sdWWp0w2tWMZwBAQkg=
X-Gm-Gg: AYBFou3A+Afd5V2i7LURr4olZYHdSh4Te6gMeF121jC7y77T2C2EDS0TGKcx0c4u6r6
	PIKaHqFgx5HwMAS+YKDy2eoN+hYcsO236mkDoCf3yLwRW5UQFFUZPf37oEqzugjEboyPfoc1tDP
	25wynYbnVUxrUVlp4YrwHDrTs0bYyWP/B6qHkqcqCmZ5/Qoth/hl4LuvntTq4MN9etdLmm4qFSt
	OaqxO4goFDrbmR8Z1J6ptx/MzZm6g3SrxG0Vteld/UCVuimWr0sVxTiUsuNjBPT7wFytL4R7nrY
	lSkBzNPmx0jUq2HtKxQVAfBHSapI2oafsGyPpmGirnZJHUJpCV4TuMIOvLj+Ktn4aG7VaJOgO91
	5tDXEghiZv7tlTyxzAWghyEK9nU7gaS123u5GnnW/34h0u+lmXVOWpHMAtoE2VtOYjJhSAKP7TM
	m5EYxwA6043R4XtEFL9uE/k0fatWtdDjjaSqOCNxynDND+lLeQUQYViTlkxKVheR1+LYR9BJIhl
	PtdXYjRz8M6wCXDkX62nicDJLFf+OkgQZbmzPgaXhTxJ6folVCHHZDOtpFJk2xVpdRazJLOMarJ
	i3xfViS2LcEUAiPmuQblK8E9FpiG80GaPvKj5heNpJPnM8jQamILWzeB3yfRI7ZV055cb+WEJjF
	2TrYtiPtbbRGoe4jv2xlphoiiEtUicK/BzXPS+/8xe8P/w2apLpXr1j/SyuXpc919It1gP9ODMd
	x6+S8jLgjwlJLqlb4EEapEWBmpFOUzcEss3jMb4xu7VFo2Zg==
X-Received: by 2002:a05:701b:4587:b0:143:26cf:8615 with SMTP id a92af1059eb24-18512b42d8emr14840288c88.25.1792467117270;
        Mon, 19 Oct 2026 20:31:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm32828470c88.17.2026.10.19.20.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:31:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] clang: Fix crash with -fzero-call-used-regs on RISC-V large frames
Date: Mon, 19 Oct 2026 20:31:53 -0700
Message-ID: <20261020033153.1124574-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 03:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248214
Content-Type: text/plain; charset="utf-8"

Backport the upstream fix which runs insertZeroCallUsedRegs after the
frame virtual registers are scavenged. RISC-V uses a virtual register
to adjust the stack pointer when the frame is too large for addi
immediates (more than ~6KB), and clang 23.1.3 crashes in Prologue/
Epilogue Insertion when -fzero-call-used-regs=used-gpr is also used.

QEMU enables this flag by default, so building qemu for riscv64 with
clang fails on contrib/plugins/uftrace.c:

  Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on
  function '@cpu_unwind_stack'
  clang: error: clang frontend command failed due to signal

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...eroCallUsedRegs-after-materializing-.patch | 72 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0035-PEI-Call-insertZeroCallUsedRegs-after-materializing-.patch

diff --git a/meta/recipes-devtools/clang/clang/0035-PEI-Call-insertZeroCallUsedRegs-after-materializing-.patch b/meta/recipes-devtools/clang/clang/0035-PEI-Call-insertZeroCallUsedRegs-after-materializing-.patch
new file mode 100644
index 0000000000..d2b27deb5b
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0035-PEI-Call-insertZeroCallUsedRegs-after-materializing-.patch
@@ -0,0 +1,72 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Lucas Chollet <lucas.chollet@free.fr>
+Date: Thu, 3 Sep 2026 21:31:08 +0200
+Subject: [PATCH] [PEI] Call insertZeroCallUsedRegs after materializing registers
+ (#214147)
+
+As insertZeroCallUsedRegs only operates on physical registers, we need
+to call after all registers are materialized, so after
+scavengeFrameVirtualRegs.
+
+This fixes a crash that occurs when virtual registers reach
+insertZeroCallUsedRegs. Virtual registers can be introduced during the
+pass by emit{Prologue,Epilogue}. For example, RISC-V uses a virtual
+register to hold the size of a large alloca.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/7a27b9779e73d3bcb0cf2deb1f74f68ec725595b]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ llvm/lib/CodeGen/PrologEpilogInserter.cpp      |  5 ++---
+ llvm/test/CodeGen/RISCV/zero-call-used-regs.ll | 17 +++++++++++++++++
+ 2 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/llvm/lib/CodeGen/PrologEpilogInserter.cpp b/llvm/lib/CodeGen/PrologEpilogInserter.cpp
+index 43c7e89..d3ad107 100644
+--- a/llvm/lib/CodeGen/PrologEpilogInserter.cpp
++++ b/llvm/lib/CodeGen/PrologEpilogInserter.cpp
+@@ -285,6 +285,8 @@ bool PEIImpl::run(MachineFunction &MF) {
+   if (TRI->requiresRegisterScavenging(MF) && FrameIndexVirtualScavenging)
+     scavengeFrameVirtualRegs(MF, *RS);
+ 
++  insertZeroCallUsedRegs(MF);
++
+   // Warn on stack size when we exceeds the given limit.
+   MachineFrameInfo &MFI = MF.getFrameInfo();
+   uint64_t StackSize = MFI.getStackSize();
+@@ -1179,9 +1181,6 @@ void PEIImpl::insertPrologEpilogCode(MachineFunction &MF) {
+   for (MachineBasicBlock *RestoreBlock : RestoreBlocks)
+     TFI.emitEpilogue(MF, *RestoreBlock);
+ 
+-  // Zero call used registers before restoring callee-saved registers.
+-  insertZeroCallUsedRegs(MF);
+-
+   for (MachineBasicBlock *SaveBlock : SaveBlocks)
+     TFI.inlineStackProbe(MF, *SaveBlock);
+ 
+diff --git a/llvm/test/CodeGen/RISCV/zero-call-used-regs.ll b/llvm/test/CodeGen/RISCV/zero-call-used-regs.ll
+index 46b0cba..78198b4 100644
+--- a/llvm/test/CodeGen/RISCV/zero-call-used-regs.ll
++++ b/llvm/test/CodeGen/RISCV/zero-call-used-regs.ll
+@@ -335,5 +335,22 @@ entry:
+   ret double %mul2
+ }
+ 
++define void @huge_stack() #0 "zero-call-used-regs"="used-gpr" {
++; CHECK-LABEL: huge_stack:
++; CHECK:       # %bb.0:
++; CHECK-NEXT:    lui a0, 10
++; CHECK-NEXT:    addi a0, a0, -944
++; CHECK-NEXT:    sub sp, sp, a0
++; CHECK-NEXT:    .cfi_def_cfa_offset 40016
++; CHECK-NEXT:    lui a0, 10
++; CHECK-NEXT:    addi a0, a0, -944
++; CHECK-NEXT:    add sp, sp, a0
++; CHECK-NEXT:    .cfi_def_cfa_offset 0
++; CHECK-NEXT:    li a0, 0
++; CHECK-NEXT:    ret
++  %1 = alloca [10000 x i32], align 4
++  ret void
++}
++
+ attributes #0 = { "target-cpu"="generic" "target-features"="+m,+f,+d" }
+ attributes #1 = { "target-cpu"="generic" "target-features"="+m,+zdinx" }
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 6465fe3399..2662371746 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -54,6 +54,7 @@ SRC_URI = "\
     file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
     file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
     file://0034-clang-tools-extra-Add-separate-CLANG_TOOLS_EXTRA_INC.patch \
+    file://0035-PEI-Call-insertZeroCallUsedRegs-after-materializing-.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
