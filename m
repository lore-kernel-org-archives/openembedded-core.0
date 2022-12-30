Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8478C4708E
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.22437.1672418716089303306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KMtMIYDb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 79so14492391pgf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3HISLCf01ekESRQANyuEcWyiVU1nH80T/+1dE6fs90=;
        b=KMtMIYDbmIeq15KZ5TRqiYKW4iRMkF2pqwgo141kBjxUDPrxtg5mg+l+zTXjlsQpy1
         POtH7zKCMD4e9N1t2+Qg8HlzzL/zc/xrQBKZ5QIaSzYjYhS9VKU8l9PDe5JYXux4KWlo
         HOzqrrjOkh8gkscAQ96I0/X7+4CHwffg04KLIWrj3va8cQLofPFRgB9jV13OCD5VQA/S
         6C2xloh0wqWeQfy8ZWE2/FXw5w0st24uZIvbfa6nwyb4nV0v267QN3N5tfD7nyX4EIVK
         SUNpZ+Ir+pwov0nqy7MQopdqjOV2XTnHQpiJxMqE/81bQS7A5+0o+yR1bZrKMYAhQTSb
         blwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3HISLCf01ekESRQANyuEcWyiVU1nH80T/+1dE6fs90=;
        b=jtaTMnm33JH9yb7OMrTtMQ3ZBE9ev5oM5uL0wetFwZ9Ed79GIXY6y6q1ssnEd7RFeG
         YfJVJCiWOF7Iu4fo1mBRqOtc1kKui9DGLxTGvJZ24hBWabpzrxLhetLTZSQuCqg0DTUq
         Nyzm78GnsF3p5G/+LC9yyZnGOixEKi/O3LOhkzxCmeAVn+olox6LqS+VGTTMzsypQpK6
         NX+zhJLUroHTvcca498aOMM3pzNb4DW9Kt9FnA/gzD06CI9/Zz/mFYaTcKo/cznS9JsC
         K1GLP6Sm6pED25pmtWOx42ZFz11Nf8fZN2+BT2H+2kc0tqmQ0Ap7scND4bVU4iJoP4n7
         eURQ==
X-Gm-Message-State: AFqh2kqpR/zVheydNfdNY59xK2cJMiat6WF/ZBUnMvUJyOnClYrWFEHP
	ybeyroRvjowPOvkmtxK9VophnGv31tj3M62LM4Q=
X-Google-Smtp-Source: AMrXdXsRrmdwlto8u3+RGovA5IMFKgULtRhvu3ba8aVcntmSf7yF4eWev8xhs7NZXSHzevByuSYUaA==
X-Received: by 2002:a05:6a00:410b:b0:57a:9482:843b with SMTP id bu11-20020a056a00410b00b0057a9482843bmr37106029pfb.5.1672418715109;
        Fri, 30 Dec 2022 08:45:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/22] curl: Correct LICENSE from MIT-open-group to curl
Date: Fri, 30 Dec 2022 06:44:06 -1000
Message-Id: <966c70491f6b90495ae6f3afc2a86020da2ba695.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175157

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

LICENSE for curl is set to MIT-open-group which is wrong and proper
license is 'curl'

I check below link and the line "Curl and libcurl are licensed under
the license below, which is inspired by MIT/X, but not identical." says
that the license is identical to MIT but actual license is identical
from the file "meta/files/common-licenses/curl"
Link: https://curl.se/docs/copyright.html

Also, I do not find the MIT-open-group license text in the entire
source-code

(From OE-Core rev: 34b228bd3a80a74bf4d84ef7ee362f4ab1e3a466)

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a246e06cb62efff8bfd20cdf3dde31e24f9b711)
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.85.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index 0386052bf4..a4561494d1 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads, and more!"
 HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
-LICENSE = "MIT-open-group"
+LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = " \
-- 
2.25.1


