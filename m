Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ACCCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 04:12:37 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.20324.1697688752394061504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 21:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GUAr1MNA;
 spf=pass (domain: mvista.com, ip: 209.85.219.177, mailfrom: sdoshi@mvista.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9b2ca542e5so6772628276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 21:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697688751; x=1698293551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfOZSz7uh+hTqxIVtwTTALxHPJJ9DUBZ24sL7wq4Nhw=;
        b=GUAr1MNAF/rhbNbunr7KCkkHNPMtUv6wsvs0eH/CPCQ8VzlAQ6RQQ+WdpJJhkHKNW+
         dIeqzRJvh3qsFnlrW3C/naQZhIf0nhQedgSzFJuEUqVPsUG0pbpkzktc59/DXzHcYKmw
         gewF8mul3NJpllKBT+qx+er7y8Q0Y2AWSr9bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697688751; x=1698293551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfOZSz7uh+hTqxIVtwTTALxHPJJ9DUBZ24sL7wq4Nhw=;
        b=BmYfR5dEnER+KcVn3usqQKqWHTs73prypWN31CfKA8REECy/HrTo1zNOpp0dFlm2rh
         K52TfgX/hw8b1c88+kFoP4r+eYwQJ9HQ+0LPxT6I+sScY0Of6O4nbzxZylRft3z5A5MF
         KSZ1G3wOnWXyRMkrdksBY1nKenFK9Seys92vEGqxaRXChc0+22xVMA+SWXhlszs22FJ4
         nthKPStI+b+O0rrQLCieQcAfuphOEZLUA4HlbBQtnWqjlj/oy+WxqPDu163o9+gythVw
         t/fCyenozmfYKFGXk2vhJQA/ZIrzy+9ex6OTVeRvwGT25Q8naJz+S1k7tFqV/DKobms3
         Izag==
X-Gm-Message-State: AOJu0YzAcIGW7PmmSdTQK1Iw1DrdRMTB+YEv0gHzu8WAhdBbtslyTn3q
	iJ4JoVSl1gwy2DhTNd1l4lNFNPPrItJs5/S7q6A=
X-Google-Smtp-Source: AGHT+IG0W7Ptq+7g2GQkpEGpSDsDVOUSnA+WKB4SY6P/BaS8QJZTySWpFtIVpyQVHMW7ZKZcMO7z/g==
X-Received: by 2002:a25:908c:0:b0:d89:42af:d46b with SMTP id t12-20020a25908c000000b00d8942afd46bmr1297313ybl.50.1697688751135;
        Wed, 18 Oct 2023 21:12:31 -0700 (PDT)
Received: from localhost.localdomain ([157.32.47.210])
        by smtp.gmail.com with ESMTPSA id fa36-20020a056a002d2400b006bdf4dfbe0dsm4259192pfb.12.2023.10.18.21.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 21:12:30 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][mickledore][PATCH] vim: Upgrade 9.0.2009 -> 9.0.2048
Date: Thu, 19 Oct 2023 09:42:22 +0530
Message-Id: <20231019041222.5003-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 04:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189425

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


