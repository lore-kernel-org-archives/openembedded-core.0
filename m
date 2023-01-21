Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3E4C05027
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 01:23:52 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.2416.1674264231722348757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 17:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aBZUxdES;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so9777559pjq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 17:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdilZkwx9lD/SiXvR35KpaRBcHiRTDtxQhx9pJckve8=;
        b=aBZUxdESA+Zg2WDUwZc7hxHF/9/JMxQMfsc+oVJW5wPu7lyu4Y5pcgxpkH1xqNDlTm
         Vjn5zsCcrzwYKre5adh/+ZpZG29RlwLZyYc6uywFxKbHYzEJrn4bTPuvyIIqi72zkxC5
         AI8McxdeQQuGvFLavnjbEpIw25p+RajLKZzsqmUlcaxGNDWmvRR6e+QTmtvFaqkKjOFI
         sPafWg33zMZ7TWZ9Om2l7dBl4h+akdL/MWi+0YpqZFp/56FyhwB8qYOduYyuKFCNLtM1
         c3xql0gKmtm445mijhvSK9hCi59bP4CUQKgGbB2Tw1BPOv6AIe42QUCnv0w4Z/1RsGdD
         T04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdilZkwx9lD/SiXvR35KpaRBcHiRTDtxQhx9pJckve8=;
        b=PuP/cLhzTsB23jLK2rMPL6k6R66Yjx1bCz2PfGRNCD25sHW/roLd2BjZGjnpYuJ8ZM
         Ku2wTAxt1s9J+QkMcAFSrHP/HaPPaxo1cdrwlfd/WljF9KQc/y1klQfkGiA4F9VgnM1/
         JHcRVvVnxHsr29kFvrnjOo7TC5v+In3Ioup/COYLDSGa7Lo+pRp+BBzUoHFj477K9YVT
         9SWJoQjj+GwoiGoNRJw3nj87scHo1V98XCwKdAxeRFBCEAp+NWGGg1/hty4JcZkn+srS
         Ulu7HT65kLXQuVVF7Zz31qrsyuzIBJJFjktTyJo/o8Q1a6bqRiKsfeTAvyVbXHIDBjJa
         iKfA==
X-Gm-Message-State: AFqh2kob+5tVh9qlCpyY8/A+ieOE8XMcd3PR18xQ9jBCmgCLmYooVAqd
	k5wgHIdQhCWFOlhFTnsSbgfYCu42h5cp6Q==
X-Google-Smtp-Source: AMrXdXsngFEVZTgqigOeFvItKyAe8bVZIZy47qwBgYKGoxEsKjru3o9uzhpewzf8zNRNODyumMjaZA==
X-Received: by 2002:a17:902:b602:b0:192:7f35:90ed with SMTP id b2-20020a170902b60200b001927f3590edmr16829268pls.11.1674264230681;
        Fri, 20 Jan 2023 17:23:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902bd0500b0017f756563bcsm14229235pls.47.2023.01.20.17.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 17:23:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libusb1: Strip trailing whitespaces
Date: Fri, 20 Jan 2023 17:23:46 -0800
Message-Id: <20230121012346.2967570-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121012346.2967570-1-raj.khem@gmail.com>
References: <20230121012346.2967570-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jan 2023 01:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176254

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
index 301e60c14f..122c3d48b4 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -35,12 +35,12 @@ do_install:append() {
 	fi
 }
 
-do_compile_ptest() {                                                             
-    oe_runmake -C tests stress                                                   
-}                                                                                
-                                                                                 
-do_install_ptest() {                                                             
-    install -m 755 ${B}/tests/.libs/stress ${D}${PTEST_PATH}         
+do_compile_ptest() {
+    oe_runmake -C tests stress
+}
+
+do_install_ptest() {
+    install -m 755 ${B}/tests/.libs/stress ${D}${PTEST_PATH}
 }
 
 FILES:${PN} += "${base_libdir}/*.so.*"
-- 
2.39.1


