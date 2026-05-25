Return-Path: <sureshannaiah.mailbox@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3A0CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 19:23:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22666.1779736986799476382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 12:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c8QPgL6s;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: sureshannaiah.mailbox@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso758857a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 12:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779736986; x=1780341786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJwbnJbXAwruX0X9yUBUBsuL2HJ5WAYnJJfVshq0HbE=;
        b=c8QPgL6splIW+nKLCX70s+obxWT2Lw2Vh+KJUr97a9V92baY7f6WrJYWuTxmrfj9Sx
         ExNeZmlGuBx6BIr2dcjspSGLN76Hkto8oAjsN8GK43SyCM8bDb6xHVHmPq+5Pys6QH39
         shWxysaA8tBMMky2hO5D4C85F6tGzVySMFkZgelTI9yaL1LIsi9iG0HT3CUP7xUMGzEZ
         MZolvpXca3acSQ86svzqSOTzCWsYe6wTMOk6i16jnDxry9oUUc4Vu0DOaXaJLyA/Sci3
         hFvxAp1xcnLoi+Z/om9pPlmxwEuFw8P9XEDObchRUDw4OVYKmRkvgRwXJbj0SQRej/t7
         parQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779736986; x=1780341786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJwbnJbXAwruX0X9yUBUBsuL2HJ5WAYnJJfVshq0HbE=;
        b=SP/hn3jziKboySvyXGkWB9BNCB96kPO0/RmFoZ3cav+ObhLgEGjThg8G4LMMRKPufg
         V7iZ7iI74SC/GNC/8OTBjDJFSacDiiZiKcxOCLst71yVQY47m29mJBKoMOJh9urFpA4N
         vAybBP7eK23CJFixEm0jPDxqeJhpQ7bzll3PWnPC+2/SWtT9sqk8ywaGdXdyX8zDQOPH
         LfTkaNF3KueKJGA+X05p5w087JrJcpAce5DPibqPqPbiqD0D0w0g0Qw2oSNjRWRsfLDq
         wyZsB4kp7aeV0V0oh2zgDns55D1aIOcx9Lx97z+dPcQCisuxRDXIFRXYXSvcVuJEJqYz
         Yt+Q==
X-Gm-Message-State: AOJu0YwiDDRuBvjeA/IIAh+/htq/Z1W/QUoqPrZRPYnoGBF9t6d8B2cb
	MMia9BNainSfr0bzBBab/KjTEZRYZiVpHx6Fqqnc3DUHfqbKtLEN9XBztuKN5A==
X-Gm-Gg: Acq92OHg/Ovh6kikab3Nim4PRZKDh6yO4/rbgJ8Vd06u2GbuirHrnJlyhVh8NAygsAO
	qXPgIaCMm3zxigLNyvm5Ao/3GHaBeW56X6CwIJbeZiWdhIwLz9KbSi3ig3dYppmx0365uJK3j3f
	WuvcP1TbjekbWPp8zBQsQXr4Dpuw2TUpqHzaPed43rS16BL4hCONTbOq3MzSeiJwj+V1geJ7T9V
	cMpc8vgThrkKmRjyuMRLWLjchC7A5v1Vb143O0TninoALX4CSYB3evrZQiHFmiNy8quUC6L/6/b
	V5eEcvUoZofxjEFTk+xsoV5bNp8FSiQMZxePIIw5xFCSxenGzoAqGbo1hwXHi6Df0gZbhgo48E0
	aISL3hvwKYH5B9/IqyQLqaX+ONpVi8a920wiiQosX1caqJf6NPlw5N0oEAZTNQfEWXRNzn6g//K
	kPYRzrk00zH04ilYw0xPrTeL++p8SitfxlGRgup/ZR7FND919ghRfA/Y4=
X-Received: by 2002:a17:90b:3c92:b0:368:1064:62f2 with SMTP id 98e67ed59e1d1-36a6773c3e5mr13947760a91.3.1779736986114;
        Mon, 25 May 2026 12:23:06 -0700 (PDT)
Received: from suresh-HP-ZBook-15-G3.. ([103.162.210.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a674c3a4esm5646624a91.0.2026.05.25.12.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 12:23:05 -0700 (PDT)
From: Suresh H A <sureshannaiah.mailbox@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Suresh H A <sureshannaiah.mailbox@gmail.com>
Subject: [poky][kirkstone][PATCH v4] systemd: backport patch to fix journal-file issue
Date: Tue, 26 May 2026 00:52:46 +0530
Message-ID: <20260525192246.2813508-1-sureshannaiah.mailbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 19:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237581

Backport patch to fix systemd journal-file assertion on removed or corrupted files.

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
---
 ...not-trigger-assertion-on-removed-or-.patch | 67 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..ade8cc3b62
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch
@@ -0,0 +1,67 @@
+From e89f166158b72a6ad022c9c795983bfe0a20cc36 Mon Sep 17 00:00:00 2001
+From: Suresh H A <sureshannaiah.mailbox@gmail.com>
+Date: Mon, 25 May 2026 22:58:17 +0530
+Subject: [PATCH] journal-file: do not trigger assertion on removed or
+ corrupted journal file
+
+When a journal file is removed or corrupted, then the value `p`, which is
+read from Object.data.entry_offset, may be zero.
+
+Note, journal_file_move_to_object() checks the passed offset and return
+-EBADMSG if it is invalid.
+
+Fixes the issue reported at
+https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
+
+Upstream-Status: Backport
+[https://github.com/systemd/systemd/commit/112cbc37906fb97afe0ad04164262cf62d0af5e9]
+
+Comment: Patch is refreshed as per the codebase of v250
+
+Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-journal/journal-file.c
+index bac258ca42..7b6b7eea2e 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -2602,7 +2602,9 @@ found:
+ 
+ _pure_ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t needle) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <= 0)
++                return -EBADMSG;
+ 
+         if (p == needle)
+                 return TEST_FOUND;
+@@ -2618,7 +2620,6 @@ static int test_object_seqnum(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+ 
+         assert(f);
+-        assert(p > 0);
+ 
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -2658,7 +2659,6 @@ static int test_object_realtime(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+ 
+         assert(f);
+-        assert(p > 0);
+ 
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -2698,7 +2698,6 @@ static int test_object_monotonic(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+ 
+         assert(f);
+-        assert(p > 0);
+ 
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index 087c0035eb..b85363ad81 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2025-4598-0002.patch \
            file://CVE-2025-4598-0003.patch \
            file://CVE-2025-4598-0004.patch \
+           file://0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


