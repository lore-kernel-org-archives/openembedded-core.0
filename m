Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29806.1793868226442055210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=m6O0lfLa;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c1d337d8so676896f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868225; x=1794473025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bFgMJDD8f4m7nptO8/qNsZBtp5j6FkyZcD2Lbtne9/g=;
        b=m6O0lfLaCvboRLOLqSG9H464uW0HFmB+czy2nZP3gKuDl3EV6GG1YzE6c5AJg+BFKQ
         NeNGw1Yqe2w61X179hnK+9j8VuOLW/sFtnpZjYrsv9eH+Q2uFHtAjUqbR4uhBc36K7w3
         3+jWcGZ4Annp8qsyW2YF2GKAO85F6ZXvonOKr+PtA9CR2oITPVNpbnHleZjshkM1m5rc
         gjmyayUZdZcbTO/iKusjt2bUzqWLSk3bUUGGkiu8bfgcYXujc/f8tnq4UIRg+VQluVt9
         uoXjETimZu4TEaV6pkgFVfRmSEay5IQgWyNCzWxtj577VedGx5fs30dt+xuWRiR4o5iM
         SwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868225; x=1794473025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bFgMJDD8f4m7nptO8/qNsZBtp5j6FkyZcD2Lbtne9/g=;
        b=HTi2Y/oioNDHdv75qFLE5IWuPNTEmNYGiERiwEx/fVfl4rf8w0NvK7SlwIZsH25FEv
         34xStIjWLzC+gsfwtGu2pA9uBGkUsPIBX+4Uq71ud3lUcyOHztFsd7Nguwhmg7nlpT+1
         zPFlJSC359M3qfIrZplKmP7HZX+CEdu4wSZLDuJOJhvBmL213waKFTjaTJGvDZHhDO9i
         hOoR9OHH9n8qkDvTtSLnwEX96GUSSFdmMHJw3oKrKau5Fqd9OFTuOlcU47be0e0xkw8M
         7jiERpEHgetQLYANLV1Jd0YViEdNW8lIhMMH+f6/lle+EIZr2E/HOI6RjyE7yW5Kgs0l
         Ypbw==
X-Gm-Message-State: APuU4Z/If6PPJHvjBI0/NB6tm5dldPo1EebUMJECP7DaGkoQwNAPla0K
	UAIj2gzXCxyTy8CrvCN2yF4NkBgXXX2uObWu1ZtY7OGap5DyV9e2K8Z0TsgxUIxitBLqKU/kVfY
	Mwc2Y7S4=
X-Gm-Gg: AYBFou3YyRIj6CWm1tjz3jHTFFnQDysujJ7LdQVKMjv2UC6lqWFLrbDE8Z9Zgwf+6AD
	fjSV5M+7W7LvsvNVWPekgO4bmMQVIxBK8x0GMPVKM9YBkAFuK9SlPVd8nvjJMu9r2NlhXK1gERH
	9t/69TUm9+v6ZnkjK00RZDWylR8n9xsz+McgWc+jpuiMtaMqM16tH4B0uTPqKt1L9BeyRONRQqf
	uibx76y21bYI8OSOsrSqPmuKPGctdwhgjABFXQoHh1pObH9vUCcCb3nfD61hUAYkKm5x7yyrVl1
	QJ5F26Ja8D0xoiTltMamY7+lu53KucHRtyXq/D8uBXdQVgroAteZoo0UAkYd6Fa+kzCfy4G6htQ
	aL1qNIKUJB9cFkMbOwQY4w8mP4jSOtycSvYpkXWAO3fEI8usAGEVy1va72NdnyZ6F3YhgD1XH0G
	SDgmAdlVRfQR7GW4MgM352bF4J6u6VzBBNd7RmoAjr8/+Rp+eR7GcCnsUHFokdL7TSR6OxWq77D
	3OpWVukt3lb0Mp9Ghvm/jybs3nEo/QAHAn4xjBoZLw99KTL826daPrWZ0WLAGcZ1xol9/tesSa3
	AZ9/AvQENZWOY+BPp9g2e6vRjFUWacvgkU71ESoVc9ry11xx2D3CuAobyUz74K+O3ZJfFvyHNiW
	4L6+u95YhHHD+WTqYseRhn+6Ov784
X-Received: by 2002:a05:6000:40d9:b0:48e:202:6718 with SMTP id ffacd0b85a97d-48e6e3042camr41528962f8f.25.1793868224591;
        Thu, 05 Nov 2026 00:43:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 13/60] cups: upgrade 2.4.19 -> 2.4.20
Date: Thu,  5 Nov 2026 09:42:32 +0100
Message-ID: <f5f374b6b471766b9a8fbeeb7967a3b28bc9b0bf.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249472
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Release Notes: https://github.com/OpenPrinting/cups/releases/tag/v2.4.20

Changes: https://github.com/OpenPrinting/cups/blob/v2.4.20/CHANGES.md#v2420---2026-10-05

Assigned CVE ids:
    CVE-2025-55480, CVE-2026-61702, CVE-2026-87875, CVE-2026-87876,
    CVE-2026-55453, CVE-2026-55467, CVE-2026-105326

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: ffad0699a46b2e34b8a986c7d94b758f09a07535)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-extended/cups/cups/0001-use-echo-only-in-init.patch | 2 +-
 .../cups/cups/0002-don-t-try-to-run-generated-binaries.patch    | 2 +-
 .../cups/0004-cups-fix-multilib-install-file-conflicts.patch    | 2 +-
 meta/recipes-extended/cups/cups/libexecdir.patch                | 2 +-
 meta/recipes-extended/cups/{cups_2.4.19.bb => cups_2.4.20.bb}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.19.bb => cups_2.4.20.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index e4b473aaf31..ca92548cbe3 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From 575a890a818e8ddc95d22838480b62988ffcd639 Mon Sep 17 00:00:00 2001
+From 4b7e48fb41dce9c10a4c4f91dc9fabfb14b9f1d7 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 378ef677a55..b79b8be307f 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From 36fa890e4b30bf42318065fe3172ef92b2d3e313 Mon Sep 17 00:00:00 2001
+From 9818e95ed747752e37d792693d3bf971af765084 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 2728fc7e3c8..7dd59203382 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 53aeff85692ce3fd0ac325ec7dcdff31748ccee6 Mon Sep 17 00:00:00 2001
+From c9c54505f5c1f77d598e8e1baea09a3794a4f5d9 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 4acff27e541..4fdc2d7da41 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From fab57dbafccee851b22b757f08fc3273ad78b8ae Mon Sep 17 00:00:00 2001
+From 97f71812d2553661ccac15eaf7fd354824339ef8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
diff --git a/meta/recipes-extended/cups/cups_2.4.19.bb b/meta/recipes-extended/cups/cups_2.4.20.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.19.bb
rename to meta/recipes-extended/cups/cups_2.4.20.bb
index c4885b60bc0..18ab74c783c 100644
--- a/meta/recipes-extended/cups/cups_2.4.19.bb
+++ b/meta/recipes-extended/cups/cups_2.4.20.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389"
+SRC_URI[sha256sum] = "ab4d9cd7f3e58060091d2b24972223d6401675f11c49b65abf4f6ef31dea22ff"
