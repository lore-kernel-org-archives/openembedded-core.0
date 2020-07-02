Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.3334.1593684568626159664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=GCxoe4vB;
 spf=neutral (domain: kynetics.com, ip: 209.85.208.66, mailfrom: jacopo.dallaglio@kynetics.com)
Received: by mail-ed1-f66.google.com with SMTP id a8so21809777edy.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdmivNlsBbzd5OVj9eapEm8jaY6EYeRnjoteXNVB6BI=;
        b=GCxoe4vBFDI7kz1EymIuII9vNw5oUmmijNaTnfdnqYtLF5fp2277DrrDdzgTjU/j5L
         FbJgYVsmZl7s0lyc098QyzFsy3fYf7MS2JUm8LuSnyAbhU3+kPVrbh9B6h6JDWQbHeEw
         tfYoGsUugg1okwdg4mVGKEjS/1Ur2RBNBmGpXX1khKhhXkz7Mipe9iUFoj5SfHmOPKFM
         6Qcx13SRVSHdkSWEbxlrvmJv68zyhM7BN0bCQ7uT/whTEoyZVCnYIW+FFT8Wi5P17d99
         OzTr2z2VcGPqwBzqBl70K7DYTbsAeNZu9oenXYp8G7eDcQvBAzsnXR8Qrwf+CVkjJZz7
         V8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdmivNlsBbzd5OVj9eapEm8jaY6EYeRnjoteXNVB6BI=;
        b=OYQ257MHEa7UPWm1cyvqwtDEXYDovN+Q4+MxfW1HVPxAPPFWASZC2MFVsgRzOBAKNH
         vOQ+JZIthMu8SVQRmFCPmIm6TTkuOLF41rpGZ3/6cVQOAekcloOueJwHsu/QeVqJKJgm
         Q4+ixva2aoyUyVoA2ZGcQWdTMzHciqBLrwX72PbFQMuXfs5zAkUIYGlf7EsIT2HA36J0
         l2t6xd4yPCBAxWN3v85RoYNHBeKUj8wpcjglSzwWHS0RCvixQc8v7TwT4QT5Twq00KB8
         sr+USVZTgqAalAawHUIVHspoMcfbGjateTma3SkIRwnQByukldF6luUWBGeIO61JCWWi
         h0QQ==
X-Gm-Message-State: AOAM530din8zpgS/g2O8DRm5XaSHf7GfqH2y0CgzoDV1fQAi7s0tcxYZ
	xRDsTeLSvfxJNxB1yLn4qwcQrVzvjg==
X-Google-Smtp-Source: ABdhPJwZbESjWhEBFqzz/lieaWhnWOZuQh3PM1+XcbZwaGbvLm5wuSU5+ThPaNPauhs9YIDv6R90aA==
X-Received: by 2002:aa7:c3d8:: with SMTP id l24mr26848231edr.97.1593684566882;
        Thu, 02 Jul 2020 03:09:26 -0700 (PDT)
Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from localhost.localdomain.home-life.hub ([176.206.86.212])
        by smtp.gmail.com with ESMTPSA id a25sm8609559eds.77.2020.07.02.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:09:26 -0700 (PDT)
From: "Jacopo Dall'Aglio" <jacopo.dallaglio@kynetics.com>
To: openembedded-core@lists.openembedded.org
Cc: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Subject: [meta-python][PATCH] python3-libconf: add recipe version 2.0.1
Date: Thu,  2 Jul 2020 12:08:33 +0200
Message-Id: <20200702100833.460957-1-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
 .../python/python3-libconf_2.0.1.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
new file mode 100644
index 000000000..80bc59d97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A pure-Python libconfig reader/writer with permissive license"
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/Grk0/python-libconf"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05f696c084eaaf5d75bc150f70975758"
+
+SRC_URI[md5sum] = "e212611cbf6a696e05742a983b3a0c57"
+SRC_URI[sha256sum] = "2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.4

