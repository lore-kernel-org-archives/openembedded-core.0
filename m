Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7959.1794464717983308617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YndA9OXJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3182087b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 22:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464717; x=1795069517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=YndA9OXJ1yBbfsxFIjF7CMNLvwG+X90h7Gc8SFT+29VdqA2mM8EtOW2MNy2cVVtGJe
         DLU/CoVVG+9TEo9TvioY+WC05yd7uGf0RTh5qH1/uT1RBKMFEjx4QTVSuLzAxwOFMuVj
         93thmM7ydtc+k1UOUyjY0atCd6O3/phG9gFC5J/m6iVTVmgnyNmfGnN2+Y3mSO+q3U8S
         MHQDgF9c//a6Z2X+WzPt/b5v5aSCEYQylah3RdCZ0xduNqwcITdOmoXi0GJ2sGeJx/hn
         vS61azAlP6QF+uHdc91DOlnO3uGtZ8dkGY8pGoRwgrur/zoKMoqLWzxV35eFYmV5+urr
         6wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464717; x=1795069517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=MLgy/kgQm92cMiag4TsUxYihyDE9SL5jUw1K+Yf+NqcO/P4578HY2GlrsMW5OR4mNF
         cxPSKVF3pOpvzwtfoz+1nLqtwjfTED1h7FAfv1NPqBydgn14l/GyHCs8nmdwxBJS4Eik
         wmnKSO3GXwQJqaGg97955YOPDmgns9xeu2ZxdZ7peta56pAYV5UC2C6QyM57IzOa7XH2
         zIS+ANxLm+Zt5GKIwXJgNwHM+m5Wke4UP0AqpUPUgAwiuFT0I1FKN79F+Dte4DRur0Nj
         zXJZHKfgi192NBXim4ULFAiDKSMHneP5MfxVbEEJ4OaQK+FarZk65wEOXCjJjSiNaTy4
         Nz7w==
X-Gm-Message-State: APuU4Z8VkdsxFm8epqgwB9vSovCrzvPMnFjFJb3qI7Sb1rD8F0f9fV0m
	q++6gnFV2NTU5jPHHR0m/XIXOiuAPRV00cvDpptU96YFID/UBm6KvIcfx/BLNA==
X-Gm-Gg: AYBFou10lr3hhYq97GCx//ZnH8J/b65IBwxufMjLo8KzgUkUlVlWiwtp9XrDw+w6k84
	KOoNDXlEEdk+I6OLS55GOHPrWGk/cCxtTQWrPpwurh/2jgFY2HzUol0oSZ8W1hdvsuVt+/zk0BP
	RQ22vNmLdOTsRUpXTF7YYzDcSn43uoqUDJaVaM5wHiK1x5ZfjJQlRW6kDYP+noU/XPL4TKKKax7
	4TEXIFFDMCoQt3INAXBtqzZMiTLh9pdpvCApk4FRddf2U7tlGskpVCtD0QswqsfteCWmotqrxg9
	b7KgL3OLKg15L7De+rr4okwSzuVJcQJPYFTizQyPfry0mb0zKz0EY6/MwBeEBu5UVtEDVUOLite
	5hbtPHP0okImqGZMzuxRQ4f3BXxGW8heJb+BVyT6mYaoNe8tqaSY2HMnSNez/V7UThlnLdegNt6
	UxOmUFmWwpBLQi7ikhbx6IL6e879lhQvZrOVs3neunbNxOIpmy7g4z3D5HIACGBWsHE5EEIBjq+
	eOL1h+PcPPi983FX6Pxd+MCFC0341wIypMfGdjF2FZFc4ssv4DQXhc16wliSJqP2FsBWwtvU7Iv
	tCg81wnOUh0FV7pStpD2ApWwTomdZpE9x7avwEuHqawrd2x6NzWtz3VmNUZoiI97f8L6yY2qWjW
	2q8AespXIxg==
X-Received: by 2002:a05:6a00:4c17:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-8bc1b60630fmr4551207b3a.14.1794464717203;
        Wed, 11 Nov 2026 22:25:17 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de768fsm3013268b3a.6.2026.11.11.22.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:25:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH v2] mpv: patch CVE-2026-123095
Date: Thu, 12 Nov 2026 19:25:05 +1300
Message-ID: <20261112062505.4067039-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 06:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250073
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-123095

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mplayer/mpv/CVE-2026-123095.patch         | 37 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
new file mode 100644
index 0000000000..1efa0fdee6
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
@@ -0,0 +1,37 @@
+From 2c6599aa7d16efd29ae49865757eb449d9306742 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>
+Date: Wed, 4 Nov 2026 20:28:57 +0100
+Subject: [PATCH] ytdl_hook: reject playlist entry URLs with control characters
+
+The entries are joined into a memory:// M3U playlist, one URL per line.
+A URL with a line break became several entries, and only the first line
+went through url_is_safe(). The other lines were loaded with the origin
+of the opened URL, so any protocol was allowed. Skip any URLs with
+control characters.
+
+Fixes: e6e6b0dcc7
+Fixes: GHSA-p99g-m25w-x8xv
+(cherry picked from commit c3096515dcd26c14004f985538b5aa41db613856)
+
+CVE: CVE-2026-123095
+Upstream-Status: Backport [https://github.com/mpv-player/mpv/commit/c3096515dcd26c14004f985538b5aa41db613856]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ player/lua/ytdl_hook.lua | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/player/lua/ytdl_hook.lua b/player/lua/ytdl_hook.lua
+index 65ef859595..2b0edb193a 100644
+--- a/player/lua/ytdl_hook.lua
++++ b/player/lua/ytdl_hook.lua
+@@ -1111,6 +1111,9 @@ local function run_ytdl_hook(url)
+                 -- links without protocol as returned by --flat-playlist
+                 if not site then
+                     msg.error("Playlist entry does not have unique URL, can't add it.")
++                elseif site:find("%c") then
++                    -- a line break would add entries to the playlist
++                    msg.error("Playlist entry URL contains control characters, can't add it.")
+                 elseif not site:find("://") then
+                     -- youtube extractor provides only IDs,
+                     -- others come prefixed with the extractor name and ":"
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index f37ae4ac50..0c99e354e7 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV} \
     file://0001-opengl-context-require-swap_buffers-param-for-FenceS.patch \
     file://0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch \
+    file://CVE-2026-123095.patch \
 "
 
 inherit meson pkgconfig mime-xdg
