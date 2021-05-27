Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.8772.1622130495723160058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 08:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nSPwBsEw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id y15so862048pfn.13
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7+b+8PCyKGcxB3GiamV3N0I8JlWwItf51tZpp+E9JvY=;
        b=nSPwBsEwt5H2lDeIRm6ljlHQ8YesRmIxFnCQ16ARiCeXUu2gyx3RXgufKCxAs2IDa+
         GHAULkbd3z8rBy00vnmU5e+22G7jzJwL+wunM1I5xW2NUJEmjjHEimQknUXbrxoYQIur
         I3wenh/fS3e5F2BYwyXSa8D6CwqrqYbCVI7tgikSH4sEdjGat7IL7SENQmSO1PCv/dR3
         ZN5ZYH878eaWs1a6lmh/Iw7i88+xKTeMcg4Hme0mGtuXOoojJ7PD16NEaiZfv0q5wL4e
         fxDKYb3ZAbnyfGcy014h6RN25ihnrTpgbXtaYullUCmWvgWqD9qBV2U3J0Bl9Uy4Fo1w
         tfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7+b+8PCyKGcxB3GiamV3N0I8JlWwItf51tZpp+E9JvY=;
        b=M0dLdq+/qWdBjWNytbyMqrjigosu3Ap/CMXD5ZwSxVAwwhnKQ4Y/d/F2MCYCvvIB1S
         +4B79epoC+IP2kyS4MtEh6ffYAtLcg9Wzcp1OiNevOjuk9/vPM2yXdnE3ObhpxhmPQ7I
         UHry0jatx9EmsrCFqMKUegslmcgZeBOoZxL96Zm0TYJ7To5ERo8JHLKU1zqkvE1I1O4K
         C3wtnmNWaCDFFAqqvRuO1H7R24tb1gCdLBQFdjGGrcfB0Z2Ny74OZtd67ogMhg8F627h
         ZhNYU+LOsB7QADtDSEF5sJwAQXmaY7dBoar5L5hb+4JR1pzauzr1bHZxYEpAEtQ7GWwa
         f6Kw==
X-Gm-Message-State: AOAM531J+ojh0etzo/gUq0Nplv7Pqi3DYxKc0LQIampQdjcZCF52IW0+
	bQ7o77tDbWfQbtERkKW3UMzb+PzvcjHTrxHGZAo=
X-Google-Smtp-Source: ABdhPJyxohtWpbA4iUIql10s+OOhQFIYHjzAkBM1eib4Q7glKUDiTAalsuL/Bl/sDjVBSj8/11+t4g==
X-Received: by 2002:a65:4289:: with SMTP id j9mr4262154pgp.165.1622130494394;
        Thu, 27 May 2021 08:48:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n19sm2286009pfa.97.2021.05.27.08.48.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:48:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] expat: set CVE_PRODUCT
Date: Thu, 27 May 2021 05:47:59 -1000
Message-Id: <20210527154759.4084611-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream database uses both "expat" and "libexpat" to report CVEs

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/expat_2.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.4.1.bb b/meta/recipes-core/expat/expat_2.4.1.bb
index a57fc1b23b..451158a5d3 100644
--- a/meta/recipes-core/expat/expat_2.4.1.bb
+++ b/meta/recipes-core/expat/expat_2.4.1.bb
@@ -24,3 +24,5 @@ do_install_ptest_class-target() {
 }
 
 BBCLASSEXTEND += "native nativesdk"
+
+CVE_PRODUCT = "expat libexpat"
-- 
2.25.1

