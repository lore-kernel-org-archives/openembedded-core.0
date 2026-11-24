Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15972.1795519606148709999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 03:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C3seDoKj;
 spf=pass (domain: mvista.com, ip: 74.125.82.43, mailfrom: rsangam@mvista.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so6277198c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795519605; x=1796124405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cp8cT/v5rk1HnRO6UKHO9LjIN/WboPzy84v7tWf0EGw=;
        b=C3seDoKjT2MGturtYIX3H8+x5msrWHY7E7zIybfqqgpcXoy+4X3JIYj1H3LUW0v+Vp
         MOVN0Jts35kHsVA1vtYooQ9rnkYJIQKF0g4IuUPaZKds03/G2gBM9q/uH0qkFf7lJ8Z9
         eBTsmINr9r6hZ7ZKw9bOxPWnBT7k5+JrNYu/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519605; x=1796124405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp8cT/v5rk1HnRO6UKHO9LjIN/WboPzy84v7tWf0EGw=;
        b=RL6M2C436xUZX6Rqc87Vw8xPxx+VH6Bx4qJvM4Nf6FChL537nj2uJzIUl7/F8iobMq
         0HDQ+tIHYl7GsqztE7AboyHUGc7wuqJGWbPqelyGqQsz4P+bcIMLObeb4M2zNA6skhn9
         6oKF5XbUM/vbLnlLe+aG+PKBW6JsD458hYkU7/jynQqN+LadZoAZFNTZ4MiN4ZbQPAV6
         gAXcMM/fQpVul5kX36Gb/gRZ5vrTRjwA9qB7aWWJ03ty+xt54c7Gj8JrJBxCoBfitKQp
         lalxeaJd6ib9PejDJMH2NwNtPJek1STg8aKrHusFZD32M/N3UyCvUus8OXs6/7n4jYOs
         4zew==
X-Gm-Message-State: APuU4Z/km+SUdsZMwFDd9/i8hQpgyhSqmo06T21sfvs63PCSHtEJ9E27
	4KtA8Aw7KN6xgau9qpZ4LiP7BLd5jSgud6150TzA4ttSiUkI4eEbyE94TBQj1ON/Yh+XoApAKIb
	VKcq1aW0=
X-Gm-Gg: AZFdTZcQESOEvjd+CUbF1IIWKPO30lUCV5ti/0LAL+nPXtUNke/s87awbEdMTFx6gMo
	j1O9poHYSLtIOYVmIxa6hgE54i8P8mgQJgf2j7ObYZQcdvzyQxQ4jrgLEV9YqaBrg1F/4y3bqiX
	vLhBgqHvEgMLEzH5PwQ2zzBLOfOIBElg47zSWjxlW8XkNvop4+eusNstnni/rXdgQsMMNUt/bAf
	3SFcDPY6vcGPZJtdQShqyB2s5zG0I9jhXQw1+Xjt//W31uPsLHBVGMGjgHqJXUdGy/X75kox4d0
	Mnq3KyFL7UFheJne/5DLRNoiKBt/uA8lu7zOd1S3mWwS7P3IRh3nyGYImJNdu/igh2ndI+t/Xwp
	7lSuYHByY75cM9A/KXRdhIlGS7TzYkCDNoyYwMGamTCjJCVnXrI5DTZng0B/qaQtyVNE5la4Tr2
	j5RRLRVVdgF/StwoIRPXSqyC70cJ4NeKDoSGiDZq1KvmEN2uViqwfnYMD95gaaULWBezo719ifn
	ZgjgBcL5vB+IsUToaEEK9xZz62Dkz/LFgrnX6Pq4GjZ4U+1tV4S54unkXE7bpbphfhCk59eHVW3
	4BsDGvG2fSrZsqGw36t0wA3oYNYOM8oKNdES
X-Received: by 2002:a05:701b:4553:10b0:1b2:6a1d:bf58 with SMTP id a92af1059eb24-1b55694435amr14560013c88.38.1795519605369;
        Tue, 24 Nov 2026 03:26:45 -0800 (PST)
Return-Path: <rsangam@mvista.com>
Received: from MVIN00040.mvista.com ([49.207.209.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm40448694c88.7.2026.11.24.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:26:44 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] gstreamer1.0-plugins-base: Security fix for CVE-2026-85150
Date: Tue, 24 Nov 2026 16:56:38 +0530
Message-Id: <20261124112638.93705-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 11:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251023
Content-Type: text/plain; charset="utf-8"

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/bfeda94b70b265f0969e5831580c6a793093e97f
[2] https://security-tracker.debian.org/tracker/CVE-2026-85150

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../CVE-2026-85150.patch                      | 59 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-85150.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-85150.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-85150.patch
new file mode 100644
index 0000000000..2f9c57cb54
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-85150.patch
@@ -0,0 +1,59 @@
+From bfeda94b70b265f0969e5831580c6a793093e97f Mon Sep 17 00:00:00 2001
+From: Matthew Waters <matthew@centricular.com>
+Date: Wed, 2 Sep 2026 16:14:23 +1000
+Subject: [PATCH] rtsp/message: fix crash when an auth value started with
+ whitespace
+
+When parsing a field like 'key= ",foo=bar' the space after the '=' would be
+considered the end of the key value pair.
+
+The '=' would be found and the key (before the '=') extracted. Then the value
+parsing would skip any initial whitespace. advancing beyond the ' '. The value
+would then be g_strndup(value, end - value). As `end < value`, This attempts to
+copy -1 bytes and fail.
+
+Fix by using the end of the item after skipping over any whitespace.
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5278
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12431>
+
+CVE: CVE-2026-85150
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/bfeda94b70b265f0969e5831580c6a793093e97f]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ gst-libs/gst/rtsp/gstrtspmessage.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/rtsp/gstrtspmessage.c b/gst-libs/gst/rtsp/gstrtspmessage.c
+index ed62636..02ba5e5 100644
+--- a/gst-libs/gst/rtsp/gstrtspmessage.c
++++ b/gst-libs/gst/rtsp/gstrtspmessage.c
+@@ -1416,18 +1416,21 @@ parse_auth_credentials (GPtrArray * auth_credentials, const gchar * header,
+         if (eq[0] == '=') {
+           GstRTSPAuthParam *auth_param = g_new0 (GstRTSPAuthParam, 1);
+           const gchar *value;
++          const gchar *param_end;
+ 
+           /* have an actual param */
+           auth_param->name = g_strndup (header, eq - header);
+ 
+           value = eq + 1;
+           value = skip_lws (value);
+-          auth_param->value = g_strndup (value, item_end - value);
++          param_end = skip_item (value);
++
++          auth_param->value = g_strndup (value, param_end - value);
+           if (value[0] == '"')
+             decode_quoted_string (auth_param->value);
+ 
+           g_ptr_array_add (params, auth_param);
+-          header = item_end;
++          header = param_end;
+         } else {
+           /* at next scheme, header at start of it */
+           break;
+-- 
+2.44.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 0f60e79b35..31224a4c7c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://CVE-2025-47806.patch \
            file://CVE-2025-47807.patch \
            file://CVE-2026-18297.patch \
+           file://CVE-2026-85150.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.34.1

