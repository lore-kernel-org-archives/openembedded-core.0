Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE80CCA48B
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.31124.1654516903771248854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FluSHx1/;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id h5so19608753wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzzwwRczujQSZ8zJ/eQRqEO3AHipd22SHS7aX5ON92I=;
        b=FluSHx1/gaVqX7hK//pW70AttbxVB/aEaC28gJWiNaJV+R26zb8roEPX+UcrfYxXNI
         n5/2a3D3MKjKXwFL662j/a81KuNN3DxRjIRzTND/hN2xCDP3K8BYhWtnNV3Ua23ZuJPS
         VpVFoZKiTI5X8GnZuW5ZuYGRKBywlIjCXkZ/Lo1viQDZr4zu6MqHTnhWO/wEZ1GG3Qt6
         /QL/NnLyD3d1eSiAbTTU8aF6fvQ3hJ79GmWvOUPsmutmgoRD8hT+rl4gKmqvH322uNEh
         YRlyYmU1o1nLbVz+Ds2BQpSyTvEHmFTQTRugu0D8uXpwWdRak+jdWzeu2TiiQbWlab5x
         9UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzzwwRczujQSZ8zJ/eQRqEO3AHipd22SHS7aX5ON92I=;
        b=TlP0xk2eNVtPFhr3xPWQbBgJx040LlZfJ325cTsOocDsg8e7+RsUQeW6Py84kEfkRa
         Y99NcXYme9FeDLTvRKm8KanUDjl49POT1fmQRDg0uwHuze6qWqnaaQTHMDf/IYoU3BQs
         3xDZgYsWxIsBputFXLACIytImRmBhejt9XPJHxxaVcFYiCsULFv78M5K4r9ZrvPeQZJB
         0KxLYyGp/UPEyL9/f4aD4Ko4ZTPbkrGkjHrhGwhu6CFB3VbD1QvxOz2v5MIPOPIvGreo
         75mzxgDv8r3dbnfP8JtEL0vF8Ow1SIYNJE9mpKGhpSu45ZMyKWJlgHhVQy9E2RBRLE3w
         7FlA==
X-Gm-Message-State: AOAM531Dfgr4DUpgWjsqdeSAJ79AsYX3tKr0ML9v/hHrC7pRT0hHtTTt
	mXcjDS35sWZr+avQIadFlcBCAQFrcYRgGQ==
X-Google-Smtp-Source: 
 ABdhPJyxiPvxv8fJoVC523eU5qespFrhkSYep2VQV6sHFegByRJsJ/JxOZzfkRClJeVpWNnQgTMmqA==
X-Received: by 2002:a05:6000:244:b0:210:cc02:889a with SMTP id
 m4-20020a056000024400b00210cc02889amr21795644wrz.141.1654516902084;
        Mon, 06 Jun 2022 05:01:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/21] alsa-utils: update 1.2.6 -> 1.2.7
Date: Mon,  6 Jun 2022 14:01:19 +0200
Message-Id: <20220606120126.3381438-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166607

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-utils_1.2.6.bb => alsa-utils_1.2.7.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.6.bb => alsa-utils_1.2.7.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb
index 6bb4e3158d..a78df2e112 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d"
+SRC_URI[sha256sum] = "e906bf2404ff04c448eaa3d226d283a62b9a283f12e4fd8457fb24bac274e678"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
@@ -62,7 +62,7 @@ RDEPENDS:${PN} += "${ALSA_UTILS_PKGS}"
 FILES:${PN} = ""
 ALLOW_EMPTY:alsa-utils = "1"
 FILES:alsa-utils-alsabat     = "${bindir}/alsabat"
-FILES:alsa-utils-alsatplg    = "${bindir}/alsatplg"
+FILES:alsa-utils-alsatplg    = "${bindir}/alsatplg ${libdir}/alsa-topology"
 FILES:alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
 FILES:alsa-utils-amixer      = "${bindir}/amixer"
 FILES:alsa-utils-alsamixer   = "${bindir}/alsamixer"
-- 
2.30.2


