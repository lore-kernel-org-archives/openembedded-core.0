Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.644.1612377612625165202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 10:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Pf6ekfUG;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id a8so614704lfi.8
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 10:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EFq1/qxtxuxiQqWJWVjEOSK7fDvumyb2X8mFsrmvCI=;
        b=Pf6ekfUGS7ijEen5dHbKPMRPoCJVQywgID+tKXjZCWTGaSFRNXbfLKSvq4FqYiYhg2
         P0M9g1IrGb6uh958xlmCJK+HSTgHx1s9XWokYRAa/9dDHAqBnQVzc3G2evPFEGXd5B7Z
         K+BH89CvdKmUr5wdbjMSHB/umqfps7svc/HVz7OEk8s9aiFwfBtnMyLHxaGwLuJ1KpvJ
         GGAbvnzU2voDxRPv1n5EmdVJfVMW9ymTyTXGdQJWRxnaJsTZSXHzpqf9Qr6Wcsl+vsir
         5HfBtXG5haYCvr/0AU6KC/wW7kNJ7iUwLfF29QClm0VboMFZnRZUoh91seVRnmtkL5XX
         HAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EFq1/qxtxuxiQqWJWVjEOSK7fDvumyb2X8mFsrmvCI=;
        b=huDqN8ycARDnIprIFRLNdtV6qnoOzp4NnRS59Pp/20h48adpE6yLAbnLyR2VG5lb++
         YiMQaeXilMkSlwp3WKUFvKCNr4HsVMbtMHkcBualx0PvRM44kuJ5f70ZXOF2dC91y2zR
         MFLeagYJ/KUGh3KdoQm22Spuio1JU/MxdkCRWiFQstV10YURv++0flrBio9uMXJqwRre
         xDgZMwe+5jxqyQH7AKyvzZy6HPVGRgLDUhqUMc3aESe6HE0Qze+hXCZNLu/J8s5BoR3K
         vidHoSnzfEEW+T/XXtUTWj81YbLCFgyj6n9t+ALwz6s82v0yR+cEX17gebRV/0ia1Otj
         ZBvw==
X-Gm-Message-State: AOAM532Gk/1p9HFWg15AX5lNFEqbrvDp0W3fZqGP5+9ZyzJGgkQeO5lz
	iWUfhBB/hlJ7uDAk9c9HQRxfK/Fhx3LOUa71
X-Google-Smtp-Source: ABdhPJxK6PK0rdA978aQTcSNVsM2G2Bnx8nL6iLsutLgHIgOuViAKKFc2eU69PRF68E27YXCxNprrg==
X-Received: by 2002:a19:f00b:: with SMTP id p11mr2415622lfc.379.1612377610371;
        Wed, 03 Feb 2021 10:40:10 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z25sm336340ljz.10.2021.02.03.10.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 10:40:09 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-numpy: update to 0.20.0
Date: Wed,  3 Feb 2021 19:40:06 +0100
Message-Id: <20210203184006.1152203-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License file diff:

+ Files: doc/sphinxext/numpydoc/*
+ License: BSD-2-Clause
+   For details, see doc/sphinxext/LICENSE.txt
+
+ Name: scipy-sphinx-theme
+ Files: doc/scipy-sphinx-theme/*
+ License: BSD-3-Clause AND PSF-2.0 AND Apache-2.0
+   For details, see doc/scipy-sphinx-theme/LICENSE.txt

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-numpy_1.19.5.bb => python3-numpy_1.20.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.19.5.bb => python3-numpy_1.20.0.bb} (92%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb
similarity index 92%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb
index b619bf6f32..8d348d85ca 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e527e2a94c4584cd192d03ffb1f4a744"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=474c7e8e97b80fb7500de2b0c4a4a8d4"
 
 SRCNAME = "numpy"
 
@@ -10,7 +10,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "d1654047d75fb9d55cc3d46f312d5247eec5f4999039874d2f571bb8021d8f0b"
+SRC_URI[sha256sum] = "67b630745a71b541ff6517d6f3d62b00690dc8ba0684cad0d7b0ac55aec1de53"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1

