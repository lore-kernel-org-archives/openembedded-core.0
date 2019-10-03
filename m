Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB9A605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 04:23:01 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y10so875868plp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 21:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1b2noI33qJiGS+ZysUC+Ryq3L/GZYhWu/OBTTdoheqc=;
	b=anX2kUkceYrHhxYHJ6qUrNXQXuPtubEhVBJxfP2O9G4KWotQHar3bl+NIUXa6uyCmO
	363GfIIejDrmYVYMaHq6g2BxysQ47uAKP2U1XmmOu/bYKAHKIFOsa/MhVqy5gMoKg6+K
	bAMWitC52PvVqvjniVZzlCBopAgNC/eHjkzpYxu5AkucgKFCcK4/7RNve+7GHtJe+EYv
	pFPIC4Qj+J4l5lAlzYypCmBnHmByaEmBPq2Oo82cSg+K8gkMkkD+8iJhXGHAkhizGMTd
	DGpte3Yfp3QC8VhUZFb7Rn3RVWsykJf/GdlP7gIPa3W/nCGFfHCAu/LkyoFjM6ZQEKuU
	rteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1b2noI33qJiGS+ZysUC+Ryq3L/GZYhWu/OBTTdoheqc=;
	b=VpYqYfzfcgfa/5/rlSezsbfp6LZpaDF8HGS2z8s/EbVnb6n3B5U+E//eKZI07+MlBA
	tLCe6fYLu7s86A5v/FFG46led5LxootXPhMpnwFXsD9RtHeSWUJLxkwCpnScmlur3peP
	4mJgKVHZqWpFoSnapBBf1CdDIFlTTRf8OtwP8xP/ARVTSRcGH8NmFRQWhd5O1geNmuk+
	wzIsUfCKo3zfdpLplZfk1PT04LkIqb8jp5mVAI6dDZTWG1qR/SjY3LE06sCVlcqVfVSq
	/fGYPMiCAi+9dX0VwS1TAZWcWwTQaI04UGw03mu9qArdoxcXUqGgNxsUsOb3Los0/v7H
	Wrjg==
X-Gm-Message-State: APjAAAWMxBvKW5zLCakNea9iwcJ+cwEs4RInFUIBzyzOe3rxGGGSkCqF
	gaLpBclywpOsC+DHOs1/t0zWjy9BVrc=
X-Google-Smtp-Source: APXvYqxoTKJ0qn5kRUw5/t36kjRqagBR0KNii5cJyTTNn4BrVfmxvci8j1ItHw5pfrATEG+cYdPkSw==
X-Received: by 2002:a17:902:9a95:: with SMTP id
	w21mr7389813plp.336.1570076581521; 
	Wed, 02 Oct 2019 21:23:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	e6sm1002856pfl.146.2019.10.02.21.23.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 21:23:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 21:22:48 -0700
Message-Id: <20191003042249.2147767-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] musl: Update to latest
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
X-List-Received-Date: Thu, 03 Oct 2019 04:23:01 -0000
Content-Transfer-Encoding: 8bit

Drop upstream'ed patch
Fix libgcc build with musl

