Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50122C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 07:28:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.45561.1643700531270445990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zcl0fIE/;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id r7so11990701wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fpizG5UG9TJWId6AIKxJB6jfV0qf1We5xulg1SVxySY=;
        b=Zcl0fIE//doNZ4CHDbH4YsT3/Zi65kHI5KtjdOZ0u8aU1yWdF6+R2+e4INzXWzsVsD
         LNd/yIiU3BYcgG6YEp28tPK52J6/VmfpOlFGwGUPigy5vadAQkkqsmXgedUPN9XksRm2
         pxlfn2N7SHnAUUoaLBusyEudsB3ieLWaaZU5A669rVyhPaRjX20hjdTj54yv5jB7yhvB
         Lcr8pHu7PhPsttK0GPr2nflkWZSeilWRzH6+WFiRFxiC1RX5pcrt3XaaVye4VJvWfjmU
         Ehkkmw/F+pUyScmpTGGRN3mpYsvqWWpmaVPqsb5wORRh2a+ZYiU+R+oD0TEI+c+ekxcW
         SIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fpizG5UG9TJWId6AIKxJB6jfV0qf1We5xulg1SVxySY=;
        b=FrReZWMsaoZgYjaQKZACvu2+kN6+uSQcO2AqIfEf51aLIP79jY5wA3p/G1hxMbbFQg
         E7GLek9pxksOVRwOZ7QV3On16ctlbeQMsXS12+VoA7iDGmBHlG6YG9gzcboqGXPxzHdu
         0UdwkXte5xPdtKe2P3hgujRgIkT818g2pByOWFW7qZZPEoe23txOR2qSvoSDYnrzCQxK
         k9RVN+GMy36ASJHFvkLNHJBX0EGCQombBnRYfrNOEFQG0TXrJZonOBrENukw7QgCq2p/
         VyCvreIddcmJqD2ANfsLwU0MjXPdS36c5N+NnQkuoq1L7t4AmXW45oj1RvEIq/h3OzdC
         wpNA==
X-Gm-Message-State: AOAM530A3uj4yi0FKtu30J8l59maa+9OgynGEqmXpB6eZOCUpi8wC18W
	eLCXrxG+7r0ETGB1uZrsQOS9mVzfA9c=
X-Google-Smtp-Source: 
 ABdhPJw1P09vgEfkltGIOST5orQcv70AMxsHUL/bNv56KH1ODh4jw7LEg3SfO85Iy4tHnktZW5iNbg==
X-Received: by 2002:a05:600c:2741:: with SMTP id
 1mr591115wmw.50.1643700529965;
        Mon, 31 Jan 2022 23:28:49 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 n18sm13667370wrm.47.2022.01.31.23.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:28:49 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [poky][dunfell][PATCH 6/8] shadow: Use specific BSD license variant
Date: Tue,  1 Feb 2022 08:28:29 +0100
Message-Id: <20220201072831.34695-6-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201072831.34695-1-nishaparrakat@gmail.com>
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 07:28:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161151

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 65e3b23e1b266653fd30c90222e953f7e37fba0c)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7061dc7505..bfe50c18f6 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 DESCRIPTION = "${SUMMARY}"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
-LICENSE = "BSD | Artistic-1.0"
+LICENSE = "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
                     file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af"
 
-- 
2.17.1


