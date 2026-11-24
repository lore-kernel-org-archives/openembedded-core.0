Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15947.1795519562825555637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 03:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LkfeVMUE;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so6752904eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 03:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795519562; x=1796124362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqG/0edUY+K3KcxMArRgkW655Y5LLi4gU/iUULTJKrI=;
        b=LkfeVMUEC89gvYyVjYTLfUJ/IybvILPYKqBNSpQmxgfqBh7dJNnx4DGmSo8ScPqRzQ
         yoLOCshERJbWK5/2EWRwieHwQyrZfmqqXJKl1mzlr+5Y1itYmeWHTjXUNjonCNbQ04qA
         JrA2CV/kmz0K4OlKfOxYTbfFlECTHJ4uQoAhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519562; x=1796124362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqG/0edUY+K3KcxMArRgkW655Y5LLi4gU/iUULTJKrI=;
        b=s4mWZQbVa5Y5DmbPSxU1Pep0XqC/5TqOb9vZ6tBqL0sX7oZRaXjiC+DZUShnIp8uaK
         1jwLQmGQsBe1rRxglHQtTUahFqytreqSy4c700QoCDVO75QTHlX3d3/nl0igtSdZP/jh
         L1iJl2HJEmcVhh5WkyprNT2obLAQqrEcXTi4w90anDkxhrs3Y5F83B0yZ+N5Pw5vuH+A
         RFFXDnUa0toA+XQ3BebxZgxYqdRe/HVxdvkzk2uQz6pCdBzfohzsNQDDoGeVqOV0TiGM
         4g/Qy/srlnzHgQORC5CrQTAl/AIaS+bgccFnLBmZ1zi8sS1BItKytUSjbWHtinHCw1BI
         eXfg==
X-Gm-Message-State: APuU4Z8I0wKtpgmgdku9gYptJhp8GEHCevBdr7z4RFe5xMbUdTRAkIm+
	fBDcdI2x4dDcCefmkByLHnXRnotXijX6R6TobcMUMOduwoksIL8+9MKsmSetj+pNwdMKdXy+PP4
	W79JnmXk=
X-Gm-Gg: AZFdTZeJ/FpNboda195msg7Hms685tyojDx2z4dtWjh/TpzOOwW+Uu8jeHYSMx2cxQ3
	UcYjQ4R/IVlpYmqzfxqnGKm88xhKzKes1ift5+yRRlbDilP6yKUiw4K6s6pGPyCBeO5TAsvnq1q
	F2AgmBpIF1gJRjeTBIxouvGfmI6oCV0Vl/MbgHkN2I76cF1GE4C5Kuyu1rU4fwNBSCI33/bES4N
	ZdSvklUT+4LZV7FjpN4J0QRQPcjLVygE5tYewSJlw5o8uGsUgZlr/L9JszWO8rFC9zRLOy4c2Pe
	8nnjV2M+AH29MD33XEC65nm8bq5EvFTgNeDXXPiJ1hiQ1fOoIwX/bnIUs0wlLBMhNM8+P01Vf2P
	uSdZuYNR4ssnXtziNz71HZ5xp6lyZgeCv7hSLDCwf3FZg6agjEYnN1haqCdgFuCNxuhNWdQKo/y
	9XJxfZLe5ovJMg5ol6oa/Sphhclpe9l033ky4a4YZ7uKTJbwrq1gIN9SE4iajXCP2TGhOlznqcH
	JUIKzd5LTbDG7H4c8cZ84k7TITc9isKRXxwLxaXhHBuCaPedG1BMevZy+gofRVieZkHLse8nC3Z
	lhGzhSHAplnwPSP0tVDfROTBLab0Jti1Y4EG
X-Received: by 2002:a05:701b:4510:20b0:1b5:595f:4236 with SMTP id a92af1059eb24-1b5595f4800mr13228670c88.35.1795519561864;
        Tue, 24 Nov 2026 03:26:01 -0800 (PST)
Return-Path: <rsangam@mvista.com>
Received: from MVIN00040.mvista.com ([49.207.209.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm49961369c88.14.2026.11.24.03.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:26:01 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] gstreamer1.0-plugins-base: Security fix for CVE-2026-18297
Date: Tue, 24 Nov 2026 16:55:54 +0530
Message-Id: <20261124112554.93601-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 11:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251022
Content-Type: text/plain; charset="utf-8"

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/178ae5ac20db75e56d65e4c4bc142bb234387807
[2] https://security-tracker.debian.org/tracker/CVE-2026-18297

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../CVE-2026-18297.patch                      | 35 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-18297.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-18297.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-18297.patch
new file mode 100644
index 0000000000..fa90a06566
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2026-18297.patch
@@ -0,0 +1,35 @@
+From 178ae5ac20db75e56d65e4c4bc142bb234387807 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 19 Jun 2026 13:48:16 +0300
+Subject: [PATCH] opusdec: Don't use any channel positions for >64 channels
+
+We don't support this.
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5122
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12044>
+
+CVE: CVE-2026-18297
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/178ae5ac20db75e56d65e4c4bc142bb234387807]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ ext/opus/gstopusdec.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ext/opus/gstopusdec.c b/ext/opus/gstopusdec.c
+index 03d061a..7c936d0 100644
+--- a/ext/opus/gstopusdec.c
++++ b/ext/opus/gstopusdec.c
+@@ -359,6 +359,8 @@ gst_opus_dec_negotiate (GstOpusDec * dec, const GstAudioChannelPosition * pos)
+     GST_DEBUG_OBJECT (dec, "Using a default of 2 channels");
+     dec->n_channels = 2;
+     pos = NULL;
++    } else if (dec->n_channels > 64) {
++    pos = NULL;
+   }
+ 
+   if (dec->sample_rate == 0) {
+-- 
+2.44.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 2eff864022..0f60e79b35 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://CVE-2025-47808.patch \
            file://CVE-2025-47806.patch \
            file://CVE-2025-47807.patch \
+           file://CVE-2026-18297.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.34.1

