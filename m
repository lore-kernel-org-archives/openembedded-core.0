Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web08.20402.1607112467418796400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rg1ZUcYc;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id f23so10466421ejk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lf9xUKUaz/gTM2LRr3jRAbVU/SeZVS6LrN9riZl0S7g=;
        b=Rg1ZUcYc4FIzWeuO9ACZ8vRx8WEvQp6B5+kA3Qt/szOKxpEcbxtlfFeZXTaXlta0Bt
         JXr61LRHEuRzmKKCwWOGdCtwznWuK8HSA96uI7d71tpbc6Dd2RkpgnREtgYhziAv8h/8
         2DuGoNJqD7MuGE2HFH+AmbqAKkCN9UsKa7gL/C5avGJ5QGNJTZAsoUw1WEbBFptmIVAA
         cDxVxejSK6D18N3GYNoJrDbovytFT00AwIFhIYD8UAwLX5MVF3Nw2IVD039PmYhYNiN5
         YXioK/u2m3rwEvoBKRJgMao52CNQhppPdzuix6ruMrJyxJWiNVH7y/T64nwZMkhA7qxn
         xV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lf9xUKUaz/gTM2LRr3jRAbVU/SeZVS6LrN9riZl0S7g=;
        b=Mt6mLCHx2w9yDvri6ZM3qUxtZRFnbtTL30i3CfG1cJ85YYsWCKemGpus8EV9Not8W/
         0LWWbo3ptc2t4YKngt/7ojjbDbgcFu9K+URR21qLiS4yJaC8DmOGBiccc+HacNxWZDHm
         bXRBeScVwShkWdrx5dJuRAYLdo1B172nKGuf6J8iz3CfPaVVhCpr6pbA2S2bsE/E0TH6
         qXWCMZky9ySXMlR9DraSejMCQmEWzE6PzumhxajUTJLocaWWO9BHWr55oFuiV3gfOqyx
         CjRH16uIVWN+WmHP3nZxRgk/bfNrw+u5MiP5GPKkaoA28lj9rUszWO2o+zUjCgsyOO3T
         dwgQ==
X-Gm-Message-State: AOAM531k7woVVnkZOBCpLPIWw9ZRy07TiKbhzM4m5VsWGHBCSy1RDrV7
	iOILa0SKBo6A8ho1scpjrEInyEVGOmEwDw==
X-Google-Smtp-Source: ABdhPJyouZw/MzSA33A5eg77lzDjUrZ6I4KELZ5b3Vt66fRMQ3aqdtrEjZwHmCiJvpQQWU+ZAwdMiA==
X-Received: by 2002:a17:906:cecd:: with SMTP id si13mr6574591ejb.441.1607112465612;
        Fri, 04 Dec 2020 12:07:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:45 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/23] netbase: upgrade 6.1 -> 6.2
Date: Fri,  4 Dec 2020 21:07:14 +0100
Message-Id: <20201204200737.7072-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not sure why this didn't inherit allarch, but now it does - only
static data is installed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../netbase/{netbase_6.1.bb => netbase_6.2.bb}      | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-core/netbase/{netbase_6.1.bb => netbase_6.2.bb} (65%)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.2.bb
similarity index 65%
rename from meta/recipes-core/netbase/netbase_6.1.bb
rename to meta/recipes-core/netbase/netbase_6.2.bb
index 33eca459d5..a54d2e7764 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.2.bb
@@ -6,17 +6,18 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}~bpo10+1.tar.xz"
-S = "${WORKDIR}/${BPN}-${PV}~bpo10+1"
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4fa7517285b4045ac0dc8dbf6730dd7a"
-SRC_URI[sha256sum] = "4e9c3082dff8896cb6b6bea9bb2200d82fb0d7c8d8c8fc9b18704fe553316237"
+inherit allarch
+
+SRC_URI[sha256sum] = "309a24146a06347d654b261e9e07a82fab844b173674a42e223803dd8258541e"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
-do_install () {
 
-	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
+do_install () {
+	install -d ${D}${sysconfdir}
 	install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
 	install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
 	install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
+	install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
 }
-- 
2.29.2

