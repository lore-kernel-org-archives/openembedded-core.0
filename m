Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68985C3F2D4
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.30986.1654516893735839745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hlXOAwJQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id x17so19559575wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2gw+9/K+dpnOkR+jTTM1NF9iGQYOUamnTG4/FnkDL98=;
        b=hlXOAwJQWeJFW7pulWpuzJy9UARIpohQIe1BMY5sq4IiVa1qhY8Ot3ugC0sRSAR1eS
         MaF2t+OZz79p0ebA7FqlHToN5pYJ7HcrqjfxtWDDPgBw45brvh2Vw5B07SB/7QhEsbX3
         Fuf23nWfjDg+TTefb/rN+9vEUmGVCnIBW/jf8llNi9VDRLQV06W0UBkkcnvZik1c7DEC
         Vl/K3zXW6j/DSG2BZD/OGf9uhTxgyP6mxM4r/t+keWsKdz0xuiZDdvGWOuUsAeiLS8p6
         cQi3kQ87AHv62/y3n083v+7VyxXSxQZT3mQo+eyu+Zz7p0q4Nk7iDLyhtBjGBKva59+s
         GCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2gw+9/K+dpnOkR+jTTM1NF9iGQYOUamnTG4/FnkDL98=;
        b=ORRT/SUWbdTYVxExRJ62L6Xv4b1Iedw0KSC4n1LWPyUMi8wpwtIKySrzYyaldiqQAg
         ZSzSDb7SybCw1XhwQLDpzJNUbujBGEdD1oegtfuB0CO6nj1Mf1x2iRo9nrEKnR1ZGlaB
         DfDKXtMX5kP3Y4pPhWDx/E2RUiwKc49Ml+zHb5s2R7vSCrr28qmxnh361cQVpIxbaaJq
         0vOzQ6JanzsJ5gYii4HyRgNgIyNEelto5YXjH4YD7X6Vfey3vdP65emtqNrGAav+scaU
         me9+sD64ze1wzVvKXaMZy3CfC3UEPS83SbYthnAYk8lU4fektV97V6J/Jm1Th5t3f++P
         UP9g==
X-Gm-Message-State: AOAM5325eBnFHNXNDrEyLuIAubMi1xbFqiMW8REJHVZqbnEDrLsIaput
	e6jzJYyUoij+3t+e2WiKoem5waJ/7DhCXg==
X-Google-Smtp-Source: 
 ABdhPJwzTutXKJsz/M3NSrlV5KAt8wdOgwQElQMZDNBGaAcLc/zdzg1cYVQYC5tW1IWN3y/SeTVvzA==
X-Received: by 2002:a5d:4a4c:0:b0:210:27dd:e57 with SMTP id
 v12-20020a5d4a4c000000b0021027dd0e57mr20753328wrs.655.1654516903778;
        Mon, 06 Jun 2022 05:01:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/21] cmake: update 3.23.1 -> 3.23.2
Date: Mon,  6 Jun 2022 14:01:21 +0200
Message-Id: <20220606120126.3381438-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166608

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.23.1.bb => cmake-native_3.23.2.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.23.1.bb => cmake_3.23.2.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.23.1.bb => cmake-native_3.23.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.23.1.bb => cmake_3.23.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.23.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.23.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.23.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.23.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 934d577acf..4a6884e871 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3"
+SRC_URI[sha256sum] = "f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.23.1.bb b/meta/recipes-devtools/cmake/cmake_3.23.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.23.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.23.2.bb
-- 
2.30.2


