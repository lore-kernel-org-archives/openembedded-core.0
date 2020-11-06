Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.12294.1604673420425359276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=exrXLlmq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id i7so1079812pgh.6
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=A/DY8QSJBFNq4a3Yc+55E+PAZTn82eEEVx9MrvrzRjA=;
        b=exrXLlmqJLNV14rhi8skm8d/Nqet4+r8JmOjRhjqQOQB0/oqwO5r92j2Je68oiHXEh
         4gNIFqkgotwfGY+hqfOFuikLYZV50ZxcVdBA7M3tmtIG0SoQUt6zx2tSD2MfOhV9Yzfo
         CCu7VjCI8wBxI+XzTCwBg1B314MzZ42OIXn8UkkogaehNzT395Thq6ktksLCuszEkWeh
         iWJcq90ghEMdi67rATGScjgVK9QIIjyrkoV6wKHgIQRIRj2Mto6lbJPWlMVfb1Kc8BP4
         LgqzOfaRzTPSpm6fyzoNCWzS/1OA+jivnfbztkKSjI++B7Q0NXQVPa/A9Dnt23gfVkXd
         ME2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=A/DY8QSJBFNq4a3Yc+55E+PAZTn82eEEVx9MrvrzRjA=;
        b=MA2uA1WYg3UGa29Jyg6C9z9VnTeXfbSVXRKOOY4kQKZ9CCGwlHxc8kQDNqG7fcFu1t
         hOPpR/5fd+o58AhaVoLRip/5nLxU8LVR4z7LH9BoB6BJATYxg8OjWi8l9B9Rs98X/G/Q
         U++3tOiYSpUpJUnCcwkcaTggNd36cBYsSFmmP6uwVUIhLQxPvQQYNCQLRswukGG+TSKa
         3iNSuUCNXW93ExeFDKU22DoVavy+sUbqyuFuihlg7/RFrmXSTjDYoHqjC1f1ZIQz8Krv
         0h4NnZ2zhkdtMCtQgm2FhJ4pD+uTpdHc0C7aAyI8EqWCi/EFuNLsmUm7yVaJqtdHAAaT
         dQUw==
X-Gm-Message-State: AOAM530bjA4qh4xrxVZPrXu9zoHvW9HH/SE7ITecIGcHCy47zj72XnLB
	uoARlgPbFgUGVSr84u/Ebvp1X82V2LIQ8tVN
X-Google-Smtp-Source: ABdhPJxUln5IpJspZGQX+1aEIBNsjCZYtjtYyYjRN2ZQIdv4FAzuDfzmb86krQx+9bYHLxNj1DQRcw==
X-Received: by 2002:a63:d40f:: with SMTP id a15mr1928225pgh.143.1604673419586;
        Fri, 06 Nov 2020 06:36:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/20] bluez5: update to 5.55 to fix CVE-2020-27153
Date: Fri,  6 Nov 2020 04:35:30 -1000
Message-Id: <698c0cbf77ebce6b336f823f826aaece0cc9ca32.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Version 5.55 is a security/bug fix release

Release note:
https://github.com/bluez/bluez/commit/5a180f2ec9edfacafd95e5fed20d36fe8e077f07

CVE reference:

https://nvd.nist.gov/vuln/detail/CVE-2020-27153

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2895e3e4eabca64cbcc8682e72d25026df5e5f0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bluez5/{bluez5_5.54.bb => bluez5_5.55.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.54.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.55.bb
index 260eee1402..8190924562 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -1,7 +1,7 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "e637feb2dbb7582bbbff1708367a847c"
-SRC_URI[sha256sum] = "68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc"
+SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
+SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.17.1

