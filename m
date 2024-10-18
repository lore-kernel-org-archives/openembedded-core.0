Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FCBD3C550
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 06:30:46 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.16649.1729233041812000577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 23:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aEQuBK6Q;
 spf=pass (domain: mvista.com, ip: 209.85.160.43, mailfrom: rsangam@mvista.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-28847f4207dso844150fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 23:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1729233039; x=1729837839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwr4FnQsiXVRmiLV52K7J/cWXN9EV0vv+s1LHUyw/ic=;
        b=aEQuBK6QsYkdpBraGWVaZ1TAo+kLQiR/4g1Cdh2NXQ51OwUAGztxuYoW9+CgQpY/xg
         aRQP7CRgpSVMARUGxCmXMVij6mFTJ6ILPdgGuQ+TWJi6yQL7r3W2kPhvSeluX9NEYnV0
         5S9/JZqjn/ZLfwfefCGwbcZGNjt7ze9HGy6Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729233039; x=1729837839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwr4FnQsiXVRmiLV52K7J/cWXN9EV0vv+s1LHUyw/ic=;
        b=GqYshc6J1q+gcX8eVkILmTxfNgjQ/bJaoUrJ/11gTz2efYAvGwxRxf1OSm3hJ0OTot
         skglf323sdYchU5rZe9kBrA7hKuQbKvCcFpiv6a3DBFKyPMQWyWri5Sl3efScC9qOdNP
         pHwOgp+23r4Cg856dkiSWr+OsXOrKE07cqW40mwX4ewFla4Rfu/DTUtxWeToIHz3UzNl
         dmUw5tpgGlxvABrew0xHLPhrRu7KBeNQMovFdtcn2NHKUsdc4T14p1RGLNIHTxnYKfTQ
         RbmXPOQgRO4ucqrzGpMrB30galP6qkrHdR4ANNrNeUjsUH7hqDn8TUYom4fUDHrA4wUp
         oR7g==
X-Gm-Message-State: AOJu0YwnRrMi8rzaletyr5wgj0qQqVjI/kt9cRk0raiy4yALuvJW6pqh
	WdUIfbTdQN15I00GOG1ygLKJnLge2j0AmiMWeph3gD/6AqhsjxKav//b+i+2WnJHtnQHWoN4K0X
	d
X-Google-Smtp-Source: AGHT+IGikVKEnPXXwcnFIoA9kipBWGSCBslgp4kw45DhRVYAD9FRa9zDwIIvx/oxbWGu5CeTXkxOvA==
X-Received: by 2002:a05:6871:10e:b0:277:f14c:844b with SMTP id 586e51a60fabf-2892c49e8b5mr1373619fac.37.1729233036640;
        Thu, 17 Oct 2024 23:30:36 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.206.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34094d0sm705662b3a.108.2024.10.17.23.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 23:30:36 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>,
	Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][scarthgap][PATCH] vim: Upgrade 9.1.0698 -> 9.1.0764
Date: Fri, 18 Oct 2024 12:00:28 +0530
Message-Id: <20241018063028.52276-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 06:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206036

This includes CVE-fix for CVE-2024-45306 and CVE-2024-47814

Changes between 9.1.0698 -> 9.1.0764
====================================
https://github.com/vim/vim/compare/v9.1.0698...v9.1.0764

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f87f4dcbfa..cf36f4087b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0698"
-SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
+PV .= ".0764"
+SRCREV = "51b62387be93c65fa56bbabe1c3c1ea5df187641"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


