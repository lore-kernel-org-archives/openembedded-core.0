Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31904C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:49 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.7244.1654699245214778858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kgfdFUks;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id q140so4014294pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2wTyqu0pIzlnqdy5L1KLEEcCRBRusAjfjqQU8Kn2Yqo=;
        b=kgfdFUksEGPEmwk13jLBOPUNFrHKNOdr577mMxgq47mj5+tLmpzzjlyrtM8Od9jJgA
         hCwbXmHyyf1/zXtuL5OZqf0Wla4rNVAOmqGzisqEmnKxIrD0+VcDEvEUoq30Husogyvw
         ypSXbPwvBV6P3fRj59xBJMpd/XF9+A/M7hyQqGobQc5II4uni0cCJa5Mdjr69L36lqC2
         JtgHWVmY3gOowIbYxFQHZDGnFKNoFrJDUa+JIfNJTe/n7CCTq87OE6H61x0f0SHHip1B
         t/modaNyx7VhSfzKRCrL1QShHkEMz1W/BFKyMTAbF+BN3nUjVrSBgfU+lldwbgEGvEEl
         geMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2wTyqu0pIzlnqdy5L1KLEEcCRBRusAjfjqQU8Kn2Yqo=;
        b=z1wjoWJFvN8g03f9K2q3B1nAbI5mQsnH3yHvOA2n4xfya2g2M2aOb/rq+I9HsSt9mt
         4fhoHlFSLKLTILLybCP2FFPV85uTu+6gPClwBuZG2+mA7Qt2AXYjJvglcEIiawu3w+4i
         mHrDVV4MC8V3pKAJmDGqfvPFyzfQnYf0rN98iOdILwmnlgK4z8+9WfxjdFlSBf8SveDo
         LHKfFdRXZJ9VwplthWSN4nyDc0/alYJtFpadYVirM76O9KUWtZh4cpcWkGTzkLZoYgyW
         0h7tXQQM1r8S8+e2VEBDn8oaoUk/z3nMn7eMayR0hJaON8144Ne7myeo2gQygDvCjDEt
         Ff8Q==
X-Gm-Message-State: AOAM5311Qb3mHB5tM7F6joXDeLR4DE8lqQ7ZbkurimYNdrqEuSqbN5rQ
	JXz0lPYDvC7kS1qnSdBzqN24nG8M1b5f82ss
X-Google-Smtp-Source: 
 ABdhPJzPYcr4Vk9nQc73kPnnlr2OvpEqG0JdRpHvjh4odOOMoWihUkTDC18+w2yPSzA5vF6hPQBr5w==
X-Received: by 2002:a63:2164:0:b0:3fd:b97e:2e4b with SMTP id
 s36-20020a632164000000b003fdb97e2e4bmr14333848pgm.77.1654699244211;
        Wed, 08 Jun 2022 07:40:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/22] libseccomp: Correct LIC_FILES_CHKSUM
Date: Wed,  8 Jun 2022 04:39:33 -1000
Message-Id: 
 <f9f1e7fa6b895cf810887b6c5ddb07b521371f20.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166731

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Previously, only the first line of the LICENSE file was included,
which only covered the license name and thus would not detect a change
to the version (or anything else for that matter).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ac45755dffc611fb46f5cd1c07f4876d3094893)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
index d47200e01c..4c0fb1d7b3 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The libseccomp library provides and easy to use, platform indepen
 HOMEPAGE = "https://github.com/seccomp/libseccomp"
 SECTION = "security"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
 DEPENDS += "gperf-native"
 
-- 
2.25.1


