Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF391C636D4
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.123.1675289806809436024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PkB4nx4S;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id z1so10627363pfg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYA4IQ32XRi4dfarLZilJzapsApcI2DCZKqpPRtxK48=;
        b=PkB4nx4S8+GPothwN3Uj6SZwmCovBlf0Hc4OHHROd8/b1z+VAACU+737OKdAuauIRp
         t7bxMW5zvkk/ZT+T3/Eh65T+Tl0OMQBpjUPUXmPiePoyIPXm2XQFwm39wflM8JSq9NYR
         BnLYgN9+Fsih/lCOXv5nxqwmYdkwa+mApnU/Sh3cIq5D8R65SSXGXrxvFehrU3ikykIn
         MXQ6kbHt8RaQcXzl4BMbdcyR7LoYV01/4yNPMkmfUto6zomwNF7pBXFo9/LAoCgx73nw
         v05tfMXrWyQMDpwO5g1zFCYkCc9MVI5VK8Q0JbeNHAsCOc367NtTAANrog1atYxKuGji
         eRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYA4IQ32XRi4dfarLZilJzapsApcI2DCZKqpPRtxK48=;
        b=T95y5cObKT9/Xk1cu+J0HdXFL8gCrhsMc7ROfb3wYdMRx6A3NFMQZqjc7WrQ8KQzDA
         XV8sV4W40TpkxIieOLQlY8pD6IB/9RmBJ0pZLHJQc5v4n+Q6E++tcCXJOIefo3H25XaH
         qySFQ81GeSIZ8t6At04x/yuYrdFyWRxY2lLDjU0HiqMr8O1jN4nCH0Ftef/WzgRjrFA0
         XTnTX94o5/gHOJzWAjPsiWhDEqIun6UDHjPWzNX3ahLH8Rm6maAllDWln0flHG/h8CKn
         CtkiqZmN0LY0966nZZtv59Lor+2sdqlQPb38IbJ9V2xy4tCQkdi1EBMGi6bJ2daQ050V
         NATw==
X-Gm-Message-State: AO0yUKUDzD5dbB9vL9r73KjiOfLmG0Cu25Bvp7HQlLSaQWXP5vdnsxgu
	2tZOMbOW+Y+2XMGHLrW0XrBCGowmhw216YsOFMk=
X-Google-Smtp-Source: AK7set/goxwfOeWvtaoc29hrSfH78X69/lizV1+VYZxexhuVfuzfuXdJGADoslbQP2ox0q8HYFTP4w==
X-Received: by 2002:a62:d11b:0:b0:594:2e35:594e with SMTP id z27-20020a62d11b000000b005942e35594emr507112pfg.20.1675289805889;
        Wed, 01 Feb 2023 14:16:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] libusb1: Strip trailing whitespaces
Date: Wed,  1 Feb 2023 12:16:08 -1000
Message-Id: <6e981dc8df59ce0e2e85b25f240b6c5767ce22f6.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176674

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
index ff3f0be7a5..18ab612d13 100644
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


