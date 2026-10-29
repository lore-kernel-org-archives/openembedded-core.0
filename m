Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17325.1793294303889171220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XJfw31ZG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202610291718227fedb83d7200020799-prj8vy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610291718227fedb83d7200020799
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:18:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SXDsQEmQE2cwBuCIw2boltJtGHCbJQoHjTDruXLVKy4=;
 b=XJfw31ZGVKef27a9DClw6jJh4kqia8cewhkArRtVWnEBTUfZSkzhF/KvygWX4MArOdDfR1
 z1BbGAFqyqVVVTDuKAkiaJrb5zpTuGIyKsF/XguS8xFYh4Ap4cLRPKrjqFykwFJ2vWpulp/s
 cz1BheC2Mrsb+XzvWYvtppvJHtDiHlFQ7qxo6TCQvKfllSE2mjp7GITqwEfS3ItC9rZZDHQf
 qGE/Dx1G9bzUrF941nHsNKpcFfm6GSLvv+NgU10Ed9vwUp/HASK1uBJNG6WQvef7f5Kkcddn
 Jj/I4ioKeW3EVo1PQDr06I+yBYYfEQczMIAqL4jOlsAQ+2dSgsLHB4Bg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 6/8] cups: upgrade 2.4.19 -> 2.4.20
Date: Thu, 29 Oct 2026 18:17:04 +0100
Message-ID: <20261029171709.2842512-6-peter.marko@siemens.com>
In-Reply-To: <20261029171709.2842512-1-peter.marko@siemens.com>
References: <20261029171709.2842512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248962
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
---
 .../recipes-extended/cups/cups/0001-use-echo-only-in-init.patch | 2 +-
 .../cups/cups/0002-don-t-try-to-run-generated-binaries.patch    | 2 +-
 .../cups/0004-cups-fix-multilib-install-file-conflicts.patch    | 2 +-
 meta/recipes-extended/cups/cups/libexecdir.patch                | 2 +-
 meta/recipes-extended/cups/{cups_2.4.19.bb => cups_2.4.20.bb}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.19.bb => cups_2.4.20.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index e4b473aaf3..ca92548cbe 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From 575a890a818e8ddc95d22838480b62988ffcd639 Mon Sep 17 00:00:00 2001
+From 4b7e48fb41dce9c10a4c4f91dc9fabfb14b9f1d7 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 378ef677a5..b79b8be307 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From 36fa890e4b30bf42318065fe3172ef92b2d3e313 Mon Sep 17 00:00:00 2001
+From 9818e95ed747752e37d792693d3bf971af765084 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 2728fc7e3c..7dd5920338 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 53aeff85692ce3fd0ac325ec7dcdff31748ccee6 Mon Sep 17 00:00:00 2001
+From c9c54505f5c1f77d598e8e1baea09a3794a4f5d9 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 4acff27e54..4fdc2d7da4 100644
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
index c4885b60bc..18ab74c783 100644
--- a/meta/recipes-extended/cups/cups_2.4.19.bb
+++ b/meta/recipes-extended/cups/cups_2.4.20.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389"
+SRC_URI[sha256sum] = "ab4d9cd7f3e58060091d2b24972223d6401675f11c49b65abf4f6ef31dea22ff"
