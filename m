Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAAAFD4F30
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2666.1773168072755650809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SSDe64ZA;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-466f935a82fso2066351b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168072; x=1773772872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l9blCT/wsqpVcoJlBIomjEadTw/LWIOr1Fg6FyV5X0=;
        b=SSDe64ZAuNL3TJIwmy1fSF5EAUmYmcb8sCL/BFWOWjWEoRA6bZfryjmDqpMoWJLPYR
         BWRY6a7VwuFyKInD2l3ZHeN4LsD6IMGtRdAZodbg5YoZ/pLQFlBd05IFpuVXktX+4zh5
         a76pxqkNTYYGGHPxvOYIJXTKPnBJR2BzSoQiTt7/8i+NVBdfWS1ziL481jZK675B1/tS
         yf9p5KOmliHI2TeOSNh2d4MGIIsEXQY2sf51O24LNZMZCfBDklCQ0G6G7+g3KFuqd/jz
         5YRsFPlvm8tw+809RHIkM4yZbDw32OYHJx5nJmpdHyvXH/o3fT1Wcv+b/LMG5QfMOK6U
         dgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168072; x=1773772872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0l9blCT/wsqpVcoJlBIomjEadTw/LWIOr1Fg6FyV5X0=;
        b=relFnOEnwlAzf5cqZAP5F9ftpCEcExCT/TXz43AKNMW6ckQYHvzW/e/vL+n/jjcmpg
         yiOE+OE4nyFNXkDJMpSN4rJH3bc1yVXQ4yjfqgS2adxcRdk4UhO+aULZPwvFQqJAseub
         cUZ4GEO7jxuNFQvZzbRszN5oYbk+v57HTvOCKATPHemjh1n13wiRK7PM2FfxJIU8RILs
         cIN4rj4Vua3jmn14qwYGsn1d+2z17VSTNXks8bgndpytkXp5uw+Lo7MPOVunQtdnuOi+
         SAHDg20dyNwvPl0lldoOlFs6rZSwRFz9JVYZeGxj4OSZ34BlG/aAIhPnLRqhx/u9IkSk
         qSwg==
X-Gm-Message-State: AOJu0YyIwtBeYUzzEGcoyOIXthG28aNIsaEkLWF+tbuu/lSwtPNzN/Ip
	hhrLek7fvgs/pxkCREpQJd16R/UUYBGMZkzfUmRDR3xCo5j2VIMBnWV5GLzIzA==
X-Gm-Gg: ATEYQzxZJb4PIHCSYv0sFD41ubMWmOmeCboH7AQdxC2mJKOtB6lVZwNRRLNKV67aXns
	eu85PqG/EbkfJtANad085zfKVwkza0Dgp7HqRv+qvDKbiSM+ak/tMafaM/gVecK0hUfh6M1b+P9
	ljIzkUGuJ6je2D62A8T4jhWEJ/A8NMfAGcWdBwrJLx0bQu1KTSZGKrDdw97QjXcnB2fpG2BmCtP
	UwiynH2n+EbMi4R7LmkeWIo0ciESnzDPDlaDEu2gqCnwrAG9cCFziyGdM1MnBVgMzmWSpqbOi7U
	flEtgedCgrg+qaeIp6KQXIuO/w0pbGO8UG36CWbcenTqZ6jFpmCIfHLpQI1XFgu1qHCB0SyCuSJ
	FiofTnQcboX29lgUFrlvfcDeULaEY6CIFJU/qI4oqU3gFH+R6lsSHAugE24h34YqiOY6VS6ECwo
	1KQtSJLSInHguWIFWsEjLK
X-Received: by 2002:a05:6808:1903:b0:467:1ad3:7ee with SMTP id 5614622812f47-4671ad320femr2562197b6e.40.1773168071853;
        Tue, 10 Mar 2026 11:41:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
Date: Tue, 10 Mar 2026 12:38:30 -0600
Message-ID: <20260310184058.533343-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232821

The dummy SDK packages do not need SPDX support, and since they play
some games with allarch that cause problems, it's simplest to disable
their SPDX output.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index bf453cac9b..71e788b0b9 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 PACKAGE_ARCH = "all"
 
 inherit allarch
+inherit nospdx
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.53.0


