Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC9CC636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.20817.1676236257901958271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uGPcn0yl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d8so10409068plr.10
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb6L2zUM4dGkvcid1OEm8ljXAA9i/TD30taQzJyIQGU=;
        b=uGPcn0ylXVuclqFQ+CeoEEGA8qH8iE5RwVMI1XKp8OHKKbcQiAZl359HzrYZRWGTpF
         qjA412c1kExBBQRdH16G24M2ay0rTk5kjn6PnrYOXRicxdGxB96d1DyADg7C1iZgyZEe
         10oh6khILqgs8YzchrSTpIAYrmWuM890mmT/hJGpTnMxk0uK6Zz0aI8vPX040biNCXTQ
         CnFpAFuBKr2ycGvm2LeMDbiZoVfEmGcATscC2uf6LBaKv5F72LWhDc2PAgNeglGmcyOl
         D4lppAHze5t1k2Uwk0S1ET4V/NcoI3/i+kdc4ZHg/b7QDM28iv99aBfpBm1djZ56U2LR
         +rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb6L2zUM4dGkvcid1OEm8ljXAA9i/TD30taQzJyIQGU=;
        b=q7Rd/IgcymTYGgbzy9gne+iY+Qwq/viSDBg6VMXh56PSLmyvTjPEjwKHIgkcXBz3xm
         PuV41TgiW4+prBsj+OQOK+G1uN+18UHhS22qw3vSvSSkba0+uutuOjkHu7/DpjLuRC7V
         tTo1OyO23VD395nz5p2l2oB+F6ipmVONgI0IWX43qvphL/w/ZnZDXnPf5wRgfyperL4v
         nSfaqLG1vDIWuDbjReGtAJDGcAoHDYJnEqIGmt3yticupWcFvqP3cfiiepu7NOxQ4ieA
         UI/6Kc1VkJYHVtwwQwpihcb/W2MlhYKG3YlGfjX8927eSfg3E7nK2xUSD+I7pg3RBY2X
         2ViQ==
X-Gm-Message-State: AO0yUKXYmXx8YN4NGdToSDJb+7VvCigfYuBIj2T/WIF4IKxy0UBQXheN
	yNvLcmSW2DSmzMPmO+bOc1KXfW9ljaiphp5cB5Y=
X-Google-Smtp-Source: AK7set9i11liS4o1F4m9+ko8vP88yZ/NlS4ssYAnHFUpPUXbDzyKQRtb/NfjCaz5U/czSqW6+bVHZw==
X-Received: by 2002:a17:902:e2c5:b0:19a:95ab:6b46 with SMTP id l5-20020a170902e2c500b0019a95ab6b46mr3133449plc.3.1676236256974;
        Sun, 12 Feb 2023 13:10:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.10.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:10:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/27] git: upgrade to 2.35.6
Date: Sun, 12 Feb 2023 11:10:19 -1000
Message-Id: <d21b033c2f8890989729bc1468254c9298f9a518.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177047

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2022-23521 and CVE-2022-41903

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.35.5.bb => git_2.35.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.5.bb => git_2.35.6.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.5.bb b/meta/recipes-devtools/git/git_2.35.6.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.5.bb
rename to meta/recipes-devtools/git/git_2.35.6.bb
index be4e3ca1d3..016b743ece 100644
--- a/meta/recipes-devtools/git/git_2.35.5.bb
+++ b/meta/recipes-devtools/git/git_2.35.6.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "2cca63fe7bebb5b4bf8efea7b46b12bb89c16ff9711b6b6d845928501d00d0a3"
+SRC_URI[tarball.sha256sum] = "6bd51e0487028543ba40fe3d5b33bd124526a7f7109824aa7f022e79edf93bd1"
-- 
2.34.1


