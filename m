Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0863AC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:24 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.7954.1646406323500572859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OxLT1nQr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id m22so7594658pja.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y6nd04w4fgTZTVMWUl9EUzosHL0HHGZS/xm85Wm9Zbw=;
        b=OxLT1nQrH5AeCUNb8J+62UunZcyd+5Dd9MWoeBCWCa9ZvApc9/Mj5ApLRc1uPKLwv3
         I+LR1faRo4to3YgvHV116RMShFC1+BPSPP1muZi7hvFSTraEfHuQ/ecC4EwKvPSX9rKm
         UXFGF8T4e6o1X3QrP83tGFAohNIqXcL75z2Le7EEHmovON3Lm2+mDOWG3ZuS6UPBSlmZ
         rcWGj/zyUG22dBO/MwB5UreFXrSipyR98/sYpKFgDIyQBb4QwHJWrNiYl/KM2Pq2MX5J
         4cbNPYZtFEedlob4v75dZ3if1J77zCN7MPdSRSoB51Bq536o3TdxKiXMIb7i9F6bLMsP
         bXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y6nd04w4fgTZTVMWUl9EUzosHL0HHGZS/xm85Wm9Zbw=;
        b=gLJv6SU3E6WiTkMqBu5637n4Vpa93f6nSv0XTIIMTjYvDqGOp961P5csDuqYq8XNda
         n6jVNie+eWONglXM5soLQNhZKA7opVHwMZ6kakHQA79S5pECLM1dab2J2ozUdQzUvPB1
         dDouoi1nYUoEuo9XGwtYvuzfeZ730IS3n/XpAjyM0BJgZER9cHk00DsTKqT8YU/ECXsU
         0qF8i4h3LkCUXm5Sm/S54YmWxVIf3X99gK1SVEHXbIM3HigEeULKgYywCq4+aK7LMM/P
         NKArz8hg9ePdXwOGNPDthVWtZ+VJyWMrxvkZd8Y6YFTgNxlvtV7c6GaLVtKRyYOEuz9S
         K98g==
X-Gm-Message-State: AOAM5328ArofoyATerGpjpaXkOAICCf9ZjUCuu8wT4EK/kR7424hstL9
	iYEgEqDxB16WVNhW1g7Tc4RGHW4AddNwtc1qRG0=
X-Google-Smtp-Source: 
 ABdhPJxNdlQQfmDjyys+qmDwncR4ZBJvJaHECSLeJBcZsZR1Q5cNHnHqquULVAZGT34d0WGiKzGozg==
X-Received: by 2002:a17:90a:604f:b0:1be:e84e:692 with SMTP id
 h15-20020a17090a604f00b001bee84e0692mr11113633pjm.61.1646406322393;
        Fri, 04 Mar 2022 07:05:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/18] uninative: Add version to uninative tarball
 name
Date: Fri,  4 Mar 2022 05:04:25 -1000
Message-Id: 
 <0ec0e49d0d2a7478efbf20bc3554f0ffba40afa0.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162736

From: Richard Purdie <richard.purdie@linuxfoundation.org>

uninative works via hashes and doesn't need the version in the tarball name but
it does make things easier to inspect in DL_DIR. There were reasons such as
ease of publication of the build tarballs but we can handle those differently
now and the signature issues from the early code aren't an issue now. From 3.4
onwards we can use a version'd name.

[YOCTO #12970]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dadba70d6a24d8ebb5576598efffa973151c7218)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uninative.bbclass               | 2 +-
 meta/conf/distro/include/yocto-uninative.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 3c7ccd66f4..4412d7c567 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc-${UNINATIVE_VERSION}.tar.xz"
 # Example checksums
 #UNINATIVE_CHECKSUM[aarch64] = "dead"
 #UNINATIVE_CHECKSUM[i686] = "dead"
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3165fc93b8..6833072cd3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,8 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.34"
+UNINATIVE_VERSION = "3.4"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.4/"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
 UNINATIVE_CHECKSUM[aarch64] ?= "3013cdda8f0dc6639ce1c80f33eabce66f06b890bd5b58739a6d7a92a0bb7100"
 UNINATIVE_CHECKSUM[i686] ?= "abed500de584aad63ec237546db20cdd0c69d8870a6f8e94ac31721ace64b376"
 UNINATIVE_CHECKSUM[x86_64] ?= "126f4f7f6f21084ee140dac3eb4c536b963837826b7c38599db0b512c3377ba2"
-- 
2.25.1


