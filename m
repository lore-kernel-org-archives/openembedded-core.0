Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26AFC3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 08:31:46 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.75220.1720427506040204437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 01:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P6kt/YOz;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367a183df54so2162781f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720427504; x=1721032304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xjJJwYr2CZsnCsv8C40YECV/N34P8V9f6cPqdJsHq0=;
        b=P6kt/YOz2uG7NT+H8E5d/ersZCw9iJrn21VUughbASa01+Zhi+61wvD2PG7OHLRL40
         2PaHkmLOwursIIXdyaB+x/d/xariNpQtxahEravkUtbk7svN5BdJdtegP6inXegxFB8o
         UDI9eLFpMjiDJv9rQXB4KlC7Lpw1V9QaMWqAqki2+9GFPA8yuIDqkEdckkTfABnZm3zY
         rJ3+YIwOKAaisHfxpWsYY7Kd70RqqX/BrwlhlL5bBCnqhTh/3YtqzDZPOyE0zjkV6pO4
         5eGCsKYlWrGkZDZd/KSVj5BeEO+jT4Q0htiLOkWCzx0vrsFAAnKwQFFUGfyBp2Y9jYrr
         PVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720427504; x=1721032304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xjJJwYr2CZsnCsv8C40YECV/N34P8V9f6cPqdJsHq0=;
        b=NQTrMqBZiTG7uEDQ9EHzzuDli7rZM051i+sLTCFy5AqV/bS9tKqhXNP3NrYyN25A5B
         aWU9Qj7a/JRoTcwmcIKTHnHV1AYNg5xnEdtzyed6nTLnydmJqN1Ye/owhnQ3ZDaw6/62
         1eH/paWTf8eDCZPNfqU3uSV5zZ4ePXCwZWXyS7TF3xnDiwj2Csikr80VRTLvtyrSCPH5
         WCnBdXmFYzjmNUduCp1Yts3YhXIjvNTq6oeFd5t+v39zBVhKSk5ZeG6S6i8T8EW9lHOn
         gLd9QXwZCQKRB5Ku2i9l8UscxfGapH93EGx7yrDlFIJ16g/eOinwBGS/roKiXB8twqFR
         eULg==
X-Gm-Message-State: AOJu0YwV/Nm17xkzV/p4CCpC3OBN5rlcJ2Uok2jg6FHdajlWzlL1RbFI
	XQoqIS5bLucmyk4ZkEEhaTi1+8f1VCQyp43Dt2rBdWmWi7Xt3iLQtGzZWQ==
X-Google-Smtp-Source: AGHT+IHbdEiVNgEqOCtZH4B+dXdtoOv9D2Vio4nolP30/7ZFFyIQlNPKpFjQG0/HC36SlcJO9R/vVQ==
X-Received: by 2002:adf:e743:0:b0:367:9624:f369 with SMTP id ffacd0b85a97d-3679dd2925emr7761018f8f.16.1720427504106;
        Mon, 08 Jul 2024 01:31:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36793b39ef6sm12765957f8f.82.2024.07.08.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 01:31:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] hdparm: drop NO_GENERIC_LICENSE[hdparm]
Date: Mon,  8 Jul 2024 10:31:46 +0200
Message-ID: <20240708083146.3177183-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 08:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201631

* the hdparm license text was added in:
  https://git.openembedded.org/openembedded-core/commit/?id=e9c1f48af10ccb58251ecc7e041babb99b94d6df

  and now the NO_GENERIC_LICENSE was causing:
  ERROR: hdparm-9.65-r0 do_populate_lic: QA Issue: hdparm: hdparm is a generic license, please don't use NO_GENERIC_LICENSE for it. [license-no-generic]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/hdparm/hdparm_9.65.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-extended/hdparm/hdparm_9.65.bb
index d5e6ab6065..1b6af566a2 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
@@ -8,7 +8,6 @@ LICENSE = "BSD-2-Clause & GPL-2.0-only & hdparm"
 LICENSE:${PN} = "BSD-2-Clause & hdparm"
 LICENSE:${PN}-dbg = "BSD-2-Clause & hdparm"
 LICENSE:wiper = "GPL-2.0-only"
-NO_GENERIC_LICENSE[hdparm] = "LICENSE.TXT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=495d03e50dc6c89d6a30107ab0df5b03 \
                     file://debian/copyright;md5=a82d7ba3ade9e8ec902749db98c592f3 \
-- 
2.45.2


