Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0B6C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 12:48:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.11839.1713358081514452218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 05:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ng2o/pRX;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e65a1370b7so34016405ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713358081; x=1713962881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0Ok+YmR7QwdPmehjFYh8Q6ZcRFBnt/l20KH7GZ+mwM=;
        b=ng2o/pRXVa+MujRCwy/3d1gxUSl/cdDLSII4utOXy0hSEnkH6wm280eRTdRY6CjfKM
         DWhe/BXwGanEzwBWAjKx8W4zSGydW0NXWRM3DbD8G7KNLNUF+S8uqVIJduTfXmERDwW+
         m0lvUZq95eSuiCYUmOLUwGTR5Fc/c/yZfbJ6Rbai3ZdkMp/hxDMxVaVALxxfuk/Oqz4d
         vxp1SqpsyGX4zTtT40RKtV8w+/qRk4CMsOseg3FVYXJUXJ7qE7WhB/JcLxX8UW45AfV1
         2CdBqgYJTHD7F0rjMmAX28IL8F15hJQ5ksTOUYvxuxD30GSxrtFteb5SoS61KXIwziTd
         BmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713358081; x=1713962881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0Ok+YmR7QwdPmehjFYh8Q6ZcRFBnt/l20KH7GZ+mwM=;
        b=DxQNLz97oiPh+Zht34d6P4c8Ykf0ENE+z8npRzVcV+nPjiRy/dJMgCUzhStdg4S6XJ
         zpfBIhUN36/hWwGtdKiergety5U6YZ54IignJlmd1XU6r6fMtmR6fbGWelaDpe8yVpe6
         UDH5ZLHdCJBI2ZbgdWYaZVnSbxOpsYaCEcOXksH7SFp8kU+schGUW3L0p3nHedeJsCsI
         ywMrHR5xg6OJPAamIOKWKq+z232+tQSEc+TS/2/U2jFnphU4HS9SVOsoXAscAT1a5hGL
         vDDAQoGqeIttae7CM7Ju4lEC4covH2fBq11zhZluquorH/6f5DJQUQKV1SLQPKTIvhiG
         VVlw==
X-Gm-Message-State: AOJu0Yzu7isIrDsCu7l2qoZ1Un8YY9wnRv744V/57FtlonLNCYmcqKO+
	R9P8uOQd9t4F7eoTDWd9gdP19aeMuAm9P+n51EBY9OwuAZpNxeV0U9Ew6A==
X-Google-Smtp-Source: AGHT+IEeUfQAGN9emaIG9lIM4yeWAIVoV186vu5smlfHAQe8GVqB7H9K/keb5qImoAW6ysHXfnHd1w==
X-Received: by 2002:a17:902:a585:b0:1e4:51ab:fffb with SMTP id az5-20020a170902a58500b001e451abfffbmr17511898plb.25.1713358080624;
        Wed, 17 Apr 2024 05:48:00 -0700 (PDT)
Received: from L-14805.kpit.com ([43.231.237.174])
        by smtp.gmail.com with ESMTPSA id g20-20020a170902869400b001e2c1740264sm11483788plo.252.2024.04.17.05.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 05:48:00 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] ppp: Add RSA-MD in LICENSE
Date: Wed, 17 Apr 2024 18:17:48 +0530
Message-Id: <20240417124748.238121-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 12:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198464

ppp package has "RSA Data Security" license text in
Message-Digest Algorithm source file ppp-md5.c and ppp-md4.c
Add RSA-MD in LICENSE field for ppp package

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
index 4b052f8ed9..5f0c75de83 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
-LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD"
+LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
-- 
2.25.1


