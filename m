Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web08.8315.1630503938241660668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RgWgMInT;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso3513241ots.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jesS1oZRFUcY4YAHsrB3S0gcvGnmevrXSAtsIBTNGyc=;
        b=RgWgMInTunD2ocs7SnvD4IfQPV4n2Y2e2O6KaZnHLypEzNXDFMIO55dLsAmvmBeuFg
         XkMkMNMFSkF11wv8uchHs/hTVspP4Ur5ShM9Q0pHpFyaz29Y15vrrFpLPWYDeJI82bmG
         um3iK74y9QTAQvnXIEulhjbuIfQMYWmkaLlyj7aldcyh5/fVOs8VAPFODiHOJnfU4YDe
         Z3bB4k5aCH89JFLGirpzFbCe2na/Djq/nxQDdM5U+jRtz+ZLLmHRVSoEZ8BvaBfp1i1Z
         uhMmtHE8gmtZUh6JxfM1YSIt4+0FP1kKJ+ypkk5ipLK41scBSbdWOIUwpTnkU1lDeV0y
         EsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jesS1oZRFUcY4YAHsrB3S0gcvGnmevrXSAtsIBTNGyc=;
        b=qpnUP0xSfvXtWE0Ap5KG2RrWdDOkDzVAC5K/m2+tITi7+AhTWgIal7TEJ9BXS2CBO+
         XlELCqraWRcfZWrrqfGIt3adY2Fc6DuoXipJ93XF+Rtis+yrJkGIsDZTLnmwfL/9XAKh
         wWPxvHkriz4xf7szIrJekbB7xYpNXsotOup2id6FnaNECV7cwUHOVgmJTRJMMsMuz7OP
         bEoku+hMpH93N9s/2SNQOR0uJewDybMi/sFdLgVqyFjjNQe/n2vsAdbiROkMHwaTcjgT
         R2QGaWN0FwV6gFFGOjKL9UctTQQ4S0de+Vf8ya2gAseTb59nLTMj/2j+VHPTbDUN0us5
         TLbg==
X-Gm-Message-State: AOAM530MC0hgLaB5GYRbRlIWo9/3teNoJag8XYpIZOxmd9UtNE1xiTwK
	VIBJFWZBbdU+dEu8zxQ9YD9HOjteDU4=
X-Google-Smtp-Source: ABdhPJxKp/wKzCugKlDjMQlNHB6OTixeY5Ovi9xnhnmocwpowaAq52bSburfNcH61K3bYStb5zhjyQ==
X-Received: by 2002:a9d:7017:: with SMTP id k23mr13449516otj.320.1630503937337;
        Wed, 01 Sep 2021 06:45:37 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:36 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 19/31] tzdata: Remove BSD License specifier
Date: Wed,  1 Sep 2021 08:44:58 -0500
Message-Id: <20210901134510.29561-20-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code in question is licensed under the BSD-3-Clause license, so
including the generic "BSD" license is unnecessary.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index a89560b424..c7d4965cb8 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Time Zone Database contains code and data that represent \
 the history of local time for many representative locations around the globe."
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
-LICENSE = "PD & BSD & BSD-3-Clause"
+LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2021a"
-- 
2.32.0

