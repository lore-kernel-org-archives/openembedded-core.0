Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F8BC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:00:35 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.29907.1660748426214741959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G6+1WPXG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id bu15so8031552wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=HJGwuKYsln26BervFwMIf4WDPMsIl8533/iR/Y34+CQ=;
        b=G6+1WPXGHLSFdye6JhcI3DyiuLCBQB4fU0LQxTCNCv+KOP0oZV7WiiHpGrsCb+3IW1
         Txx7rNWEYvzyiqdNmRHGv4ivMPaMVt4JXdna5dHtBpuDOfq0xzlbVd+5Hirjvb31zkKq
         qn4dWo8YPAVOz6UV2RqM4n5gXFwoHv3I3TIsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=HJGwuKYsln26BervFwMIf4WDPMsIl8533/iR/Y34+CQ=;
        b=WYT+MrHCES62bDmPNvYkLKyoX/iz76GeGz1S0gwcPdvtQdDnGnBGMbpe9xSRTHBDGt
         EXoERPMfYO7vaxf2URy0ljxaGv8dKiU2/AK48OHkZBEFP8C8FuxnqjfLIUxnrFsHgacg
         7pcIaOWeErQSbRCU1XAzyUD7SFC9r0T0UZn2YzZwwe8bwUMlW+w6Ixx5zp7L+JhCBQu7
         NH4XVrRVE75BTh9D5McGhOS9Ad/MysaQuyrQDrQxoM9JfBLrPb6mgLuD8YMPX7PA+zTd
         /+hQdCVSjRwNJyZurTTxTnu1vuygUpq80jPnROZW8HsX1bMPpWb7gPK5RjSmTj3gEksk
         q4MA==
X-Gm-Message-State: ACgBeo0wufwFECVwuyqp1SyBHEwmjd28DmCAyv+9UEriK8tDXQjLul00
	EAzUkseb0i/vSBYH3WrQpo5dxxtFWWIf1g==
X-Google-Smtp-Source: 
 AA6agR5n1zwsJWKu8l+ubMUSka5uHtZoITXeRg7sx2pu+8JNPz5sOg3gNAHl6u0KML7lvapBb63OyA==
X-Received: by 2002:a05:6000:c3:b0:21e:e081:4cc4 with SMTP id
 q3-20020a05600000c300b0021ee0814cc4mr14205986wrx.93.1660748424072;
        Wed, 17 Aug 2022 08:00:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 az36-20020a05600c602400b003a5fa79007fsm2615853wmb.7.2022.08.17.08.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 08:00:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Update patch status to submitted for two patches
Date: Wed, 17 Aug 2022 16:00:23 +0100
Message-Id: <20220817150023.1850188-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 15:00:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169490

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch     | 2 +-
 meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch b/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
index aa3d16f6000..f3485858f48 100644
--- a/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
+++ b/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
@@ -1,7 +1,7 @@
 Avoid encoding build paths into sources used for floating point on powerpc.
 (MACHINE=qemuppc bitbake libgcc).
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599882.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: gcc-12.1.0/libgcc/config/rs6000/t-float128
diff --git a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
index 3544f61a744..7f1a2deec7e 100644
--- a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
@@ -7,7 +7,8 @@ Instead, call gcc's realpath function on the incomming path name before
 comparing it with the remapping. This means other issues like symlinks
 are also accounted for and leads to a more consistent remapping experience.
 
-Upstream-Status: Pending [need to see if gcc developers would accept this]
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599885.html]
+[Also https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599884.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 
-- 
2.34.1


