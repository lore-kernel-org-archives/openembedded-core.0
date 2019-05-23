Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 129007E3FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 14:58:25 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o11so3083374pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cPaxnXaaDPCLxcu29V16ALcltJKS/r83NuxKgzjkzt0=;
	b=Hkj6zwCcM73mesC7Rc0bu4LMhAjO99ZHzGCEF+Zv6FFY0OPDtsqnkAVLCwBkxy8HJF
	K2KhRybFp/Ptvr1yxgqF9CCbzdGCVEcy1p/vufRwXWccRDC2MNVMd0SSf8nez9bX+H2N
	8m8h7jZfaBmKlDWUzLkFlfYs8JUxBkPYcIQAs0AG5wl2HT7y5bIJeiP43IiQorqNs7J/
	TdwIDufyfPHEuWb8wnRLlRZTa0hhInXfpdsZUNekB/Gtp1dbe4JxtHwxKHHul13SylRB
	DLQYw7UQMhPXlSwUTStvwfg3qxYzAlYJ2+QpVejdU2cy2ZbryMzVT3/qjBclstzfbwsH
	+w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cPaxnXaaDPCLxcu29V16ALcltJKS/r83NuxKgzjkzt0=;
	b=YV7fTFW4ceav80x1Pv4ycnt6CdATh5a3xKjNy7RR3WAFo1qZeFxB4wyJF1fxpusiMr
	8nB6UAl91okfJcPwgJRB5iNYHXaBJpK56ePKVpTS2yqEDdIRZYI82ca0E0nqLp4n+9sI
	pYdSWGSe8nrnZ3vr99r0TWBRGGaIDjqMur+NPDJgL/kRppjPHLdnMgmXUqhuIpS/f6hd
	F3n92U/M6e05IcNbDHsgaGrTP8uPQ/tcgftc/FBCmYE8OjS3vBP1vltGapURSsiT6yZD
	NPLNkK2vhGgT71jcSdJPQkkMgtVv0070S2i2xTpVoJaFw2zgwxCsBMNe7zGdLy2hqOnY
	iFbw==
X-Gm-Message-State: APjAAAUGEGc2y1Q9aSTxHZ+UReryyJ3U5kQUoO3EE84lpYBo8SmD/3rk
	YviaaY8uWpBvIUsLi+XmUuOGp9QG5Cg=
X-Google-Smtp-Source: APXvYqz1jn3OGpwIYMe6yHQdgjfDe3My9vYdDKSPzZUhKHaLdBM/oaNAg1Y4mWCSqdNWbKt4B3yA1w==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr44794242pgp.72.1558623506425; 
	Thu, 23 May 2019 07:58:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	v1sm29519925pgb.85.2019.05.23.07.58.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 07:58:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 07:58:19 -0700
Message-Id: <20190523145819.23329-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: [PATCH] Revert "musl: Add TEMP_FAILURE_RETRY from glibc"
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
X-List-Received-Date: Thu, 23 May 2019 14:58:26 -0000
Content-Transfer-Encoding: 8bit

This reverts commit 0c68c621d3b8690e3a346170006f75b032511a8a.

It should be upstreamed first

Secondly, musl and glibc are under different licenses and importing
code from one to other could taint it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch | 36 -------------------
 meta/recipes-core/musl/musl_git.bb            |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch

diff --git a/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch b/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch
deleted file mode 100644
index 4d48d61651..0000000000
--- a/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 19cbebc3fa33c6a1a71a6036da4d67c98f859f06 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Wed, 15 May 2019 16:08:33 +0300
-Subject: unistd.h: Add TEMP_FAILURE_RETRY
-
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Inappropriate [oe-specific]
----
- include/unistd.h | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/include/unistd.h b/include/unistd.h
-index 9485da7a..8a75af57 100644
---- a/include/unistd.h
-+++ b/include/unistd.h
-@@ -460,6 +460,17 @@ int eaccess(const char *, int);
- #define _CS_V6_ENV	1148
- #define _CS_V7_ENV	1149
- 
-+#ifdef _GNU_SOURCE
-+#ifndef TEMP_FAILURE_RETRY
-+# define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__                                                              \
-+    ({ long int __result;                                                     \
-+       do __result = (long int) (expression);                                 \
-+       while (__result == -1L && errno == EINTR);                             \
-+       __result; }))
-+#endif
-+#endif
-+
- #ifdef __cplusplus
- }
- #endif
--- 
-2.20.1
-
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 2b433aed8c..1e324804e1 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,7 +15,6 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.21.0


