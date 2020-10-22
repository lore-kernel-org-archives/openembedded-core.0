Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.817.1603381940308449120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pz2L0Kbz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id e7so1372603pfn.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=i9PTOteHcBa5krEVD2FfceEQAK9kNWED2NaZNhI9CFs=;
        b=pz2L0KbzSQGEokyACBMouU1KYRMCSNgcmPWAeGG4dfvNoI1TGJpSWZHquQ5GL+STC2
         PeFORWbAmv65o9EbXfP+2QR4KxJ1AOPJBRYZExTTCl6aYYe4qyrO0dv3ekuE78j5/g5i
         y0ZSh9MOT0MYdb7vWY+4KHPQwotvHh0TX9LjhhjimQdr88DtcIUA6bGzWUzWrFmeXcul
         /D3hNWh6ihleL+70RUorZaWLnP8KG/H0wXjO7LxR7Y9Tv3ajlnsLZO8Qh6Abkl7KMnbp
         CrxMe9FFb8o0HogcC/2isS/WhPxerjAY6JhY+Ay3oURkHhbAbNvmZCtuMWJjr28codOr
         9vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=i9PTOteHcBa5krEVD2FfceEQAK9kNWED2NaZNhI9CFs=;
        b=IlW9catwRTBsSXzBEkxFI2IKRFPcaW/fqinu21faYC6RaMhDl/8Fpr4GshbKqbV4Ib
         YwAGsI0OUMD1hZlo0Qh0ESeVZ1qwlsrhmY7bjlrsN0BCgzx1fNWL6/j9n7cO18dkxtFZ
         wtEVHTjN7/BXUu/jiMd5JaDQtREr8KnD/rqM7+nwY5iQI/9/2ZaUHJhJgnOMlzkQ+M3T
         KkIb7hWmWSQc4xuPni5AQSGiL2+p+kjidgi13G9BJ2cK783+i9iLcnnEzwO3sgqDdjw4
         xgxA6mUyLLNcbewdw9eEdAkcCyaB5k8XbpSoK0x7kno5HSXFrkG/XMQ6pyGdtWNdrMy6
         rJMA==
X-Gm-Message-State: AOAM530SpD0MCohMWM2LcboWJtl6757RpZikoQRPfETR4H9pIT8Dct6r
	PvW5nIXWtfWylyAi4m33R0Ui57myizGNPvk4
X-Google-Smtp-Source: ABdhPJwSMphjNoZZnQ0Uj3XKALFkvymjQmXuMZhcj0aI70p7PXdOs+W1MBITZFRptdOokfzGUcENRg==
X-Received: by 2002:aa7:8d99:0:b029:155:36de:40fe with SMTP id i25-20020aa78d990000b029015536de40femr3159121pfr.33.1603381939115;
        Thu, 22 Oct 2020 08:52:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] arch-armv7a.inc: fix typo
Date: Thu, 22 Oct 2020 05:51:34 -1000
Message-Id: <96efcd0d1271d4f412bf7e59d048e84c0df9d46d.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* broken since:
  commit 594f8584268d5179c18512beada2bae4a21325de
  Author: Phil Edworthy <phil.edworthy@renesas.com>
  Date:   Wed Nov 28 10:09:57 2018 +0000

    arch-armv7*.inc: Add Cortex vfpv4-d16 support

    Some ARM Cortex devices have the VFPv4-D16, but no NEON.

* fixes:
  scripts/tune/log.fake-cortexa15.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa15) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa17.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa17) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa32.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa32) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa34.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa34) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa35.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa53.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa55.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa55) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa57.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa57) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa57-cortexa53.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa57_cortexa53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa5.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa5) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa65ae.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa65.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa72.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa72) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa72-cortexa53.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa72_cortexa53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa73.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa73-cortexa35.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa73-cortexa53.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73_cortexa53) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa75.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa75-cortexa55.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75_cortexa55) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa76ae.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa76.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa76-cortexa55.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76_cortexa55) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa77.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa77) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa7.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa7) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa8.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa8) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-cortexa9.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa9) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-neoversee1.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversee1) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-neoversen1.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversen1) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).
  scripts/tune/log.fake-thunderx.armv7atb-vfpv4d16:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_thunderx) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c01e2b1c68bad89c5c9bba5b731fd5da4435e5b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 199e63f98a..2bf3c89edc 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -120,7 +120,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} armv7ab-vfpv3 armv7at2b-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfpv4d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfp43d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfpv4d16 armv7at2b-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfpv4d16 armv7at2b-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-neon armv7at2b-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon} armv7ab-neon-vfpv4"
-- 
2.17.1

