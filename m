Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4F3C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:26 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.51066.1720015284142145333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GubboKGY;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7f6309e9f29so199524839f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015283; x=1720620083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZLoqttQQd0sTcjjmtleS0ipsYhkshkbTe3nrVGzReY=;
        b=GubboKGYpkBJQIskUNP3BpxPCGeRCcmkrFSAe5ltO6DgP8a29A+lV30jKDCJRr5XYK
         tYNJ2fJhQhIwYtvFaxFm5gZ8Q3EFod1qpyOLqNse7AruBMK4aQ+Kjj+fJJo2BKZ7jtyB
         G48hdlIW9KGp+m4JNR3KnLS7FTaoOLFRJxXtrduvAwe0owMHfZVW08hiNk9rF5K1/k93
         5VpBqvBtb4QI7ZZu5xSKUPXWjQp4jdI7eL2F72PSSygqxbrLfLyuYefhSH4HG9ghzuPh
         bAxj1ZALvEQjAHfgDNUPpOkRO4jWmlKbUYuWExgdubTSil9uo+YyrpQAcVsKt0ahhct5
         K+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015283; x=1720620083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZLoqttQQd0sTcjjmtleS0ipsYhkshkbTe3nrVGzReY=;
        b=UGrzOq3s4mNhGyXYyNp0VGb8im2SJxxrA6GR/A/8D9dORCP8HEf6vxmb2gSaYtTuLO
         Oh3Z+2DtxIuvaRyp1H+gixc83IiKVUl7hZhpbwWWltatpZEC0zrHcsw38NoUhsdQDOYc
         pf+v6dSGv7TRMa7OgyDMr+tEbv8YBbwPsBNasDiTKPb/AIxr3xeC06dilsUXgDtG24Cy
         NIZ1ThPAAn1GmdOMo5PEppN8aBj63K10pqOl0Btb5yCY6tqez0sTV73WXHPKTo6H5upF
         h7c8v7qNTliovb3+zQt4HhVZinlpTnMVdsoLOBANkDG1dxbl+C5x5wVS3XGj+Ec8yLW0
         tfTQ==
X-Gm-Message-State: AOJu0YwDtgZKomqGD6ZE+iEQ515UVXMQUM9ABub7mBUEt17JmB1pt7/Z
	3AJAuJblKGmdid8kxSdCB9a4SQT8RAjpxuAskmDLtUuGLuMIlmPoPe6KRQ==
X-Google-Smtp-Source: AGHT+IHC8UaPCF7U17k4iWU1zv+DwofH1pxwk8PJAgnR01abl5WNZ0TxWvKFERApVyqvPmV+BaJaaw==
X-Received: by 2002:a05:6602:1d4f:b0:7f6:2802:fa76 with SMTP id ca18e2360f4ac-7f62ee1b590mr1329355239f.10.1720015282537;
        Wed, 03 Jul 2024 07:01:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:20 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 8/8] Switch default spdx version to 3.0
Date: Wed,  3 Jul 2024 07:59:23 -0600
Message-ID: <20240703140059.4096394-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703140059.4096394-1-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
 <20240703140059.4096394-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201489

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
2.45.2


