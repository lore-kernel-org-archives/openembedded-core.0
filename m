Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D6BCD129C
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:11:18 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.166624.1712754674811190981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a5BbxnDG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ed01c63657so4436325b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712754674; x=1713359474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoqXnbNJ3x9Jrovup0C7bEHubadJ8B3guyJvxS32KGE=;
        b=a5BbxnDGtiC/LBHQsUBe6DdnKNspg4iQbQ3QI7bw4YLydTqI02KxUHxP7eNqgocsSx
         5Tw9zmB1LlOGQ60TYh8dQjCG07bG9Kok3jN2suZoPI1auGUt+Oy59kpqtpcCAmrgC/lq
         TPOq8XOCLA7FvGMIC6W7ncp9y7xGQ3a2AfawjA9x3zoawY6KtTTKue1Mw0Q5eomY+nkO
         5fOt9KH0Al+2o1W8clL0sMq3LZ4ts3SS83QJVWA+vuQW+QCpX98UVuuE04/oFqZsPyE/
         Rh8EEVyRqmsAj77awBdnFqON/e+/PIxm7KTk/hMyHC6AXAgWJBZof2s9VexCKH5Ozc52
         bD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754674; x=1713359474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoqXnbNJ3x9Jrovup0C7bEHubadJ8B3guyJvxS32KGE=;
        b=A+vFtALDRcA7br8OpWuG69DL4C8cni0ttjtxn5cW2Fd9AtV9E4KTlk1LUGotwDoi02
         UZNJn5VChwiqx4eDeN6WWVPR0dDByaPa3SeWLlbvDNVY9CWp+HkahZPuhH9sxN+SuONc
         1ZS1SfKtmkclfV2RKIMIQm997Eu/pGYqqQz+/NRiRoojKstMR0QHlZN5L6ZncgQkBwdf
         E46e6tKRb30IJ/5vM5uzmRELkbaj066TawwfsDN9k+t7A67oFIU3B3ZghZ4cCl8C2iSB
         iLbYB/7QBaYsXxUb0Xzs5On4QepytjYFw3D5hxqfr34iLoTTJeGv8pU0lBVkaHqFRpf/
         ojNw==
X-Gm-Message-State: AOJu0YzXAi9WF7MydOI6IKyhZVdCN7eIV6QNfxihvXCjyPeGkm3AZ/a4
	2EUz3+nE1/UzpYx8hXNT2FE1CrofX8i2tSz0Qfp6bmbhY82kPesXkEcFZNNQvqEdzpi3gJ5nNiA
	Mjxs=
X-Google-Smtp-Source: AGHT+IEmr9QbvPVTfXyjnZGW05yVfWa/FTCJ1dLJg+mb/gB2S7CkPfKSv6tfXGFdjW8VvBUHXa8Xzw==
X-Received: by 2002:a05:6a00:991:b0:6e7:1d01:334c with SMTP id u17-20020a056a00099100b006e71d01334cmr2843214pfg.2.1712754674131;
        Wed, 10 Apr 2024 06:11:14 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b006ed0199bd57sm10054887pfd.177.2024.04.10.06.11.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:11:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] licenses.conf: Add missing LGPLv2.0+ license
Date: Wed, 10 Apr 2024 06:10:58 -0700
Message-Id: <c0838eb2ca68e2476cd7535bdf6e1380b2b7f492.1712754495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712754495.git.steve@sakoman.com>
References: <cover.1712754495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198098

From: Colin McAllister <colin.mcallister@garmin.com>

Adds LGPLv2.0+ license variation to match LGPLv2+.

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/licenses.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index d14c365977..c78823e847 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -37,6 +37,7 @@ SPDXLICENSEMAP[GPL-3.0-only] = "GPL-3.0"
 SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0+"
 SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
+SPDXLICENSEMAP[LGPLv2.0+] = "LGPL-2.0+"
 SPDXLICENSEMAP[LGPL-2.0-only] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-- 
2.34.1


