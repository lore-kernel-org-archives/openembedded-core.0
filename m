Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27831.1795312417304988661
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 17:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LkYTM+Oz;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38564b4b017so2226756eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 17:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795312416; x=1795917216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZaxCOvysQGJ8I2DEijZvFzFC7SeuHKMYYF0RoSQYGAg=;
        b=LkYTM+OzvEUX5AWfKE25nEzWZZCGKL74Q66zGbc5KQjAIzgaxnvsFEGqBN3vInslmf
         DtDeUV4VupYpveRjnGf8S7Gs2G5ktChm+RbNLY5RTQEi3IfSb2HII/EJVngAxPoAZ24W
         qBol8Os/OzwwLwapdAo9fw4Ycg6akwJkKC9WtZiNdFf+ZtYzrxfICIP6FqNdYzdSuGwT
         XtZpH0+N+Am7Wf2Oauct0De/r7vaFod5ZjuyA59jmNPQtSTY7I51Z6zaabkMpltMIEEO
         KsTBDWagH3kjKp+dbH8d9YTEndBQ4XB1G5KR36kovG40g40jaPwF+WvAd7C4u47k/sEm
         ng9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795312416; x=1795917216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaxCOvysQGJ8I2DEijZvFzFC7SeuHKMYYF0RoSQYGAg=;
        b=TYNpnzVDuPg+0z0OUTetKKkw+sizoIuS3/ivwXKr9PZlSupPLUjx7DHqYyhpBhVE87
         gNj7mvrkhB04Frl3uBsmlqBe/JcNps2mA4YEuBu8+gXnMuq+kL3YLlZYjBvWayYhqJLl
         4prQFIoy44Bw9TnVMJdB0Q03UNL7QUYCJonKVKZaVl6FUxdY/IfNpTsyfmeWYxVhQ1OU
         ifL4vZpIuC8KedVzssyQPu1VBW+Z6VJoiuPSriETtHcmKG96/oAbpW+jmKElvXUt5V1L
         GSlJG4FBt5T99hqtfv/aLFa1GRszD0LadGf9GR2lBiDIc/BWqIB9HkVD6jGjFmGXs/kh
         oOCw==
X-Gm-Message-State: APuU4Z+xiMg82CaDB0+K5g1zG4fQJfWZN9+DnrM5Zy3xU9KCGDhBZMq8
	rqoFuiFZ/ujMd1UIPx2h77R4895vJy0NWCxpQ34yiqe8yhNsQZguFmKCCK07dV+q
X-Gm-Gg: AZFdTZcb7uhaAp+L4u7/52TBoakC1vciGJLppKQZKMu/SQsNQHzzBgRUaK7b8cDOVku
	9PT7OD4CWzg/I3dQPGFHYuMzyU1IGf2vEzFc1tBvc1BOTcShTX8yYJ9meqx5u/aC8NMe7mIlBAM
	fjAJlwCC0fmH03hceRq6pkM9vdJUdlKSE/gB7rMh7/jLMeKfZZ00tsiLzMdbN12yQV0IqMSYDsM
	+4cMpzb+HiWjK+Yozpa1Hz1oJ/wirRAgcqlYsn4h17Dtek4dPL93gcEXiaVgV2c0KjWcEMW0xVC
	hA15WCZfeu5qAB3DwA8956fkyBxfgOqraLMdULSo9uxmv5qKwYCZvivPklq4ZKud5to8hJXb+I0
	OoEk1he828uPy/AO+n+UgNNUU8xvtLhQDilntD7uGI0ba0SJMEMHiG2PDl5msdBSLLGwpVtQKvp
	Gll7I8M2k30o3rm47HbeoIVX6vcOigcGb1nbK7H6MCursvd4BjWxqJl9bO2ELNmHsd2lW3ybwMo
	V6+rDX/MpevWuSgkSk1c6XRButyARqpIm2Xczc7PaCJl38DnYExgaPDH7rADwsUd6wgL6oLM6AK
	Q3MaoVEqfm88+Cx3bOdHpfHbpav4hyiY6M1P4dI8vBDKRS7XMsU7aAWXFQyFRAouQ4EauyZ7Ss/
	I1EhFWA3hHu+NS6N3vF7Awgg8Gej7lNLNy4nk60ANMeWvYQleYLxyRq6RRC4/s5/ed8iV+AjHZd
	23NnRPSdH0AEyjPcQVRFYQwu8sqvbNfcdQG/5OmY2aGNV+R1ArwiinFkY8nb3ni6gXf74X++024
	KJVzCc9VdScPQqpJaV4Ko5o0N8CwsSnXYSdslZZiCCe4ZIEj7IpZ344pwLEeJIXDmBdNPP/ihot
	anJX
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr9002408eec.7.1795312416373;
        Sat, 21 Nov 2026 17:53:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm25405356eec.10.2026.11.21.17.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 17:53:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] strace: Fix fallocate ptest build with newer musl
