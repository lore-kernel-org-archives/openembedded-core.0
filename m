Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACBC4725D
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 00:23:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3956.1705537389540141467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 16:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTnquBxs;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6daf21d1d5dso1708657b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705537388; x=1706142188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bczP5H1dV1o+/llVjdPXOgprH3VJYQp80epJVm77Wu0=;
        b=KTnquBxsuILA/he2Et4eNx19tsvPxGgoOSTHFGmoeRJP4woACN+62P5f85pYYb9fa0
         1OMi5I6vPZKQZvp6WZ6uroZuVhC+0ElJ1trlrhPB1FXnt+ItnvN5TFWyG9USsHRb/iKk
         LQ25WvvNnbS+nuMSO3sVVKR2m8U+vz5z9cPHnH0OMbB97OxEvsywqk0ufo1hYoKqGxGX
         KkRG2umoDDvy3d6CROxQZNjO+p5USdZhSBeHsesyK2hfxElpsRxi/nU9JqHdVVGDHw84
         h2TcBAvpJ5b2UOYIxRR7VOeFualTv5rWuJ7FruFe1a2ZmQmkEmFw/WJjqe4aOQXLcqYO
         I+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705537388; x=1706142188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bczP5H1dV1o+/llVjdPXOgprH3VJYQp80epJVm77Wu0=;
        b=ZmgFqAyhaR2C7Uz6RxZXtquxFFBC4xURLK6Bm3pL9odA7RhZ6CHsu6+GL44Lz/3P0I
         ggSCKFKn39eZt9HAsRmDMms62BYolUOJ3/QeCfu0Dwkgehlz+pbumSTk2AkdJPGoKEek
         0rkP1i5SCzHQv8LOvvksoz1U9cs/R2nAs0JOL+7jauWIvWwiYpY/LRTSNpey8TUDMYiw
         8D9kYuvqUK38+OSJdKURKQsXpgN7LjS9hh7ZwDUqnINSPxyqHbqVoB62jW/NWV0K97+J
         U4O5IdkBoNHn7y7KKRPee+1m4qZg3U69e7e25UWdTYdKz+aP00IatnasRXh69Sik1DnS
         nN6g==
X-Gm-Message-State: AOJu0YxjRPWiJ4EhNk2LUjqbFse5YYW4FJhsm8dImXyeZTcgxaMCLxIf
	2ktBkqxC4US5f2iMWauxVOoRRII/tAJ53WMeap+ZS8bK6lGJwnRAoHTbKP1v
X-Google-Smtp-Source: AGHT+IHtW6aiWOATqUJztI62RKFuBSxaQuIq5U/goX+fojt9/U804tK/WksfL9Ku+UymoYkbWKjnwg==
X-Received: by 2002:a05:6a00:3909:b0:6d8:f420:da04 with SMTP id fh9-20020a056a00390900b006d8f420da04mr158734pfb.0.1705537388538;
        Wed, 17 Jan 2024 16:23:08 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:90ef:9aaf:10b2:2357])
        by smtp.gmail.com with ESMTPSA id y22-20020a63b516000000b005c60ad6c4absm256300pge.4.2024.01.17.16.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 16:23:08 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] iputils: Update to 20240117
Date: Wed, 17 Jan 2024 21:22:53 -0300
Message-Id: <20240118002253.3660203-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 00:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193951

From: Fabio Estevam <festevam@denx.de>

Update to the 20240117 release.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../iputils/{iputils_20231222.bb => iputils_20240117.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iputils/{iputils_20231222.bb => iputils_20240117.bb} (97%)

diff --git a/meta/recipes-extended/iputils/iputils_20231222.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
similarity index 97%
rename from meta/recipes-extended/iputils/iputils_20231222.bb
rename to meta/recipes-extended/iputils/iputils_20240117.bb
index e919febd12..5a5e15528e 100644
--- a/meta/recipes-extended/iputils/iputils_20231222.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
-SRCREV = "84cdf26908b4a03b917a5429a6339b7374fcc38b"
+SRCREV = "8372f355bdf7a9b0c79338dd8ef8464c00a5c4e2"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


