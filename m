Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F633E63C94
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 09:40:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36246.1769334030747005584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 01:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JnqX85kl;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a09757004cso34306755ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 01:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769334030; x=1769938830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RuNfZ0Ev09ohBcbfOLj6FM3DSRZbeAT8WKWvo2Z6Vyg=;
        b=JnqX85kltTI3JN9HKFfENkbahC4LSYDnS3hz2PsVUNk45nmpQSM6rQ0dPAR33ryscF
         bDW4BDncWhhEeOq19697wbTwAY9aqdGAQ0CLydnSh13WlB+RVT7A292nFaibrQQnOrZJ
         /W0ks13TQ2L5vPnBCRt+gnJKKu5EbVDIFXwR0m0bcnlv+t/08evHfXnZJgO2s6QaHc1R
         EWxmb1xtizZ7IYWH34JjOT98Y7X3YMI7b9yTawoTAG8LyqL/9WCahWuKEt0B6ajDPxt1
         93+1rh6/wTXzCJeqQKAidwEBSEBwHaHvEzx76AyzNLfGtpN/zC+HxafrKc/1u/EtH6xd
         Iwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769334030; x=1769938830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuNfZ0Ev09ohBcbfOLj6FM3DSRZbeAT8WKWvo2Z6Vyg=;
        b=pgn8GYCsnw0I7YKei/kgp7ByvcsyzmgqqB1wqEku7u0tmKEk0titVyX9j4ducTn+F9
         WbI26kSE94+p5yrlZUOFTonBfuGCx07Iup0OpoVZQRsYe03OaIpNAvldcIcBJ4USxF67
         a0wDHZ3w4YXPz0Rc4YafDNvfijDXUfyBotAp3TIvffmlSN/0Z7wWnhSg+QX3odjydmUH
         j6wWeG6QdkqwXKq5Cx44suT8TG/FVSJjonQwEx3zbKgPSfrr2exJvboR7IhRNC1km+Xq
         Pq8hYHG0Kp5uAQMJ5xIshIcv5jAExdvxGZJKA8iNTWl1oFVQka35pZd2GPxHyGm+CKEC
         G8Pg==
X-Gm-Message-State: AOJu0YyX9xu3EhYEQBWt3M1GVbsiyCRG0DvhLQGKkZO6Yy2iOXLGCkCE
	UUN4zJYL3L40kKFMJIJSUzYOKvXnUcz61cDY8bUAr5ap2nM6LOjHGNE1gnLkPe49
X-Gm-Gg: AZuq6aIUZrBvcX4jPbxZ9e9FMkKdeGwWn3phPOaFpF2rf28lKQZo3/6wmXVObYR43IG
	s3k6ucVGfk7u2Khb095AKHHfdf+C5NZJN0yPA2LH8ccI88qCGGxsT1G0GVm2BfvCieXK2IzhnGD
	qRXi6Ucx8jEb6GJzzHjKS8Wwm/chdvzhcTGE2bDlo3Tu7A9j3z5vKtP8uwrreB9kdG1DRu6x17h
	gqbvNGSeVNe2OllaIxbwuoYCEkHWrqqdu/0Q5WUH/MbvAzJb36nU9r2qH4gpjn6lQrbKGjcDV1M
	XxrE2me9oxXonkUtOQbdVKuCizYOFRoLknC78d69tMGKbWWGXi5dhTtGOXCl08q0E7UTKqHOJl8
	uTHhcFiKDlrfv4MLiHeKzL1LmCbjciF9DcPz3En0XKTLeljHdJA+nIopFi60Qe5ppYIgLgLZClf
	/rwtbmmPCWoEzlsnYyw5n541BV
X-Received: by 2002:a17:902:da90:b0:2a7:b646:54d0 with SMTP id d9443c01a7336-2a84530e7d2mr14455005ad.41.1769334029646;
        Sun, 25 Jan 2026 01:40:29 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97623sm64606095ad.61.2026.01.25.01.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 01:40:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 1/2] avahi: patch CVE-2025-68276
Date: Sun, 25 Jan 2026 22:40:19 +1300
Message-ID: <20260125094020.1232242-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 09:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229929

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport the patch[1] from the PR[2] mentioned in the nvd[3].

[1] https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41abb9b7c6355
[2] https://github.com/avahi/avahi/pull/806
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-68276

Dropped CI changes from the original PR during backport.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 7930bd3037..bb20fd17cc 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68276.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
new file mode 100644
index 0000000000..75169419f1
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
@@ -0,0 +1,65 @@
+From 8ec85459d8e6e59cc14457e16fb7ba171901f90e Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 17 Dec 2025 08:11:23 +0000
+Subject: [PATCH] core: refuse to create wide-area record browsers when
+ wide-area is off
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon (with wide-area disabled) by creating record browsers
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling
+the RecordBrowserNew method directly or by creating hostname/address/service
+resolvers/browsers that create those browsers internally themselves).
+
+```
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --method org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient disconnected from message bus without replying
+```
+```
+dbus-protocol.c: interface=org.freedesktop.Avahi.Server, path=/, member=ResolveHostName
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e' failed.
+==307948==
+==307948== Process terminating with default action of signal 6 (SIGABRT)
+==307948==    at 0x4B3630C: __pthread_kill_implementation (pthread_kill.c:44)
+==307948==    by 0x4ADF921: raise (raise.c:26)
+==307948==    by 0x4AC74AB: abort (abort.c:77)
+==307948==    by 0x4AC741F: __assert_fail_base.cold (assert.c:118)
+==307948==    by 0x48D8B85: avahi_wide_area_scan_cache (wide-area.c:725)
+==307948==    by 0x48C8953: lookup_scan_cache (browse.c:351)
+==307948==    by 0x48C8B1B: lookup_go (browse.c:386)
+==307948==    by 0x48C9148: defer_callback (browse.c:516)
+==307948==    by 0x48AEA0E: expiration_event (timeeventq.c:94)
+==307948==    by 0x489D3AE: timeout_callback (simple-watch.c:447)
+==307948==    by 0x489D787: avahi_simple_poll_dispatch (simple-watch.c:563)
+==307948==    by 0x489D91E: avahi_simple_poll_iterate (simple-watch.c:605)
+==307948==
+```
+
+wide-area has been disabled by default since
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
+
+https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
+
+CVE: CVE-2025-68276
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41abb9b7c6355]
+(cherry picked from commit 2d48e42d44a183f26a4d12d1f5d41abb9b7c6355)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ avahi-core/browse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e8a915e..59d53cb 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+ 
++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lookup_engine) {
++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
++        return NULL;
++    }
++
+     if (!(b = avahi_new(AvahiSRecordBrowser, 1))) {
+         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
+         return NULL;

