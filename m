Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.5871.1593072117759479805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 01:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=uljcsHQ3;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id y18so2684697lfh.11
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=9U9ZhzP3bHOi4BOHtJc/O3HXlKol5QZ9OPEXM5uDC50=;
        b=uljcsHQ3bziTfvl7Az3i47+xeuBz59/fADdfhqviXBGQHkhK/Y1yOcVFA2XnlEyAZI
         NVmx2wVoR5JPjbR6o3cwfCPnKpacNSgQT0NXgsqC9Ps2YHULwOlIcL1seERGcONXaPxD
         6t2MUFo7b4lCyXF4G44XzBiMOKw+4FFNEGO2zjaEs5qpzRcMm3xEtHcbwQBrQF/ZlfgA
         8eWSxtS1x0ZCugPVwbT8iZBiivLXvAdV5nZTU/SjhsKKz5HtQ+v4eGksBIF7yCaPr8cn
         zSWtSBePjUEvhl7aOYIHuNTk57w7dh6mfn45GX6KTdW1Iy89bUT5eToB+gxEJp/Cd4VH
         RFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9U9ZhzP3bHOi4BOHtJc/O3HXlKol5QZ9OPEXM5uDC50=;
        b=I1W+sRChJCPT7vwGogU6DOQInG7hrZR2tKhHX6kjzw5hEfeNTGACoiEQPUCTdHb96J
         77rTKCKaoBWHqly3dkI9d6wxDOZWnoohqIBdy5CCzw3A0WWbiE5cOxtZjr+JC2KwlOIq
         5/S5yyYLDB8FT6Rffonsz7jvftF/cs4nJcBbnkqzqsmoJBfPhQUuI3MhpTx3NfkF0coK
         jghil2fZdLlZ4qQIJ2x2Mjw5kdACxS2d+4VdzCICAT0AKtbF1gGUg8i0cYlzhkNS3U50
         VCovOFT4SG95siW5yxIa0wJBYtYPfUN3BFlMbXBwfSQTgM0KCw4PF5oeQiyNJsVilP29
         Lr2Q==
X-Gm-Message-State: AOAM532vfh3a4RaTH257yYT/S7IFuNQKXRroo4ecknZts/X/lM7g0LtV
	OUD5F0Oj8pIBm9Wd0tqMXS8RapAiDmg=
X-Google-Smtp-Source: ABdhPJzlERyvOiy4HkrqZ4Dyhwy1HBqHIyxsaGRHhESDLUCfs03mTgYSU4zi2qOA1S3F56u2+MpAdA==
X-Received: by 2002:a05:6512:3089:: with SMTP id z9mr17569955lfd.83.1593072115486;
        Thu, 25 Jun 2020 01:01:55 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id l16sm4648957lji.138.2020.06.25.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 01:01:54 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-setuptools: update to 47.3.0
Date: Thu, 25 Jun 2020 10:01:51 +0200
Message-Id: <20200625080151.27885-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
 ...hon3-setuptools_47.1.1.bb => python3-setuptools_47.3.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_47.1.1.bb => python3-setuptools_47.3.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 9322ca9a05..9eea54d5ce 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -12,8 +12,8 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[md5sum] = "6e9de90b242fdd60ef59f497424ce13a"
-SRC_URI[sha256sum] = "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
+SRC_URI[md5sum] = "03918daa0284c622731d9be84762124a"
+SRC_URI[sha256sum] = "a9acc877163d829a561c7c379ac76451154a32a361369593c91a2d33cf1295ed"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_47.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_47.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_47.3.0.bb
-- 
2.17.1

