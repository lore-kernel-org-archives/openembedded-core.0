Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id BDC197D708
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 02:43:54 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f5so11564572pgu.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 19:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RiR3DsEOD4mA2yRAFH5b8cP+SUnXe+tIa/PznVwpgKk=;
	b=RQtJIquXMzgtn9b6KcMDdvdJLz4IkB510BnZpqGqBM3ZjZ/yCbZQvd63mHf/J3snCT
	N9qGTiMyB0OhWrlL2rH+8Wopx3zXH9p39EJF2+UUPWam5BysWLBqH5tOH3toSMOIiqUQ
	Qgi63KF92yoPgJ93hYlf6n5iHxprD+jdx35DNg5WsQcpNh8QVT1VQ2Cb9KHo73B5zkt9
	XVMtfLMo+5JCpO+T7NHJ0YXHdy7AF347JXMHtHR6bGx3EGwBfFYRBaOeLr/JMOtMTW26
	A85i8dWRXJkn1IO37de3J/kcQ8caOWR4l5JdG/UGX0odCodOJ7S5KlfIEfVLay2PNc5X
	hcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RiR3DsEOD4mA2yRAFH5b8cP+SUnXe+tIa/PznVwpgKk=;
	b=M9+UatNXR84JmEJNEsQ65Wwfi6Gl5JFrIro1cPKoUnw9dX+L2lt4kqPGFleHDnpQPz
	3Nu7/5St8vkgdEa5er/beJXNEghBXV7416AGV11BSMkzj3cvpazXlvqGRAFig9k4VIuk
	r1V4qApkIgaAeOTgLNwm37D6oAEIJ2ruQRBSCj8jrgkNCBpWIDsb4rpr9x1zf3giLz3n
	q65fRSV46iD8s/Xxb9GUjgXp1E5a0tT/SwcqgbWuvwrRdhN+h3cVJq1sf5Ni2YNIH1Wp
	CdUMHfTe6kbcECSiTJp/+lZX+e5f+6IKf2Axf0qch6jaWVg6KtpoIz89pEr0jLvXdRB3
	mWHQ==
X-Gm-Message-State: APjAAAUsJMP18kWCwOnBlaeUIvAVOpMrMbIbiBWzLLEUjzXqDq4jgyva
	eMt5O2S8VE2S8UVgXfP59xoy36bK/Sk=
X-Google-Smtp-Source: APXvYqxDjG/go2ZBk4/B/XYuQ9m4Q5xh8hGKc0LdPraO48h+U/dJzCEdj3BU0GDAyrR16bjXddyjPQ==
X-Received: by 2002:a65:6552:: with SMTP id a18mr69879059pgw.208.1563936235162;
	Tue, 23 Jul 2019 19:43:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	n98sm44881624pjc.26.2019.07.23.19.43.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 19:43:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2019 19:43:45 -0700
Message-Id: <20190724024345.27717-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] strace: Upgrade to 5.2
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
X-List-Received-Date: Wed, 24 Jul 2019 02:43:54 -0000
Content-Transfer-Encoding: 8bit

License-Updtate: Copyright years changed
https://github.com/strace/strace/commit/4b4a0e5a6e74e16dc2bb9b38d81415d9f57425d2#diff-7116ef0705885343c9e1b2171a06be0e

