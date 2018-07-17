Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 295617898A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:25 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r16-v6so1887532wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ik+am51asfUNR52drAUjDSvZGUzOGS9d4o2VHPgyBQo=;
	b=Zi/MbOFQFyocdOyXbPFri28c1LOpp65D4kKgJStHOXn9stujVOlBOYZHNC8bvlI8xg
	hCmZVYJbrH2d8RyCRgPZmgnNdDc+EuuAip2Da5mwfpKa+9pRMwZbaPYcCa3LL72vYYYB
	S9Li7rq3fymOW8UFrQvc6/ehW4zUtAaxyllvRO8UthZHAttpv2eIyTVHGXKhcFJwytpP
	llfwY2eFkrCkTSTfMLh8VDDePXR2R4KK8GPZgoxtozcsT/u9BWpiDn5CW9/w4enFUdx0
	cHhBPbUB7XKUbys4uxETWux83Dt1eGSF1LkpzzWGvD7mT8WRzVKCH88higjds6qwkZHi
	cywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ik+am51asfUNR52drAUjDSvZGUzOGS9d4o2VHPgyBQo=;
	b=dztXd5DQAOsRSqHol5nP9jzp+uriPkmZvEliA2FiIcRhWH7cotQvLWwnkWlqkuvnCS
	EYCK0RwdfXbrWdrU4TNblsvSqRWcS9wvM+lNvxXI0mtBklcIZRvE4ToN1tXBPu1aes5f
	NH7B+cQTcB7FTbELPZrm8sMdRcJMvkkPDOEEMsqJ+Ng8YzvTUEAibl+rglBlBgEILcNk
	I5mbGQCw4Oz+zwgEX5dOUlpDdW3GtuHa+jvpARLGSdA3MR9zEwWjhs3qU1VVoet6so5B
	/RQLmj/1jZFFSF97yJ3Jib5DPRCcDc1HG4Gf2bsaixK09Fb2P/4pM98cUUbJq/4zCiw0
	HSEg==
X-Gm-Message-State: AOUpUlE6Pnjjn44LB1XqUhpwULdjmlYsjTQZq+j6pKrd27DFfhGMFs/4
	tHynN9v6j9vSUq/Xjqb5ojDofzU4
X-Google-Smtp-Source: AAOMgpe73jYKs8HQ3/Ze4nXR9h+5DYhIWNl7pTRsTIRYYM2MAwAoAVAZeOh172pu4uRChgTe4jAsqg==
X-Received: by 2002:adf:80c9:: with SMTP id 67-v6mr1847394wrl.95.1531845565592;
	Tue, 17 Jul 2018 09:39:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:04 +0100
Message-Id: <20180717163910.3196-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 09/15] strace: upgrade 4.22 -> 4.23
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:25 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...aw_syscall.h-avoid-r7-specified-register-.patch | 74 ----------------------
 .../strace/{strace_4.22.bb => strace_4.23.bb}      |  5 +-
 2 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch
 rename meta/recipes-devtools/strace/{strace_4.22.bb => strace_4.23.bb} (90%)

diff --git a/meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch b/meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch
deleted file mode 100644
index 8584291ba83..00000000000
--- a/meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 0c75ebaad09d6d3f2395dfe6160904af883dd0d9 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 15 May 2018 15:34:39 -0700
-Subject: [PATCH] linux/arm/raw_syscall.h: avoid r7 specified register
- variables with Thumb
-
-If Thumb code is being generated and frame pointers are enabled, the
-Thumb frame pointer in r7 clashes with any local variable which may
-need to be assigned to r7 (e.g. the syscall NR when making a raw
-syscall).
-
-With gcc, the double use of r7 results in a build error, e.g.
-
-  strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used in asm here
-
-With clang, the double use of r7 can result in the compiler silently
-generating broken code which crashes at run time due to frame pointer
-corruption:
-
-  https://bugs.llvm.org/show_bug.cgi?id=34165
-
-In most cases the problem isn't visible as frame pointers will be
-disabled automatically due to optimisation level. However to handle
-cases where frame pointers are enabled (e.g. when CFLAGS etc are set
-to support a debug build, etc) provide a version of raw_syscall_0
-which manually saves and restores the frame pointer value in r7
-to a temporary register before setting up the syscall NR in r7
-and invoking the syscall.
-
-* linux/arm/raw_syscall.h (raw_syscall_0) [__thumb__]: Provide
-an alternative version.
-
-Upstream-Status: Backport
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- linux/arm/raw_syscall.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/linux/arm/raw_syscall.h b/linux/arm/raw_syscall.h
-index 69c7e23..ec534ec 100644
---- a/linux/arm/raw_syscall.h
-+++ b/linux/arm/raw_syscall.h
-@@ -36,12 +36,27 @@ static inline kernel_ulong_t
- raw_syscall_0(const kernel_ulong_t nr, kernel_ulong_t *err)
- {
- 	*err = 0;
-+
-+#ifdef __thumb__ /* && FRAME_POINTERS_ENABLED */
-+
-+	register kernel_ulong_t rt;
-+	register kernel_ulong_t r0 __asm__("r0");
-+	__asm__ __volatile__("mov %1,r7; mov r7,%2; swi 0x0; mov r7,%1"
-+			     : "=r"(r0), "=&r"(rt)
-+			     : "r"(nr)
-+			     : "memory");
-+
-+#else
-+
- 	register kernel_ulong_t r7 __asm__("r7") = nr;
- 	register kernel_ulong_t r0 __asm__("r0");
- 	__asm__ __volatile__("swi 0x0"
- 			     : "=r"(r0)
- 			     : "r"(r7)
- 			     : "memory");
-+
-+#endif
-+
- 	return r0;
- }
- # define raw_syscall_0 raw_syscall_0
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace_4.22.bb b/meta/recipes-devtools/strace/strace_4.23.bb
similarity index 90%
rename from meta/recipes-devtools/strace/strace_4.22.bb
rename to meta/recipes-devtools/strace/strace_4.23.bb
index 99691f87c37..0c159fc6f6b 100644
--- a/meta/recipes-devtools/strace/strace_4.22.bb
+++ b/meta/recipes-devtools/strace/strace_4.23.bb
@@ -14,10 +14,9 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
-           file://0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch \
            "
-SRC_URI[md5sum] = "7a2a7d7715da6e6834bc65bd09bace1c"
-SRC_URI[sha256sum] = "068cd09264c95e4d591bbcd3ea08f99a693ed8663cd5169b0fdad72eb5bdb39d"
+SRC_URI[md5sum] = "fad4bba0947553cef34d46a9fd78f039"
+SRC_URI[sha256sum] = "7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad"
 
 inherit autotools ptest bluetooth
 
-- 
2.11.0


