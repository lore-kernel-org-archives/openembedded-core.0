Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.5235.1605279187426176283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UZdCw8dO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id c66so7825743pfa.4
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MRvbgO983LNIn2G3U0Bz8mlSajKj8tIHhg0ysD0XEJM=;
        b=UZdCw8dOmHFDOSwzHZAodR3fa4h+biYGJ4zod/odq9AUfHxwpVc0XyuYX+X4gEbRoI
         uTv+GIGwjRSsUsGmOEU3lfyudNTy40n3jgNvCCB7s5ElpuwLZch/TTkLbxFAv7V6UJ90
         PwWyloEBLxTtVte3gU7TqCFRejAd2fwKRAdnHVIXcWkGyo7QOTOTKkmSEy7pxB95oceD
         broRG9XXNSneKUo92N0P4uA0Q8b5he9XilzHWeONhiq+Y46cfi/rd/Hf3uc/xIoRY7JR
         qoSqVefLCQV7DTqHlg1de/7mHJiv/pAXflX3Kt9zOjgFp8+k9XJ8aM3LFNeUJZd8csUq
         KPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MRvbgO983LNIn2G3U0Bz8mlSajKj8tIHhg0ysD0XEJM=;
        b=Pp2pvE2V1TahG5F2Ka5S+gJ2SuG5QCPAJKmquNwmIJF6jpWvT3LSdA3gBhUli+lGWU
         aTWn93Fy9qWrSg4FvbTajnBBrnyec/hUdSONI3v0bEB1FP/GtrzcYO1pb4b2msFh7d3l
         mG2TV7Ve1w/BDFFcCdy359LehRh69DsuSBmdsKajaSeydKLibcqMjhZTWdVQJIIcA2rK
         ww87Nlwd3qirmXkFhZAhtT+BsfObeU0TqQEfQdQqce3AHoyAUk/i4hSFpRaRTiF3w+Qo
         sSIu9xfZNDIb98BJ54xO8wUKGnuibH6ky6QqBrvzGv6uOLYPKayq8Q/ySJAIh56LkPdf
         DFuw==
X-Gm-Message-State: AOAM530NrCVUdvb8punam7foWVOShKhqR3wQ+ZZVWUdTVM2AKJkW7RRE
	9+VeC/+PK3sA6uBAwvn9gInNTB7Bg2WjCmlD
X-Google-Smtp-Source: ABdhPJzJfqyjRVGwFZbyH92WgWKHwVN2LyBaQ6mrzvYCygqj98nYude+mrt9bMdVNU6p+7l3hBdgYw==
X-Received: by 2002:a17:90b:1b43:: with SMTP id nv3mr3674317pjb.67.1605279186541;
        Fri, 13 Nov 2020 06:53:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/18] oeqa/core/context: initialize _run_end_time
Date: Fri, 13 Nov 2020 04:52:16 -1000
Message-Id: <4ebf97e36d9def38fb869cbbbd5ce10f5d2669a3.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

with _run_start_time as value. For partial results of interrupted runs,
this info might be otherwise missing for at least one testcase

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c5e8baf57fa2a33b9ef507b11d9ea9acaa77238)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/context.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 4ce3089ad0..4e238f80a4 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -85,6 +85,7 @@ class OETestContext(object):
         self.skipTests(skips)
 
         self._run_start_time = time.time()
+        self._run_end_time = self._run_start_time
         if not processes:
             self.runner.buffer = True
         result = self.runner.run(self.prepareSuite(self.suites, processes))
-- 
2.17.1

