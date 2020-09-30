Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.6580.1601504107469978836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rFBoKnwk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id t14so2107457pgl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9RfF39mGm0ba9HokeWTq4ZBY5fUI7PsixeO3ThEvxhI=;
        b=rFBoKnwkP+JTJjDVNvqPAhdh+d4bHUtSojeequY7ZVt9MN0ppNO4XuuW4clt9fB8fT
         7YU5Ye8svUkdpO5y8BkHI8gCbGXzsMLpBkI6JbXnIhkxKwHCSrrVlvR7qwWKLS5SRKuP
         jYdFg+LArZFBSrpFNNqcwIcxYUXbKsrC7Tir9HCIcmIh54qFPxPRw2SMrbZMo3zWbC8v
         EJvLuOFb6IDlH8KYwmh1Q3noIjHiA2DAaqbDHGKwKc/I+wQYqWkc8qzn7r9QlcyspgpX
         Urmi/EkzzY3nki+a1B+iGbQMl8o7VPzcPc5F+/hiD0GRI2St+221UcC9Av3mzynBId5v
         J0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9RfF39mGm0ba9HokeWTq4ZBY5fUI7PsixeO3ThEvxhI=;
        b=mARQnp/siFoIqlbpnCzHuD1T1xI30G6tCLR6Q/UEY/W4Ht4WDOqXSaZo1WkhWXzVDa
         Gc9KBhMwq3l3MrA1v9khjuXXSoUO9bj6+pJQT2LUJtP59S8iIlVui+V78UTPHXPiLcms
         nwuhEiOQM7qmo9/FMlvFhJbMq++a6VdRQwPiQe8GUK9Pe9YGO33Ch25ui4VMf56Iz8lK
         bB/dN9aAFJwpi7MwHJ5MGOiPzQZeGDDDHNnsPbcka1REEe1uS/3Lr58Ef/Lze6hjYrbC
         m01dBc6wKbH82ws56fye/ppX1nTX/Saz7gZIHf8qWLCMgWuoIDY+F/cIxG70sTQUwEPY
         pp4Q==
X-Gm-Message-State: AOAM532H28SdDFHv73cL7cbpa/HsRkZ/RIaYktYNkCm2pWqe/5TngPt4
	b2yk/9ZK6ykFkSq16GR5kiB9WRehkbpYp2uwEbY=
X-Google-Smtp-Source: ABdhPJwUKIpf+P75SK5RJBtokWyP0TNGF3kkTVGV+NbvqcCCZO7Wwtk2KJSQOz4YAAWB2KJ8qIrs/w==
X-Received: by 2002:a65:5a0b:: with SMTP id y11mr3573604pgs.395.1601504106187;
        Wed, 30 Sep 2020 15:15:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/41] oeqa/selftest/incompatible_lib: Fix append usage
Date: Wed, 30 Sep 2020 12:11:27 -1000
Message-Id: <0c9437beb64aa294a1863de10a6c4b44612fa9e4.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It's pure luck this has worked so far, add a missing space to the append.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 793e0575b1cebb953276b5f93ff31e48c19779c8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 3eabd79097..2a6382a1a8 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -85,7 +85,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):
 class IncompatibleLicensePerImageTests(OESelftestTestCase):
     def default_config(self):
         return """
-IMAGE_INSTALL_append = "bash"
+IMAGE_INSTALL_append = " bash"
 INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 """
 
-- 
2.17.1

