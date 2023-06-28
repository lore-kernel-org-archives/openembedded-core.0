Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A94EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.17390.1687961628325269200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=259IUYuZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b80ba9326bso25463465ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961627; x=1690553627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzhuiJs3Wo3vVOGNA48Tl2JtZWlty6uLdB2LWrj/NbY=;
        b=259IUYuZoi4IWZpZJosxk272bphCK02B/pzmTLjKJZFLBcT60pobCBmuELHphN/Dp6
         eS3HuSiOldaqdUMcR2YcEFCT/bPzMFWDLY3Ot/9ogTKugOkz4TUfvcveKzWdF74UG4oK
         xO1mP00SqfAwFCcELLH+QoKIL1vQTYZhWCFvRPxwkz09En8DGduhWTRBenEkx3e5/HX5
         BjZKWFA4NdH+QeA7QCyn3AlciPK1LEm3k6u/HTbnh5xW0nfikdz2Vvbct9cvtTsa79gs
         fxiZ+ip6S8tpgsbBsVCfgIqK5HUxlPTk3wiq0FN0svz6ksjN/2jyJmXLnuZfwVy1sHaD
         YXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961627; x=1690553627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzhuiJs3Wo3vVOGNA48Tl2JtZWlty6uLdB2LWrj/NbY=;
        b=ZE9kzXhcTFLGi5yq9KdmCXTLd1UcNztQ17QLJ20inCJaAFJsrnTSmXwc3P/uAWMMnE
         plMVtjQqY0kdPDnGOcsZpphQ/Ybi26K+4CsrnQJDeajWLL6oWdxWHF/V1wRtvHAwjrn4
         ZSe4yCXomkG1suNHAFDkQN+8sJMPqMhwmn3VGlbq6DagqhtkJKQwulK5I70VWBuoMdyT
         9Kk0uDYqpUiZY45Oz/rQueqXjpmM3MPmd+2zmVUWAFVVCjP06etVVAbcFlkW9AQK5dKV
         q3geq6XTYp/JifRgOC0J0SdgyQKQf5Yuico6zeAmELX8UEuJW1Nkg8unyGBXAIr2idvy
         5TbA==
X-Gm-Message-State: AC+VfDzmXngoS4FgjVINDShuiin/C/aFPo8BGCZJyF0VRpeeJTakACuJ
	Vh97Mv0WABRN+5U0y2BB58dVopL5omRxkrxvkFKF6A==
X-Google-Smtp-Source: ACHHUZ4Xe5MsDjmJ5ZXEacrrkTOvbvFSwV3pxy7PIO3k1hzBIhAppsXCtrzCOmBmUGwz6dWrtd4Z7A==
X-Received: by 2002:a17:902:7c06:b0:1b3:a928:18e8 with SMTP id x6-20020a1709027c0600b001b3a92818e8mr11588606pll.52.1687961627486;
        Wed, 28 Jun 2023 07:13:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/29] maintainers.inc: correct Carlos Rafael Giani's email address
Date: Wed, 28 Jun 2023 04:12:52 -1000
Message-Id: <1f664daa33b5fae83990b9b5d5490a896a307b68.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183582

From: Alexander Kanavin <alex.kanavin@gmail.com>

As confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c7f934368d3fb3e9cf268f8237eae80b1c1665a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 50746e2d7d..d7bf806b05 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -294,7 +294,7 @@ RECIPE_MAINTAINER:pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-kexec-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-keymaps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <dv@pseudoterminal.org>"
+RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <crg7475@mailbox.org>"
 RECIPE_MAINTAINER:pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
-- 
2.34.1


