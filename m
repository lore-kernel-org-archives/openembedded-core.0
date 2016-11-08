Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 30CC4719F2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 06:01:39 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so18219240pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 22:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4VQASa0BgQ3e3c5MfE7CHeWT0o2XCJXtsqMdIM7K2OA=;
	b=yXG907vr8bOPyaLOnEKssnJ6ZphetfxPhvl79WlRgX13X+6XsCAgnDJq73O2413VPi
	tbQ6aqVupTFeq1A7K7Fi7b1Z7duIzxtEn73/ZLBaVMLhvA+8VrOBiQHWyFKdbAZ5URMN
	VGe4NWlWiMsGKh0kQWxpmpHLQencAQtcL7OfaCKwA47aBPNV9zg4dJ3P+12OM9HdR9Lc
	Do2mZiX2z2aHSC/3GYYWwXwF9YwV2rBESFObibyettfm8f8b3GEQ9zfVVmWCW4hk7zr3
	Mmt9Z6LEe179lD34WE7U396Idm3oQMQLnEMzwjV3dTVVkW3hN+bL55O7K7Y4zCZdTb13
	kSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4VQASa0BgQ3e3c5MfE7CHeWT0o2XCJXtsqMdIM7K2OA=;
	b=Kf/6n9bn3mZGI1AGRUtACRMPzqo008o0lP3Is8gHp2vylZYnJp1gB9+ZGs9Kx1RsJE
	W3idIOvLdEJ6UUH/P7zbV4Md2fuj2kVVGum4+97AnZeRgnlE3RB5PzL03SVtl11l4bJo
	27nPFEJW4JZr8p6COenkpGfVYdN7qUHyZ2aT25uj5uET3PjSP5xSKyoR4n41QeMdEMGX
	3smhlSqzAo3VtDNhlFRxE6iRD2+b9TwXA6T5V4fxuOVjOAa8+9B02eFw8FT9/WwMr00d
	05UGtZ9Xf/3WILdM8/a20iQ93CjjAivbsTRb74FfaKa6lFewaAsxhEaznH24Nt95V1hI
	Ksgg==
X-Gm-Message-State: ABUngvcOzkmC1mQvw87PJpAbDMyaLz8kxJsl2m1TdH+NZeMhzOPxsJpFYhFJYQnX8gQtLA==
X-Received: by 10.98.103.201 with SMTP id t70mr20222329pfj.99.1478583908598;
	Mon, 07 Nov 2016 21:45:08 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	fg2sm44804753pad.23.2016.11.07.21.45.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 21:45:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2016 21:45:03 -0800
Message-Id: <20161108054503.15107-1-raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 08 Nov 2016 06:01:40 -0000

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
index 1ee56b6..be5c5af 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "39494a273eaa6b714e0fa0c59ce7a1f5fbc80a1e"
+SRCREV = "33ce920857405d4f4b342c85b74588a15e2702e5"
 
 PV = "1.1.15+git${SRCPV}"
 
@@ -11,7 +11,6 @@ PV = "1.1.15+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
-           file://CVE-2016-8859.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.10.2


