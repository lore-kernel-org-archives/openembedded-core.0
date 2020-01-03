Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9147FAA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 07:21:28 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id m13so4386481pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2020 23:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qfun1DMG8Dhz4jo0bhS8r2+KDKzBr5fgAlvEpY0GonM=;
	b=j7oOzteFq784RP4NiVy99Km5a9F8WDUX6lAz+GJCMrdGf/yEasYCitF7m/HA1DM6QN
	2YTDME4CTqSjti3B7UmkRMOZIYvuZt8iz/cXosg5zAr7HUcTSsmNXJxs49iI+ztvk6yU
	lBJPW6Oz/WWwluTrG97kEpyhWKGoSipdj25al7IOcprjRBV4EOyjrt551FORJWptRMdp
	Nt1yxVAk2bWPW6B+LkmmLeD7wiqBAzSIq3yWxK5Hnc4lYiIgwE/e4lfAn96nCMaeFwHE
	SuMk+D9jEw42kK3E1KrxCqEIGr/fgbfLHG+IULO0Ys9/+9Sh6OSGj9PlbGaQjqgf/B5O
	bUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qfun1DMG8Dhz4jo0bhS8r2+KDKzBr5fgAlvEpY0GonM=;
	b=LWvEqWeYybrptIgGk5c1Sd2oid66n2wMibnhd07j90cjChIgpcyjYBbVccA4BTmxOJ
	h8AlAdSISImABDA46eWym2ldyP7iArp57ISA/pUhhG3eGrzJ7hfFIRF9NqGF5tQ3xpw9
	6Ax6AiOiQSkFWsl7/vfN9s5D+F6pQ/Bklck6RWY16jQeMmJA3311lZb/T3H4x+jfa96y
	RPvs4rE7wF8uOQOwyqTmeWupTMRJygwXHrYFy57cri21taaX3v0YpAXMdLLEHBCmFabR
	7bYTJzkrvl2ynIE6/Sr3NXPV22RJJ4TblDR0wIaCU9SIiin9SLmtXO0uMSr5chA0RnZx
	4ozA==
X-Gm-Message-State: APjAAAVnUF8TYnz7lMOgasXar9h8L1mimQBMaWrwc0r0ozwrpzTK4BBK
	PLbZBY+ezPRFuokSxEyTgpmiFiMo4/c=
X-Google-Smtp-Source: APXvYqw+g72Lpg1quKMc3BI80ruMDuiDeqsBbsUPjDSHRWSz/Tp0ri0GnmnLuJx2EgO2pxwFuUoR8A==
X-Received: by 2002:a17:90a:fb87:: with SMTP id
	cp7mr25456171pjb.56.1578036088926; 
	Thu, 02 Jan 2020 23:21:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	i66sm35163470pfg.85.2020.01.02.23.21.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 23:21:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jan 2020 23:21:21 -0800
Message-Id: <03bdb652b1aef96d7ec6c00d91e5f56d9cc8f47f.1578035913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578035913.git.raj.khem@gmail.com>
References: <cover.1578035913.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] musl: Upgrade beyond 1.24
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
X-List-Received-Date: Fri, 03 Jan 2020 07:21:29 -0000
Content-Transfer-Encoding: 8bit

License-Change: Added ARM to copyright files [1] [2] [3]

Detailed changes are here [4]

[1] https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=db3cc9a319c788cf5241ea68d3fa86b43f35733e
[2] https://git.musl-libc.org/cgit/musl/commit/?id=daa29e894c74d61296fe19d9b7c4be2f04037639
[3] https://git.musl-libc.org/cgit/musl/commit/?id=d3f7df235904439d48db041c7796e5b44be5b8e6
[4] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=2c2477da9a553c0b9b2fa18073a5dcdbe6d395af..70d80609558153a996833392999c69cdb74e1119

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc               |  2 +-
 .../0001-riscv-Define-sigcontext-again.patch  | 48 -------------------
 meta/recipes-core/musl/musl_git.bb            |  5 +-
 3 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 0683bf85ed..9aea2c39c8 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d0fe2be17bc45ff4a42ade1c13ed6340"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95ee848a08ad253c04723da00cedb01"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch b/meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch
deleted file mode 100644
index fcb324e15f..0000000000
--- a/meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-commit a0993f8f0f161423ecdcb754f282ffd2fe47a7b5
-Author: Rich Felker <dalias@aerifal.cx>
-Date:   Wed Oct 2 09:28:03 2019 -0400
-
-    reintroduce riscv64 struct sigcontext
-    
-    commit ab3eb89a8b83353cdaab12ed017a67a7730f90e9 removed it as part of
-    correcting the mcontext_t definition, but there is still code using
-    struct sigcontext and expecting the member names present in it, most
-    notably libgcc_eh. almost all such usage is incorrect, but bring back
-    struct sigcontext at least for now so as not to introduce regressions.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
-index 03fe48c1..2ff4be30 100644
---- a/arch/riscv64/bits/signal.h
-+++ b/arch/riscv64/bits/signal.h
-@@ -6,12 +6,6 @@
- # define SIGSTKSZ 8192
- #endif
- 
--#if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
--typedef unsigned long greg_t;
--typedef unsigned long gregset_t[32];
--typedef union __riscv_mc_fp_state fpregset_t;
--#endif
--
- typedef unsigned long __riscv_mc_gp_state[32];
- 
- struct __riscv_mc_f_ext_state {
-@@ -41,6 +35,16 @@ typedef struct mcontext_t {
- 	union __riscv_mc_fp_state __fpregs;
- } mcontext_t;
- 
-+#if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
-+typedef unsigned long greg_t;
-+typedef unsigned long gregset_t[32];
-+typedef union __riscv_mc_fp_state fpregset_t;
-+struct sigcontext {
-+	gregset_t gregs;
-+	fpregset_t fpregs;
-+};
-+#endif
-+
- struct sigaltstack {
- 	void *ss_sp;
- 	int ss_flags;
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index aacff79f7c..92149b5632 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "2c2477da9a553c0b9b2fa18073a5dcdbe6d395af"
+SRCREV = "70d80609558153a996833392999c69cdb74e1119"
 
-BASEVER = "1.1.23"
+BASEVER = "1.1.24"
 
 PV = "${BASEVER}+git${SRCPV}"
 
@@ -15,7 +15,6 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0001-riscv-Define-sigcontext-again.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.24.1