Drop backport patch for mips o32 build fix
Refresh patches to apply on 5.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sing-non-glibc-libc-implementation-o.patch | 13 +--
 .../strace/0001-mips-o32-fix-build.patch      | 98 -------------------
 ...Check-for-mips-and-alpha-before-usin.patch |  6 +-
 .../strace/{strace_4.26.bb => strace_5.2.bb}  |  7 +-
 4 files changed, 10 insertions(+), 114 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
 rename meta/recipes-devtools/strace/{strace_4.26.bb => strace_5.2.bb} (87%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch b/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
index daafceb37b..fb5f72529f 100644
--- a/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
+++ b/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
@@ -13,22 +13,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ptrace.h | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
-diff --git a/ptrace.h b/ptrace.h
-index 89d4b95..b3f45bb 100644
 --- a/ptrace.h
 +++ b/ptrace.h
 @@ -30,7 +30,13 @@
- # define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
- #endif
+ #  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
+ # endif
  
--#include <linux/ptrace.h>
 +#if defined(POWERPC) && !defined(__GLIBC__)
 +#define pt_regs uapi_pt_regs
 +#endif
-+# include <linux/ptrace.h>
+ # include <linux/ptrace.h>
 +#if defined(POWERPC) && !defined(__GLIBC__)
 +# undef pt_regs
 +#endif
  
- #ifdef HAVE_STRUCT_IA64_FPREG
- # undef ia64_fpreg
+ # ifdef HAVE_STRUCT_IA64_FPREG
+ #  undef ia64_fpreg
diff --git a/meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch b/meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
deleted file mode 100644
index a5dccfb08c..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 2c8b6de913973274e877639658e9e7273a012adb Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Tue, 8 Jan 2019 19:23:44 +0000
-Subject: [PATCH] mips o32: fix build
-
-Upstream-Status: Backport
-
-Commit 917c2ccf3a67 "Refactor stack pointers" moved mips_REG_* macros
-from linux/mips/arch_regs.h to linux/mips/arch_regs.c because these
-macros are no longer used outside syscall.c or files included by
-syscall.c, but this caused a build regression on mips o32 because
-decode_syscall_subcall() uses mips_REG_SP prior to its definition.
-
-* syscall.c (decode_syscall_subcall): Move ...
-* linux/mips/get_syscall_args.c: ... here.
-
-Reported-by: Baruch Siach <baruch@tkos.co.il>
-Fixes: v4.26~61 "Refactor stack pointers"
----
- linux/mips/get_syscall_args.c | 26 ++++++++++++++++++++++++++
- syscall.c                     | 27 ++-------------------------
- 2 files changed, 29 insertions(+), 25 deletions(-)
-
-diff --git a/linux/mips/get_syscall_args.c b/linux/mips/get_syscall_args.c
-index 387aa852..e2889f98 100644
---- a/linux/mips/get_syscall_args.c
-+++ b/linux/mips/get_syscall_args.c
-@@ -37,3 +37,29 @@ arch_get_syscall_args(struct tcb *tcp)
- #endif
- 	return 1;
- }
-+
-+#ifdef SYS_syscall_subcall
-+static void
-+decode_syscall_subcall(struct tcb *tcp)
-+{
-+	if (!scno_is_valid(tcp->u_arg[0]))
-+		return;
-+	tcp->scno = tcp->u_arg[0];
-+	tcp->qual_flg = qual_flags(tcp->scno);
-+	tcp->s_ent = &sysent[tcp->scno];
-+	memmove(&tcp->u_arg[0], &tcp->u_arg[1],
-+		sizeof(tcp->u_arg) - sizeof(tcp->u_arg[0]));
-+	/*
-+	 * Fetching the last arg of 7-arg syscalls (fadvise64_64
-+	 * and sync_file_range) requires additional code,
-+	 * see linux/mips/get_syscall_args.c
-+	 */
-+	if (tcp->s_ent->nargs == MAX_ARGS) {
-+		if (umoven(tcp,
-+			   mips_REG_SP + MAX_ARGS * sizeof(tcp->u_arg[0]),
-+			   sizeof(tcp->u_arg[0]),
-+			   &tcp->u_arg[MAX_ARGS - 1]) < 0)
-+		tcp->u_arg[MAX_ARGS - 1] = 0;
-+	}
-+}
-+#endif /* SYS_syscall_subcall */
-diff --git a/syscall.c b/syscall.c
-index d78f51dd..51fcc721 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -349,31 +349,8 @@ decode_ipc_subcall(struct tcb *tcp)
- #endif /* SYS_ipc_subcall */
- 
- #ifdef SYS_syscall_subcall
--static void
--decode_syscall_subcall(struct tcb *tcp)
--{
--	if (!scno_is_valid(tcp->u_arg[0]))
--		return;
--	tcp->scno = tcp->u_arg[0];
--	tcp->qual_flg = qual_flags(tcp->scno);
--	tcp->s_ent = &sysent[tcp->scno];
--	memmove(&tcp->u_arg[0], &tcp->u_arg[1],
--		sizeof(tcp->u_arg) - sizeof(tcp->u_arg[0]));
--# ifdef LINUX_MIPSO32
--	/*
--	 * Fetching the last arg of 7-arg syscalls (fadvise64_64
--	 * and sync_file_range) requires additional code,
--	 * see linux/mips/get_syscall_args.c
--	 */
--	if (tcp->s_ent->nargs == MAX_ARGS) {
--		if (umoven(tcp,
--			   mips_REG_SP + MAX_ARGS * sizeof(tcp->u_arg[0]),
--			   sizeof(tcp->u_arg[0]),
--			   &tcp->u_arg[MAX_ARGS - 1]) < 0)
--		tcp->u_arg[MAX_ARGS - 1] = 0;
--	}
--# endif /* LINUX_MIPSO32 */
--}
-+/* The implementation is architecture specific.  */
-+static void decode_syscall_subcall(struct tcb *);
- #endif /* SYS_syscall_subcall */
- 
- static void
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
index becee79d1a..95d85bf34a 100644
--- a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
+++ b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
@@ -19,16 +19,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  tests/sigaction.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/tests/sigaction.c b/tests/sigaction.c
-index 95be197..54819f9 100644
 --- a/tests/sigaction.c
 +++ b/tests/sigaction.c
 @@ -156,7 +156,7 @@ main(void)
  	sigdelset(mask.libc, SIGHUP);
  
  	memcpy(new_act->mask, mask.old, sizeof(mask.old));
--#ifdef SA_RESTORER
+-# ifdef SA_RESTORER
 +#if defined(SA_RESTORER) && !defined(MIPS) && !defined(ALPHA)
  	new_act->flags = SA_RESTORER;
  	new_act->restorer = (unsigned long) 0xdeadfacecafef00dULL;
- # define SA_RESTORER_FMT ", sa_flags=SA_RESTORER, sa_restorer=%#lx"
+ #  define SA_RESTORER_FMT ", sa_flags=SA_RESTORER, sa_restorer=%#lx"
diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-devtools/strace/strace_5.2.bb
similarity index 87%
rename from meta/recipes-devtools/strace/strace_4.26.bb
rename to meta/recipes-devtools/strace/strace_5.2.bb
index 2688724e66..8367bf1a4f 100644
--- a/meta/recipes-devtools/strace/strace_4.26.bb
+++ b/meta/recipes-devtools/strace/strace_5.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.io"
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1+ & GPL-2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5c84d1c6e48e7961ccd2cd2ae32f7bf1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0169a04810830e94f4b1cfb823c9f592"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
@@ -14,11 +14,10 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
-           file://0001-mips-o32-fix-build.patch \
            file://ptest-spacesave.patch \
            "
-SRC_URI[md5sum] = "daa51acc0c7c696221ec03cf0b30a7af"
-SRC_URI[sha256sum] = "7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c"
+SRC_URI[md5sum] = "b9c02b07dcde5125498ce7da69b77baf"
+SRC_URI[sha256sum] = "d513bc085609a9afd64faf2ce71deb95b96faf46cd7bc86048bc655e4e4c24d2"
 
 inherit autotools ptest
 
-- 
2.22.0


