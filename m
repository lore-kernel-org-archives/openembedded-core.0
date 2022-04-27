Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1CEC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.5857.1651048829201595562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m6pLGtGL;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id gh6so2048074ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2S+ICtkcbKw3MtWaIbk6oJeb3BYfjou8hFd7P4w37PM=;
        b=m6pLGtGL0OI3kOW4tsEIqha3pg8wAqVyZoXUhaRF/X212KXICODPXA9uItfuXWT2IM
         bEQjFuZOKdGony3xV9r3BnbpEYuCk6hwPR0w6VOyurtmjCQMrkqtd8UEDiDKYPb60Yk6
         Cr2dN7ZNV2nAqWMkCtA61bAa87Dq8++S/Wbi012gtzbXxJMenheWay9FqZU0QN5iqwZo
         CyykW59mM8Wo2IGqHHjekCDDmzOdVRfz3QrmJR/MVBUVWSU1LtsYDyy0FAdoiS1WSogu
         smaNXZiJIoLTsyd7qqzhQUJ/yY+ke95bWA5Cwu7hChCsD2fuLYz4UC4lw0MPw2HukOSf
         IpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2S+ICtkcbKw3MtWaIbk6oJeb3BYfjou8hFd7P4w37PM=;
        b=Ss/uYnbTmWyZ1A8UimAVSFNcwKu+ss32guc6YnXY4xC/jmtVdGBylCid9CczPuttPe
         VpvjY/GKTw9vm0Jeg0IouLgXzImLclyrNT/QhVTC2YnaUs0fmtTZZO9haiGlIGJe28oo
         8OhqBGAz7oOiQ2nzWSHrjRng1+QXRKiV/v6qqhEx2fgyb2mgcifu1vlcTu6RP2ldBP19
         PdgPGz8a4uKvPrblIHgqBe0qiLEPbYvHYGiPZ/tnSNWAqJ/3eEBJjTRZcd1twsz4UWxQ
         ++b5vDnytO4UWSVLKFaI5KVphNAh+sWJvlI7L2ag395P3gVNdvYqxsAs064khNYaaslj
         teQg==
X-Gm-Message-State: AOAM530ITqJrvWm9zua8mWODNHjSEeL6wINN2fxmp7kQZKJ79hCJZ/6+
	CXC+aLM4VwWdxIkwG9Y4TRMoi5FIPIM=
X-Google-Smtp-Source: 
 ABdhPJyfQngFW3liFf0wUvEaEV2wqj/A/mzV7fQchNpQfg6faibJtRYmDPAujt4wnehBO04Np2uLhg==
X-Received: by 2002:a17:906:d288:b0:6f3:cb6f:428f with SMTP id
 ay8-20020a170906d28800b006f3cb6f428fmr1341937ejb.332.1651048827833;
        Wed, 27 Apr 2022 01:40:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/18] cmake: update 3.23.0 -> 3.23.1
Date: Wed, 27 Apr 2022 10:40:08 +0200
Message-Id: <20220427084009.3406717-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164908

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.23.0.bb => cmake-native_3.23.1.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.23.0.bb => cmake_3.23.1.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.23.0.bb => cmake-native_3.23.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.23.0.bb => cmake_3.23.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.23.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.23.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.23.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.23.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 6f6fa61cdb..934d577acf 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "5ab0a12f702f44013be7e19534cd9094d65cc9fe7b2cd0f8c9e5318e0fe4ac82"
+SRC_URI[sha256sum] = "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.23.0.bb b/meta/recipes-devtools/cmake/cmake_3.23.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.23.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.23.1.bb
-- 
2.30.2


