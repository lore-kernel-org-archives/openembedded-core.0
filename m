Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA164C4332F
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.9318.1665273319209530343
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nb3zvrLk;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 195so7607440pga.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QRLZxggxcOMWPgBD6uwoBSz482hhsGCGJvqoy6sWQA=;
        b=Nb3zvrLkByld8AUWwJjcJ16TMqQtFBR4nb8ResfN4F6vM1C4p2jNCFSKxLgfOrD8Sb
         JAR1a9DQ6ba6rxSyka19C9KFoxwiBAC6HrEScvR2vg8tTWKqjtU3QOf05YPlvEOgyD/N
         1YUBAiO9Ty9HdbYy9lAEbCsOfryBmu5uAEueuvCHCU4Ef9/SLzDc3ZGepO7kw3PIENkc
         UO1mg7a8QxIS0wOYN8lKfjAU5a4agOzpUTYZhLf7URgBfKV7ubI+gxLQ++WecvsJilm2
         +UqlqTD8OKJnreYFdfwxtPMxHlSFpaeqBsHbcqrE0eIUBBD6xOq3tPzzVb/aLqu6f3Bx
         VnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QRLZxggxcOMWPgBD6uwoBSz482hhsGCGJvqoy6sWQA=;
        b=YfCBufODHfuFP9ILf9FYiXBv0s1aDkLRPOQGHpvybCx1IkgPEoK4l96g4rJCr7uGYN
         VckoUw9sBb97w6NKPfptoMbJLtMoOm/KlcwQQ3ZEMLJ/waAtUtU0xPYrjxg9BTIiwkNe
         O3FEnWX/GjuMvyjeOSOyUfqFaEpzOjLFphSsJR1vJnGppRJAx7CfxM72W80w5WSVUDl4
         d/MAkRNFt/CMb8hZIZlxVk7bJMS+aPoNEh2ZvB5OC4R/eQ3LtLTWfCPOJaPRTwTT+bef
         gaU08RPbRsStSD0Hy34ayYiQOO1xarvKmp1ektaXzFT1w6Cl/PQ9QJn0u1qu79XyT+Xq
         3hAA==
X-Gm-Message-State: ACrzQf1yFBIjXL5wAfw/wFQEMzxz7hCW11KVkNUi/pBPgK9IpLotZTFB
	skWRtzMd9s8RSMbRuj5AJFdTXFuwLu8=
X-Google-Smtp-Source: 
 AMsMyM5pmHCFT6gkiVf2jWQ/1NcBp5+B7AFSp/ol9rn7Ls2z+A1gnrdaS7V0UEo5yzZuxmaIGUPTmw==
X-Received: by 2002:a63:2402:0:b0:460:99af:331c with SMTP id
 k2-20020a632402000000b0046099af331cmr3166419pgk.460.1665273318248;
        Sat, 08 Oct 2022 16:55:18 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:17 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] python3-hypothesis: upgrade 6.54.5 -> 6.56.1
Date: Sat,  8 Oct 2022 16:54:48 -0700
Message-Id: 
 <46b8b8374028758b9cdd881cbbf522e8885c0831.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171542

For changes see:
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-56-1
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-56-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-55-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-54-6

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-hypothesis_6.54.5.bb => python3-hypothesis_6.56.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.54.5.bb => python3-hypothesis_6.56.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb
index 9adb614493e..c16daabeefa 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "8a9056825695f415bfad4e808ae719fc01383a9ab659775319724365afcc7ec7"
+SRC_URI[sha256sum] = "cefdaf6143170f1aa28adf4816d12547ab60f93c143f7d5205507d9e4804fccd"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


