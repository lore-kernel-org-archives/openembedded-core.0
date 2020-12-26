Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.19188.1608974874898365906
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WwaWsajH;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id r5so5535386eda.12
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gxnqfEdkRhAAVuHNYwGzdRpILxaKnBVKf5CpntM2Pn8=;
        b=WwaWsajHn0B5zeEYIRv99XBlTn52uw1If3idR1isCzs1Ha7fo/BNIhaThWSYWkSTJ1
         zTZNhGL4/AV8XCPuUXj/wX/smeIiAwQE579FraVSKcECV9otrY8nh+BewOSGSojeEHt4
         ONJevp4wVCveFIcHD/pUPHZ6KDxDBKpwKkBRz8bsBSvgevk/t1pVZT0UNjR+37tyxB2o
         DQseYVuAAjNvETam3r4Mjwexn/TyR8JTcTXz5YOSvwoWM7QpJf+E88hnViJSCnCX1SOk
         4lVMIfwfqRkm1Um2eKYgaoYd2tV6Uwg5WIStBT+4Kck63g6OR+tbXzGoLDCD397SAB4Z
         RQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gxnqfEdkRhAAVuHNYwGzdRpILxaKnBVKf5CpntM2Pn8=;
        b=Qbp4Pzz50dFCt/DDd8j1Mimnda8WZLnXZUd6Jjexwz8hdVQ2LhBIZfrARCx1nhR2UU
         izZ/AGuddUa1fcNzVWo9xxQzA9OeilMiE3c4BJprL11BpyyudeHZKOqqFEJPiBGtuDwp
         uaRm9AXkr3WMZaZOiMnDRJBu1FpnbDgeN+PLOfnP+J1LGeUR1poFDwqN24KzDbfyu4k0
         /+gChhiiWkw+SQ3/B6/7IMEGaMzBFbD+VM3RfIxUHL74qyfvJqmB5hrl/M6rKyNBsNjU
         fQUyo959gqC3c7AsvROo5pxwcWkr2yt6f1X3K+Fwqjitccv7ZTouM/9jZNLuDIyyNSmS
         Gchg==
X-Gm-Message-State: AOAM5316dK0W6f6vXAvk7dDFFR0F9sKTLT9ixQJzq9v31JcTU1ZcW4Yy
	jbQP9BLLlcY9+hYUE1vTckivs7bzVjc=
X-Google-Smtp-Source: ABdhPJxl0VSrgvI6TMqDIw5QtA/VQkuHIkGEPrUCDzeG6VAa8dNdtDHtyT6QJETSd6R2GjjZJ2pRHg==
X-Received: by 2002:aa7:d9c1:: with SMTP id v1mr35071706eds.115.1608974873513;
        Sat, 26 Dec 2020 01:27:53 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:53 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/48] libpcre2: upgrade 10.35 -> 10.36
Date: Sat, 26 Dec 2020 10:26:58 +0100
Message-Id: <20201226092732.52323-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: email address changed
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcre/{libpcre2_10.35.bb => libpcre2_10.36.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.35.bb => libpcre2_10.36.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.35.bb b/meta/recipes-support/libpcre/libpcre2_10.36.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre2_10.35.bb
rename to meta/recipes-support/libpcre/libpcre2_10.36.bb
index 35c019c100..d8077a1224 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.35.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.36.bb
@@ -8,11 +8,11 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=a06590e9bd4c229532364727aaeaf084"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=60c08fab1357bfe9084b333bc33362d6"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613"
+SRC_URI[sha256sum] = "a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.29.2

