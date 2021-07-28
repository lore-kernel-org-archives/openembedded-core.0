Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.1910.1627458747143336959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 00:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LWKWJUEZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id o7so1786416ilh.11
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k523uEjBxmRcqqjsGZJ0MA1djkhXTPgykE6uQBZmQjY=;
        b=LWKWJUEZUx486Jyp5CaadRAyPoH9qWqlkNKaI1ST48k6Cna9bF+5q47Vm6Y0mhKxvb
         TFLpvnPAVoAIMAspmOTS8UlqlrQPB5W4mF3YZdOs5L1S/S4iCsipCzNTCs0wq15p3MAC
         Ep11OkxAGa8hhgk6GsgsKz6tX7+/ugcr1XVlkCI1hBQujMknL8s2mjHSzWS1g0O2Ze8j
         qeVDhwEJBUO6WKPhkHhq3JUIKgVpu8pQNmdeXD3KRJWdLGWEoNxJIIntnre+aMXEieP9
         xS4ps5jxzFCNhSN0BH8R/0cuMyM02e0VdsfcFt5epypFqz1p44WIqISjz93ZDi0jZLBn
         4t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k523uEjBxmRcqqjsGZJ0MA1djkhXTPgykE6uQBZmQjY=;
        b=bWb2jhE1e6kA4cHbOj50OfDprhQdY5wo3bQ9wBMCEixswvc9eTQMonJUCh3/imKo3I
         RO0iQrTmB8k3ML0/MV9Rn6efRfcJItCkBT2m9U6+89qmRi2HaCGWC18z3Ug8LuqxgKlX
         Ntrk332VZ5xaPtNt3QO50cNMa2fG+P6n690IoIc3jJK8QgX+8+qRn3xbRDHB3L6Vdl9W
         P8B7gogZO+55vGg4YaMSqhn0R9/k9gvePc2baUagkL3Y14eJihamLJ5pKjMPRXI71p75
         HyOmbMU2cTZoABZmeT9uuNQ+0J06KDWZy9ua8E5oQwzPUm8KLrjZcHNWMtLOVUY8eRal
         CIbg==
X-Gm-Message-State: AOAM532JalUIhLmedtWkNCQ7Jsd6YCEpUxHJOYyMngco9xg9kPF9mxbF
	vUwkE2TM5q4KGjCmyNd2gR/880Jxx4iAaQ==
X-Google-Smtp-Source: ABdhPJzRSjSbdjeeunnZoihXSZfrPS8+Wk4spWiQAfTfEq5/vAirKfL8X3xwKR0qwHwNlITEXKJUdw==
X-Received: by 2002:a92:ce49:: with SMTP id a9mr1788970ilr.195.1627458746084;
        Wed, 28 Jul 2021 00:52:26 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id y198sm4074801iof.25.2021.07.28.00.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 00:52:25 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH] glibc: Fix CVE-2021-35942
Date: Wed, 28 Jul 2021 00:52:15 -0700
Message-Id: <20210728075215.154410-1-vinay.m.engg@gmail.com>
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
index e9f01a14c5..abb01f8468 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -58,6 +58,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://mte-backports.patch \
            file://CVE-2021-33574.patch \
+           file://CVE-2021-35942.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

