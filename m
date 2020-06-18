Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web11.10583.1592494997420543722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=poBPtH/S;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.195, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f195.google.com with SMTP id x202so5468868oix.11
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rn73IWWhnEaMF0hOCUDVSOaePNuQvb4QGECfM1wNI/M=;
        b=poBPtH/S2ekoDAWhVxtUIXaifqr/TPWfhcFZPpJNL336Job5MCmNo5MNYCnI3zjNGc
         Ohk267XCYE7HDxoGQlYtHk/aAuG0bQXlsrA5b+XSJa7ZgU3xVrva8mU0BERwtExzjVBL
         z6UHmTJ4hQZ/XEHE/fUNEzd26/TRnSF8Sf7SDnLqouCSUzPwPY9z1CRS/L+duVsrBy1l
         MA4+Pl7m3cuhwCNfgmBW8LNXSVDSsO5Fy/a6M4leUFornQy34P1CguhBMfDi981zwaDh
         v/lkaobKhPmMo10W19tkR/1B3YINlLzIR/jhAEO4ZUDwZFnzvPm6vqjKUYD68jqGOUp1
         G9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rn73IWWhnEaMF0hOCUDVSOaePNuQvb4QGECfM1wNI/M=;
        b=Dde6obx50zZEotJ0WmAuIYXntwVpvIGviJMw4HLF2euYDdc4w0nIT5O2Z36ea6FNS5
         SbEsR9p53dT9ka6E4lYBWuhQRkxeGrsjPI3HzfpSuwB5XQvLEafIgexRbyIUwx/ZV926
         cWu/LrfurusWJHAm8YzW4bg7alwePC/QuOiyDNxHGMdyBMqYn4HljZGbO3sn4cA3fUUD
         nMX+Wfk60ZYMuouW+bHQPjSCY6obNkGaUPJiEZaV3LmGFCyg6nAUCzP7+7P+eT+SWz2Q
         C5YdkfsNQFRhyvn2o4wbiWR8fqWtPQVfDcLn0AXGh/N5ROjIQJnj91OnhfvEcYWr+IQX
         PtWQ==
X-Gm-Message-State: AOAM532jz+QqfIn59KsxbFiPxBaEsyd5OJv6J/XUKMvfEJ69L/X2rEwL
	/B0hsDo6sQ3gHyKGB1zYr61jHbv1xdzwPA==
X-Google-Smtp-Source: ABdhPJzhYsvDsjmE5+3/RGHrULcWY2YrdP8xvWJ3XQFl71hqzHJo/qcZyt0FXsWcX0VIou429HFCxQ==
X-Received: by 2002:aca:6c6:: with SMTP id 189mr3365272oig.134.1592494996347;
        Thu, 18 Jun 2020 08:43:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:43:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/21] acpica: Upgrade 20200214 -> 20200430 for gcc-10 fixes
Date: Thu, 18 Jun 2020 05:40:50 -1000
Message-Id: <71391aab99033f5488d44c097a25323bdf06ffc2.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Joe Slater <joe.slater@windriver.com>

Advance to version 20200430 to avoid multiple definition errors for uninitialized variables.
In this case, it is not enough to add -fcommon to CFLAGS.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e1df28fb0534587d4f9305eb163f497852df4ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../acpica/{acpica_20200214.bb => acpica_20200430.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20200214.bb => acpica_20200430.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20200214.bb b/meta/recipes-extended/acpica/acpica_20200430.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20200214.bb
rename to meta/recipes-extended/acpica/acpica_20200430.bb
index cfa9fec4fb..478be7f56e 100644
--- a/meta/recipes-extended/acpica/acpica_20200214.bb
+++ b/meta/recipes-extended/acpica/acpica_20200430.bb
@@ -17,8 +17,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[md5sum] = "3505ba6170b77db1399eae0e2a959113"
-SRC_URI[sha256sum] = "e77ab9f8557ca104f6e8f49efaa8eead29f78ca11cadfc8989012469ecc0738e"
+SRC_URI[sha256sum] = "fb807f1dec31664f972af37d213abf72987afe33abf68c83051e298da35d297c"
+
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix-${PV}"
-- 
2.17.1

