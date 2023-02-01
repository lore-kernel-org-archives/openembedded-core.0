Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80410C6379F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:22 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.24064.1675260858889270324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JJsubRmo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id s67so12595066pgs.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCUuMo67BC8YWSEMxwjTRli1h319GAR/gu4ROmhREy4=;
        b=JJsubRmovBtcVsIMc5aVCZSKHKTy3W4tJd1pJeX/S9GywrB8M9tDbxTUbukxHTDixs
         aWvIRoj9sWDuCNbqifgq51gDLRqrkY7uLTCPNx/mAgMyrFgnVdDqyQRxyshUSyO1EZjN
         ZayjFSNVYx69UR480jmN2M4KGcJhq6SBNVtvtBuCTeJ/Tb9vlpwii8qjfF6eZQmaULgh
         qWgky1TbxpuLcjKkcLHiWxr6topyTsc5aVrAiAUJSNFnuC7SwbCCSGdkRAJylo0edn3Z
         lWoA/+HVxKrOr+fNbeON7PUT48s+e8aDNE30BxZRhCIKXJqa6nXbOf2bIEb/jeLGYG92
         nkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCUuMo67BC8YWSEMxwjTRli1h319GAR/gu4ROmhREy4=;
        b=K87VDlyNomAl7nVP59xCcSfCmQd07vix4rq5I5832CbDtKZ6UjyGbWbpblqkzU+l0E
         Xel+BVhGbx6cESBq4QdrO3KFcA3Y+RhnP2IXJ4njRZ5amUFvuAd7nPA2B+DUaVocy5RS
         hULjnTBdDMeNDrNDQh3LWsxj7sQt3LRQttpRFUp4VoGkWJod5spXBDmYTpy+15yfiMxk
         1gNBHfqxPlH1LZ9+8TQkEG/IqYuuBYIJdpecqsyuLHzese3ROTSfeLZNeZoHbJMJuNNr
         VJ2d8TEn1L0m+9JiETe0FJlBa25SGvjxnEKVEXT6DqKvV28HDtG5lIHYqDSNe0PfLjer
         PUZQ==
X-Gm-Message-State: AO0yUKXX/iNvGyvngkQ3QbhDH2tx5F8d2nQWVWWLWY5/95xOf5oJ+it7
	QXB9AlImQPt3R93+YQmFZ8V7Z59T3EbSyAcjQM0=
X-Google-Smtp-Source: AK7set9IRjwRKxgHk2PY7BLa3h6UzaWoZPvhTr/avA8gXmdlrk3J2mJ81jIEMncKJOIWAnl3YwXOkg==
X-Received: by 2002:aa7:80c6:0:b0:58d:a7f4:9630 with SMTP id a6-20020aa780c6000000b0058da7f49630mr2173182pfn.16.1675260857849;
        Wed, 01 Feb 2023 06:14:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/17] spirv-headers/spirv-tools: set correct branch name
Date: Wed,  1 Feb 2023 04:13:46 -1000
Message-Id: <f9167e9c31d55c60d6713aa4f601b012663926e3.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176543

From: Ross Burton <ross.burton@arm.com>

As of last week, the SPIRV repositories have renamed their master
branches to main:

https://github.com/KhronosGroup/SPIRV-Headers/issues/313

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2957da09f13607ac00ddd4a87ec9ad0014326507)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb | 2 +-
 meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
index 94500a96ba..ce47206ac2 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
 SRCREV = "b2a156e1c0434bc8c99aaebba1c7be98be7ac580"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
index fc1074d8b8..c6fba3821b 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
@@ -8,7 +8,7 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            file://0001-Remove-default-copy-constructor-in-header.-4879.patch \
           "
 PE = "1"
-- 
2.25.1


