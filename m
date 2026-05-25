Return-Path: <sureshannaiah.mailbox@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DB2CD5BC9
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 19:30:21 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22896.1779737411718214520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 12:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HoZviv3j;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: sureshannaiah.mailbox@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c736261ee8dso4421846a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779737411; x=1780342211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSZomD7p3YxsYdELh0qlyd/8ivmtXpY8C8sqnMS56hw=;
        b=HoZviv3jsijMrgq+zsrg4xj7UlEodSwavOjScAYCht7pAebJTtAjTjZJqMWFhxFSVj
         7tWY3xN1DN8jvJCtRT7ng52EbpzezNe3cHaMG6WeN28rMbUAfOBo2EsNR7zsOnkTcBCu
         PaC8Lf5De97Bt9RxVSl8mf4MRYKVjRachKt7/qZGAscSUzilRocGA5b8/iuszU/m5axs
         VMClCzKlCMTN3zuPc4+/KPQD0TGlANp/nL7jxcnTAmXbbWtveuYIUlMH967rsJbcJIuH
         7FY/CnDDI4Yhea2U5cFM+9TRWA+EfvHw7gHlq2bG1T4e7FCW2NSKhv6sOoyKZ7s10csm
         Pjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779737411; x=1780342211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSZomD7p3YxsYdELh0qlyd/8ivmtXpY8C8sqnMS56hw=;
        b=YbzoznFT8imEUVg+ywkuvfGiQbvIC5X8uk9x4Af35Ujz2C+I3gtcGs+pNV2TdU33Mh
         HwZtZPOHaxKa07Ej6E9iBAFVQoM9RLJaB+ognDOta0bcu8xQRlYAFW1eiFyhKegYM3c6
         ZFu4AF9UvjlB56bJlfc51eDMsbBHbwtQ3DUyUaODE5dGQCQ6JeWeG77a+ACXeLWqufZL
         8o5PVdGmZ31c13VP4q5rVs+HQkM2L4KlXuyrX+zigR1zyNuu6rnLBBlPR5EEpeTD7/wy
         tUQLOVn8wVeLyS063YQv88HRExd9lu9+hKj9Te/oJKL8iq0ZocgOgh9juYvS/ACF33Iy
         vrYQ==
X-Gm-Message-State: AOJu0YxQDqEvh3vp0lNycxipsMq0Hfy3Fj1Svk0+RDxVD+UNWlXcSv6I
	CUCOzuAlDKmB2ybt2M8hV/C0cNC7bcf4EPjTDxazJQ1LnpIpvT87euZIw3R0Cw==
X-Gm-Gg: Acq92OGpcWpyber0IFWIvnnUwgriytvJVBRgP5SL7SOr8wonCJfmi2BF9ihXiyqvWyD
	VmBHIiCj4iPc5KU+ftgoCobQf2D7FKCWKK22Rd3qBWS8FdT5bKsln+H32pr3DGpu5G6bLHlOpSU
	5p4sVU07xWJ5iMxkyoXps+yNe54TXl6FQaTpd/3OP+KA7+NOSViPLkjr49aSGTJ4ZvVbgmK59Cl
	H6/JrKKE0Qe53H7FTyCSu6emMpFuWkjamSaVppyTx002KG643Wq5+9syotVVxaiNT8JrMY/weuu
	8/T8aAhMArZ7xx4kQy/Nqrs9ld8vRTtLCA6e6Q1axu+1yYMqVh4H7PaX970Nh/GwfWG9/3TcUGO
	Ho2jDvUUFxK/4Wss78CINVhoHe6MdZhonyhnzr8NyPtnUw7Gc2Vh9yrcbP9NM2PJdFYKxdw+T+a
	Dt2XcM0+6vBoWEP9zHAqxSizommPCNc82ucvuD8fpFL1W7Ur7n9+OAPFc=
X-Received: by 2002:a17:902:f78f:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2bee3bcea3cmr16806605ad.18.1779737410840;
        Mon, 25 May 2026 12:30:10 -0700 (PDT)
Received: from suresh-HP-ZBook-15-G3.. ([103.162.210.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56bc151sm103386805ad.24.2026.05.25.12.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 12:30:10 -0700 (PDT)
From: Suresh H A <sureshannaiah.mailbox@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Suresh H A <sureshannaiah.mailbox@gmail.com>
Subject: [poky][scarthgap][PATCH v4] systemd: backport patch to fix journal-file issue
Date: Tue, 26 May 2026 00:59:52 +0530
Message-ID: <20260525192952.2813974-1-sureshannaiah.mailbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 19:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237582

Backport patch to fix systemd journal-file assertion on removed or corrupted files.

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..3ccaefe9c9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
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
+
+Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
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


