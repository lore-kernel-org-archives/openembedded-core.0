Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C79DC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12395.1784134070471440270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k6KhMYGf;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4563ac048f4so431388fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134069; x=1784738869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYZLGk1BPmORRGJtFaeGw4yV+7JMpyQK1nsifcd6obc=;
        b=k6KhMYGfNwy+0oiqQYy0P7sD16A9/dYsWqtgrXO87f9lqQMeEpqkRKG1jDdd5HR9Ju
         xJh6z08VJcBUV8xhpfDhTStnWu230FSrUpBJIX2aIQis/RU333PB5N+5QZ5EjxYtp6eZ
         AsI5ZpCIOmIUaNq4wdKMIuZAFoWez/oqCoPk9bWPX6AFYm4Es09yBnziL37coFiyf2PP
         lN0HNTh0JeIgjiDHuOeVhBJQUt8kiRGkj9d9aBD9NFjKFyrnPyEWiFuBXu2Q6bw2mxRp
         8pkVf0PeZdMFNayOpInHslOA/BkpVEv1nNwZu1d9Q2B2WRsvRIIq5ODk6WBgRpEhzDyG
         3PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134069; x=1784738869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYZLGk1BPmORRGJtFaeGw4yV+7JMpyQK1nsifcd6obc=;
        b=HdNQI8h6r4s7N3cOTRZz2BSdLhMoNRoLquQb+VLGglfZ4uN67a3andZl1OQSgtYq+Z
         2Ml8cDeA5czNmE1/G1sap23tBcLEqpGCIySfLIHW1Ah029/ruaTfSnNVdUUMcQaidBjs
         tsN/Xa6v2LAIvYPNPgCWgmHQDzmPspUVo2QHCgqn4lFaN5jH2sC1As+/QqRV3LTxjJFN
         61xuppys8FBaxwF0+oS4TLE8YmJj6ZV3m9SinJEbwN98GWyIdgbKBLg0zTvlBX7Vaics
         jKmTFjuluQVwPMStt9Ahl2RgJjHGsHBPFBejmWlqOkjMRSEhZSrFZgjtpH0neJaRwvnr
         jMKg==
X-Gm-Message-State: AOJu0YwWOsHcSkDTRpOPr4M4Cl8aLnPaNyfO9NhqsVmscs0IxQTan0xj
	U690VXn9mt6fZGtDQknOXGbGGBh+sTa826Nywl4EgV6McpMlmePS+QsnC/uZXw==
X-Gm-Gg: AfdE7cmKTIeWsjXLk4NtqelHhw7H6UTKJsftK/lau9/xvwWRJfktuFHGyHLhSocVyUT
	LWjWD6Ugh4OVtakxC0KhqPBJqW/l0GmzM0d4jcIv5ayFTyylpY2YW9r8TqAAyGTK6gLpO9xAPRP
	KH1NLSaoiFdDum87ga6Okw7GD2acMEA+1bWwVSQ0gXZjv4h7Fc0obalVApGgRw3tUoCn9pm8WAv
	lnX0S8X82aeKm6HqK0ItP+Yr7ItmvCMBKp5mL/K/3ZC3A1GrIj67ANOOXv0/EZbeMQTZNkQsqk8
	gD45XPYgTo+yiqpj0lNbCUd7BXr1b4ccpouVYlD70zOFfQJskEi9gZpVOQdro4y0ng7mHnTsfFJ
	OIQFhglHh4Jx5/dNpBMBwJBYy/zaaMSUsm00s/9mXvexZ6q2P/x2bF74Na40s7koweBdMyhu3bR
	LTmYsfJC+A
X-Received: by 2002:a05:6870:f290:b0:42c:d6c:726d with SMTP id 586e51a60fabf-451f105c680mr10068155fac.8.1784134069636;
        Wed, 15 Jul 2026 09:47:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:49 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 10/25] xz: Replace deprecated SPDX identifier
Date: Wed, 15 Jul 2026 10:45:06 -0600
Message-ID: <20260715164739.364323-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241003

The GPL-3.0-with-autoconf-exception license is a deprecated SPDX license
identifier, so replace it with "GPL-3.0-or-later WITH
Autoconf-exception-macro"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/xz/xz_5.8.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.8.3.bb b/meta/recipes-extended/xz/xz_5.8.3.bb
index 0c0886fa7a..b76b1726e4 100644
--- a/meta/recipes-extended/xz/xz_5.8.3.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -10,11 +10,11 @@ PROVIDES += "xz-decompress"
 # packages, and the LGPL bits are under lib/, which appears to be used for
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and 0BSD.
-LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & 0BSD"
-LICENSE:${PN} = "0BSD & GPL-2.0-or-later"
-LICENSE:${PN}-dev = "0BSD & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later WITH Autoconf-exception-macro AND LGPL-2.1-or-later AND 0BSD"
+LICENSE:${PN} = "0BSD AND GPL-2.0-or-later"
+LICENSE:${PN}-dev = "0BSD AND GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "0BSD & GPL-2.0-or-later"
+LICENSE:${PN}-doc = "0BSD AND GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "0BSD"
-- 
2.54.0


