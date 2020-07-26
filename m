Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.35792.1595792902679085328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 12:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=cUqU4kCg;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id y18so7824922lfh.11
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 12:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H6gsD4URgbDx4es515CWJm88FVlhX+TO+4JgR72b9lk=;
        b=cUqU4kCgg+03+OWjctcDep9q8OdDLHa2OYtTwiJN+Vz9baAQiudtTvbmSe9mUHX4sp
         FNXngDaC7pgucOVoDJjH/8hEIVF+j4kRYNb5T0Ah7lb+FnSiTMIawuthrmQifAFf4UZH
         3lsgh+JCh2QGQJJChNEa8bwbKEOBqxXD4vwxIyIlVuybQMLX8VaAZLtU6U0j/9P7QyPU
         eKNthYJ1QomNsxsN8woaM3ntQ2D+3Fo2jMboeqJ0Payc4eSYj4GHcHSbVSUcs1f1uIRr
         FHbKnvKR1yAB1aU1iXjbKGKM1e/JieHnMP5Gjn3js/V37zKJIDwGVrD83VUEdsLzOy1Q
         Uz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H6gsD4URgbDx4es515CWJm88FVlhX+TO+4JgR72b9lk=;
        b=JwmvBNwd3sl183Sx+R5grj022xiWUxRfXln/tRsc6RqD+c9HgLMacGx4B80MlWQHJ1
         koDarQHQK3ZDfCR9WoZ9QzgYf7k1mpHL2NAKeqCTSyJSuzibzuSxDV4ipg7k5ji5zUVN
         BDLlCcae1+R/Ukik07bfaSRkOZ+9fRxciNhp9UQBI+jHk3dnjcMWCMnSVvV1aalB50DE
         tPn2gOLa7mOPZJ6j4zBbWL5TLtalJnX8URuodXTjw83mpK3gUXZZSvuFHR3ZDILCEvmx
         PgfDJEh2KtV7vbnRwvzHOwEANwak6DdLVbUqt+pnR44wFF/9H6OFbR06/9KCLhvdJHIB
         nDqQ==
X-Gm-Message-State: AOAM531FDRXRrAlRDLI2Rs1kvCvkUibaKaCJ/sUWyvlTOUpRcUi+innj
	wCo6TER8aa+m/AEKCx/RLQGr8Tkw5s8=
X-Google-Smtp-Source: ABdhPJxVKgPpd1lqhz4kaPshQbawOsc2Fe8hyjfNCA+AstHCL8wganOODtexuis0HusPP//YSqnmZw==
X-Received: by 2002:a19:c894:: with SMTP id y142mr9586148lff.74.1595792900042;
        Sun, 26 Jul 2020 12:48:20 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id t205sm2527763lff.8.2020.07.26.12.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 12:48:19 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] diffoscope: update to 153
Date: Sun, 26 Jul 2020 21:48:17 +0200
Message-Id: <20200726194817.383742-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../diffoscope/{diffoscope_151.bb => diffoscope_153.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_151.bb => diffoscope_153.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_151.bb b/meta/recipes-support/diffoscope/diffoscope_153.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_151.bb
rename to meta/recipes-support/diffoscope/diffoscope_153.bb
index 9b39b44350..77f5254aec 100644
--- a/meta/recipes-support/diffoscope/diffoscope_151.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_153.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f15e04aa537f0a3d91c99bf631c604668f4eea8f6552c5f93ea9be2bf014df84"
+SRC_URI[sha256sum] = "b5104b5e72252df45ba6b7cbb0169e2e3407715b6b063fa5b38a2649b0d719a2"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.25.1

