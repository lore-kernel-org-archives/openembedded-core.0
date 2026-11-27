Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1547.1795801794754039838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=JIm2V8AZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so7863525f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801793; x=1796406593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bja3U64BOA4vSixJAX8yoQyccXEpK8pDonbnWODZh+w=;
        b=JIm2V8AZYhG2/oXxVxlokmDZqwnYGRLYSeRoPvRyCmf3V6vw4wxX56wdcUFpmK9DW2
         64+wIRBXvBMOkmv9tU+GGKt44AU3gsU2M53owZ91UTFv152QpJPwLcvF8Y6DlN4mZ2S2
         GcE0CvLdZe1E0LZWHuauBndTRLWFPF5qbvHCM5SLHoSnf4PdtD6rtwP4eynghD+2cvuJ
         RG7M7b15S5AVXstwL9LhSt9V4fHFjqPrSNHZLSfabs0+ZCXRHJO9n2ZzLo0LPEXz5KOi
         Kxuwbik/w9SKiTXEEfp3Yyh5SKbCkw7ptM9jz6ow7VKfG0PGIM3X5HCMFBy82VMQC15t
         Ic+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801793; x=1796406593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bja3U64BOA4vSixJAX8yoQyccXEpK8pDonbnWODZh+w=;
        b=F0O595dxE0yaj1gdwckyc+d0pilc4YSV9/KaG32S7Yl1TKSYKvXg5WOtzOzSHYoMK9
         cZQqzZLOHjeBRvjqJ4pw66P3g9g5M/LUs4rGxv2Z1+DxEDl0lpcsSmd8/SVdIxvgtZim
         UEFa8NFsL6P/jjD4AmDttQLOzytrD/h6D9b7esobNyS5MnhsEYfZ/amymVLXFSHKjmwV
         6dnz4caWziUVuicbab6dxu4q3Djz4yHlk/CW7Nrld0yZ6jcwjPouZRxJwYVbtqHX92dv
         PibnYM8UOZXY5kG1fBMS6Uy7aecPcbuX/jlK2QuFBIaLw9pWhyTgDJRJdtIq4y4ZFN55
         Uk/w==
X-Gm-Message-State: APuU4Z9Yo95yXD+UCk33gVkUP3J6aiacaviKI1aQwBaBK/tPEuWGFhhp
	ib4VUpCAE936gFYzPaH6+JOIqL9ZmDtYmVKcEWhdZvfD26DIl3j+5kXB3V964zmy/sKBSvCgRbv
	5NERfUjI=
X-Gm-Gg: AZFdTZfIYu78NnIB6f1lBpWuPlS8xtAG9iPKkadU/pEqj+ZyegMrxZUbzySFpp4mB05
	XCvNRQ4fGmQLlrFVIe+xQXfp6dOh89UVsJLGtbsozGFZigDIkG88epbniIVBHy37Ag4hTeykLXJ
	QXNrQQvHB5V6H1JoKTkRN2KGD6vrL/+5CBBbBBbq66k+fxjuzCvjGK7eObfPF7v/kwS0S0hWnW7
	Eo5LaVm4q3ZmY9ePo7O6/w8URq5VL1JChXYLVUJGbxu5/oN7WH4vdk/Pd4y/OzyfZ6NvGDTU+8q
	NIRkwz8fGltntiiSK4i1xOwZILwbVd45dNNDz/BWiL5V/ZbHGNTRi23W4nD+6ydzkWoSd+AvQVn
	dc340lsGueKYIFg+GPzoRcFjRlayy0I/hV9OCEMXPE7fyVI39HROmo08vxuMLlm0ubkd7xpZd2z
	ES/3UwlH53QKIh/DeXYUT3lLhPz47mUDe4TT4dVe/jAf9qqZSKyvUTpd9dh/7OOEK7bD8b9O0Kp
	jn2qnQaa+Boq0Hi/svI/Mmx8OalxUlnoqtUKmJt0f8LRCVdtgAvtJH0P2vJXu6mYjqalg6+kQtZ
	QPtbm+3KsaPMXDslOg/flk+vrLCLU6D1nXrDpg9NXpN3K4S4m6yVV7iOPMgeVVdOsmkTjFVDzEY
	uHMscQVDp4tCbafd6a0CeaMoRNzAqVQ==
X-Received: by 2002:a05:600c:4e02:b0:4bb:8636:dd7d with SMTP id 5b1f17b1804b1-4bb88817f77mr507308315e9.24.1795801792950;
        Fri, 27 Nov 2026 09:49:52 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/37] go: Fix CVE-2026-33814
Date: Fri, 27 Nov 2026 18:49:16 +0100
Message-ID: <683b25e165a942a550e21e46f72fcc1dc2d31d8b.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251439
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f
[2] https://pkg.go.dev/vuln/GO-2026-4918

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-33814.patch                | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index cec3bbbb4ee..5695e907d96 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -64,6 +64,7 @@ SRC_URI += "\
     file://CVE-2026-27145.patch \
     file://CVE-2026-39823.patch \
     file://CVE-2026-56862.patch \
+    file://CVE-2026-33814.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-33814.patch b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
new file mode 100644
index 00000000000..8265bf205f6
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
@@ -0,0 +1,44 @@
+From 825d42a14d8ffbdbdda87a39e78795eb17e4f0f2 Mon Sep 17 00:00:00 2001
+From: Mark Freeman <mark@golang.org>
+Date: Fri, 17 Apr 2026 16:28:03 -0400
+Subject: [PATCH] [release-branch.go1.25] all: update x/net to a9171bc8
+
+Fixes #78477
+
+Change-Id: I0a4c8e25f569fc1bfb8ac39ff728bfe7300b751f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/768323
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2026-33814
+Upstream-Status: Backport [https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f]
+
+Backport Changes:
+- Omitted src/go.mod, src/go.sum, and src/vendor/modules.txt because
+  their x/net version updates are not required for this focused backport.
+- Omitted removal of the SETTINGS_ENABLE_CONNECT_PROTOCOL-specific
+  s.Valid call because Go 1.22 does not contain that setting case; validation
+  is added at the start of the settings callback instead.
+
+(cherry picked from commit 9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/net/http/h2_bundle.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index c1a2e76ea4d..2f5a6d3d5a2 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -9910,6 +9910,9 @@ func (rl *http2clientConnReadLoop) processSettingsNoWrite(f *http2SettingsFrame)
+ 
+ 	var seenMaxConcurrentStreams bool
+ 	err := f.ForeachSetting(func(s http2Setting) error {
++		if err := s.Valid(); err != nil {
++			return err
++		}
+ 		switch s.ID {
+ 		case http2SettingMaxFrameSize:
+ 			cc.maxFrameSize = s.Val
+-- 
+2.35.6
