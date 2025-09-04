Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC4CCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 05:15:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.32224.1756962913814895309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 22:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYfpNBvX;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2491f6b39a1so5226595ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756962913; x=1757567713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqSPu1EGuJXlbyQP8JJ3N+DcAR0yqtDNX7AWOn/UVns=;
        b=YYfpNBvXpjiRsD3GZIav+QI3Sh4aiHQLjBqPRnc0Mn46dgYbIUEjtRhKYwP0i9QWDK
         hN+I4MhVrYhnWI2zHS9YOr4Veji60+NLpVAXXYCCk3OrKUP33JDmMV81nMFwIeFtjvBl
         BvpBQfJMt4gUkIIKaIfCvZnPnhY/jkE0MNH4MOKtSxr5IF1ttE2vslHY6AySGTy1tmvi
         ECHvwzOTLPxLxXUVR5cMtJsOvcER3WKV0ijYb7hx5Yu7uUClMYg+msBIN/supWT7Xtpk
         gcOoLE9LR1tP6zC++EsSCpSaB8tXq8d1TOutU1ZHguz9G5c+iFdO1OLdqru/lfodAUKn
         t1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756962913; x=1757567713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqSPu1EGuJXlbyQP8JJ3N+DcAR0yqtDNX7AWOn/UVns=;
        b=OgokCu++mK90Cb4toySR5uDPhCIy+dOdHEiGTEDkM6AaM2Sic0914KG/Nh16nEFkFZ
         gCF4UqikGhf8Z0E24s55EjXdANbK2Hsugkw7S27L+Krwn7tc1bip2w1QO5Ghn2SCWl4o
         vw80P0MO+7mp/jZNquRcuEce+IrxRMxaMKVur6wHHC8SI1q0XVcOVPlY5jJ3BlqUUM8k
         jn7OUKjOVZ1JLboXjYJOHBjDGEWLGrmCnImlly6eswEDAPaMOw8LK+1/9bl3GgmMW/pg
         pG5TLQ8nMfGpqOG8s78P/M8Yh+z+s9uPYhH30Ig4iRLLfnikQqAeLWhkhNXhSWVOruYc
         1XSQ==
X-Gm-Message-State: AOJu0Ywwup6a4VgcVS1srj/rSS2rVe/ksKUosX4aXertC1ydSM9L8DZI
	ximsN0HgOkYuRGdlvWWLGvnoq+FqqaKxHrQ+W+KhKsMro6mhd+o1zJtY/MuDcUIF
X-Gm-Gg: ASbGncvmFrUZ800ucJ3ArxKqzbEIeR+619gwaDFYb9IkVR0cwrv1F10H61WbjzmVb4g
	vLAW9HDKelDTirWFgTBTLpCI8wyL4SPK61/HWLNedxKpODyOZGD2yT8L/t9PVSQiO7cRlZTk/Ra
	92xU8zFDP73LK8+rSx16fGJm/RJacvBgurdw4eaHmJzgFVlsmDQDqp1lzalzxtdZwF80j/83ysT
	k8dKgUlDs+wn7sfuU2YSPSRl0rdfiOl+QAb31CxlhUcTn998YOPcRuC3EhMDOe/UYxETaF56Olz
	clTlP1w5TV+fGGMVgfWGAVTETt7BNf+yB+/bjZFDuwLT6GgWiA5p3jyHv3fTHRKVmf2/SO0Qm4k
	Xjv/Z3+DosUE0wFIja45mZbRdZvV9WRZ8IFWaTw0YkGCoiP5/R7PGH84l2EwtiyWeAl0WlR7T1A
	ymMzqY6OWeP1dK58fQEVSkfdTAMIK7nhCCnpepU9hiQQcWVe0aFYI=
X-Google-Smtp-Source: AGHT+IG4PL1Atla5kj1G8dHm+LK56eZDYnvwCtz96u2iuWtiKJZhsaz6EhJ7hiVmcItWeOssGPyBCg==
X-Received: by 2002:a17:903:38c5:b0:248:811e:f86c with SMTP id d9443c01a7336-24944a985dfmr228590835ad.34.1756962912800;
        Wed, 03 Sep 2025 22:15:12 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d93317f0sm18756121a91.6.2025.09.03.22.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:15:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] kexec-tools: Fix build with LLD linker
Date: Wed,  3 Sep 2025 22:15:08 -0700
Message-ID: <20250904051509.798465-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904051509.798465-1-raj.khem@gmail.com>
References: <20250904051509.798465-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222898

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update the Patch-Status to Submitted

 ...nt-base-match-pinned-section-address.patch | 36 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.31.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
new file mode 100644
index 00000000000..42d81439957
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
@@ -0,0 +1,36 @@
+From 0d8a9e12b6509cb2a79818f5f4062a0bee33edfc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2025 13:28:32 -0700
+Subject: [PATCH] Make the segment base match pinned section address
+
+ET_EXEC uses image base of 0x400000, but the build forces
+section VMAs like .text = 0x10000. LLD now errors when any
+section address is below the image base unless you explicitly
+set the base. (Older LLD tolerated it.)
+
+To fix this, set the image base to match forced section addresses
+
+Fixes
+| x86_64-yoe-linux-ld.lld: error: section '.text' address (0x10000) is smaller than image base (0x400000); specify --image-base
+| x86_64-yoe-linux-ld.lld: error: section '.bss' address (0x12000) is smaller than image base (0x400000); specify --image-base
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2025-September/033481.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec_test/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec_test/Makefile b/kexec_test/Makefile
+index fec6210..f9fa92c 100644
+--- a/kexec_test/Makefile
++++ b/kexec_test/Makefile
+@@ -31,7 +31,7 @@ $(KEXEC_TEST): CPPFLAGS+=-DRELOC=$(RELOC)
+ $(KEXEC_TEST): ASFLAGS+=-m32
+ #$(KEXEC_TEST): LDFLAGS=-m32 -Wl,-e -Wl,_start -Wl,-Ttext -Wl,$(RELOC) \
+ #		       -nostartfiles
+-$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -Ttext $(RELOC)
++$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start --image-base=$(RELOC) -Ttext $(RELOC)
+ 
+ $(KEXEC_TEST): $(KEXEC_TEST_OBJS)
+ 	mkdir -p $(@D)
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
index 7333aa73c17..b12f76a0bf4 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            file://0001-ppc-fs2dt-Match-function-signatures.patch \
+           file://0001-Make-the-segment-base-match-pinned-section-address.patch \
            "
 
 SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"

