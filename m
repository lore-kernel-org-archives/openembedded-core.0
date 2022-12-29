Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F7CC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.206923.1672329685772966142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPcE6Chp;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so16639224wma.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnA3QvKJECUKMQBjr/9fOHj8eol3XS3YXZ8jtMSTRCs=;
        b=bPcE6ChpoWDQcJxcW4h2TftB0mGzI2Fd/u+Cvcbp/17ocn7b3dCVpocnxBZJSOmZlM
         Q7Pe6YCZVNsHjWpXuxNo9QVWRyEsywxuOGQNLFm+RnwLF1M4i/l2NeYcfNi7jmz4Cllz
         LIRdOCCMtcCyhjOa/HA5EhXY3Zv/LterbrzseRg/BMWkmkOHv7omToK6ALlYNYzaRDo3
         pziFhsn6A8GHV76XGIa5fkC4tf4B9CPXQjb85eBugggP94IMDHSkNknKhSHBHqrMTWan
         9lBj4unc3uZvfOJCXR0TtHjTIFTbG5JPS7KaN0sp4PgvP6ohD+CsWWJ5IoTlbgK+H/64
         39qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnA3QvKJECUKMQBjr/9fOHj8eol3XS3YXZ8jtMSTRCs=;
        b=M5f3ONrapLbkBQafZyrMqec4/LYTNtn5wtUhEqw6AY+dK6IrXblrS5RKDcQ2NouwzB
         AJBezlmZw3kEGl/ql6wjCDiR91llxcKapfgfAl4QxbhPsG8jrENyc+eV/6GbTqxlF1u6
         bffLH6OaZJCBnUnX4dUYRKH2FjwjQKeaEdc/yP00wlFCPQFDbSLeSsA16qV9uw17wurs
         ZD3kPopL2doV7IYTKpLXJIb/gPBjippVxAiZlkEoCd1jm16kQNtcayQmb9QzcyBA7lIN
         xWSjIbNJCpNBrDD8TkZN6svlrw8a+o+vnKZzMbU9c5Gfzy1hXevF8aposF3ElJNQfW0k
         t+/g==
X-Gm-Message-State: AFqh2kr+zHop3X5Sb2QeAXbGkrLHf8jup/iq+nFjIHWWYupaA6pWRVL/
	ODBszqzk3ElcSfMck1OcXXRKHqkQ/2g=
X-Google-Smtp-Source: AMrXdXuZerPDLnqqQWzkpKuANk1vT5ya2NrX5lfVaLKC6D9GwMq7EjzLcBqLzr7Xi+/2Ts8ZqNIXUQ==
X-Received: by 2002:a7b:ca51:0:b0:3d2:7a7:5cc6 with SMTP id m17-20020a7bca51000000b003d207a75cc6mr23674388wml.18.1672329684050;
        Thu, 29 Dec 2022 08:01:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/10] boost-build-native: update 1.80.0 -> 1.81.0
Date: Thu, 29 Dec 2022 17:01:10 +0100
Message-Id: <20221229160110.255775-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175116

boost itself is already updated.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...oost-build-native_1.80.0.bb => boost-build-native_1.81.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.80.0.bb => boost-build-native_1.81.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.80.0.bb b/meta/recipes-support/boost/boost-build-native_1.81.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.80.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.81.0.bb
index 54c0b2064f..d01c7658d5 100644
--- a/meta/recipes-support/boost/boost-build-native_1.80.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.81.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "405d34a04d29519625c5edfe1f3bac3bc3dc3534"
+SRCREV = "0271fafc1141c182d4aaa8db8b1c08a109d04c87"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
-- 
2.30.2


