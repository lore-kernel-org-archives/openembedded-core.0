Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4775.1792538584582374464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=o9H++uo7;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so541515e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538583; x=1793143383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z5jEMQK+Go6xTd95e095Vcm2M64nczJwJYaTtXMec60=;
        b=o9H++uo7/gL8EpQGKDq1cWgK4v5AJOIxmrxbCXsZrZyIQr7Jgv4yPDuHbkBUIeJvZV
         7KiNQxkB62S7b/J9TJTsKzkYLIo3AJiFP0Hh29czuPyHinOVsyo/kLJK7bXc58KfZo4V
         U3lDtTbpXfNH64FdK/37JQdO/E/8aEHUfW5XBPCULp46Fskn5Eb0/mv6pGKxMsMXu8fw
         xA1CbuqOtA3lZ5pV4O6K841wAT4Kv89eEzvKhMxHlpXbj8TZCGiZa7BBTMD94REEefib
         vYp9taYn5nQiPjuQB6psdAaoJzftLoKm/RUWvu7D6m9/2Do6X6nLFMwOSxev7i9wCgg3
         RRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538583; x=1793143383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z5jEMQK+Go6xTd95e095Vcm2M64nczJwJYaTtXMec60=;
        b=vN1YVjc0lGL2YUrJvgACAI6uXt8Mpkn03An+1GnKHZQDQpe6DP94nek2j0+rhBvwhC
         EKXjU4b6MNwu0Qb/NF9fm+R5tOparFx8OaaV23P8qKdyCTKehyQ5U6yLHqEp3e5SzqU6
         VBjXNzYJejZVvWuq6r255B5ICYQtJW89na8k9PDj0nGq+r48mKvCdW0jhLvtN+WT+7K7
         xBlyDYwMk4ube2BHhXjnWGHvvRNuHjnLyN4GbMx4LfRrXsQ40OHHT7eh371hd4A6d01O
         6QmsbQqmE5KS/PT+POsw3YeA11+6qnUYmB1iGZbHkWT5RRIs6Bzrv4cipox4P15UHC7u
         6m5w==
X-Gm-Message-State: AFq9FYKNcKwMA8u0fxKZ32hAQELlavpa1eptvh6CHgm9tlO3GVVb+VgL
	6vPruGzB+QeVhAcmYCS6Q2Wh2DGjh7Ejii+xsGpJ/XS7vEjJQaO0fhlrY3aXolhCqGeLd8Ek5JL
	wWMHiSaU=
X-Gm-Gg: AYBFou07a5rffAQj1HAN3XRnR0JX7A6yFA7VoBceAio8nOT2MSVU4IY/mZ7r35sAY9M
	jyIvugKDxdK2TWeFh0XCE64/ZQNdJYmNuEUm3cXdGkcA0QzjHnwIMuvcNW6p+ulcaM1GSo7tz4D
	qmCu6yfE0KUWYs3BDJi8VeBH1gRB6hexA5et5wrEV9C/2wiU0jyc5Kf7+X2EsXCv68UgNgCEINS
	RE7oENDjRlPMJ0d4vKG5rqRz7RJ22fNouikOUmKEeriZzh4/bompBs0AUc0vwt3IMaz2GaGe+mR
	4Hd6p5XytAVldFu0r02BdAX4CE0NUdJ/kjhxpzJAcm7NfYhDMmjOB3cp7otKF65kBToZ9nVXbmm
	qjFmxjOCTqYh+zRQ/sySImOjLM0huNHLI0IFvNhPg+KxDYDboZvTqZqz3wApRfmqZBZuTAqXX93
	FfUhpb1+nRSWtR+6r9hyXGib40ZvVEe8RFq51Raz+QR4XgaT+JJJV1/ftAurn4olTcyDCa3Ssp7
	WQTdcNkyjBcius3JAhd1UGkN+Fvx7X8zlxYYho5R45hIFju8xj+PA2bQ/dMl2dtsbfQoRbhKlg8
	p9A/9NRtB4RkIttsjjg8pe0WjhtXLC3c2jucQ120zMC2wRxGvyi6TUY=
X-Received: by 2002:a05:600c:b90:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1fd72a9ffmr4878065e9.0.1792538582693;
        Tue, 20 Oct 2026 16:23:02 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/25] lttng-modules: upgrade 2.14.4 -> 2.14.7
Date: Wed, 21 Oct 2026 01:22:30 +0200
Message-ID: <9b79cdc74091de846317f26b98d3abb3227f9a5f.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248339
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changes 2.14.5-2.14.7 (from ChangeLog):
- fix: adjust range in btrfs probe for v6.18.14
- fix: ASoC: soc-dapm: move struct snd_soc_dapm_context (v7.0)
- Fix: kallsyms on powerpc64 with ABI V1
- fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1, v6.1.175,
  Ubuntu-6.8.0-136)
- fix: ext4/vfs/btrfs/mm tracepoint updates for newer kernels
- fix: leaked file and fd on channel create error
- fix: warning -Wordered-compare-function-pointers / -Wcast-function-type-strict
  with LLVM
- Fix: ring buffer: zeroed UUID in populated empty packet headers

Two carried patches backport the hrtimer and btrfs fixes above
(b77f94c7a7, de7ca66c797), now redundant since both are in 2.14.7
natively; drop them. Only the OE-specific Kbuild
CONFIG_TRACEPOINTS-to-warning patch is kept.

