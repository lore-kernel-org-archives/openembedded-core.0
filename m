Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29077.1794840671779586085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 06:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HrRVlJCN;
 spf=pass (domain: mvista.com, ip: 74.125.82.49, mailfrom: vanusuri@mvista.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4063681c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1794840671; x=1795445471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+jACkVTEQoDSM7KM15LZqzreA0oRVbmE3ZUXiPoZIs=;
        b=HrRVlJCNjiTJWL9hE3xQvdB6z4T54Dicb52n6HBvCUCorPv1nkmql9tvOZ+rixmNOH
         Sw9QY/bfEgLMxeB35Dfa+UPF9ggK0RIH5xl1TFIMYZRAjYWjMz6yO8+K09zoEIY1W6OR
         dnvE3ipQnDNnIqnFyYQnhTxPZ8jHwtNUccJEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840671; x=1795445471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+jACkVTEQoDSM7KM15LZqzreA0oRVbmE3ZUXiPoZIs=;
        b=pp7MsnRKBHeXzKXwGJ63Puq2IFyb1iI8JaGAL1BiO3QP7R7+6EJOUiCFkc4oiyNZVQ
         mGg+O03XeS0WTsIdikptM+ulWxmjROS1TT8MaVfCpIGZzYe1S1Mgl2+rzb1npJZToSi+
         keSKM0SnlMkqM/GC2YomrLZZ38eGEjyNKG92iyheuwM/meqoFRDcf24bwLVoePNpQvwr
         YeFl4nABslXkrnlbzCPNmfsJbbv6+rFcKZawm/7wmGqgJXKPOJjAVCqMrUoSji9AUEdm
         Wd2CiqHVIetfiIBUdrCAaaNGUmtJHs4FWmJoWlx4CZRtkSmOnXCsjE+9TxRpmjr9YGEh
         qSrA==
X-Gm-Message-State: APuU4Z/nhaq5FYYaujBcwbHKfyABOFUsPM87KQoi+6sBl2sujmgLOv9n
	2h3KoGwPyqlN1MopqfdWXeghor/SG/IFX/2w+GyFBVSIQN4jU1j+BNzmdSoTdc9Mu9dvrkzPTqN
	5dmvU5Dg=
X-Gm-Gg: AZFdTZc7zn51GtCLUjVEJdWh4chpoDD1K0bG6Aaq5QZximmKydDcoE1WB5Z8HtMw9Ou
	UVLRj/bLdbtPsw6EQJRwHc3Q6fbL61F48hdMjf3qfoIL5LkDqiNRW/hI/foQDuQEd/ucnQq7VOQ
	06eJcanSGb7Z3HziMH4OlEwSU35sjPAhT/yeItHETlMV9VOtOm+3Djx4uLF6wXpiQOo3haVmsKF
	zcvTvJ14fy2HOxd6b0urpAJRK7c99WKeQTSBqtKZQD3Y1SB4hwAngndunhepXoRvqlQuD2hJgAk
	nserwRGDv1tBtK43bBuduJjFcxehoq6rpFj55fn/hfEHNWsTGzmqX/jisfaBVuUs83mxKtPKd67
	9SNuBPgFb1G14V0Xm1ST2W0xnVuu5kZbsJYfSL1x8SUDhiT9skXDHrdhZ6A/Bka9Iiv8pROoOIc
	J1MpYFvcez3sGI1KqFI8o+Ucg4cQozjwadZ302qB7NuXMmCzdwukj6XxZ1DjLirR2Flm424X5dj
	hVe5AN5q7mTIY2Ut7gHFeuXigtjPwjG2Fy1mtgMFznPdWutckAHkZT6gTjm1LCAjMSA+xTEWTdO
	JSNfbPxueykB6YcnkgJrt2j6Ztan54xqbxokLU5eoGqkde4WqvODfaA0/WwrrQ==
X-Received: by 2002:a05:7300:4faf:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-37967ad9432mr11061890eec.19.1794840670455;
        Mon, 16 Nov 2026 06:51:10 -0800 (PST)
Return-Path: <vanusuri@mvista.com>
Received: from MVIN00352.mvista.com ([106.200.28.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm35758630eec.14.2026.11.16.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:51:09 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] systemd: rate-limit tail timestamp refresh during iteration
Date: Mon, 16 Nov 2026 20:20:32 +0530
Message-ID: <20261116145033.2369325-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 14:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250346
Content-Type: text/plain; charset="utf-8"

Rate-limit journal tail timestamp refreshes during journal iteration
to avoid unnecessary volatile mmap reads.

Fixes: https://github.com/systemd/systemd/issues/42521

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...limit-tail-timestamp-refresh-during-.patch | 95 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-timestamp-refresh-during-.patch

diff --git a/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-timestamp-refresh-during-.patch b/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-timestamp-refresh-during-.patch
new file mode 100644
index 0000000000..0f30978bce
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-timestamp-refresh-during-.patch
@@ -0,0 +1,95 @@
+From 46e1b78bb2724e9691e4c91b7b4b8559d218fbfc Mon Sep 17 00:00:00 2001
+From: dongshengyuan <545258830@qq.com>
+Date: Wed, 24 Jun 2026 13:01:32 +0800
+Subject: [PATCH] sd-journal: rate-limit tail timestamp refresh during
+ iteration
+
+journal_file_read_tail_timestamp() is called unconditionally in
+next_beyond_location() for every file on every iteration step,
+resulting in O(N x files) volatile mmap reads. For large queries
+like 'journalctl -n 1000000' this makes the command unusably slow
+(~5 minutes on systems with many journal files).
+
+Rather than suppressing the call entirely (which would make the
+inotify path fully load-bearing for cross-boot ordering), rate-limit
+it to at most once per second per file. This reduces the overhead
+from O(N x files) to O(T x files) where T is the iteration time in
+seconds, while still providing periodic refresh as a fallback for
+any missed inotify events and keeping cross-boot ordering
+reasonably fresh.
+
+Embed a RateLimit struct in JournalFile for this purpose.
+
+Measured improvement on a real system: 5:24 -> 2:39 (-51%) for
+'journalctl -n 1000000'.
+
+Fixes: #42521
+Regression introduced in: #26355 (34af74946e)
+
+Signed-off-by: dongshengyuan <dongshengyuan@uniontech.com>
+(cherry picked from commit 8f8ab4bf98f930fcbbdd7efcbba8577981d31df9)
+(cherry picked from commit de01a0f78f833208fb9c8eca69bed6420b0e7e65)
+(cherry picked from commit 578dc90e6c4a87ad77927c462f5c42794c464c4d)
+(cherry picked from commit c066fab7052e41b2de4893488fdd39a0c3db4fef)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/46e1b78bb2724e9691e4c91b7b4b8559d218fbfc]
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/libsystemd/sd-journal/journal-file.c | 1 +
+ src/libsystemd/sd-journal/journal-file.h | 2 ++
+ src/libsystemd/sd-journal/sd-journal.c   | 7 ++++++-
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-journal/journal-file.c
+index d96a0aa22d..95775c1956 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -4123,6 +4123,7 @@ int journal_file_open(
+                 .strict_order = FLAGS_SET(file_flags, JOURNAL_STRICT_ORDER),
+                 .newest_boot_id_prioq_idx = PRIOQ_IDX_NULL,
+                 .last_direction = _DIRECTION_INVALID,
++                .tail_timestamp_ratelimit = { .interval = USEC_PER_SEC, .burst = 1 },
+         };
+ 
+         if (fname) {
+diff --git a/src/libsystemd/sd-journal/journal-file.h b/src/libsystemd/sd-journal/journal-file.h
+index 81fafb9bec..d6fd569e2c 100644
+--- a/src/libsystemd/sd-journal/journal-file.h
++++ b/src/libsystemd/sd-journal/journal-file.h
+@@ -16,6 +16,7 @@
+ #include "hashmap.h"
+ #include "journal-def.h"
+ #include "mmap-cache.h"
++#include "ratelimit.h"
+ #include "sparse-endian.h"
+ #include "time-util.h"
+ 
+@@ -130,6 +131,7 @@ typedef struct JournalFile {
+         uint64_t newest_realtime_usec;
+         unsigned newest_boot_id_prioq_idx;
+         usec_t newest_mtime;
++        RateLimit tail_timestamp_ratelimit; /* rate-limits journal_file_read_tail_timestamp() calls during iteration */
+ } JournalFile;
+ 
+ typedef enum JournalFileFlags {
+diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
+index acabec699f..1bc795cc29 100644
+--- a/src/libsystemd/sd-journal/sd-journal.c
++++ b/src/libsystemd/sd-journal/sd-journal.c
+@@ -807,7 +807,12 @@ static int next_beyond_location(sd_journal *j, JournalFile *f, direction_t direc
+         assert(j);
+         assert(f);
+ 
+-        (void) journal_file_read_tail_timestamp(j, f);
++        /* Rate-limit tail timestamp refreshes during iteration. Calling this unconditionally is
++	 * O(N x files) volatile mmap overhead that makes large 'journalctl -n N' queries unusably
++	 * slow. Periodic refresh keeps cross-boot ordering reasonably fresh and provides a fallback
++	 * for any missed inotify events. */
++	if (ratelimit_below(&f->tail_timestamp_ratelimit))
++		(void) journal_file_read_tail_timestamp(j, f);
+ 
+         n_entries = le64toh(f->header->n_entries);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-core/systemd/systemd_255.22.bb
index 1bdeb551fd..0c230e8ba6 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -40,6 +40,7 @@ SRC_URI += " \
            file://CVE-2026-4105.patch \
            file://0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch \
            file://0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch \
+           file://0025-sd-journal-rate-limit-tail-timestamp-refresh-during-.patch \
            "
 
 # patches needed by musl
-- 
2.43.0

