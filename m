Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58060C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 14:38:57 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.23028.1707230330961799786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 06:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iZl/Zp4M;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42a9f4935a6so4738731cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 06:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707230330; x=1707835130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2K7fPeuQy3PjBVgZaQ3z8n9BORhrv7PC46p8xcZuXI=;
        b=iZl/Zp4M6WMQvt5HJXpCHB7CUwSKM7L8tBZFlFnN43hf/0GP/ItidBWsFDxA8IItUM
         TQhgkEL+SrWWYce4D3UJMNm3bvzvaAEuxa9TdQJWDSYUj5+MKKacixoCZWaJMcBlOxuh
         4XX+UUBiNo1Dswn6fY3P2QVaPdb4FgSVbeROSirHTBZB314mQckguSaJbEyUjRsjeLlE
         5AxZdXRUZSrmAzDtkyTzPv6WEUNt3XvjpR7bXUZI2K4FyW/zwFY2Hb0VMCCqgXb3mQQm
         G6Aq+9Mx9FhQpA0J2V+gNstD6NC+Rc1WnSIW1TUKntJvICD6Rmrkshy0Q+3A2FPuS30q
         0+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707230330; x=1707835130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2K7fPeuQy3PjBVgZaQ3z8n9BORhrv7PC46p8xcZuXI=;
        b=TMDUaqSlXN6vE6tRtuZOkKsdTcWq+0w3eVq4YzBX8kJuCVQbgrsEOYpjYJJRuq4oEM
         UUuAJBiCCKYM1RXy3hZmcVfLslRSAzpFcJLVllrZSsDqL/PV0GzmTp+XmqFlM23SlNkS
         5Itgh4upPBfan39boUa4oH+s0qHaLEA3r2v06o+bn6UZGJiTjCfhvE3VtR/L7KtRiDOx
         pcOlOQaTxHtEoeQ3rmY54uuy2fR6xnxfwWWBEZZ+e5m9irnAWjiNezLYGBdBQQ/F29sF
         5SsQmvbkuDGdXbARLnVpp6c8NtmckYGlIIUGOJfwkvKoZG3g743tTdWH6qtkGMVQztnX
         NQ9w==
X-Gm-Message-State: AOJu0YxXresqh/dc+e3y8JzoA0x86UQhIXHAPnYiEUgUJ5aREPR/2+ia
	a1ATyN+WZPzBE+vR/xd1W4ulZM/ZkaoqBxBYsgHbvojsngoORdiA03oioS3Yq2WN12ktqeCVNde
	Q
X-Google-Smtp-Source: AGHT+IEf22xvRW9L5t9tTP0bD1gXr0qtteMx25tLMqZXaVpEELScn5zhrgx6q9pbz6+B/YvpbhBaWQ==
X-Received: by 2002:a0c:dc09:0:b0:682:bfd0:d79e with SMTP id s9-20020a0cdc09000000b00682bfd0d79emr5293448qvk.27.1707230329726;
        Tue, 06 Feb 2024 06:38:49 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id eo8-20020ad45948000000b0068c3b1bcf6bsm1054780qvb.95.2024.02.06.06.38.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 06:38:49 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest.README: update mailing list
Date: Tue,  6 Feb 2024 09:38:48 -0500
Message-ID: <20240206143848.162750-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 14:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194995

The contributing info still lists the main Yocto list, but patchtest is
in oe-core, so simplify the instructions and put the right mailing list
in.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest.README | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index ad46b02ad6e..76b5fcdb6dc 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -133,16 +133,13 @@ including the PASS, FAIL, and SKIP indicators for each test run.
 
 ## Contributing
 
-The yocto mailing list (yocto@lists.yoctoproject.org) is used for questions,
+The yocto mailing list (openembedded-core@lists.openembedded.org) is used for questions,
 comments and patch review.  It is subscriber only, so please register before
 posting.
 
-Send pull requests to yocto@lists.yoctoproject.org with '[patchtest]' in the
-subject.
-
 When sending single patches, please use something like:
 
-    git send-email -M -1 --to=yocto@lists.yoctoproject.org  --subject-prefix=patchtest][PATCH
+    git send-email -M -1 --to=openembedded-core@lists.openembedded.org --subject-prefix=OE-core][PATCH
 
 ## Maintenance
 -----------
-- 
2.43.0