Verified do_compile succeeds.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...st-range-in-btrfs-probe-for-v6.18.14.patch |  36 ------
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ------------------
 ...ules_2.14.4.bb => lttng-modules_2.14.7.bb} |   4 +-
 3 files changed, 1 insertion(+), 142 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.4.bb => lttng-modules_2.14.7.bb} (87%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
deleted file mode 100644
index 662a8036802..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From de7ca66c797ba0b3273a217a47c8fb791d896f7c Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Fri, 27 Feb 2026 17:54:39 -0500
-Subject: [PATCH] fix: adjust range in btrfs probe for v6.18.14
-
-Upstream commit c5667f9c8eb9 ("btrfs: headers cleanup to remove
-unnecessary local includes") was backported in v6.18.14, adjust the
-range accordingly in the btrfs probe.
-
-Upstream-Status: Backport from commit ca93dc3b05fcb
-
-Change-Id: I51c5cb6345c6a1e1aa4e5e3cb9a4af2ec962ecb2
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- include/instrumentation/events/btrfs.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index feb4f40b..e87f0085 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -12,7 +12,8 @@
- #include <linux/writeback.h>
- #include <lttng/kernel-version.h>
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0) || \
-+	LTTNG_KERNEL_RANGE(6,18,14, 6,19,0))
- #include <../fs/btrfs/ordered-data.h>
- #endif
- 
--- 
-2.47.3
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
deleted file mode 100644
index a6fe47737ec..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From b77f94c7a7109e70a97bf936b72d66d611187d61 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 25 May 2026 10:38:18 -0400
-Subject: [PATCH] fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1)
-
-See upstream commit:
-
-  commit f2e388a019e4cf83a15883a3d1f1384298e9a6aa
-  Author: Thomas Gleixner <tglx@kernel.org>
-  Date:   Tue Feb 24 17:36:59 2026 +0100
-
-    hrtimer: Reduce trace noise in hrtimer_start()
-
-    hrtimer_start() when invoked with an already armed timer traces like:
-
-     <comm>-..   [032] d.h2. 5.002263: hrtimer_cancel: hrtimer= ....
-     <comm>-..   [032] d.h1. 5.002263: hrtimer_start: hrtimer= ....
-
-    Which is incorrect as the timer doesn't get canceled. Just the expiry time
-    changes. The internal dequeue operation which is required for that is not
-    really interesting for trace analysis. But it makes it tedious to keep real
-    cancellations and the above case apart.
-
-    Remove the cancel tracing in hrtimer_start() and add a 'was_armed'
-    indicator to the hrtimer start tracepoint, which clearly indicates what the
-    state of the hrtimer is when hrtimer_start() is invoked:
-
-    <comm>-..   [032] d.h1. 6.200103: hrtimer_start: hrtimer= .... was_armed=0
-     <comm>-..   [032] d.h1. 6.200558: hrtimer_start: hrtimer= .... was_armed=1
-
-Change-Id: I37ee0ae0af665a51fd4f92adffb6b1dcb2ecd9d2
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/b77f94c7a7109e70a97bf936b72d66d611187d61]
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- include/instrumentation/events/timer.h | 39 ++++++++++++++++++++++++--
- 1 file changed, 37 insertions(+), 2 deletions(-)
-
-diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
-index f69e069b..dfc295e0 100644
---- a/include/instrumentation/events/timer.h
-+++ b/include/instrumentation/events/timer.h
-@@ -220,12 +220,43 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_init,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0) || \
-+	LTTNG_KERNEL_RANGE(7,0,10, 7,1,0) || \
-+	LTTNG_KERNEL_RANGE(6,18,33, 6,19,0) || \
-+	LTTNG_KERNEL_RANGE(6,12,91, 6,13,0) || \
-+	LTTNG_KERNEL_RANGE(6,6,141, 6,7,0))
- /**
-  * hrtimer_start - called when the hrtimer is started
-- * @timer: pointer to struct hrtimer
-+ * @hrtimer:	pointer to struct hrtimer
-+ * @mode:	the hrtimers mode
-+ * @was_armed:	Was armed when hrtimer_start*() was invoked
-  */
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
-+LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
-+
-+	timer_hrtimer_start,
-+
-+	TP_PROTO(struct hrtimer *hrtimer, enum hrtimer_mode mode, bool was_armed),
-+
-+	TP_ARGS(hrtimer, mode, was_armed),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, hrtimer, hrtimer)
-+		ctf_integer_hex(void *, function, hrtimer->function)
-+		ctf_integer(s64, expires,
-+			lttng_ktime_get_tv64(hrtimer_get_expires(hrtimer)))
-+		ctf_integer(s64, softexpires,
-+			lttng_ktime_get_tv64(hrtimer_get_softexpires(hrtimer)))
-+		ctf_enum(hrtimer_mode, unsigned int, mode, mode)
-+		ctf_integer(bool, was_armed, was_armed)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
- 	LTTNG_RT_KERNEL_RANGE(4,14,0,0, 4,15,0,0))
-+/**
-+ * hrtimer_start - called when the hrtimer is started
-+ * @hrtimer:	pointer to struct hrtimer
-+ * @mode:	the hrtimers mode
-+ */
- LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
- 
- 	timer_hrtimer_start,
-@@ -245,6 +276,10 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
- 	)
- )
- #else
-+/**
-+ * hrtimer_start - called when the hrtimer is started
-+ * @hrtimer: pointer to struct hrtimer
-+ */
- LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
- 
- 	timer_hrtimer_start,
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.7.bb
similarity index 87%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.7.bb
index d0983f58cbe..8a6ab93dc1a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.7.bb
@@ -20,10 +20,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
-                   file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch \
-                   file://0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch \
                 "
-SRC_URI[sha256sum] = "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69ccb757d6d3dbb0ad"
+SRC_URI[sha256sum] = "fe304c31ad3e8f68a48f52b538ed2c1bf9b9fe62d8ee528ebc96d0a321287145"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
