Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D80F71A27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 02:13:31 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n85so492281pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 18:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AraSXZKICNXSQE7Rw5Zl4eggyeUCw8gRsAfIc5nvVYE=;
	b=mbn+2ZeRCeFCFB41MHswPoFY/f0wCy3j/Q2Q6CUzOJZ8C4bHH9hqDD95q+esIjlpD/
	fiV0X7FzVKtCFMoB5jBzcK6Ni8xxZOjadofVmMfK1AbGbb3bQygaDbEyblRopI2yaVMw
	2Pl/gheM7LlSWedt1EKhByKH3WMegw3a9KHtW2roKBHQnt+sB05wpPYh+b5n+tsGBmzc
	ocJ193676Y+YRYk84u8xkbq4S4edIhpcTuTsZDxUsi6jJ/WbOMIBjj6ib4VViNa2r96H
	0X7fxXOge1c4w9xcf3iojdXwLFY6ElcjaLiiKM/5P82OIcLofVhlUd61MMdZfAPVuqFp
	1xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AraSXZKICNXSQE7Rw5Zl4eggyeUCw8gRsAfIc5nvVYE=;
	b=Xg25SnRnRYeO+OR7zno7JHXtaOaa+7NDRStKAfGxoRjK/y7eLEu/E/uhdM/2A0jGbK
	CZhMHgAOtAc+RImJ+mdslQYNMZ6IBs28XhlunxCxJ9Qr+zjXcoUQDYOodZ5+AQtzA9uf
	Drw/kIUKmlRFlSxthZrA0gVOmKmtVT/jp7TTwxGIhIs8JvVoKIPK1T8paW9gwanQAzv2
	SKCpbKnJcKUlST5wAMra7TABlOD7V2yPVNbcFpadgNzTfzYoN/bFlBUIF4/HFycNAJff
	fg5AKXBDylkubKhFh32VxbJ3TeD3yrcdtiIr/bzwQm3EGRxsW4m5hqmxrUEyV1WHV+w4
	9zyw==
X-Gm-Message-State: ABUngvfSlyJf1rHfSjpFtsHSyT2gFXjwfXIeNVzLBUwwProns61kYKVRAIHp43F/Su78Hw==
X-Received: by 10.99.152.25 with SMTP id q25mr545435pgd.36.1478830412246;
	Thu, 10 Nov 2016 18:13:32 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	vz6sm10227854pab.15.2016.11.10.18.13.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 18:13:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 18:13:26 -0800
Message-Id: <20161111021326.26750-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V2] musl: Update to latest on master
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
X-List-Received-Date: Fri, 11 Nov 2016 02:13:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/files/CVE-2016-8859.patch | 79 ------------------------
 meta/recipes-core/musl/musl_git.bb               |  3 +-
 2 files changed, 1 insertion(+), 81 deletions(-)
 delete mode 100644 meta/recipes-core/musl/files/CVE-2016-8859.patch

diff --git a/meta/recipes-core/musl/files/CVE-2016-8859.patch b/meta/recipes-core/musl/files/CVE-2016-8859.patch
deleted file mode 100644
index 82da86f..0000000
--- a/meta/recipes-core/musl/files/CVE-2016-8859.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From c3edc06d1e1360f3570db9155d6b318ae0d0f0f7 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Thu, 6 Oct 2016 18:34:58 -0400
-Subject: [PATCH] fix missing integer overflow checks in regexec buffer size
- computations
-
-most of the possible overflows were already ruled out in practice by
-regcomp having already succeeded performing larger allocations.
-however at least the num_states*num_tags multiplication can clearly
-overflow in practice. for safety, check them all, and use the proper
-type, size_t, rather than int.
-
-also improve comments, use calloc in place of malloc+memset, and
-remove bogus casts.
-
-Upstream-Status: Backport
-CVE: CVE-2016-8859
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- src/regex/regexec.c | 23 ++++++++++++++++++-----
- 1 file changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/src/regex/regexec.c b/src/regex/regexec.c
-index 16c5d0a..dd52319 100644
---- a/src/regex/regexec.c
-+++ b/src/regex/regexec.c
-@@ -34,6 +34,7 @@
- #include <wchar.h>
- #include <wctype.h>
- #include <limits.h>
-+#include <stdint.h>
- 
- #include <regex.h>
- 
-@@ -206,11 +207,24 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
- 
-   /* Allocate memory for temporary data required for matching.	This needs to
-      be done for every matching operation to be thread safe.  This allocates
--     everything in a single large block from the stack frame using alloca()
--     or with malloc() if alloca is unavailable. */
-+     everything in a single large block with calloc(). */
-   {
--    int tbytes, rbytes, pbytes, xbytes, total_bytes;
-+    size_t tbytes, rbytes, pbytes, xbytes, total_bytes;
-     char *tmp_buf;
-+
-+    /* Ensure that tbytes and xbytes*num_states cannot overflow, and that
-+     * they don't contribute more than 1/8 of SIZE_MAX to total_bytes. */
-+    if (num_tags > SIZE_MAX/(8 * sizeof(int) * tnfa->num_states))
-+      goto error_exit;
-+
-+    /* Likewise check rbytes. */
-+    if (tnfa->num_states+1 > SIZE_MAX/(8 * sizeof(*reach_next)))
-+      goto error_exit;
-+
-+    /* Likewise check pbytes. */
-+    if (tnfa->num_states > SIZE_MAX/(8 * sizeof(*reach_pos)))
-+      goto error_exit;
-+
-     /* Compute the length of the block we need. */
-     tbytes = sizeof(*tmp_tags) * num_tags;
-     rbytes = sizeof(*reach_next) * (tnfa->num_states + 1);
-@@ -221,10 +235,9 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
-       + (rbytes + xbytes * tnfa->num_states) * 2 + tbytes + pbytes;
- 
-     /* Allocate the memory. */
--    buf = xmalloc((unsigned)total_bytes);
-+    buf = calloc(total_bytes, 1);
-     if (buf == NULL)
-       return REG_ESPACE;
--    memset(buf, 0, (size_t)total_bytes);
- 
-     /* Get the various pointers within tmp_buf (properly aligned). */
-     tmp_tags = (void *)buf;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1ee56b6..d4467bc 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "39494a273eaa6b714e0fa0c59ce7a1f5fbc80a1e"
+SRCREV = "4078a5c31fa67987051c2180db7a07702534032f"
 
 PV = "1.1.15+git${SRCPV}"
 
@@ -11,7 +11,6 @@ PV = "1.1.15+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
-           file://CVE-2016-8859.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.10.2


