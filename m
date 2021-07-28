Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.3162.1627468457648693027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 03:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WCOtd1ja;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso3448532pjf.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cva5IUOzdJxfOr0PHb4gXFPLjw9JRdMJRbxuZDiNVe4=;
        b=WCOtd1ja6ExKVTZ7ADUltEX9tVtvJjRsORvDCZeBhnhanhuetnw07NR8hbQ2+4abl4
         y4+3fyh6nWOEw3AWemL6CYrmJ1T5cqoqC9qxg2eMT7rXhGuciOazRWnIKtIXnQYC3Emu
         VOxmZYWi4W9YCnNMm4ItQmS+aZx4/XKXFNo6Ln2tdq9md8P0nkIXTd6uizXqx6tmavBw
         aDQIxXjsZKIc38x5TYJVc65qKrb+JmMrpzCvD3D8zuaS4R54U+9rQnOyC0gYfccGw+Xf
         NMt1jj2R42fCh8+8JFxUBBkNR2jrI7DGn9kxSiPYCNgYZj5uE/NI5eTMIGd+aqbnj8fL
         Tcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cva5IUOzdJxfOr0PHb4gXFPLjw9JRdMJRbxuZDiNVe4=;
        b=W/8gdr459f9IQbPdr5HlOoOZWLZohuMBTq1aO3ZoeaBCrldFSScr/dSB1OVh2nfZw/
         27A5xhmY9ipgoR4CFzzBNhk77qLhKyfrDUtHvQt+eDn0mRAPVGYipkosZu1zNFRnT1rP
         pn3YsaC++5MDJ/msMTra/t3ba+xxLoQRMwvKiQCKok0VlHoN1tyKnipj7vOxU0fNIl9z
         Ph5Pnlcbt9z+gj29uUY6CrbKCeAeZ6f6VPm/WrmO5KW369s9jKLvAwW6yMpYmL2heFT/
         N9ZcYI61qiKDx70Dw4H/QtSojuVWgAG/RtRDlc34Q2am5ppHVk91gPbNaAeeq4XU6SjK
         NSDw==
X-Gm-Message-State: AOAM531PWEdlEey3Cozf2z+pcFwhLZsAHDQuPTuAeBZwY/W0Irhis+RE
	WKLGBXxl18LDlcY1Lr0mOP56Yyd57k55hg==
X-Google-Smtp-Source: ABdhPJzUMDx4/nlDVpNQhI6z10ZOjnRaBtjWXEcO9Qd471GRbhuS8QI01sg84iq/6hGrEEolZsLKBQ==
X-Received: by 2002:a17:902:c20c:b029:12a:edee:a7fa with SMTP id 12-20020a170902c20cb029012aedeea7famr23003383pll.2.1627468456775;
        Wed, 28 Jul 2021 03:34:16 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id f10sm7180200pfa.17.2021.07.28.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 03:34:16 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [hardknott][PATCH] glibc: Fix CVE-2021-35942
Date: Wed, 28 Jul 2021 03:25:38 -0700
Message-Id: <20210728102538.36902-1-vinay.m.engg@gmail.com>
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
 .../glibc/glibc/CVE-2021-35942.patch          | 40 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
new file mode 100644
index 0000000000..349762bd8c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
@@ -0,0 +1,40 @@
+From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Fri, 25 Jun 2021 15:02:47 +0200
+Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
+ 28011)
+
+Use strtoul instead of atoi so that overflow can be detected.
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
index 4b54a0dd59..eb6c3430e3 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -62,6 +62,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2021-27645.patch \
            file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
            file://CVE-2021-33574.patch \
+           file://CVE-2021-35942.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

