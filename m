Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698B7CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:13:27 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.284152.1697641999990598638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PpMjgf4M;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-577e62e2adfso4520034a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697641999; x=1698246799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfOZSz7uh+hTqxIVtwTTALxHPJJ9DUBZ24sL7wq4Nhw=;
        b=PpMjgf4MnF5fLT1g9MPPek+VuqoKeow2AEiFgCJLeAVJZHAS4obmKz6MXBxkpGdHce
         R5D1oADwuJ2cPKtjRxrJjLyQUY1kNgepQ13gHKxGF0Ipcr1GI7DhthiO2fp80BZ0L0Lo
         +7GtMXVmlHSNDSnblSFOmKuIBNjgRLuuefbcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697641999; x=1698246799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfOZSz7uh+hTqxIVtwTTALxHPJJ9DUBZ24sL7wq4Nhw=;
        b=FESdc5UMsqVAVxItgro+SfzvTpKn4zw3X5K6S7rhINiEJ9JlpFoCdeL0BuSvNz4TR+
         RxU5aP60jtNpNB7dtSYIcLAzGK9TgBs4pOJZdQBkD54HDkQ4Y8MmrioiEM2/ng4WMBYq
         42nMvriHZJm0lWTxWkbjaw0RICnYZQ2ZECG7yikfFqvBDShf8MtLlCG8JMzPP7qvk5Fm
         adeetapbh2dXKYhf1Y6YdBgUzLPbpsLKwMBvx+6WNGHBCZztceJgV2fyLBLpz+G9ZsqF
         ace77JoORdBKO5Ef/DpBXRDvnaVXxCi9AX+jt0UzB+0J69dMjb0IEdEXX3/xt3nNFDVB
         gJ7A==
X-Gm-Message-State: AOJu0YxMuc5yKGBMa8IbEocM07qd6Sdx1GUtx73XQCDksLdw0tOEa5D2
	CmwXLx84GvsmvT2I9LyQShXhoybTF3raW6P9dzY=
X-Google-Smtp-Source: AGHT+IFKRqLXptanIxp43DmGgDWMD1jvPrV7kVBVLibrmJhLFCIlCTQUsuJtAurpwL0WQQ5i3oVzRg==
X-Received: by 2002:a05:6a20:1614:b0:17b:62ae:a8aa with SMTP id l20-20020a056a20161400b0017b62aea8aamr1399243pzj.6.1697641998852;
        Wed, 18 Oct 2023 08:13:18 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.40.79])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902e9c500b001c72d694ea5sm24453plk.303.2023.10.18.08.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:13:18 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] vim: Upgrade 9.0.2009 -> 9.0.2048
Date: Wed, 18 Oct 2023 20:43:12 +0530
Message-Id: <20231018151312.95975-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189397

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5535.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5e06866692..58025828f2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2009"
-SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
+PV .= ".2048"
+SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


