Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D4C35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.2883.1742323144492718888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XEYfq9YD;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6ae7667dso7352133a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323144; x=1742927944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=XEYfq9YDVHjNsGaVVTctz2Iwta1tNI4QkCwu9ZmeO9HJzA+Yn2sb1yhqqzHyIPe3xq
         1OcSXkM27emh26nAsZaUZ5E4OV5Iv2LD3MdnvXt7+RgxeE5hUpLdO7Ind/l5aYAlBiM0
         ujMlmoCP0B/5UGXVUUfoE1fAyvP73PnfFOymprHhsr58Yshh0zHiUdqIia8Vj1CNrywW
         sII3DzLecSTGmGNr3ORXNyus9KYQiD9/KFV/YoTopB3TTtuIPxkDBaC5atXtgUMSLh/A
         0SfT47lyetG20eJsA1YG2C2ugtDKK9oyNERU4VVQPpeOrOl2Q1TXL3S8KIclrgrCnLv5
         sJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323144; x=1742927944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=mb+4A/z5eAWxaDGNAuAUWu6d8S7D5/BT1zyDuo3op3b8VMYJRIlDk/dvqWfJIFXgmx
         gqV9UiaWnc19eOno+hPBxxS4aorCZZ3QGZyfScHg9NPkCk1HwJn4VXj2Cw044cBx1tdG
         Atj4B78R7VIn7EGun/rK/ln5MPLwjfxHLAgoT2SdLK2v6Q4kLjHODGPeUf00ZgyTXHtD
         9B8S2R26ae31Ife3yrOSdxAI+nhYf2sZbGUuaEmbMbNFQy4wrczXxhKuVDUvjjVSFv4j
         NjV6fRjwixPEdGMhEDq0sq/5dmgr6XZ5NZEAYG+vgUHMwYshgzKGbrzbPoOtg/9NOhMS
         280g==
X-Gm-Message-State: AOJu0YyvYQ7vf4I4hHQ/F5xb6tLMDHrgeoPh3BxMRkE6uOmFBYrJsllS
	R+cF6BiWVaLuqgP2kcjXMSRLuPJZrSOjZhin7qJYqxJTsJ8b8HtZiCqdLiTW
X-Gm-Gg: ASbGnctga7tA2aHuDB3n/IZf+8+vQ4Ea3aA/rftHIeBiAPPu+WLDj/vXcNb1E8KXYUs
	tban2zHLt/mx/DoYSyHyY+VqPqFwc91PCCEHM+xNQKKtZwCICdMsa0c021o+EYU+jsiv7jTrOuc
	xfzSRelZColUmG8drz+Kt149SyEv5Lk1JtE4iwKaCO/WGZwmLuFrstotvH7cxRTzVDvcpi+uyxG
	li8QBcngShrHlcTzkbwAF0PcEQ2SgJynEYUgen/Osff9JuwIle3/Hsfpi3v5ff1P0Qp1bWjIo6w
	YQnyKl6YeueN4doyAkOMGpO5bbbnjs4srixr
X-Google-Smtp-Source: AGHT+IFKoy4Nlyjer1zmhQbkzfFHepL+i3iYQUOVk/f+/P6hmn442ivk+R4H2oV/2lcGgUkECQtxbQ==
X-Received: by 2002:a17:90a:d40d:b0:2f9:9ddd:68b9 with SMTP id 98e67ed59e1d1-301a5bc5c05mr4268939a91.26.1742323143718;
        Tue, 18 Mar 2025 11:39:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:39:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 23/25] at: Remove mktime signature from posixtm.c
Date: Tue, 18 Mar 2025 11:38:38 -0700
Message-ID: <20250318183842.2256284-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213249

This is in conflict with signature from system time.h

extern time_t mktime (struct tm *__tp) __THROW;

GCC-15 with C23 on, this is treated at error

 posixtm.c:45:8: error: conflicting types for 'mktime'; have 'time_t(void)' {aka 'long int(void)'}
|    45 | time_t mktime ();
|       |        ^~~~~~
|

config.h is local include file to use quotes to include it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/at/at/posixtm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/at/at/posixtm.c b/meta/recipes-extended/at/at/posixtm.c
index 5514ba4fe26..bba8312d9a8 100644
--- a/meta/recipes-extended/at/at/posixtm.c
+++ b/meta/recipes-extended/at/at/posixtm.c
@@ -20,7 +20,7 @@
 /* Yacc-based version written by Jim Kingdon and David MacKenzie.
    Rewritten by Jim Meyering.  */
 
-#include <config.h>
+#include "config.h"
 
 #include "posixtm.h"
 
@@ -42,8 +42,6 @@
    of `digit' even when the host does not conform to POSIX.  */
 #define ISDIGIT(c) ((unsigned int) (c) - '0' <= 9)
 
-time_t mktime ();
-
 /*
   POSIX requires:
 

