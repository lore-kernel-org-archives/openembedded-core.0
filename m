Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B64CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:23 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.50320.1710953062705257835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UEcL5EWW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e88e4c8500so90425b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953062; x=1711557862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZaZVuKTafYFgYtEyC1h8fM3f2zusb+hLkoG/kiDCWE=;
        b=UEcL5EWWNpmbOwFgMhdyzarJSJoXNbse8EW4hf40Y7Tv8YJfJEZ41AVgk1kjV5BGVR
         d4NEWxBKfGCOL/qB2AN44azRYCFqTe1OceL8+HLfkHhTRA8yUlBaOMNXGkv10ji34ffE
         25IEu9r1dFqVIv7xngsHcazcHB4ffv+pPvGGEZC8DcsxDP6A439Ti8mOKRHMSbRm0vPW
         sxl8rXHDGl/utLk29zZbsUH6dRnI9J3P0w7MSXon6P9Y1zibnbZWPKEVz3OxqwFHcztg
         kwhdAb+gc+zcpBpEaPNHi8ISQTEcoFFrsGwPrwH6JJ/r/9hfK3ACIFOiPvlgX9wBMZce
         D6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953062; x=1711557862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZaZVuKTafYFgYtEyC1h8fM3f2zusb+hLkoG/kiDCWE=;
        b=YavYK4q0aEmUE3v6CXpEAlbhjXJQsMnzezgoqAtpDcbph+KiHKc+x004sSXit0DACe
         ge54GfOGQH9nTHbnIDUHoo0SP8IDzRUAQn9hC0g4R5vOaZRfpcR3lhWlwWv5CzEnY0VS
         A6y9aiYVZQZN4JB6HVigHcMxnX/0CAet9A2I/Y9dSgF8koLLCfay7TXgfOEAr4wI4XZQ
         ARMtXIFROjGYBukBTqiVUPkxTcawqnK/NDLjCFCv0fFaFV4pBoRi2z3GviA2225UbzM4
         RR5Se1qohHbW89iTnf1Wq0yWkynJpic/Nsujbay97ncorxQrrGEKr4gYnhri7bJwqAG1
         7hVQ==
X-Gm-Message-State: AOJu0Yx3eOKWLm/SNwn+uu+/BWlydz8Ak5WX0dSN/eOiZ0PIxH+E7TVE
	GmTD+6/I6Kzstm4SqJp7q808iITV7qmYQhe1SSt9yMq5Xq2P+XjWSuKVVtbMxS+kvUvjjGiRDnx
	LjZk=
X-Google-Smtp-Source: AGHT+IHa55/zSZ6sFp9eyGy503VqWn3zTnqGn33Zu5fHd6yiJ3R5b5IozErqmiXi/PSLBnEDROuJpg==
X-Received: by 2002:a05:6a20:324b:b0:1a0:d103:7030 with SMTP id hm11-20020a056a20324b00b001a0d1037030mr14734937pzc.32.1710953061955;
        Wed, 20 Mar 2024 09:44:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] cve-update-nvd2-native: Fix typo in comment
Date: Wed, 20 Mar 2024 06:43:56 -1000
Message-Id: <3ce55e2a1e680de1cd9be735fb766a1366e88a98.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197389

From: Yoann Congal <yoann.congal@smile.fr>

attmepts -> attempts

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc18aaeda8e810f9082a0ceac08e5e4275bbd0f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 69ba20a6cb..9b6e746add 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,7 +26,7 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
-# Number of attmepts for each http query to nvd server before giving up
+# Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
-- 
2.34.1


