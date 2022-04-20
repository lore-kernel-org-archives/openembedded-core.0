Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEAFC636D9
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.8225.1650463769539512779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mSD6j3dm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 z6-20020a17090a398600b001cb9fca3210so2149618pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y0M/n48XUivNcHHq+vJ1n3QT0GZflxsF6YfPJT3aNzQ=;
        b=mSD6j3dmAP5BmcLZYAWTLfKBTJA9Spobrj2LIfpU7eDUstAv2YeRCaq3dG3YYvfY/v
         MAM2/XFlbrZtBjgIbs1s6JmTjlzBtljyloiFFNDwjMjzTxRpt6qQiykLM/7w8uiTppj3
         03oblkvuhmP1NWVatXSCOR4Ydpix6Pe6wRWoo6K82H8vI2WBKcDJC6320q7RS3dWnzMV
         ek6j3nZGMxCn8iruaABFgzitG6PWfzdo2a00cx3IvYd5CXlUhYtQwKamPlozy3f7DLbF
         ybqUEqARS+l/Y/r7uotVwmgi3EiXLb6KV3kCjpUgmktNcXyJH12i7nWSYZYqwW6FiObT
         rqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y0M/n48XUivNcHHq+vJ1n3QT0GZflxsF6YfPJT3aNzQ=;
        b=rwrH1GDdgSMtHPv0soky0DRLf4V5dGVuvRNvljSJii0mf5Aks8xNB1yoE6Q3QX8A5H
         TR8iBXNr5cMWYB7Fx9YQk+o+2/Xj1corQmkvk0kHDAPX6Fhl8sAFuc5v/aRJbM0Rwblk
         6ZflYDrq6vTV8MEJxQ5x7xZTHxBa6ZVMjUbADPktVsQ6qPwa3OulIVP+ErQWY3bUypqn
         yKVCgIYq60wdUiNG7RCrMzUgSS8WVcZo2Oqllpyjrr4FB9w5jOqlJ6mO6X4FZP8oMoTN
         ImO6BCyl6phtlGhXEmtaC/KnAGunFhfciV2jBnaWgm6Au9c0SVehRqOhk5inDMGkIzlU
         fGGQ==
X-Gm-Message-State: AOAM53357mzbiOTSrciCaI97lYuz669ud1e0f5uavbMnqE6cxC38MZir
	Kw1g6SwFVBAoYvetU4LWVD/MRvYV7b99UvEq0WA=
X-Google-Smtp-Source: 
 ABdhPJziRI/QbjkgCIPznKCPfAbXINeaxjv85IUakaQZeX92dDarvBhe9T5AtB4iPmulyMsUB8X6LA==
X-Received: by 2002:a17:902:cf0a:b0:156:39c9:4c44 with SMTP id
 i10-20020a170902cf0a00b0015639c94c44mr20740896plg.124.1650463768512;
        Wed, 20 Apr 2022 07:09:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/27] wireless-regdb: upgrade 2022.02.18 ->
 2022.04.08
Date: Wed, 20 Apr 2022 04:08:08 -1000
Message-Id: 
 <e3750d11bbe6bd88b42ed09271394c6f0d0b9b6d.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164688

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6ea7450a919f2b571746e7af350c1362e41f8e1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
index 801a6f0584..cd42039680 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
+SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
 
 inherit bin_package allarch
 
-- 
2.25.1


