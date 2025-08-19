Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19004CA0EE9
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 05:45:01 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.7148.1755582292552874749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 22:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJvl5Mp9;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32326e7baa1so3913505a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 22:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755582292; x=1756187092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zT8I8qajSCnjJoONaARmgIxobJSYd44pMwtI7cRD3g=;
        b=VJvl5Mp9D7nx8/VEYgwr94c5Q6RaN+TmdI+PpkWGPZdCR7Jg5vd6C3hSiDwvEFN0Bg
         YCA35Q7zoCXpLaSAGPLnc0R23u8C3Hoq3yMOOG6QWadntfAhlhFYR8wbtkCf9sBB2ch1
         itu/4Pxzx4VZEib4fvrPwiMS2b+MCt8O+btiwyCpSdPVPlh5/m4s6JpS/37MUXOepxza
         qEC1XnafGmUrt8Ugrd+4AXhTgHvtdmFRy4aXSjxx0RENGtFpOTM5mswqWtr4NPe6MV1t
         +e1+0Jr8YhKESU/TD2f3KpWUOam+lR9xox/9Qi6inGlLnoHUJ6jBT0kiXfpkfWQMNdz2
         WD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755582292; x=1756187092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zT8I8qajSCnjJoONaARmgIxobJSYd44pMwtI7cRD3g=;
        b=flZui9f+fdvMOA/kw+elfTQzWlKNX8UwB0ehp03mulB0MpOBRuevmLBe4ATX5xX+Jx
         HabaBRHDnq0HJc9OHXESPTlkiLVNKRHsDWeCEFI1tCVf1uZzA1emWzUlLO+zbRzCI7Uv
         RbnKNngUptWcoFsTmM4SU7kLg0HoBD4R4F+hp6grDien57FrEBfJOmbtBy9CLkEFAwrr
         3bU8zFu6GHrtDtyTfpfV1bGdPJDh+ao7X3mwbh6hF0m6t95E/ftQ0ZymV+6Y0qJIU6jI
         kjLy/ml1RrSHDQDvZPP/2Du04ENx9OEhvSuqK/gTJC2FchC4sDlkhfKpFTRQhGr/RrQ9
         rjFA==
X-Gm-Message-State: AOJu0YwIKTZINYMT4vJRWWsB4b+ZzvUf0gPzl7W98BtiNOQkE7WtvQlg
	AmvWkrCjAsPFvy93toDAlWAA7pAbazFM5UJob2u3Yu20+gqZdydygz2AUxQn/NFi
X-Gm-Gg: ASbGncs2QZEphIVUxTwObuJXPG4DgEgvQyDHKeH9DicLn01jCiPOZc4tqrdDPJfZI9e
	uLhiLyNcJ2FWbZzt/1Z4TTX4IkLgpJIgIuTB7194O6eQ1DeAf36mDj6coZTr6ONWt/2/H7AaD24
	Ho829KUWdkb5O3nJwAomHAkS+DjoHOsWB8ScTz8zVmwqRJLENFkYde+YA3orsLND1/bvf57uS28
	2IgBymlzIFC2tcqDfKUCxyV+3LQVrjlcXeFs0gif4jE3covYDBLVRWGThnxybn0YJik6fPWr7+D
	27dPMpqlq99+n/3FO9FwWUhUWG39rh5EnZaamSvf30CBtVVnwfENHX7lXRtQVviVuiO/IY2GfXg
	gsBa0+xp+D8NOophlTQwfTg==
X-Google-Smtp-Source: AGHT+IFMLKCPAR9hVK0cPp64UA7J9el79ikZD9oQq4SILf1GzGv8XtwpFdbZNit3CyKJPc8iplLDxA==
X-Received: by 2002:a17:90b:2b48:b0:321:27d5:623e with SMTP id 98e67ed59e1d1-32476afcd2bmr2029053a91.23.1755582289965;
        Mon, 18 Aug 2025 22:44:49 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d19a02fsm9609938a12.0.2025.08.18.22.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:44:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Fix uio test and ignore pwritev|pwrite64 tests on musl
Date: Mon, 18 Aug 2025 22:44:47 -0700
Message-ID: <20250819054447.4003831-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 05:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222072

The pwritev and pwrite64 are wrappers over pwritev2 syscall in
musl but strace assumes glibc behavior, ignore them for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 53 +++++++++++++++++++
 ...01-tests-fix-uio.test-with-musl-libc.patch | 30 +++++++++++
 meta/recipes-devtools/strace/strace_6.16.bb   |  4 ++
 3 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
new file mode 100644
index 00000000000..465a8339a9d
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -0,0 +1,53 @@
+From 13fd22ad0df5b80c428d3ecc0114fb340f3b3894 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Aug 2025 22:18:58 -0700
+Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
+
+musl uses wrappers for pwritev and pwrite64 using
+pwritev2 syscall [1], however the test exepcts that the
+program will call pwritev and pwrite64 ( glibc behavior )
+
+This can be fixed if the function calls are changed to
+use syscall() API directly, but that needs change upstream [2]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/src?id=5370070fded61b569196764673a4fc8440aac79e
+[2] https://github.com/strace/strace/pull/347
+
+Upstream-Status: Inappropriate [Musl Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/pread64-pwrite64.gen.test | 2 ++
+ tests/preadv-pwritev.gen.test   | 2 ++
+ tests/pwritev.gen.test          | 2 ++
+ 3 files changed, 6 insertions(+)
+
+--- a/tests/pread64-pwrite64.gen.test
++++ b/tests/pread64-pwrite64.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pread64-pwrite64 -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
+--- a/tests/preadv-pwritev.gen.test
++++ b/tests/preadv-pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (preadv-pwritev -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev
+--- a/tests/pwritev.gen.test
++++ b/tests/pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pwritev -a22 -s7); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a22 -s7
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
new file mode 100644
index 00000000000..a879ca50ca2
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
@@ -0,0 +1,30 @@
+From 7fadf6947761cc5248aa4a376bb9517481dbaa52 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 12 Aug 2025 20:02:31 +0200
+Subject: [PATCH] tests: fix uio.test with musl-libc
+
+musl-libc handles the pwrite calls differently than glibc, making
+the uio test fail.  Using glibc, there are separated pwrite and pwritev
+calls, however musl uses only pwritev2 for both pwrite and pwritev.
+
+To account to this difference, modify the expected matching regexp
+to also match the musl output (append it with an OR).
+
+Upstream-Status: Backport [https://github.com/strace/strace/pull/347]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/uio.expected | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/uio.expected b/tests/uio.expected
+index 98d5c06..2a712a1 100644
+--- a/tests/uio.expected
++++ b/tests/uio.expected
+@@ -1,4 +1,4 @@
+ pread(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
+ preadv\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
+-pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
+-pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
++pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
++pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
diff --git a/meta/recipes-devtools/strace/strace_6.16.bb b/meta/recipes-devtools/strace/strace_6.16.bb
index 3e6b855df06..0552caa2b6d 100644
--- a/meta/recipes-devtools/strace/strace_6.16.bb
+++ b/meta/recipes-devtools/strace/strace_6.16.bb
@@ -14,6 +14,10 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://0001-tests-fix-uio.test-with-musl-libc.patch \
+           "
+SRC_URI:append:libc-musl = "\
+           file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
 SRC_URI[sha256sum] = "3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa"
 

