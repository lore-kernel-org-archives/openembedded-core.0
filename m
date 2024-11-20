Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24846D63941
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.13936.1732111040106093483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XX3oZZzs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c8b557f91so21380155ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111039; x=1732715839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncn9TxYFGAZMD/iCV3ZNcaYuq9YHmBSzS4e22wiX23s=;
        b=XX3oZZzsD0O1ipeOuqm9eHVfRyvJC7VNPRkaHIlku+EQEXt+MhpXvEsF6eYYB7C50J
         u318w9FUlfvVPGTVvtIJHGN8nKxFzRA5bI/xbcXLNbFoOAaTCYnpPxvSArgUiT+P/ZvY
         7y8dZaXjW4BN9HOWnyG9xpVO7Gw2qZdYZFQchMfgvtoq2oUqVN9kVE+uzwqHvcfgmFn/
         ysLcw4J4GW47uXaupZbk74kA1dBKI4cRQPfe/VlTxJcGHEp+su+dfLBmZVumn/enmW/V
         x/NZrBKPhnVLRlde4bvWvaN2zn9BehAhKPKIp+ewJ6j8WXv17CptFwfzuEWTNutX0Zg9
         llGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111039; x=1732715839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncn9TxYFGAZMD/iCV3ZNcaYuq9YHmBSzS4e22wiX23s=;
        b=miQXN7uQxVJPMNZbvkLb5at8FsIU9r8erZQzAdrPagu7G9thY4eKBmn9iZNscssCZO
         zZzjMF8BpxEHdfDDYLX3y4FVOVgU4wVIyA/aZpbxpPffVmXMKMxRsbAuzzbQSHA85bi0
         ZiUW6uqt7LsypyL1SpPrB/ee/rH7VOc3qlbl5rxN3PlymMCIMqAYmoulm5jGW1DqDIGr
         SlI9n0kVYFnsOE75s9Z3JgPikQAAB5xn8po6EbJJFnjjHPfS6SjCLODNlqNkGm0nDg2+
         lX71kCAdd4fWv5hi8BwkL6ynRgT0AOavRYLfHrVb2OKfmIBL1LKke2755pqGzJ3jj8Dl
         E26Q==
X-Gm-Message-State: AOJu0YzPGB8WuJF9fwUQPVr6DsAXY8Y0MQFkXLpXG/SXo2GCbK1ue4Yz
	TT5GDSxcc7Z5wA/oWBW5WPQtghKcV3NcFK2N749w7sDdLxfkrSv9nJEoRAbQngmLJ/Da78VQWTD
	Y
X-Google-Smtp-Source: AGHT+IHc1S0EgDM4MxlYlz5DucID8DScGDGqGRzQujbeTt3z6h4Fd23exiF30lbDdMk/iD0zkdnl5w==
X-Received: by 2002:a17:903:41c8:b0:212:b2b:6f1d with SMTP id d9443c01a7336-2126c1299f8mr34657005ad.32.1732111039426;
        Wed, 20 Nov 2024 05:57:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/31] wireless-regdb: upgrade 2024.07.04 -> 2024.10.07
Date: Wed, 20 Nov 2024 05:56:37 -0800
Message-Id: <7a840afe98096dfd20983c488c3107df78cb77d8.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207429

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f124bb09a798d94eca5e93387bc361b147ce53f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
index daf5e6dfcd..0e4100fba7 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
+SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
 
 inherit bin_package allarch
 
-- 
2.34.1


