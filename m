Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.11796.1602842138382378620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dUkY4e+9;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id qp15so2276803ejb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TS1yZJamg8PgoLyjgKXTSkuYjvg7E44sxMaNaO25/pM=;
        b=dUkY4e+90nDr52sG6VWXWyDBW0SYM6QYdz6REVtUT7zeGnyQ85KyZJYtHda9qXW8fZ
         YXmoEJMUndKXqmhuw8bfN32czvrHUKQJPoL+pOaxbkD2lGBv9PeDliGWJrD7S+JN3L6s
         4UJ64WUcOIz/KBS4lJWcpNPAQ9cs3qBahOsl3JYN2Pjgqb8h6FkVdGrQFwQcpFOSGlM+
         t1WOHIMzTAJfhpl25lu8GWjTQq8rjghMu3+tQ0KnR29q94Fswd4KE5do03NA0UJBgMBX
         t5avOvlgi5iVFa5IOwIAgbYVhj20q4bUGOI8iPM/krCiNsgUKk1NxOJm+4hwF/ZeHDFa
         il0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TS1yZJamg8PgoLyjgKXTSkuYjvg7E44sxMaNaO25/pM=;
        b=lhk5UY7N5YppQEWFLF69B3QNhz00y+fX/SNxi/6K9bM5/tVzTvRRynSP7ilS6ziaYg
         o9k+yPnXq4NiU4v1/d8aShBjJv2VhByWJVUuiL/MIOxaDfFYG6210BJVvx0MPeY5azxG
         bC4Z0B+OPEs76DIM8mdacF/6hzztipzWqXWVyHIRPvWG9G8j+Lnw64zQCZpPD8UZlpWS
         VLVAjaWGpnodNz6cVCRv20YT9IEP4TdDTf9mgxWkvRUWTSxbRdk0Pt5QXYwb0N674yyU
         ZQ5p56yQSVqRouXNcnDH6M1nCteOSvUUZ57w1LW9WQGSirvp0Z2gxPewjURWkRizchs2
         TN7Q==
X-Gm-Message-State: AOAM531JwT5TcC3zsMOE1ymkc5co/bKoQgjHgNMNApuOO8QVahxefj4V
	I/r9CRMJe08VvrWYu/nJF38q8j0wXsU=
X-Google-Smtp-Source: ABdhPJxh2t2RmvY6d6NIqel3JNhKMyvRC2dxihvIjkYjCsvznL28wRGWROq+K3WspVccnyetJJ2tdA==
X-Received: by 2002:a17:906:3e1a:: with SMTP id k26mr2945267eji.96.1602842136606;
        Fri, 16 Oct 2020 02:55:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fx11sm1223747ejb.77.2020.10.16.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:55:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] tune-ep9312.inc: add t suffix for thumb to PACKAGE_EXTRA_ARCHS_tune-ep9312
Date: Fri, 16 Oct 2020 11:55:31 +0200
Message-Id: <20201016095531.140098-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016095531.140098-1-Martin.Jansa@gmail.com>
References: <20201016095531.140098-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* broken since:
  commit 805dd4807d322dc70cef97edd68fdb3142b60fb1
  Author: Andre McCurdy <armccurdy@gmail.com>
  Date:   Fri Aug 23 13:51:36 2019 -0700

    feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX

* since this commit the 't' suffix is set ARM_THUMB_SUFFIX by
  armv4 override (which does apply for ep9312 tune) instead of
  armv4 in TUNE_FEATURES - so the comment in the file was no
  longer correct and ep9312 wasn't usable

* fixes:
  scripts/tune/log.fake-ep9312:    Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t ep9312 fake_ep9312) for DEFAULTTUNE (ep9312) does not contain TUNE_PKGARCH (ep9312t).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-ep9312.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 11fd266ba0..5e1a0e5791 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -8,6 +8,5 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
-# this tune does not include TUNE_FEATURES_tune-armv4t, so there is no armv4 TUNE_FEATURES => no 't' in ARMPKGSFX_THUMB
 TUNE_FEATURES_tune-ep9312 = "thumb ep9312"
-PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312"
+PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312t"
-- 
2.25.1

