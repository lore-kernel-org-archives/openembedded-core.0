Return-Path: <sureshannaiah.mailbox@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78433CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 19:09:50 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22428.1779736189857151630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 12:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WqyRXb9D;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: sureshannaiah.mailbox@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3664df32e91so11355213a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 12:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779736189; x=1780340989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsiHvbAXVuHAK2XYQq9s2E8yITWykVKlT92+SiHXTvk=;
        b=WqyRXb9DeWtECieRf/Th15jDFcTMoybQwKXAq52J2DiL2AueXpeWh6/XxqwkLnrfb2
         CfH3o3tNIRwqeb4Q3EoND/oVwFi+mjDVO3S5ahAN146kKxH1BTuo5Dy+OPFealqM1g/w
         Vakb25yNI9Z2jIpHoX2AhvAqeq7qBTYU4jPg7bPbWe+55NwQHsAP3Eh9m9rNi7iC7Tkt
         7zN1/XQB7Bm8br6K1wZW4/tmEFK+jc4VKNYiBrWGgilZEv1A5S/sJeNgXgt9KhgF3lus
         nk8OSAtMUJudYhTsVI4nhILbdCg3NJ5O6vEtIa9l6XcpL19WJLqbZeFrrCOr054P8SWk
         x4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779736189; x=1780340989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsiHvbAXVuHAK2XYQq9s2E8yITWykVKlT92+SiHXTvk=;
        b=X2Pg9OY9bu7INHFfT6ax47yoZAcOWAQUSqtFOmbfVNgIYAZInwOqhE2lQpzAho7XIy
         yW0sFrU3D37AxIH/D0LO3t/JsVZjkyM4mXJtfDZ2ZuPDcJoZ5pfc9d8/kDQ6kBCxPhts
         C+59xVHsOQa0JtXrDL1T/CGIjs79EUY3ktbjyPzBucFYZG6diWL76jcWh1aUzlSOyT3K
         jyWw+C/kOD31fNFUPLK1pi1TNwFasPpxjl5l6OD3m9CEf+Rht6HoLmQVCfo/FlKifecN
         d7mXgFI3LIeSG82qC9xbIgV/3tNDbIh/PSVRnJRgrAba3FIBMq9b0G3xNdC0S5nTSKLF
         HfIw==
X-Gm-Message-State: AOJu0Yzzc/rJAVDL3Ma/ixk/x5yBlrJOv/RA1/6P9iIrYZwHEP0qQyuU
	h+gIt5aYU2nRWVd6jJhgS9q76Bt14W9CkVl5848RudUhoE4ewWCsHlbiMAMhuA==
X-Gm-Gg: Acq92OFuD4rIZbd52shWuqwJ0l4ibqLmB3gl8CKEqRAJtDfPVB2K8Cq4I15tfdIUSvU
	Nw1LSKqxBsJXY6I+bRoWE55Z43BDAeVI2sM0oiSohvkSSNkxQ8J1yvOrvk1LL6jSIRqvbFhggQw
	fNXLeKoSbhRwXIvsxmhb4rtR4cie+WwCUl1hJlPxzN9RkvDeFWIeWxehGR9eEQaWlxFVOsnFeQi
	DJn8CFP/1urSzVcB2pwhKZ0uAXs0y5VBJ4I9jhmWubk2w1c1wS9FsaAaMIMjG3TPpJjbH6o78kC
	++og16O5kqLeutVsftaVuVclMXAussMmqUVeVClXrmAioegg6155n17cK5vwiHJp9UBWbGgKfyy
	gNJW+NIuz7p99fJu7ZHihnvh0FDUck5nSMZYWuDpGU2ZLvvmoj/OzH0ruZhasIn7PYjVwZzQ7R+
	RWne8IHkHqXyc98VxH/ma0ZA55v0InrHD6mKhv8fiC3tslTlpL+ne3PKM=
X-Received: by 2002:a17:90b:38cc:b0:369:de03:29c8 with SMTP id 98e67ed59e1d1-36a6764cb9cmr15526333a91.23.1779736189294;
        Mon, 25 May 2026 12:09:49 -0700 (PDT)
Received: from suresh-HP-ZBook-15-G3.. ([103.162.210.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cd92sm10835766a91.10.2026.05.25.12.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 12:09:48 -0700 (PDT)
From: Suresh H A <sureshannaiah.mailbox@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Suresh H A <sureshannaiah.mailbox@gmail.com>
Subject: [poky][scarthgap][PATCH v3] systemd: backport patch to fix journal-file issue
Date: Tue, 26 May 2026 00:39:26 +0530
Message-ID: <20260525190926.2812079-1-sureshannaiah.mailbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 19:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237578

Backport patch to fix systemd journal-file assertion on removed or corrupted files.

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
---
 ...not-trigger-assertion-on-removed-or-.patch | 63 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..58413bb546
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
@@ -0,0 +1,63 @@
+From 112cbc37906fb97afe0ad04164262cf62d0af5e9 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 18 Jan 2026 19:15:31 +0900
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
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-journal/journal-file.c
+index b3fa41ffbf..8dcd599bbd 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -3318,7 +3318,9 @@ use_extra:
+ 
+ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t needle) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <= 0)
++                return -EBADMSG;
+ 
+         if (p == needle)
+                 return TEST_FOUND;
+@@ -3354,7 +3356,6 @@ static int test_object_seqnum(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+ 
+         assert(f);
+-        assert(p > 0);
+ 
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3395,7 +3396,6 @@ static int test_object_realtime(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+ 
+         assert(f);
+-        assert(p > 0);
+ 
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3436,7 +3436,6 @@ static int test_object_monotonic(JournalFile *f, uint64_t p, uint64_t needle) {
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
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index 9c5f8af240..d510e63799 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -33,6 +33,7 @@ SRC_URI += " \
            file://CVE-2026-40225-02.patch \
            file://CVE-2026-40226-01.patch \
            file://CVE-2026-40226-02.patch \
+           file://0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


