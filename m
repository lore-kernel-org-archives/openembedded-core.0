Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.26220.1609446022931827804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Dec 2020 12:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CYb5hOcR;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id s21so11663976pfu.13
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Dec 2020 12:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YCcSIm+MJNV4Cqo8/oZYEdvxXlaj7KRqkShT+Rcus4=;
        b=CYb5hOcRfT8UcVlViE1I9fw69aYeJXqBbGjSaBQg4c/nzXgL9NHla+5cPeXYAn+Hjg
         96i86QZWwylM2ZodfeOQeu1LM6F6tY9wgDExhVLv3bULF0OTY9fR4pFv+n1F7WrZza3z
         TF4wI1DZ/l4rJIhHsKD4ZV0pGGcgQi2dzWqnEPL2UZ4beOBLGsSS9WH3ME3PH0EXjDDW
         n0ho1NkmXE96IdjBu9yc6k4UALSzZpV7WThNri86NiM7LO6dcrNx7tCW9PE/LTSQ1v4k
         p1lv+VY0jceYk+CE4hOu4+ni74YtkLNFlqBZSJqyYylZkhVzHLsqMx1S76hbMpiJctwf
         9TvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YCcSIm+MJNV4Cqo8/oZYEdvxXlaj7KRqkShT+Rcus4=;
        b=XID1FBUoiirFFUm3S0YYIgRPR+9G+hXB1KS3i1DQ5EQCjVHDUahrm4lDKoxhq0+h/Z
         NX7PtsapERGjtj6h3cKxLZw3H9A5eL+hKhiaarLrhWShnBSRiBPzaBAUMgvVpD6RMOiA
         /hNFEz+U7fW3N1CuCWOQyNmfO9nyUSrUx2BFte3tBfcgF1qNXfCV9FYIy9VbAyC6KMw0
         MZa0vk/aE1k3Lrwt/lDCHJa/aaq3NVpoDaT38iC4E9n2tCSEN9LEOapA+xEftCtNevnI
         g4CDFJiQ+qA/oPR80jSCJHcxlYZwsXYSoo17ZDcbJG18EkytBFBvT6NQsiQpHEmk10aT
         A9lA==
X-Gm-Message-State: AOAM531droHG2SVUsYND3Dkr48dcWH7YM7eFpRFIjg+XWm96ovwdh0MH
	W9vy85M2t5N709Q5XCBpfoYZNOgd2q3FNA==
X-Google-Smtp-Source: ABdhPJzpnT5N3WWskHNYfisSEDZx6dsRu+8yR6jTeV8SmA+zdE66hlZpHbo0R/Ng1QAX6ufRIGfjjw==
X-Received: by 2002:a62:1ad0:0:b029:197:e389:fb26 with SMTP id a199-20020a621ad00000b0290197e389fb26mr54233823pfa.20.1609446021936;
        Thu, 31 Dec 2020 12:20:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::cd68])
        by smtp.gmail.com with ESMTPSA id d10sm47053661pfn.218.2020.12.31.12.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 12:20:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libpam: Drop musl patches
Date: Thu, 31 Dec 2020 12:20:17 -0800
Message-Id: <20201231202017.4112686-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These issues are addressed in libpam overtime and no longer needed thusly
in 1.5.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-for-defining-missing-funcitonality.patch | 68 -------------------
 .../pam/libpam/include_paths_header.patch     | 59 ----------------
 meta/recipes-extended/pam/libpam_1.5.1.bb     |  4 --
 3 files changed, 131 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/include_paths_header.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch b/meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
