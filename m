Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83E5C00140
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:30:15 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.11503.1660620613907395542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pxMj4f/K;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 130so8011705pfy.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DGfv2rPFB1aAAJn5woSApxd9Cx2STBWXnqoo15HEBgc=;
        b=pxMj4f/Klij5fh7rfZJK1U7ax6ECNroFNU2bI2kxHxXr0xqLn3wDYF4qhzy4fT982o
         d6lUAk06i8Et7kgEKF3lqplJgLn9xA1vorFqD1lUk9uh5zdR2uOajJQPv4THr+lEUHpd
         WmFMzrcTPZZEqztUb/EL/7XUxAXWbtwUobbIaspEVT3Dvsl9xCF9gy1IRaEpqHtnnhHp
         cn82BnvDahzz39AYJGo6/RcXSdFWUEsRABsDBin0FRR8Jxx62TNKC2LqURCW3mtjNJps
         TKzYbY1sQpOwTgwPSDiq7UESlZEgdnMt7W2x+qW60P7dRLIWFAiEKI6AJ+vJdT30+P7B
         0//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DGfv2rPFB1aAAJn5woSApxd9Cx2STBWXnqoo15HEBgc=;
        b=ukG4yv7X+wkU0jixqcg+3m0vyWkdK381QyBq8dXSalts+J6h5PrMABO0fP1ev99od/
         M+1FkKpheD1oXRm1Uc2mBzVqIwH//67q7EJu5/DWOxKADCDClDVon48dkhNm40I46e96
         G6HcJW6FXei8YyLRO0NxjA/9DWKh3rzPDZHD7whcXJDCeWr3jnxKCBEoBJlCzfu/zwJx
         XJB26ImcIHuY/R/mnEgdwsXH3taB4bZWNtaQA/sIBAeKfvyImI50XCtdQx8rmnH+qGZP
         sHljUoExppfHMFxJ9Ysw42rrMMna7dRrz8Ss6P7FCrKljliYzP0vMMjBBweB6/Hvpoou
         +9cg==
X-Gm-Message-State: ACgBeo3V2Pdzern3v9Hi0YEqMTt1hu7TqpXze8H19HUsq90q/zWPbvE2
	r7EP00tRBp4oIhCf2h1IL7KY3dASsuFMhQ==
X-Google-Smtp-Source: 
 AA6agR7kVCSCVDZis3j/3MyobKWJug6XrbUgqNdVFnCwp9J58KwkZwFeULiA74AxyfFPraA2uz427A==
X-Received: by 2002:a63:8942:0:b0:429:a15b:4cfa with SMTP id
 v63-20020a638942000000b00429a15b4cfamr1673892pgd.202.1660620614067;
        Mon, 15 Aug 2022 20:30:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b190-20020a621bc7000000b0052d87b76d12sm7218807pfb.68.2022.08.15.20.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:30:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] spirv-tools,spirv-headers: Update to 1.3.224.0
Date: Mon, 15 Aug 2022 20:30:04 -0700
Message-Id: <20220816033005.2700801-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033005.2700801-1-raj.khem@gmail.com>
References: <20220816033005.2700801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169419

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb}  | 0
 .../spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb} (100%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
index eb907326c43..cfea28a6efe 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
+SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.37.2


