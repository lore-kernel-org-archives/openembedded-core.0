Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88794C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 01:23:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.5109.1647480229618444230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cr3qfaIs;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id p8so5551354pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NrBnOBedsi/88gmG+vtAAGl6qXysPqNipMgCKXeZEGM=;
        b=cr3qfaIsmcgQ07MYsvkripQyM+Gzox2rJd+RC7hu98KfYu/ye3AcfoQhqGLV3EMr0H
         3Ik6hgo2tITlym5KqlItvghAUK+3OWBOzGB7IUGZeXi8DLGI7FQf8T2ZxTeep/yVGzdJ
         gwIeFX2g6rGMmOgCV4J4lSbGOc5ReFaKXWk7PRflquQxdXgl1q3D/COJfrBCR/HSI70f
         F6YdveTpTDFpgw9ymtGKc50M/vcyDRizSXMpIraiSHO/IHwZj9RawRdenwlMJwjjwfSI
         ulwzy7rS9B/rP4JyLkF3/ubAaYnaB4b7sVa4igrzey93YO95E2fXGT5uIyJpoqwu3ZxN
         w6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NrBnOBedsi/88gmG+vtAAGl6qXysPqNipMgCKXeZEGM=;
        b=FJ0li+AV4oe4rTJ2zaC54o7JDPF8/Q5KQHB8gvp+iEZ1X4i1r5ZmVGTKr98C271Yva
         bl2G947XZogqgCbeQ1gUu+VSVtRhhABh+2N9kUHXzkW41bMRTIRFAB8FqPOwdEI8LL8P
         Jsp7jOFXFjJ4vR8ncZQ2iOvarcjGP2NNCqpiqT0SGQQEE2oDSfU7H8bICK2uPjeyFUsX
         ltF561LHasLa44ZBMHlv/tJlxYAOopQgDyZVh4Ri+8UFOulZ0Fi8hPthrmRRBGsBauiG
         B13YoJgGGs+saUSnAdpKlJiPYrNLyCOV5SnBCjpotv/jdLzFMnrsZw8qNHWFZ3bfLQo4
         /h5g==
X-Gm-Message-State: AOAM530z9LCvKJdMSUfVX6oOvLf6qB1d7QR4jMdwn1h89lXGRZeTsG1v
	CpSv3nq+S2CQ5W+WPcFy1iIgO/p23h8=
X-Google-Smtp-Source: 
 ABdhPJzlr/SOvA8GD5ZJwhIDf7gMlo6gvPirzN6Do4bBNY5FXNDWoBAKo1dR9jFZvIfjCuzatx27Hg==
X-Received: by 2002:a65:6d8b:0:b0:376:bfb9:1f3b with SMTP id
 bc11-20020a656d8b000000b00376bfb91f3bmr1745643pgb.427.1647480228621;
        Wed, 16 Mar 2022 18:23:48 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:96ed:2179:adc5:9d0f])
        by smtp.gmail.com with ESMTPSA id
 h16-20020a056a001a5000b004fa343c2d0csm1218580pfv.136.2022.03.16.18.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 18:23:48 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-sphinxcontrib-devhelp: LIC_FILES_CHKSUM
Date: Wed, 16 Mar 2022 18:23:46 -0700
Message-Id: <20220317012346.713546-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 01:23:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163368

Fix LIC_FILES_CHKSUM

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-sphinxcontrib-devhelp_1.0.2.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
index 92ebdcacb73..0909566e9ae 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "sphinxcontrib-devhelp is a sphinx extension which outputs Devhelp document."
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
 
 SRC_URI[sha256sum] = "ff7f1afa7b9642e7060379360a67e9c41e8f3121f2ce9164266f61b9f4b338e4"
 
-- 
2.30.2


