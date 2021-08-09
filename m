Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.20238.1628498407543034144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 01:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HNqolx4p;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso561731pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 01:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ik+8i9EtZeqM0bzwS7DcUsRgzxRTXx3OUXhPXDBchE=;
        b=HNqolx4p0riwc8KbKNTJkmSa9Ng5aiFwICr1rJZEO1ro2DqQY/2SFk/O6MR/uiHjxX
         3mTIwpI6CnxF32H0WzPOKJdJimq3Dolq3IFoBF1+V6OrpzibNhx60kLWzcrDxoj6b8P4
         wIJLCKSpusVF7Rpmp9Se+Bu54hpwJFuBZ2mBot+Q6nYJRLLm1p2FI+a2nvsV40VEYlBA
         s9LL8EVgVqI/9fYNzwyIKyexFGvedWZP9fbwcFVzEv3wciiHBnloBRRBXbHbtgIKFXHi
         sbc9KGQG239F84BurHQXx5wERJ86oatZisf7Ny2q+vBWs92ZzJfi+r/DVc401QU7SmQT
         Ep5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ik+8i9EtZeqM0bzwS7DcUsRgzxRTXx3OUXhPXDBchE=;
        b=mJPkuplt79o/MOIZjqpQU6fu2aV1PeFQ2epxSlD/bQ5Uzh0nyIaEc6OlYP6ykppgY+
         46s44aG838DHKMiiWcJsJIMNKB8b32aI6ENlj88TV5hgrfY5N1o0PDAlT8s/6iCw21PT
         Q+e3sbfi8JMbtU+L7m8ZHTx7T3DRphHPOjI8rv43fTNQm3qnbvHfH4zy77VEVSj/iS8j
         bXMbdZK408Pd/Rbm8FpCj/WratQ6i14++hnid5uvCv1IBJvRTk1MpHRB0GwPVcDlRF+I
         hR2H8AK2fzoksknRPHr9EpaYIzixPhEjhHfinXsQ0bWVxdXBd30rTvMe/Y3QyTxA4pPS
         BP6g==
X-Gm-Message-State: AOAM532TONTUQDusw5Igl0Is9uCZ0aC/ApJk04twGBmKCAQdl0DwiNa9
	asrZWI3AKvweuZIZ2Vi/0+Y=
X-Google-Smtp-Source: ABdhPJwgBvwC092kYnWKc0mo6wEECRm9pHRnkK36s1ENvFnucKf3X8whUmhVtCk+KZGWFL0nm71utg==
X-Received: by 2002:a17:90a:ce05:: with SMTP id f5mr34989613pju.93.1628498406900;
        Mon, 09 Aug 2021 01:40:06 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id l10sm17743003pjg.11.2021.08.09.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 01:40:06 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: anuj.mittal@intel.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [hardknott][PATCH v2] glibc: Fix CVE-2021-35942
Date: Mon,  9 Aug 2021 01:39:31 -0700
Message-Id: <20210809083931.100208-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Source: https://sourceware.org/git/glibc.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011

Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
glibc-2.33 source.

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
new file mode 100644
index 0000000000..5cae1bc91c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
@@ -0,0 +1,44 @@
+From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Fri, 25 Jun 2021 15:02:47 +0200
+Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
+ 28011)
+
+Use strtoul instead of atoi so that overflow can be detected.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
+CVE: CVE-2021-35942
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+ posix/wordexp-test.c | 1 +
+ posix/wordexp.c      | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
+index f93a546d7e..9df02dbbb3 100644
+--- a/posix/wordexp-test.c
++++ b/posix/wordexp-test.c
+@@ -183,6 +183,7 @@ struct test_case_struct
+     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
+     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
+     { 0, NULL, "", 0, 0, { NULL, }, IFS },
++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
+ 
+     /* Flags not already covered (testit() has special handling for these) */
+     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
+diff --git a/posix/wordexp.c b/posix/wordexp.c
+index bcbe96e48d..1f3b09f721 100644
+--- a/posix/wordexp.c
++++ b/posix/wordexp.c
+@@ -1399,7 +1399,7 @@ envsubst:
+   /* Is it a numeric parameter? */
+   else if (isdigit (env[0]))
+     {
+-      int n = atoi (env);
++      unsigned long n = strtoul (env, NULL, 10);
+ 
+       if (n >= __libc_argc)
+ 	/* Substitute NULL. */
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index bb35c50c98..7f516d2bbe 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
            file://CVE-2021-33574_1.patch \
            file://CVE-2021-33574_2.patch \
+           file://CVE-2021-35942.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

