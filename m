Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34934C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 07:46:13 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.7942.1671176762959829368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 23:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B0188Puh;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 142so1249038pga.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 23:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KgMPrcBlqDL4KklNPkRwshvxMiTs1RFoEjxW3+Tr6DI=;
        b=B0188PuhOtMHt3oAu+deuKojuv2nfK5aCJTgDkXEL+4uVvockc+hhkIOTKWYlh4ckj
         v/eFC9SFyF+7wbAwzP7zmO1Ca9kyD8v2KTNuVy++IneikF1WycHFLd3p7cJ8xhBZShVE
         A+PZVUqXH8u7q5j9Lv/Oqar1YJdIjDY/wxutymKLwVvNZdm7uQ/AMIyp2bWNOiX6LMFB
         l08T5Yvu7dnOVSBD5H/CD3J6vBAx1ccma+SlnkTMAEU4C1fE1E5+xBo+tMBSmPrtR3gw
         TuN1bQl1mw4x83p50fGDYXtnNlpOlCXzaXynmZ9OuBH/0RSY/GAM3F4DMM0+8TQ1AOFl
         +eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgMPrcBlqDL4KklNPkRwshvxMiTs1RFoEjxW3+Tr6DI=;
        b=WoydBQFAnUYP5B6hbJVOxk2uT7DYTO4N8X9rV5d9lXQtI6C/Wt2NxTH4G1T4Q5Qyme
         +oe9t5K4XO6k+pmcHPGeGqukwDbc+4OEM0Y0DurhePU3+RFHGLBfsPt7aUGOSBL/MlMY
         ffGR52rT4umR2sU+5Mme1szITQaIWqozxLydNkMXPyztXo5Esad3HCq1f2JdkTSqmWBm
         4emgOWDj1bGfeq8InnNTLHZ3P800p5r1Ib8NmAq81cOqudvkeiYtx/dddd4MOcslFmt1
         bA+ZLbxiPotNOyOqeQ5+Gi6gquCULUf3C+u3bkLAXZnOpN+e4SFDQzDWfMu9INZVUCjW
         1SUw==
X-Gm-Message-State: ANoB5pl8SmRnleeZnkwmOqh55ZooVyTviXo6q0J+GB+dyfcUDxroYB52
	n58Oijtot0CTFVNN7os5lN0q1MgpLDQ=
X-Google-Smtp-Source: AA0mqf5TdHI3sctarmso5NtXN4DY/3tKgdsNtrpRUcKEBSIs9ukLfRNoyBPWmQ66cEsGsx9Zo7ug5g==
X-Received: by 2002:aa7:910f:0:b0:57b:5770:fd7e with SMTP id 15-20020aa7910f000000b0057b5770fd7emr11272655pfh.1.1671176762013;
        Thu, 15 Dec 2022 23:46:02 -0800 (PST)
Received: from localhost.localdomain ([103.81.93.37])
        by smtp.gmail.com with ESMTPSA id q15-20020aa7982f000000b00576f9773c80sm803647pfl.206.2022.12.15.23.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 23:46:01 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH] curl: Correct LICENSE from MIT to curl
Date: Fri, 16 Dec 2022 13:15:46 +0530
Message-Id: <20221216074546.46689-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 07:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174732

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

LICENSE for curl is set to MIT which is wrong and proper license is
'curl'

I check below link and the line "Curl and libcurl are licensed under
the license below, which is inspired by MIT/X, but not identical." says
that the license is identical to MIT but actual license is identical
from the file "meta/files/common-licenses/curl"
Link: https://curl.se/docs/copyright.html

Also, I do not find the MIT license text in the entire source-code

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 31aa9d7185..49287b2e3d 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads, and more!"
 HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
-LICENSE = "MIT"
+LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-- 
2.25.1


