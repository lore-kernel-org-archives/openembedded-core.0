Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD45C282E7
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.22244.1659940968760901638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hRP8j+tf;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id z22so10069544edd.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xBpa3TV6eUC/KniBvWaxNQ02Ykn73AHmC6rYlKnXvTg=;
        b=hRP8j+tf+TN9HRIUDWVt0OuUkj/yZtoMJOSma2jGVVPHw22M5gQfDqXHdZh7n1Ct6T
         SNGAXfUuhCTh4PgMIejr4y9HjI7iZ79Mlj7j6eq0aCuM9GBauN1/i1hvf+tTMbe0T8FA
         DQ9ViPND8gT4Vlg4zsPzU/nE8RP+03WWZN9AxtrQAn/2DtYujSvB4gp8WiZ2v0V9i/AO
         awQb5YGB7CcTq0ePG+ZNcFBA8yDYLBvFSowZ01GNRi9Ia579y+rZicyI6/EJETIoGhA6
         tCSRkcSRedaUnbYqu2d8MwCpbNdlc2G+4MXCd08dFfEtJJeK+uVJMVbVjjKKETkRNKc0
         WKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBpa3TV6eUC/KniBvWaxNQ02Ykn73AHmC6rYlKnXvTg=;
        b=FRYH/AnTUBcOijMhmJ088XeR4RKK/fV3rj0aC+mEeYyiNzU1iXertS3HPNCeTWcYnM
         n436gjsgFKz9gq7goGR+JJNOW50yvHelQLZKrqFCH/YvdESsJWa+XJRenCRzd+Kc/MiW
         RZp2MsyIJAUb/amvMAR0oY8aH3u3Calc9t8fW+HOYKrPzUu2wnwTU6Q681rcpIpc+fJ9
         vpIXbeldQACZZE50umKQOx/NSa6AS7a6pJu+0+QcXG851x+MzjoS56Hxfrvw2zekW9dH
         CJLZnLGIyl3GDlgrilTRmlNtTUNJdAMdcU3gEtRtgcmV/ckzGzrkRIRCg3Heh4d7mqx/
         LH5g==
X-Gm-Message-State: ACgBeo0s/6Wqd2S/kFOHmIIb7w3PKdYXW4c26fHiOPMx4NISziYXdW7J
	qUYG19IIRulf0n15lXoxdw6/m+KBxTk=
X-Google-Smtp-Source: 
 AA6agR5sBIBLEN1SE7D9l9ktsRAKIZUWIw/7oxPX+85NHe4Pz37qFaz4tTrckdCF3DdH1tYqs0k3hQ==
X-Received: by 2002:a05:6402:5518:b0:43a:9e32:b6fc with SMTP id
 fi24-20020a056402551800b0043a9e32b6fcmr17345594edb.252.1659940967286;
        Sun, 07 Aug 2022 23:42:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 06/44] cmake: update 3.23.2 -> 3.24.0
Date: Mon,  8 Aug 2022 08:41:59 +0200
Message-Id: <20220808064237.3975347-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169031

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 .../cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb}                | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.23.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.23.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4a6884e871..d64afffdc1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f2102a52df7aa592cf072180e7ebc8c7 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa"
+SRC_URI[sha256sum] = "c2b61f7cdecb1576cad25f918a8f42b8685d88a832fd4b62b9e0fa32e915a658"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.23.2.bb b/meta/recipes-devtools/cmake/cmake_3.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.23.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.24.0.bb
-- 
2.30.2


