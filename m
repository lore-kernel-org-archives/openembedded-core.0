Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.9095.1622042547443823310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 08:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W4ZVBgxN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id f22so1216125pgb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2+0hoiUORhSSKgFU2acfCZLLuhVD/rGDnnysXnEfoM=;
        b=W4ZVBgxNihqLZmkSBgmJ82bZZVhJmXrgkFMaNnZZm3V+cYAB41TO/gAVzOdHkuiR4R
         u+7jd030L0eFC27IUAqYJoFdyPdGQmtByEEJgQEjMX60ekATQATFQal//Hwtn4oNE/gp
         NklZAbHCkTeADwaD8M+CzIsdGo3HHOFf3lPkl9UBCax9ciuqPx4/wMUNfFLg0SnHmacA
         85OZFQ5fnrgwqn9nxgRVRffnxkwtQSuWFwWKwASFaX81mTwORtA8GlBSHvWd0mhri6eH
         OLP+uLqlfuXQztvna2KNqJGnZF7gHS+GiWptS6GL8vjIrEeM7kpxUmc9o6uOLSivjO4T
         eBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2+0hoiUORhSSKgFU2acfCZLLuhVD/rGDnnysXnEfoM=;
        b=RYdWEOwoETVewm8khhYZ+uK9eZU6dB8yvBVqbxz0rutcY0pwTgR68X11tIo0VIKWSZ
         P5n69+aXahnNDmRzNZEP6KAhyIm326GfXJnAoWaDvb3GmKpkPz/ilp6eyHAaNq34WiYR
         BnXc95GHkGfnPYt6uhhmZl3UnN3rDsjKe/9ZTJB6OoA/A1Fv/QJPWek9N0sfmmZlCmhq
         mPUtFyzOiFotgSykzRpuEYotj775ShgfgEg0XyZRv37jU2a32wRAgdfOsr9nZmZ2taLr
         PgttmM2xIDj5uZGgaAauCqRbQNbFJitmdXTRH4FgY80cKqtsyVHcd2FK2cgoab1f9dQ0
         jZNg==
X-Gm-Message-State: AOAM530w+6lJAHz7vJ0jEoicxymo53ZIOVJUyRtbTNhWW+g7sSkB2yKs
	593X3NdVFmueiMQAyD1s9FQDOrV1KV16xvOtF3c=
X-Google-Smtp-Source: ABdhPJwMVj2hWHEh0IjNLdIU8Zd9BQtHXt2vxko4Aks9MZuh8G4Pj5sqif34fKUR3Mif8mzweNJPcw==
X-Received: by 2002:a62:3106:0:b029:25c:cd66:3be1 with SMTP id x6-20020a6231060000b029025ccd663be1mr35670185pfx.29.1622042546013;
        Wed, 26 May 2021 08:22:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l126sm17446028pga.41.2021.05.26.08.22.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:22:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] expat: set CVE_PRODUCT
Date: Wed, 26 May 2021 05:22:04 -1000
Message-Id: <20210526152204.1282585-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream database uses "libexpat" to report CVEs

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/expat_2.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.3.0.bb b/meta/recipes-core/expat/expat_2.3.0.bb
index 14d2855df3..b77b114fe2 100644
--- a/meta/recipes-core/expat/expat_2.3.0.bb
+++ b/meta/recipes-core/expat/expat_2.3.0.bb
@@ -24,3 +24,5 @@ do_install_ptest_class-target() {
 }
 
 BBCLASSEXTEND += "native nativesdk"
+
+CVE_PRODUCT = "libexpat"
-- 
2.25.1

