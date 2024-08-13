Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB0AC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 04:58:50 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.65342.1723525106243310526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 21:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gwD96ISp;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-200aa78d35aso22383265ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 21:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723525105; x=1724129905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aOB39iSG1RCXRgEAiSDCApcczw54oEgzBYvHxD8G2o8=;
        b=gwD96ISpHEol2cvGgQx8g/g5nTh5itbgh77PfOJR6ksEjEBJxQw98QteNsL+YwsYKJ
         +gU5eEGAqtLSJCMbCYM/uI2X4zvspihim5/ARnPhKRrEzY9M5eLBRSZzdwUFV1cw/sZb
         TiqbcSq/475dLYVy9kTgSI7NHmCL6EDEah1Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723525105; x=1724129905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOB39iSG1RCXRgEAiSDCApcczw54oEgzBYvHxD8G2o8=;
        b=pfHGIbpTv46kagKCUpDmRHWS0Gnes1JeB4eiQnhEfiBLhpRsw2BTrZurLqVEt8iA5/
         8T6odNLbEFO1DeY3nt9ENh9AOEuxhuIo3Kcy+/jzGSDfnR/d70O9huWhdfGNEiBxSzEx
         piN3qKQ5pKM/QIbln/voi77fcZ+QXQt9ylYep+cnZxtEiwljE+MPG7dcBKBMUQAP9qj8
         MsXul0m68PddbbZzEZHNvmrAX5nGuLfL/6f2PsomsW75u2OKv2YMX7qEU/vQHy2ShYfR
         lcnxcwDcoqXtpCmnPtZHn/uzz9BCpSsq1Jg7Fkl0pPRk35MtMbW5+gtEb24gg5Xed/MU
         X1HQ==
X-Gm-Message-State: AOJu0Yz51omGOU9Nl4txoqqTkDscDPp/z7KdTpYaFfEOoIdf6jDWrStj
	N41k6u3ZxzkkrbkMb+O3ENvyzE40hk6rFjda+H/5I6VdVU5+HaBy0ovIXMXiNj8dc2N2vpJeiox
	oUZo=
X-Google-Smtp-Source: AGHT+IHzA9yYYESMA9TGFpAJnXpxHNSI2CCzRs+2oBiH/HbRcma7UcB0c0AfRJfUdMfAtuUCtuvu3w==
X-Received: by 2002:a17:902:d50c:b0:1fd:6677:69bd with SMTP id d9443c01a7336-201ca1b106dmr24109285ad.41.1723525105130;
        Mon, 12 Aug 2024 21:58:25 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14ac7csm4969995ad.108.2024.08.12.21.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 21:58:24 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-zipp: upgrade 3.19.2 -> 3.20.0
Date: Mon, 12 Aug 2024 21:58:19 -0700
Message-ID: <20240813045819.1180188-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 04:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203247

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/jaraco/zipp/compare/v3.19.1...v3.20.0

v3.20.0
* Features
  - Made the zipfile compatibility overlay available as zipp.compat.overlay.

v3.19.3
* Bugfixes
  - Also match directories in Path.glob. (#121)

v3.19.2
  - No significant changes.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.19.2.bb => python3-zipp_3.20.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.19.2.bb => python3-zipp_3.20.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.19.2.bb b/meta/recipes-devtools/python/python3-zipp_3.20.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-zipp_3.19.2.bb
rename to meta/recipes-devtools/python/python3-zipp_3.20.0.bb
index 8efb9d1814b..101bafac1e5 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.19.2.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.20.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "bf1dcf6450f873a13e952a29504887c89e6de7506209e5b1bcc3460135d4de19"
+SRC_URI[sha256sum] = "0145e43d89664cfe1a2e533adc75adafed82fe2da404b4bbb6b026c0157bdb31"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.46.0


