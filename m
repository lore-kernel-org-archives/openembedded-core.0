Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.11400.1602840411317312636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WfOD4//R;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id dt13so2102340ejb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jE+0A1APbchjRkeY1xzztbe5s6uxAjGzxqGYrtX/G0=;
        b=WfOD4//R7HLgfqO/fXU0FWS1XoDBSx972xTQWa0ZDNO3k6alkD0fVBog9rZrQUiIHi
         XLtMjOGUs+png4x6nOJNmku/OjGXpd4V9liFog3WAmwI1m8wnZ1kKwxyvZ8PJZIVzkjg
         7KSXW+GRfIMwCg72IhXVzXIODHfCodtuELXPJJW1o6k4g2HBEzL+vVqByiGzelyIUZz/
         dZz7LP/zPaHmBqfX6TBt4a16xDU2NOJNJ1+eAW+hsoKGQ4jPpS43Xs9dFIbD97bBFWTN
         l3VIpIB2UiHBu9gObnU3r+NGTjFcnvUpgper84wathMGBFCaheYUMfR34TQWhFkid7pR
         flgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jE+0A1APbchjRkeY1xzztbe5s6uxAjGzxqGYrtX/G0=;
        b=n3175on1MZL4XzyMsJRwISO9CuKimSKnzoP9YmPCP+U+z2wAYYL5XT5zVn46e5Cb0J
         7hkgLrgaofDJdjr5th1W79cfp4idd/McWYyUadJSEJGtYUYkolX5dhs5t3BRzwaEig0t
         YKJM0zYDKtALLbJuJ4dtpThWGU26s/GeeqhAK/Jnaz9uj0zJ8Ey0xOaXmzu60UXq/vQi
         Ad7wmqubn5ra1qRKadGqoyVBIXY6/n/U7NPUzpqKJmpJTkPjC21Yj5tnmG6gZLFe5jTX
         8bKAM10K5B0tMRd309kJodhCUBmhNpMg4mt0Psd8n1cW1hOi+P/xB9/zHV8cX68eIkE3
         R4Gw==
X-Gm-Message-State: AOAM531Oh8mxZToncQRwsTj3w0sbiIkWepASAhlDldmsbU5Aepz+rvMJ
	Mhkqd9aFIrtl/u/HM+5WCkKqXxRoME8=
X-Google-Smtp-Source: ABdhPJx3U+f5+fvqw/WJprzyBRc1laC96dIX0zDl2KvgmdgCMBW00qaS9SyU/f6ooMvlh2XsO1r2gw==
X-Received: by 2002:a17:906:1c0f:: with SMTP id k15mr2604423ejg.343.1602840409274;
        Fri, 16 Oct 2020 02:26:49 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e5sm1155708ejb.26.2020.10.16.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:26:48 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] arch-armv7a.inc: fix typo
Date: Fri, 16 Oct 2020 11:26:39 +0200
Message-Id: <20201016092641.3860384-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 meta/conf/machine/include/arm/arch-armv7a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index d795b867fd..ce87af5306 100644
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
