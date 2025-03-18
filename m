Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DF0C35FF3
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2936.1742323132702204718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kt5DZDc2;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so6681578a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323132; x=1742927932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPSfqcsFYCmDEIEBHfIYCnL+AQbT8jQB7KG0eCEwLOk=;
        b=kt5DZDc2JYd6jfol9lMwsYKIHX7xvWnNK2n8kGoOC7ntq1itvgqwg1tiakuxLLHV4z
         +YjLs/3hoakqUzHbAMT92ArVbUqpsNgqX1Zb9tca6t98JBT7Q/Ztnt84IfqD09RCAu+r
         zEYu4f9hhCu5vPObY/LHHibtW4VSfjdgUEKpYi62XPAQ3GE0FQ6YUf4zAMW0P/jnplK1
         wbU1wNrdP/FcxJgoMUlsmrB55iafT0ocJT2ah7LIfmK1JaILgN5oY9/JVSLsTXg1ps5H
         N2xRtAieVBkZT7ddTRy0H3G7ObPfIDK9koLhPgq8YwnuEMik0A5mQQBdVhN2WT6v4pJO
         J/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323132; x=1742927932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPSfqcsFYCmDEIEBHfIYCnL+AQbT8jQB7KG0eCEwLOk=;
        b=XWrOyoRWXtBxpc2QVGa4sk0liJKi50is7zePuN36RNFQ2DOZaoLKfIj866SD+UFSlS
         EHahdzHMyzs3J3E8bnStSUvL2NfXu/PWZn6Z1p64Uh5muS11BW3K9jbU55CFcsFT+LJu
         yMaEnMW8yO14nynKkBQ+nQZNNShB7VE2sqmOBhhlNW/WKhi2wMbYxb8TAaxGcPugPFzu
         AWt/J1A272gkoQzh/iHUdHwBqy0WgmDwQeT+mtrczmfrOkTts3X0sxQ6AwVNrv8w6cg4
         nGZ/PSTb3+K2yzUWzim9WXPXd95VRRemCI10tKTJwbPcvO6BkYUemwCK9lb3tlCfdQJJ
         Mtdw==
X-Gm-Message-State: AOJu0YxOIsgtY+E7h9mR/C5zOx0UO/wM7/aEqac1yPsMhlFPA33W5bjw
	J0GbP3J+KCe5lyPJ0JAG8D5nDUGsmW+1glipbrK2K4DIiBhNi0/KG9f33Dgo
X-Gm-Gg: ASbGncspXDt45RgM2kPOr+Dj3Stuo+Ri0LiSmSZTVjKv09fbELPSDvDq19M4IzB3Hup
	7G7fXIrCAsUOzCN183Rp2jTmR68F0C8QwVle5SFYGtPgjdtgtLdMUIN2SUtXDgY16cGP0HyqDaR
	kav8TTtxvLHQDdZlUan2CtFZj2cIgC+NBLqhW4cjjyJDvwZ+vOQ3uhUpuBDQl+5o3EXNB0CDOMq
	R20Y5+SXHrc8l0wNQqeD3cwU0kT88aYhMX34QwiY7599ROM19K9BI+fjDT/R6MUfPLpv9Xx4GZf
	WCG0xfjkxlkjlk+eAIG3/wKxPmt4a7w+TApO2cs09AYrIkI=
X-Google-Smtp-Source: AGHT+IGYGOFdPlVe90/2AFQ8mDW/7mnzoQWhoeEv71ZjWrbtUKvPr03oC5DaBFSiQf3SUpUUkhnzqg==
X-Received: by 2002:a17:90b:3d0d:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-301a5b80f2amr4474492a91.26.1742323131964;
        Tue, 18 Mar 2025 11:38:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 09/25] tcp-wrappers: Stick to C17 standard
Date: Tue, 18 Mar 2025 11:38:24 -0700
Message-ID: <20250318183842.2256284-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213235

GCC 15 has switched to C23 by default and tcp-wrappers is old code
pre-c99 and would need to be fixed all around to get to work in C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 8cf927153f0..05644b7db95 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -55,6 +55,8 @@ SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489
 
 S = "${WORKDIR}/tcp_wrappers_${PV}"
 
+CFLAGS += "-std=gnu17"
+
 EXTRA_OEMAKE = "'CC=${CC}' \
                 'AR=${AR}' \
                 'RANLIB=${RANLIB}' \

