Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341DEC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.46708.1674657738208683198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=H8sqTfTe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id n2so198470pfo.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fu2jxwjnbBNvjgssPJZykZk5DYyM7ZeC8PG8LR+LcrU=;
        b=H8sqTfTev8OEdidzlfRlRKjt10vLDiw/KhW1Y7ITQJZ2olis9OCildOq+av9m2k1Hr
         3KJK3icYwjlQSaofZP+edXSwTT94Ajw62rnSUX6wc5uwrjHUEBz79nD+bpjuL1niavjd
         WrmhgCHKYiAdqp+74g/DKqH1fOEUOojRQo1BIagHSkJfUuWnW1DgSCLC6vGGpC7hpwcp
         zzCfIeAopJsAebvdYEuKexI837Y+O8TcejWYA/LdJFmrJX2Yk2l7NYGLhg6AKCdtoyIB
         Rc0Y9jRIUCIC52LYRWyQFa7pSOfH1ByVA9dqXcVGBcc5o22E5DrXjj5+zszWu0HyYujW
         S2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu2jxwjnbBNvjgssPJZykZk5DYyM7ZeC8PG8LR+LcrU=;
        b=wULyVJKFShNCzmDZqMEgK5MieUuS2ZJMkKeSpuPNBHSl5a3poAv1IsbOMFIhuok/MS
         npMvMGDK+1OzcWtzG+s0FsWRGLzE4R/3EJlcIq7h/KBaKBMUIsY7aRc2Wg0/EX3CovHz
         9Ts6CHRvUvpMpdsMMrUL9p7YzPV7HNsOgGIzsZRZv4ThsKtzQsHfRFWysCwbawCPHGHz
         BBd2lsLt/8fNugfSUa1Ld2alGfzCfLjHMH9JZ21kIfVRR3l/IV6WAvRqqo7hTmuuyJ70
         l8CDI64QrH9TkzfM7gfbl1dEGLNL19SMWVuE/nEEn4SbNnGrlS6qLIKcftr2gTsFuxqj
         46wQ==
X-Gm-Message-State: AO0yUKVKhdp65CghHQ6jcpuCyaguksNQhjl6t+g07+wPKx2rlHd0Qns/
	0xgG2U5nIKQe6RMqroYhqwt/DCmtug5saHBS5Vg=
X-Google-Smtp-Source: AK7set91PHD8eufRfhhfsuBwEh7rxMadMYLhsGnvieNy58cn7OU2hM7txaDShjVr6z50NkO2O7gnFw==
X-Received: by 2002:aa7:95b9:0:b0:590:63d3:260 with SMTP id a25-20020aa795b9000000b0059063d30260mr1469111pfk.19.1674657737123;
        Wed, 25 Jan 2023 06:42:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/16] cairo: fix CVE patches assigned wrong CVE number
Date: Wed, 25 Jan 2023 04:41:49 -1000
Message-Id: <8b1f40639c16286937f04b9b50cef3d759bf442e.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176357

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

CVE-2019-6461 and CVE-2019-6462 are fixed, but the reporting is
incorrect as the patch for CVE-2019-6461 is actually for CVE-2019-6462
and vice-versa.

This swaps both files and edit the CVE field to report the correct
identifier.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f12c2a5ac94cb29f473f3c7e335463c7fb6d8a6e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cairo/cairo/CVE-2019-6461.patch           | 46 ++++++-------------
 .../cairo/cairo/CVE-2019-6462.patch           | 46 +++++++++++++------
 2 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
index 0b7d9a0c36..a2dba6cb20 100644
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -1,40 +1,20 @@
-CVE: CVE-2019-6461
-Upstream-Status: Backport
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
-
-From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <hlewin@gmx.de>
-Date: Sun, 1 Aug 2021 11:16:03 +0000
-Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
+There is an assertion in function _cairo_arc_in_direction().
 
----
- src/cairo-arc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+CVE: CVE-2019-6461
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1c891d1a0 100644
+index 390397bae..1bde774a4 100644
 --- a/src/cairo-arc.c
 +++ b/src/cairo-arc.c
-@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
- 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
-     };
-     int table_size = ARRAY_LENGTH (table);
-+    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
+@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
+     if (cairo_status (cr))
+         return;
  
-     for (i = 0; i < table_size; i++)
- 	if (table[i].error < tolerance)
- 	    return table[i].angle;
+-    assert (angle_max >= angle_min);
++    if (angle_max < angle_min)
++       return;
  
-     ++i;
-+
-     do {
- 	angle = M_PI / i++;
- 	error = _arc_error_normalized (angle);
--    } while (error > tolerance);
-+    } while (error > tolerance && i < max_segments);
- 
-     return angle;
- }
--- 
-2.38.1
-
+     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+ 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
index 4e4598c5b5..7c3209291b 100644
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
@@ -1,20 +1,40 @@
-There is an assertion in function _cairo_arc_in_direction().
-
 CVE: CVE-2019-6462
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Backport
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+
+From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <hlewin@gmx.de>
+Date: Sun, 1 Aug 2021 11:16:03 +0000
+Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
+
+---
+ src/cairo-arc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1bde774a4 100644
+index 390397bae..1c891d1a0 100644
 --- a/src/cairo-arc.c
 +++ b/src/cairo-arc.c
-@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
-     if (cairo_status (cr))
-         return;
+@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+ 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
+     };
+     int table_size = ARRAY_LENGTH (table);
++    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
  
--    assert (angle_max >= angle_min);
-+    if (angle_max < angle_min)
-+       return;
+     for (i = 0; i < table_size; i++)
+ 	if (table[i].error < tolerance)
+ 	    return table[i].angle;
  
-     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
- 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+     ++i;
++
+     do {
+ 	angle = M_PI / i++;
+ 	error = _arc_error_normalized (angle);
+-    } while (error > tolerance);
++    } while (error > tolerance && i < max_segments);
+ 
+     return angle;
+ }
+-- 
+2.38.1
+
-- 
2.25.1


