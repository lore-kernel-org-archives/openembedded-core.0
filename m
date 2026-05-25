Return-Path: <sureshannaiah.mailbox@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C7FCD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 19:07:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22376.1779736036059261785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 12:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BqAwRLjt;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: sureshannaiah.mailbox@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso4836406b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 12:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779736035; x=1780340835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9s1GPh01XwocP8T7ZWqltxEXUhm2AQp6avuXJooawRg=;
        b=BqAwRLjtb/IYel+wFCpQ4zkc1D03RiIXAvXTlOB191AeyazV7SFYbb7/DxBis2hcGl
         3N/0ov3Px/IS7Of093HXqetROdKw64dl38DMoYAyjI8EBgMDQiiezUBVZZgxCWNLOiM3
         B6R5re5qAXDntOLMWC6b6N+K9gSUZi5pWCVVk/o6+UbCKFb8jScN8gap5nODxOvX2dSa
         9NLJXPNzwlRBSCM6NknTzV4YdhBjwtMt1yfTF3nEKUIKwROSun3oNklaSH1Rc07OPGhD
         PPmdZtThWNZHvU8sN5bEjuT288a0ssAqFrP4zZTT/hnab8Lzd7D7xh8pX0lhG7pKtNpg
         9gVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779736035; x=1780340835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s1GPh01XwocP8T7ZWqltxEXUhm2AQp6avuXJooawRg=;
        b=SJEZEJ96T5CLDcqIiMLTPq0KVuDL8rGJTDpMAgpq3bCv52w5kXG0wZ2caQL+BObn5B
         eYTURNywzL6QzRXMu+FfL4c8z6bEnv1yf/+Ar4tHRViWhpQQ7hZRPL35aqNIrGE/or1q
         8hv2J0WveBFVPTsN0GDHZv3l22P4R6wcKl+OhBfRlOaS/6DdlNZzwfaldqsuKn2fUW3G
         kzW7FnJUM4FCa/vJT8xZcmenqIrS9z+SPEOPBj6uUSNkQRSWAuseHNN0tv1XF8M5yKai
         H6ind0u23NAXsdm2M6VgoEfGhvNNdLu/Q3WTIe9p9VYqw/ftzhCQAjXJQYyHa4lfaEAC
         6TFg==
X-Gm-Message-State: AOJu0YwMzehh8AqYB1zBsJBxqd1zS9i6HPqnehOD39yYdYhSNn+5LOjQ
	dPRLWXKW2ZlIriISdk4qauCx4FdhGXHN7VrYfZHlUe5hpIe9oJNnJ5efYs34rg==
X-Gm-Gg: Acq92OFWrTIcNK6r9BPrTLNO7iY0564lnW8NvvM93Dm5mvJfgRRqJBlnY/2+kMGkpNS
	QKZkAJX2yDCj57kIpuPoK/IVOWFUqsMxZKCWMHWtaYN7Woa7erET/l82oF3AkH7YRJ/n9QoDyTx
	GmXRWqpXIHqxmKxFOL/wsY3Wj7+kwUadWR4bzz8VwIXhBLzm/9681qp33+k6/DcABvZzS+ehpVT
	Wrmq7LbhGOmXq0ISc2Rsgn3D8AyKJq3zmOaYbx87/9d9zPvy7LUQQQmk39oeu04NZuhVEq2vZ6x
	N88wL4FfHbnJIvpYklFuruQwZyQ3I+lpv+bbyT3qafVn5tp8YW7luLnN2JODrczCRX8egQ22UZu
	m4ZsOtmU9PV5RQ+QLunZc5FHDlK29im8jW1dUvYUvx5LEgaJUwJhRfRPvQSIqGD/aAOMmHwzPwJ
	sww7IyioAR7nAX6sW0eeio+I3KRIeCfpwk7oACRxTNXHWmyTL++Oz24Bb7JEXq3zsrHQ==
X-Received: by 2002:a05:6a00:8d82:b0:835:7c0e:b530 with SMTP id d2e1a72fcca58-841606f55aemr12769742b3a.0.1779736035376;
        Mon, 25 May 2026 12:07:15 -0700 (PDT)
Received: from suresh-HP-ZBook-15-G3.. ([103.162.210.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fafe14sm12152227b3a.42.2026.05.25.12.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 12:07:15 -0700 (PDT)
From: Suresh H A <sureshannaiah.mailbox@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Suresh H A <sureshannaiah.mailbox@gmail.com>
Subject: [poky][kirkstone][PATCH v3] systemd: backport patch to fix journal-file issue
Date: Tue, 26 May 2026 00:36:33 +0530
Message-ID: <20260525190633.2811778-1-sureshannaiah.mailbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 19:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237577

Backport patch to fix systemd journal-file assertion on removed or corrupted files.

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..e14c5ce6f2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-assertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
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