deleted file mode 100644
index c55b648139..0000000000
--- a/meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 45d1ed58927593968faead7dbb295f3922f41a2f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Aug 2015 14:16:43 -0700
-Subject: [PATCH] Add support for defining missing funcitonality
-
-In order to support alternative libc on linux ( musl, bioninc ) etc we
-need to check for glibc-only features and provide alternatives, in this
-list strndupa is first one, when configure detects that its not included
-in system C library then the altrnative implementation from missing.h is
-used
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac                |  3 +++
- libpam/include/missing.h    | 12 ++++++++++++
- modules/pam_exec/pam_exec.c |  1 +
- 3 files changed, 16 insertions(+)
- create mode 100644 libpam/include/missing.h
-
-diff --git a/configure.ac b/configure.ac
-index 9e1257f..cbed979 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -599,6 +599,9 @@ dnl
- AC_CHECK_DECL(__NR_keyctl, [have_key_syscalls=1],[have_key_syscalls=0],[#include <sys/syscall.h>])
- AC_CHECK_DECL(ENOKEY, [have_key_errors=1],[have_key_errors=0],[#include <errno.h>])
- 
-+# musl and bionic don't have strndupa
-+AC_CHECK_DECLS_ONCE([strndupa])
-+
- HAVE_KEY_MANAGEMENT=0
- if test $have_key_syscalls$have_key_errors = 11
- then
-diff --git a/libpam/include/missing.h b/libpam/include/missing.h
-new file mode 100644
-index 0000000..3cf011c
---- /dev/null
-+++ b/libpam/include/missing.h
-@@ -0,0 +1,12 @@
-+#pragma once
-+
-+#if !HAVE_DECL_STRNDUPA
-+#define strndupa(s, n)                                                  \
-+        ({                                                              \
-+                const char *__old = (s);                                \
-+                size_t __len = strnlen(__old, (n));                     \
-+                char *__new = alloca(__len + 1);                        \
-+                __new[__len] = '\0';                                    \
-+                memcpy(__new, __old, __len);                            \
-+         })
-+#endif
-diff --git a/modules/pam_exec/pam_exec.c b/modules/pam_exec/pam_exec.c
-index 17ba6ca..3aa2694 100644
---- a/modules/pam_exec/pam_exec.c
-+++ b/modules/pam_exec/pam_exec.c
-@@ -59,6 +59,7 @@
- #include <security/pam_modutil.h>
- #include <security/pam_ext.h>
- #include <security/_pam_macros.h>
-+#include <missing.h>
- 
- #define ENV_ITEM(n) { (n), #n }
- static struct {
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/pam/libpam/include_paths_header.patch b/meta/recipes-extended/pam/libpam/include_paths_header.patch
deleted file mode 100644
index e4eb95669b..0000000000
--- a/meta/recipes-extended/pam/libpam/include_paths_header.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-This patch adds missing include for paths.h which should provide
-_PATH_LASTLOG definition
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: Linux-PAM-1.1.6/modules/pam_lastlog/pam_lastlog.c
-===================================================================
---- Linux-PAM-1.1.6.orig/modules/pam_lastlog/pam_lastlog.c
-+++ Linux-PAM-1.1.6/modules/pam_lastlog/pam_lastlog.c
-@@ -23,9 +23,11 @@
- #include <stdarg.h>
- #include <stdio.h>
- #include <string.h>
-+#include <sys/file.h>
- #include <sys/types.h>
- #include <syslog.h>
- #include <unistd.h>
-+#include <paths.h>
- 
- #if defined(hpux) || defined(sunos) || defined(solaris)
- # ifndef _PATH_LASTLOG
-@@ -332,6 +334,23 @@ last_login_read(pam_handle_t *pamh, int
-     return retval;
- }
- 
-+#ifndef __GLIBC__
-+static void logwtmp(const char * line, const char * name, const char * host)
-+{
-+    struct utmp u;
-+    memset(&u, 0, sizeof(u));
-+
-+    u.ut_pid = getpid();
-+    u.ut_type = name[0] ? USER_PROCESS : DEAD_PROCESS;
-+    strncpy(u.ut_line, line, sizeof(u.ut_line));
-+    strncpy(u.ut_name, name, sizeof(u.ut_name));
-+    strncpy(u.ut_host, host, sizeof(u.ut_host));
-+    gettimeofday(&(u.ut_tv), NULL);
-+
-+    updwtmp(_PATH_WTMP, &u);
-+}
-+#endif /* __GLIBC__ */
-+
- static int
- last_login_write(pam_handle_t *pamh, int announce, int last_fd,
- 		 uid_t uid, const char *user)
-Index: Linux-PAM-1.1.6/modules/Makefile.am
-===================================================================
---- Linux-PAM-1.1.6.orig/modules/Makefile.am
-+++ Linux-PAM-1.1.6/modules/Makefile.am
-@@ -7,7 +7,7 @@ SUBDIRS = pam_access pam_cracklib pam_de
- 	pam_group pam_issue pam_keyinit pam_lastlog pam_limits \
- 	pam_listfile pam_localuser pam_loginuid pam_mail \
- 	pam_mkhomedir pam_motd pam_namespace pam_nologin \
--	pam_permit pam_pwhistory pam_rhosts pam_rootok pam_securetty \
-+	pam_permit pam_pwhistory pam_rootok pam_securetty \
- 	pam_selinux pam_sepermit pam_shells pam_stress \
- 	pam_succeed_if pam_tally pam_tally2 pam_time pam_timestamp \
- 	pam_tty_audit pam_umask \
diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index 6af1d43c60..486c9d8aad 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -26,10 +26,6 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
 
 SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"
 
-SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcitonality.patch \
-                             file://include_paths_header.patch \
-                           "
-
 DEPENDS = "bison-native flex flex-native cracklib libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--includedir=${includedir}/security \
-- 
2.30.0