Detailed ChangeLog [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1f0e9f9cc2e3fa354f94e18b3b362de5f1ec7272..2c2477da9a553c0b9b2fa18073a5dcdbe6d395af

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-for-riscv-floating-point-state-to-_.patch | 67 -------------------
 ...and-specifiers-in-the-riscv64-CAS-ro.patch | 55 ---------------
 .../0001-riscv-Define-sigcontext-again.patch  | 48 +++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  5 +-
 4 files changed, 50 insertions(+), 125 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch
 delete mode 100644 meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch
 create mode 100644 meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch

diff --git a/meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch b/meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch
deleted file mode 100644
index a9abb18726..0000000000
--- a/meta/recipes-core/musl/musl/0001-Change-container-for-riscv-floating-point-state-to-_.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 52a37610650e7366a398dd07393d3902d2f3faa3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 28 Sep 2019 12:19:57 -0700
-Subject: [PATCH] Change container for riscv floating-point state to __riscv_mc_fp_state
-
-Match the struct elements with glibc
-glibc also uses __riscv_mc prefix, some packages like gdb uses that
-
-Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2019/09/28/1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arch/riscv64/bits/signal.h | 18 +++++++++---------
- arch/riscv64/bits/user.h   |  2 +-
- 2 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
-index 76d7ad80..aba7ab00 100644
---- a/arch/riscv64/bits/signal.h
-+++ b/arch/riscv64/bits/signal.h
-@@ -13,25 +13,25 @@ typedef unsigned long greg_t;
- typedef unsigned long gregset_t[32];
- 
- struct __riscv_mc_f_ext_state {
--	unsigned int f[32];
--	unsigned int fcsr;
-+	unsigned int __f[32];
-+	unsigned int __fcsr;
- };
- 
- struct __riscv_mc_d_ext_state {
--	unsigned long long f[32];
--	unsigned int fcsr;
-+	unsigned long long __f[32];
-+	unsigned int __fcsr;
- };
- 
- struct __riscv_mc_q_ext_state {
--	unsigned long long f[64] __attribute__((aligned(16)));
--	unsigned int fcsr;
-+	unsigned long long __f[64] __attribute__((aligned(16)));
-+	unsigned int __fcsr;
- 	unsigned int reserved[3];
- };
- 
- union __riscv_mc_fp_state {
--	struct __riscv_mc_f_ext_state f;
--	struct __riscv_mc_d_ext_state d;
--	struct __riscv_mc_q_ext_state q;
-+	struct __riscv_mc_f_ext_state __f;
-+	struct __riscv_mc_d_ext_state __d;
-+	struct __riscv_mc_q_ext_state __q;
- };
- 
- typedef union __riscv_mc_fp_state fpregset_t;
-diff --git a/arch/riscv64/bits/user.h b/arch/riscv64/bits/user.h
-index d2e383b2..9918a2fe 100644
---- a/arch/riscv64/bits/user.h
-+++ b/arch/riscv64/bits/user.h
-@@ -5,4 +5,4 @@ struct user_fpregs_struct {
- 
- #define ELF_NGREG 32
- typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
--typedef struct user_fpregs_struct elf_fpregset_t;
-+typedef union __riscv_mc_fp_state elf_fpregset_t;
--- 
-2.23.0
-
diff --git a/meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch b/meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch
deleted file mode 100644
index 09b71cb299..0000000000
--- a/meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 59f2954fcaacd9426827c69a729e2647cb9977e5 Mon Sep 17 00:00:00 2001
-From: Palmer Dabbelt <palmer@sifive.com>
-Date: Tue, 24 Sep 2019 20:30:15 -0700
-Subject: [PATCH] correct the operand specifiers in the riscv64 CAS routines
-
-The operand sepcifiers in a_cas and a_casp for riscv64 were incorrect:
-there's a backwards branch in the routine, so despite tmp being written
-at the end of the assembly fragment it cannot be allocated in one of the
-input registers because the input values may be needed for another trip
-around the loop.
-
-For code that follows the guarnteed forward progress requirements, he
-backwards branch is rarely taken: SiFive's hardware only fails a store
-conditional on execptional cases (ie, instruction cache misses inside
-the loop), and until recently a bug in QEMU allowed back-to-back
-store conditionals to succeed.  The bug has been fixed in the latest
-QEMU release, but it turns out that the fix caused this latent bug in
-musl to manifest.
-
-Full disclosure: I haven't actually even compiled musl.  I just guessed
-this would fix a bug introducted by the new QEMU behavior, Alistair
-(CC'd) actually checked it fixes the problem.  The rest is just
-conjecture.
-
-Upstream-Status: Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arch/riscv64/atomic_arch.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/riscv64/atomic_arch.h b/arch/riscv64/atomic_arch.h
-index c9765342..41ad4d04 100644
---- a/arch/riscv64/atomic_arch.h
-+++ b/arch/riscv64/atomic_arch.h
-@@ -14,7 +14,7 @@ static inline int a_cas(volatile int *p, int t, int s)
- 		"	sc.w.aqrl %1, %4, (%2)\n"
- 		"	bnez %1, 1b\n"
- 		"1:"
--		: "=&r"(old), "=r"(tmp)
-+		: "=&r"(old), "=&r"(tmp)
- 		: "r"(p), "r"(t), "r"(s)
- 		: "memory");
- 	return old;
-@@ -31,7 +31,7 @@ static inline void *a_cas_p(volatile void *p, void *t, void *s)
- 		"	sc.d.aqrl %1, %4, (%2)\n"
- 		"	bnez %1, 1b\n"
- 		"1:"
--		: "=&r"(old), "=r"(tmp)
-+		: "=&r"(old), "=&r"(tmp)
- 		: "r"(p), "r"(t), "r"(s)
- 		: "memory");
- 	return old;
--- 
-2.23.0
-
diff --git a/meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch b/meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch
new file mode 100644
index 0000000000..fcb324e15f
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch
@@ -0,0 +1,48 @@
+commit a0993f8f0f161423ecdcb754f282ffd2fe47a7b5
+Author: Rich Felker <dalias@aerifal.cx>
+Date:   Wed Oct 2 09:28:03 2019 -0400
+
+    reintroduce riscv64 struct sigcontext
+    
+    commit ab3eb89a8b83353cdaab12ed017a67a7730f90e9 removed it as part of
+    correcting the mcontext_t definition, but there is still code using
+    struct sigcontext and expecting the member names present in it, most
+    notably libgcc_eh. almost all such usage is incorrect, but bring back
+    struct sigcontext at least for now so as not to introduce regressions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
+index 03fe48c1..2ff4be30 100644
+--- a/arch/riscv64/bits/signal.h
++++ b/arch/riscv64/bits/signal.h
+@@ -6,12 +6,6 @@
+ # define SIGSTKSZ 8192
+ #endif
+ 
+-#if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
+-typedef unsigned long greg_t;
+-typedef unsigned long gregset_t[32];
+-typedef union __riscv_mc_fp_state fpregset_t;
+-#endif
+-
+ typedef unsigned long __riscv_mc_gp_state[32];
+ 
+ struct __riscv_mc_f_ext_state {
+@@ -41,6 +35,16 @@ typedef struct mcontext_t {
+ 	union __riscv_mc_fp_state __fpregs;
+ } mcontext_t;
+ 
++#if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
++typedef unsigned long greg_t;
++typedef unsigned long gregset_t[32];
++typedef union __riscv_mc_fp_state fpregset_t;
++struct sigcontext {
++	gregset_t gregs;
++	fpregset_t fpregs;
++};
++#endif
++
+ struct sigaltstack {
+ 	void *ss_sp;
+ 	int ss_flags;
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 13fd17353d..aacff79f7c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1f0e9f9cc2e3fa354f94e18b3b362de5f1ec7272"
+SRCREV = "2c2477da9a553c0b9b2fa18073a5dcdbe6d395af"
 
 BASEVER = "1.1.23"
 
@@ -15,8 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch \
-           file://0001-Change-container-for-riscv-floating-point-state-to-_.patch \
+           file://0001-riscv-Define-sigcontext-again.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.23.0