Date: Sat, 21 Nov 2026 17:53:33 -0800
Message-ID: <20261122015333.438502-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 01:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250861
Content-Type: text/plain; charset="utf-8"

musl now defines FALLOC_FL_WRITE_ZEROES and the other fallocate
operation flags in <fcntl.h>, but not the deprecated
FALLOC_FL_NO_HIDE_STALE. tests/fallocate.c assumes that when
FALLOC_FL_WRITE_ZEROES is defined all FALLOC_FL_* constants are (true
for glibc, which includes <linux/falloc.h>), so it skips
<linux/falloc.h> and do_compile_ptest_base fails:

  src/xlat/falloc_flags.h:24:7: error: use of undeclared identifier 'FALLOC_FL_NO_HIDE_STALE'

Include <linux/falloc.h> unless FALLOC_FL_NO_HIDE_STALE is defined too.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...fallocate-test-build-with-newer-musl.patch | 47 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_7.3.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-fallocate-test-build-with-newer-musl.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-fallocate-test-build-with-newer-musl.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-fallocate-test-build-with-newer-musl.patch
new file mode 100644
index 0000000000..083baa7481
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-fix-fallocate-test-build-with-newer-musl.patch
@@ -0,0 +1,47 @@
+From 66b1687dd6b60b0c6fd957f11eb66f5ce7edc7d6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Nov 2026 16:12:50 -0800
+Subject: [PATCH] tests: fix fallocate test build with newer musl
+
+The test assumed that if <fcntl.h> defines FALLOC_FL_WRITE_ZEROES it
+also defines every other FALLOC_FL_* constant, as glibc does by
+including <linux/falloc.h>.  musl now defines FALLOC_FL_WRITE_ZEROES
+and the other operation flags in <fcntl.h> itself, but not the
+deprecated FALLOC_FL_NO_HIDE_STALE, so the build fails:
+
+  src/xlat/falloc_flags.h:24:7: error: use of undeclared identifier 'FALLOC_FL_NO_HIDE_STALE'
+
+Include <linux/falloc.h> unless both FALLOC_FL_WRITE_ZEROES and
+FALLOC_FL_NO_HIDE_STALE are already defined, and also undefine
+FALLOC_FL_WRITE_ZEROES before including it.
+
+* tests/fallocate.c: Check FALLOC_FL_NO_HIDE_STALE as well, undefine
+FALLOC_FL_WRITE_ZEROES.
+
+Upstream-Status: Submitted [https://github.com/strace/strace/pull/441]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/fallocate.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/fallocate.c b/tests/fallocate.c
+index 2c28ad8..34d2839 100644
+--- a/tests/fallocate.c
++++ b/tests/fallocate.c
+@@ -18,7 +18,7 @@
+ # include <fcntl.h>
+ # include <stdio.h>
+ 
+-# ifndef FALLOC_FL_WRITE_ZEROES
++# if !defined FALLOC_FL_WRITE_ZEROES || !defined FALLOC_FL_NO_HIDE_STALE
+ /* Avoid conflicts between <fcntl.h> and <linux/falloc.h>.  */
+ #  undef FALLOC_FL_KEEP_SIZE
+ #  undef FALLOC_FL_PUNCH_HOLE
+@@ -27,6 +27,7 @@
+ #  undef FALLOC_FL_ZERO_RANGE
+ #  undef FALLOC_FL_INSERT_RANGE
+ #  undef FALLOC_FL_UNSHARE_RANGE
++#  undef FALLOC_FL_WRITE_ZEROES
+ #  include <linux/falloc.h>
+ # endif
+ 
diff --git a/meta/recipes-devtools/strace/strace_7.3.bb b/meta/recipes-devtools/strace/strace_7.3.bb
index 6e801d265f..8f1cc5fb93 100644
--- a/meta/recipes-devtools/strace/strace_7.3.bb
+++ b/meta/recipes-devtools/strace/strace_7.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            file://0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch \
+           file://0001-tests-fix-fallocate-test-build-with-newer-musl.patch \
            "
 SRC_URI[sha256sum] = "529634c40910895a9a1f3c5c1e65da2ca9ed72fb158dfc4bcc89efdf05e39b72"
 
