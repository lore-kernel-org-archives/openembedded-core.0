Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DA9ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 16:07:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.759.1661962038988853974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EA3DszXG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v16so16172070wrm.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=wn53t6vCsCHdk6CLD8Bw0cCrIu6avujxaPAYpusTww4=;
        b=EA3DszXG/UC6YGm2neKPimiq9oobvnCAZ6Flos9vzNaBooW+08AZ4XDydEdy+bMnCf
         MWoQxwnm3t1H0ASXfj9QqdW2pXmcJqSs8R+eVFsxifvh0dU4axZDnwqFpM2wO2LuZCBD
         ARX0lTHZY9ZI74L3O9Bqja6tfCxyac7cyWYDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=wn53t6vCsCHdk6CLD8Bw0cCrIu6avujxaPAYpusTww4=;
        b=hrMUa6Pl6O3GPXDz2qDgbDyvKnXzWdALo3LkuCyHKE0xEOMOPIBWTUaNwPDhoCrFHA
         P54WGbjMqBT/HcmbHGnKVoWqEwgqjpzAsxFws3NvoUd+m+D42teDit4z+wloYD7LU68T
         khu7BNksVnjmUQs50RXivKFFkCZyeZeD93xeXcz+v0wcRziVA4Ixaoqno5ZPhS5ovHma
         kXyzr0NNsy947PTtuu0AcnlC2PvusIXDy/7O13kFw/OjQbK177TEnujOKKX9w5WRn5rb
         blzryq3Jnkvsq86uZ3GidDdpalBTroa50svKOdpvxA3Yiya9raHDTv1wbOxcblZpyAyd
         fTZw==
X-Gm-Message-State: ACgBeo2pLZujryXZZ03vChOMsTqv6hQvd2UyBnXj7HKDVagmsw3iWU4a
	37RHYsBkFxtBc6BoCkoP1fNk+E7hulaFjw==
X-Google-Smtp-Source: 
 AA6agR46pNHxbPycUgun2+HlVnzOfHl0isowfKRtAQA5NFXwPPvG5ZpoiKxOO7J+JjT38v+61QbPyg==
X-Received: by 2002:a05:6000:2a1:b0:226:d5b1:b001 with SMTP id
 l1-20020a05600002a100b00226d5b1b001mr10173843wry.29.1661962034959;
        Wed, 31 Aug 2022 09:07:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e8fb:7413:92ab:6224])
        by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003a62052053csm3432354wms.18.2022.08.31.09.07.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 09:07:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 9.0.0242 -> 9.0.0341
Date: Wed, 31 Aug 2022 17:07:12 +0100
Message-Id: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 16:07:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170134

Addresses CVE-2022-2980, CVE-2022-2946 and CVE-2022-2982.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5b95ab2625c..33a82992433 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0242"
-SRCREV = "171c683237149262665135c7d5841a89bb156f53"
+PV .= ".0341"
+SRCREV = "92a3d20682d46359bb50a452b4f831659e799155"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


