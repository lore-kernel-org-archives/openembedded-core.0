Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EF1C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:42 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.24076.1675260873862320109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y0pbCsoW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 143so12573448pgg.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MexbAGmO9d+s2ncVxBpPWkcJkHX5nsfwdYp+S59kiE=;
        b=y0pbCsoW6Zxfi23+BGVUfKW74I/ObGgJE53nd1fZtENSlptcwe+a9mhXIrszhKCtun
         AYAVrh/8g6vdbUY6MblOk1PW05KdO8pbX33mX4VEsWcy7Ok2iyZoSIYsTbjlaQ2sAB14
         em5yNxQuRjcmn7XoWKOp86FMyYJZr0nNS8KtxbP8obHeGkmWIH1hv2kWIP9fWFgZXJn0
         TcpA9aEHTC1GgSJtf2P8xntSDgaCcHHJ8ZWyVI9otTQA61voZPNefxAFRZQ3cN7Pw4FF
         dyrAvLAmwe6T4R8Vupf1blFiFUbFLGuyEULsXzpSfsOdBOYY94vBW8fKjdZQmnxo46Dx
         +9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MexbAGmO9d+s2ncVxBpPWkcJkHX5nsfwdYp+S59kiE=;
        b=s8mbs1TV61TRGAUB3y/RBaZQVjZfHRhQlKRcWiq7ltY0AJXmxRyQWtyPzZHtRO5Het
         CG2up2S/TNuxmO/r7YtNwCooVkzyPdoVumwg+r4vr8csyP1jtyUQ+fvvH6o8rDsW4eUL
         KbQgUR4gZY5awwcX1gl6ywGsQ1ac1I0TjrmYa7LLayYEcsvHvQkkgFl95Gi8whRDgCd/
         lxBMXETmkG9usN3cb6m48xZgKuiF1RNap9xIKa7OWwL8YSre/wXX+4yKs6cJ1j9IsNPl
         OUbZMoxjkHuPrBney5udiRZQDRCsT4lYGRl7jO1OnOd12HmJi2FphAo0FF5MY3zpDxOU
         XGCg==
X-Gm-Message-State: AO0yUKXWomza0IsBeWHOCVYnwH1X4AvevA9+iO8rTHxv1rumTcLv7eEK
	QG36+1mOMxW7MEqpXxrkUhuiR1bvku2RKGrWOB8=
X-Google-Smtp-Source: AK7set/j+wN6FfxNzEQciLEK5raxpqmvMQ0aikSXqk4ub9p64F9+IkSGt04mU9bkIMXHlT9WImJH/g==
X-Received: by 2002:a62:834b:0:b0:590:63d3:260 with SMTP id h72-20020a62834b000000b0059063d30260mr13530765pfe.19.1675260872965;
        Wed, 01 Feb 2023 06:14:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/17] libusb1: Strip trailing whitespaces
Date: Wed,  1 Feb 2023 04:13:54 -1000
Message-Id: <2ba7a2e7f2472bc9d8ceac4d7b499d8b3c9c89ca.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176551

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b24ffade16fc23ddb77e26d8967c26d62f4ed6d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


