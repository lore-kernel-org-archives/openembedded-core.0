Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F1CC6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 22:42:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2518.1663022556742394230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 15:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bI98GB8c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so12095583wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 15:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=bT8ZM2Utqi85iV7BV5UHHx5X91zNMZoFnUjzTT6qdWU=;
        b=bI98GB8cp8EV2e2WuEB5fyPSUaZ1UrNEM6c6LsT8p3Gl6rwje0twNZnOpflHCJvCeU
         quW0FOCd9Pz7AoPRWU3O3i0cm6SmIP8lkKqgnE6eTDE/yRnhUcu0JQSWGp14S6je0ocd
         yBduvzK744NroQC6eWyRC6RRpoN/iQAutsSQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=bT8ZM2Utqi85iV7BV5UHHx5X91zNMZoFnUjzTT6qdWU=;
        b=Ya6YaagBspHIQXPkVrecWOtV0H6Byoxv+BVS2FXJyWjNFNdaqV9WKQ62fx8AE+/3+W
         DehIXDUbYlNUIeQ8sz3Ne3hwHNuqOG18Tiw6JQNk0tsuzfY9t071OvFFRQvJNYwH0UDC
         Rk0ukD2ZlUShOkeC9nmEBGjlf7YKYocj+MvVMH1Msz+nLAsMAsIxYUSA4x7U5BwrdUic
         sAhQQpTx7C/BJUf8+L70hIBLt7Q1MiX5a/bjq1yVY0VhOteYxDcIcIYDxl8KoN19szRs
         JxvDHG2h+zd/FWNAhLqPEcOdpI/mBM5M9IiKXj8y43IybXWDX0V5Fq/rhO1K4zVSvbOC
         HUzg==
X-Gm-Message-State: ACgBeo1y2CTvaPkBC/pAa/y4jUDu6TTqFuozm6ONKmxdN5tLWfla83Vi
	e85pBic4tJJwq+39mrJ3irApyIh9rLK/Ew==
X-Google-Smtp-Source: 
 AA6agR6OLvU+pgNfMoXyH/XTO4d8oj5r2irMFOvffa1OXf8wM92cFBXDyUe+GYe+8PigNW7Cibub+Q==
X-Received: by 2002:a05:600c:3b13:b0:3b4:757d:93a5 with SMTP id
 m19-20020a05600c3b1300b003b4757d93a5mr328333wms.183.1663022554601;
        Mon, 12 Sep 2022 15:42:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b740:75b6:5b77:5982])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c198c00b003b47e75b401sm6911575wmq.37.2022.09.12.15.42.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 15:42:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 9.0.0341 -> 9.0.0453
Date: Mon, 12 Sep 2022 23:42:31 +0100
Message-Id: <20220912224231.920784-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 22:42:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170549

Includes fixes for CVE-2022-3099 and CVE-2022-3134.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33a82992433..70dc2dfecf5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0341"
-SRCREV = "92a3d20682d46359bb50a452b4f831659e799155"
+PV .= ".0453"
+SRCREV = "83a19c5fda0556330860899bfb484addf9178cd0"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


