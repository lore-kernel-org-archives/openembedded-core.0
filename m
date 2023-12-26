Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EF4C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 17:14:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.84789.1703610875403641765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 09:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=An0vwx1W;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: skulkarni@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3e416f303so11727775ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 09:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703610874; x=1704215674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaarghO4WAGO7JlDdXKih8G6TEQoQOJ0LMiwzGCdVw0=;
        b=An0vwx1W9uYtGJGpvsienwU/i5N1GiL1W98PJrq3jqAf7irNM9gkwy1itOI8sxQAK+
         xjb/c4aUK4ZxcBTqrVfupynwhpo+XmLvOCORfD/RGfGcqr22JUm+KYBy9LqIyeYSQro/
         0YScCVeqm3sGwvOye6/50HhDuXW54PmMB7s2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703610874; x=1704215674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaarghO4WAGO7JlDdXKih8G6TEQoQOJ0LMiwzGCdVw0=;
        b=Sert0to9R817rQK3/AKi/iFveNyz06+IMTxfTagmrC08WCplFKq/ncTljUu5WB6Ohl
         WTsXbdZJtmnsM/WXEYRXYywt1V08BX+JKheSFD0iIZbhnuCyrD9dWASMMticJBT2b4Tn
         ndDDI1v6JrvXfPf9s3NDnNNSzkinPyPYdErfXg970Nqa+Socy3Fe/QWlUl4TLY78ErTP
         wkcwLMX/ZeLOhOXCTmN3ZZa7MHAihWUVxLZijNo2MHAqrtWslt8ljqBrXiZEMnzU+BJH
         BnJQpQF/KFdeJKmtzmptN4Id1E6mcfQ4VSy3M7PfYdnW4tsvT3S+X2Z4Wrvmn19PRm2U
         jpKQ==
X-Gm-Message-State: AOJu0YxOYY8Juinj9ODqGdzyo03EHtMR3CL15j8dG+gEQDVtJFM8mBd5
	jVFQKe+0VzWaUwUNxKHh6bBBdnM5E1RK/Nv/StB6bez9gcI=
X-Google-Smtp-Source: AGHT+IFB+6Ca4xxXNAvcy3IMNa7MU7MyAMvEPM6GK3Zfgr3zteCzqIfVxJSmndLM3ffSVDpu6I+wvw==
X-Received: by 2002:a17:903:1c9:b0:1d4:47d4:82b4 with SMTP id e9-20020a17090301c900b001d447d482b4mr1140744plh.15.1703610874414;
        Tue, 26 Dec 2023 09:14:34 -0800 (PST)
Received: from MVIN00032.mvista.com ([103.134.108.34])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709028f9500b001d46d9953a3sm1906562plo.241.2023.12.26.09.14.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Dec 2023 09:14:34 -0800 (PST)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH] tzdata: Upgrade to 2023d
Date: Tue, 26 Dec 2023 22:44:08 +0530
Message-ID: <20231226171408.16269-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 17:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192913

From: Shubham Kulkarni <skulkarni@mvista.com>

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2960bfefe3..75f13cfc94 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023c"
+PV = "2023d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
-SRC_URI[tzdata.sha256sum] = "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
+SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
+SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
-- 
2.42.0


