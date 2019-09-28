Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 06FAC7F304
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 23:16:35 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id y5so3481320pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VsPmnR9rJRoYIzrueOkAGwqPr/1p5Dqqs8hhihqHU5M=;
	b=ceZbeNSzdChUYGK7bMQpXQK+ns0rFUiKEAP3pRI3qZnuc849UOzad8wXXO0ni3fRz2
	xn06ShoIoxbITh2bW8tlMI2MeahntMBzg+ru2p9JMGZP43yNbec2KAG/yST0eJJMAI9g
	SXXt2lwdicFnKPQTV/newM8YHz8f9JqwVQ8zAGgrBnx4u1OeqdH0afrz1MW3ijXt78tu
	1vTKi8ByGCFutohsKt0ayZ/NcEb/E41HicvbANuFqjf65yRoRNWiAGqYa1u1L1pDRubE
	Sk0aaPpvxQOJzOoiQJtGn/WQzWJ5pR9uwWpBN8Ati0cPBEop951pSYS7XxrO2LCoO8SH
	OVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VsPmnR9rJRoYIzrueOkAGwqPr/1p5Dqqs8hhihqHU5M=;
	b=d3XZUe3G8fKofviYUqhB4Agi0qepFt1UBcJp2BaBHW+46EV55c+sgPPluVSyEED2eq
	EiYaIaeaGtBrmoLnV7aJp8AdtC46NWUkOffHlh9aoRMXtTZa4vvepLH28i+KlLW4+UGU
	I/K+fZkIweLPl43He5Rr3GrpzqDhh0caIhGU410FlEU0Z1yPtzlfSpdzQwSqNuimj+TD
	l0mjVYdMqba5QEsbwmp+FcDFnKC0ceIYsUvZS7CAFPry4mwLEHoECcUj07ms+p7wwq5Y
	lY5Lp0QKsZEhtnCl2DL8UDvsZGH9ey4xLa5kSIoV2iyDjTxKdI+O0IUeZ3FYDT3Zv/79
	LJxQ==
X-Gm-Message-State: APjAAAUSAl/VxaLwYRcSkexYw4oPseQxLIMPFlDX34nNujNgDhQCjor6
	qYLVX355dKBcYaRYMvLHim2Ju6JwzSo=
X-Google-Smtp-Source: APXvYqwBcF50GWliPHBTIte9KpUms2GBzIbBKFk2NkWlS1R6lwxJQ3s9kL70DVPqQgqJ4Wbc4Ul3vA==
X-Received: by 2002:a62:cb:: with SMTP id 194mr13664413pfa.130.1569712596517; 
	Sat, 28 Sep 2019 16:16:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id 31sm9690507pgr.55.2019.09.28.16.16.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 16:16:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Sep 2019 16:16:17 -0700
Message-Id: <20190928231617.3553801-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190928231617.3553801-1-raj.khem@gmail.com>
References: <20190928231617.3553801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] musl: Fix __riscv_mc* containers to match glibc
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
X-List-Received-Date: Sat, 28 Sep 2019 23:16:36 -0000
Content-Transfer-Encoding: 8bit

Fixes packages like gdb compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-for-riscv-floating-point-state-to-_.patch | 67 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch

diff --git a/meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch b/meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch
new file mode 100644
index 0000000000..a9abb18726
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch
@@ -0,0 +1,67 @@
+From 52a37610650e7366a398dd07393d3902d2f3faa3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Sep 2019 12:19:57 -0700
+Subject: [PATCH] Change container for riscv floating-point state to __riscv_mc_fp_state
+
+Match the struct elements with glibc
+glibc also uses __riscv_mc prefix, some packages like gdb uses that
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2019/09/28/1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/riscv64/bits/signal.h | 18 +++++++++---------
+ arch/riscv64/bits/user.h   |  2 +-
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
+index 76d7ad80..aba7ab00 100644
+--- a/arch/riscv64/bits/signal.h
++++ b/arch/riscv64/bits/signal.h
+@@ -13,25 +13,25 @@ typedef unsigned long greg_t;
+ typedef unsigned long gregset_t[32];
+ 
+ struct __riscv_mc_f_ext_state {
+-	unsigned int f[32];
+-	unsigned int fcsr;
++	unsigned int __f[32];
++	unsigned int __fcsr;
+ };
+ 
+ struct __riscv_mc_d_ext_state {
+-	unsigned long long f[32];
+-	unsigned int fcsr;
++	unsigned long long __f[32];
++	unsigned int __fcsr;
+ };
+ 
+ struct __riscv_mc_q_ext_state {
+-	unsigned long long f[64] __attribute__((aligned(16)));
+-	unsigned int fcsr;
++	unsigned long long __f[64] __attribute__((aligned(16)));
++	unsigned int __fcsr;
+ 	unsigned int reserved[3];
+ };
+ 
+ union __riscv_mc_fp_state {
+-	struct __riscv_mc_f_ext_state f;
+-	struct __riscv_mc_d_ext_state d;
+-	struct __riscv_mc_q_ext_state q;
++	struct __riscv_mc_f_ext_state __f;
++	struct __riscv_mc_d_ext_state __d;
++	struct __riscv_mc_q_ext_state __q;
+ };
+ 
+ typedef union __riscv_mc_fp_state fpregset_t;
+diff --git a/arch/riscv64/bits/user.h b/arch/riscv64/bits/user.h
+index d2e383b2..9918a2fe 100644
+--- a/arch/riscv64/bits/user.h
++++ b/arch/riscv64/bits/user.h
+@@ -5,4 +5,4 @@ struct user_fpregs_struct {
+ 
+ #define ELF_NGREG 32
+ typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
+-typedef struct user_fpregs_struct elf_fpregset_t;
++typedef union __riscv_mc_fp_state elf_fpregset_t;
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 335d53d42f..13fd17353d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch \
+           file://0001-Change-container-for-riscv-floating-point-state-to-_.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.23.0


