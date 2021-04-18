Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.8990.1618733798234336465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 01:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vAP6hrA4;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso989508pjs.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JvmzZ2E/Zs++CLEuHyp4bguwea1XCJiwgZ6/xrQBx/c=;
        b=vAP6hrA4Jd8yn997oSxVt1OpVUwU5xnY3EtfigRaRwCcD/hcWVaEIifpwW3q3SAwK6
         0ePuy14Fgbr4Jm4Dxut9l5aDkWQM7kUdPWTc3LBDThS8qBIVBUPECjIJ/yzgP9TM36b1
         5VJskKjyi6ke5ShuP9T0XmfpKNJIzCsuGN5nREyebtU098znDSwzTaytRfnxOHzjYWBF
         7K/rppdf6nUfukXdOFi708SQitdMuz6EoasxsdSjGOWyVGn04ykEO/WFtaNXfyCOqIbQ
         a8g+CRYo8c0CgEvELrw6Iep/gQN9v7qGNLr6LbqAI51JNLAcxsPxas/bwA/ARnrC71Rb
         W+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JvmzZ2E/Zs++CLEuHyp4bguwea1XCJiwgZ6/xrQBx/c=;
        b=WNT+xIrsselZbCNdPj0bWN2Yk3RIyS5TK2F2VT3Nc7Qkq8cN76pubWkf6rh0d9cm7U
         SriDBlwA7HdNkhWKq4+Y8VXiSVEq+2dvdfh/ZSCOkrHpCjoqJlJRFFCtx/ln55sokRn8
         8Ie7qVEiuJzd/RnP7WNAGJoJhH0D/MCYTS1Mxej7f0WqoUmaL8Aw1cn3Slq4BEVwNmnU
         MqTpRbMmlWeHLJo+XIik0L07Dxi+cOPKPToQLclTD+BjtJ9864cilAstgMFHZW98NFGN
         Fftbe0qXYOqW41MrBSX5g/FAaxSFIhh+thInYyVUhKPmmsapXmkpxFhsOlpXdLIDCmAH
         0W2A==
X-Gm-Message-State: AOAM533y/pm51BOHA36F5d7k1xyhNmxK58dcAMiQ7wpgTADz8XhcxcLy
	Pycuhko+t7LDyyrwykpHo1PCqwXY68vsLw==
X-Google-Smtp-Source: ABdhPJwTrqKIkytL91s8i4sB0dSDBGD34lcT3CWXo/EQ1H9MGMkaB8HTpZis5uDbrSwdudbg4m2j2A==
X-Received: by 2002:a17:902:ecd2:b029:ec:9199:7fef with SMTP id a18-20020a170902ecd2b02900ec91997fefmr4887565plh.22.1618733797382;
        Sun, 18 Apr 2021 01:16:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id g2sm2339211pju.18.2021.04.18.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 01:16:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] cups: Turn gnutls into a packageconfig knob
Date: Sun, 18 Apr 2021 01:16:29 -0700
Message-Id: <20210418081634.3169548-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable it by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/cups/cups.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 244c87001f..9faac08104 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -6,7 +6,7 @@ document types."
 HOMEPAGE = "https://www.cups.org/"
 SECTION = "console/utils"
 LICENSE = "Apache-2.0"
-DEPENDS = "gnutls libpng jpeg dbus zlib libusb1"
+DEPENDS = "libpng jpeg dbus zlib libusb1"
 
 SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.tar.gz \
            file://0001-use-echo-only-in-init.patch \
@@ -43,12 +43,12 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi',
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
+PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
-               --enable-gnutls \
                --enable-dbus \
                --enable-browsing \
                --disable-gssapi \
-- 
2.31.1

