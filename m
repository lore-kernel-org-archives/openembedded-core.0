Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796D6C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:18:36 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.34259.1718835510497369996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJh7iCUq;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d23a0a32afso91952b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835509; x=1719440309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T3ggPzHzoJxsuweGARlduUC/tLeCFRcx8gbgl85F/k=;
        b=KJh7iCUq1CzmNQvChOOONBPpKDn7GrG3KPblup074Q351BnVtH5Nq1prSTQnPM2uKJ
         rEVCw8S67r4GOWjh1KyAB50ZU9dreES0BSPnaEbLyWMCBxgRkfyhi/VR98uuaL8wBEKN
         iLvWQBWijT3DVTZY6PIahJmPn0sSORk0DRZ6ZxomvnT/p1Fucpab7lc5YJhQreq2vPUd
         n2W7YobOXsJHfZ4NnipSyQIB9y2ISdaUKWvpB+I495wQSWWiNkoMbqIp+aUHdZdr1K7d
         egljgqDKVLtHVc6/GQRIDdWb58S6wkkrOsF5AP2LtjPfBELs9WxL+U9yx0UZ5JTHXy5U
         eMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835509; x=1719440309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T3ggPzHzoJxsuweGARlduUC/tLeCFRcx8gbgl85F/k=;
        b=pkTCuJPBy8zxSbA09lk2hYPixKFWde5Jyf41TovA06aI9RLYjskhks21hbmyrznTzH
         9SGFwLH64TadlhS3y29Xak65Bh+OJnWvfpdAjobWMASq9iLTW6Xogqplc/FgZXzITncq
         Uy30qj1pgg+9uBNGju3x1HVCRrwbAw2rDt4PsiRTO3qIDw7wmrX0wCAhrTdEUoNQDYIq
         UzxTk5FHlArDpBY/LiPJtM0qU/Sg04r2P+yIdf/U8HRrstHwgraP7tTM5WJRPicBH3lO
         m83ZsWrmpkRiS0xP5oLIWGCB0piFtWP3ysPRQCdn9RCG7xux/wzyxumsy/AP2uEBE83U
         vl1A==
X-Gm-Message-State: AOJu0YwmbmLEQszyRT3FfMRRab9vRFjVlZHqbh7u4ycZlb1EcAQVy9ZJ
	MqYqDLgCwUva2DXWgJWEK4hiFSeCqGdGwcNyn2iq4OFUf95poLt9ufL9Ww==
X-Google-Smtp-Source: AGHT+IFPp+CSlGcRtYGf+VG9Z+trM8bIOmkHP7LZKiXdzas13xP+5yC3qhBNTVEIg6Kf/iHwb9dYFQ==
X-Received: by 2002:a05:6808:60c:b0:3d2:1769:90e5 with SMTP id 5614622812f47-3d51bb13b8amr3214009b6e.57.1718835508704;
        Wed, 19 Jun 2024 15:18:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4189])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2475e5359sm2321190b6e.3.2024.06.19.15.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 15:18:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 7/7] Switch default spdx version to 3.0
Date: Wed, 19 Jun 2024 16:13:29 -0600
Message-ID: <20240619221805.3038528-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 22:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200936

Changes the default SPDX version to 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 19c6c0ff0b9..b604973ae0a 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -5,4 +5,4 @@
 #
 # Include this class when you don't care what version of SPDX you get; it will
 # be updated to the latest stable version that is supported
-inherit create-spdx-2.2
+inherit create-spdx-3.0
-- 
2.43.2


