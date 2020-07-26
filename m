Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.26537.1595758684350348434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 03:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=KMkOv0Dg;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id y18so7417922lfh.11
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lT8qjEtAsPWD+U24ZW1vRHTXCIxLzrxpdZT33sk4X5k=;
        b=KMkOv0DgOTqfJMnFzKpmFLihfo3//2ceDNp5UNukCUkcJv8miqaGKIS9T24mQ01bxJ
         dRoK/vFGGxkpWJJP+e/4+6WO2ugBg8iXJtTU7MQRdDhknht6+jNFRtV9ip13yW+9aVGt
         WSBj6Nk16BWNKDsB17G9zqbloQYo0moErzeCyJuBlDjWtoiro8W5sbZs/IogZe/lAulQ
         i2kUDbgHiRkMugZ3C6GEyTXzqWqnEHSg5JYkDlIxBmf2CZ4PopSnjaqcLMaVdV/xNRXd
         YIKJf7fvU9fB937Yo/Oh5uCyt2TZtW/cLsqybZg/lBQPOzREtPmBkTjCo2RfpP5zx406
         dX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lT8qjEtAsPWD+U24ZW1vRHTXCIxLzrxpdZT33sk4X5k=;
        b=bffWRsklb/nEBSmKKZX7l9GTo/8xdZcIrE2wCjZQxoWi7dcaDIE9F8/sQUzLJ2nRGd
         PKTahRHNf/vJU56QTayaTn6CBTsqcwpWqV/ZZ3PFSA1AidqcAjE6o7CDOMLdz0fQicUL
         J7qEhOJ0EO8CE4oHzZaYJDnaE/twpJ1YWX/dl9wrK8NLNAcDC1pIHug2OGAJzFXIspm5
         6bbjclYqM4wok8czNwG9Vu3WZvh44BYtwsWzp0ebii/TypWe0MSm209nAbG61sFpc7Qz
         o2kRKyEjmvhbxDffig5ume8jNjqYBRO21JePg04Q/qrV/0a+4MpmHHrhPksGlyUc8AV4
         f1Nw==
X-Gm-Message-State: AOAM531kRiwb/2h2eHGZMtTOBeY45yrAtz+gd3Sk6W4vPGxSe+y4ZR4T
	FXQECd3hcYUJ6Wcz0V8qmXJxVMazw2c=
X-Google-Smtp-Source: ABdhPJzw/Y/jWAGtS4cCVB7ZaigTQttMvhcxRz227xOzRP8MDQQ73ZNUOMGPH5chBB+Knzb5eWAlUw==
X-Received: by 2002:a19:50b:: with SMTP id 11mr9495229lff.154.1595758682106;
        Sun, 26 Jul 2020 03:18:02 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u21sm1416333lff.91.2020.07.26.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 03:18:01 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libhandy: update to 0.80.0
Date: Sun, 26 Jul 2020 12:17:59 +0200
Message-Id: <20200726101759.3991490-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libhandy/{libhandy_git.bb => libhandy_0.80.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libhandy/{libhandy_git.bb => libhandy_0.80.0.bb} (89%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb b/meta/recipes-gnome/libhandy/libhandy_0.80.0.bb
similarity index 89%
rename from meta/recipes-gnome/libhandy/libhandy_git.bb
rename to meta/recipes-gnome/libhandy/libhandy_0.80.0.bb
index 64258941ee..056d9659d8 100644
--- a/meta/recipes-gnome/libhandy/libhandy_git.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_0.80.0.bb
@@ -3,9 +3,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://source.puri.sm/Librem5/${BPN}.git;protocol=https"
-SRCREV = "7a193d7692c9c76a1a94f17c4d30b585f77d177c"
+SRCREV = "b61eefde06040703026f49a0b979588e69f77d3a"
+
 S = "${WORKDIR}/git"
-PV = "0.0.13"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-- 
2.25.1

