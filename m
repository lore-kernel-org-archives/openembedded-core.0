Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01463C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4664.1642588889903862193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kh/dSd4O;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13460352wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jfjvtYT9tV0sUyVN1e68aCnQNC63WWJ3ZLNb/AK+ryk=;
        b=Kh/dSd4ObIGnZBbdCQOXZZjHS5m0CervDt8xVlz9dnNPTQHidg0DrOo98gI0AuxngX
         6RLBCSujbP/3n5frTpC9BaXQiHI+w8rNQXWzEhIS6cTgR9tBr7Kj87D/wAxzMUX0/c1s
         ZVgJ3tNaJ42iXkxEyJhFrGg5SZdfovKRUcAR+G9LtKkGG5Tf3Oo2OGKqsCJcup9ZWK2T
         watQ2H7n8xytPvykjP/hZE9zMI7BcFujY+w9Fxyc15oF7phmZIsT+knS3qgUzTjpL7y1
         fkQDrHLUDpTpaPwWq1p8UpGEOthrEJcSB+bFSFxsEysLM+6ihLZy3nNWztI0vcGwE0Lt
         iA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jfjvtYT9tV0sUyVN1e68aCnQNC63WWJ3ZLNb/AK+ryk=;
        b=jIHX45nxLSHM6KY/2jDLWB0DPDsHMuhQ90AD9jtwAZdZV5dIjLtkN59hnujZQ2AdBH
         wDHSrvIs8OF/0kLs5zimVoTxc3su9HGsXULuza3lrsJrQ1hhlrDfdngHL8n1l5rcnoap
         ykpcHQW+USqu5eVNAEulaTgiKD2hzQZIQ4Wg/B0TMDknNxvfTcfY5w0lAySskC8vRrSD
         8JlZGAstc6lBcXwOi8VIOfjb+LmbN4i0cR4V/27algBZWskanYNYPcgNZ8d0tVhClNO6
         zFAj2ZpX3/cJgJ87qow6AONt6Oi6jLxeMeGd3BjMfpDlSDf/i+KEbUrQvlapfRZfrnFc
         CcwA==
X-Gm-Message-State: AOAM530+jotbGH0KkumzwdyBf6yPPijGYI2e8rsycgpPo+xIX50txhaq
	VVFzV/GgI2vFBA8WwDU2sF0mkOzQid8=
X-Google-Smtp-Source: 
 ABdhPJzEMRgcuqwV2UeJaGnU4cq0FL7qty6d6d0EsvEfYOw0JMygrjVhSLJTZTv5Da8ScDzb9WUyUw==
X-Received: by 2002:a5d:5010:: with SMTP id e16mr1581534wrt.656.1642588888545;
        Wed, 19 Jan 2022 02:41:28 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/39] libuv: update 1.42.0 -> 1.43.0
Date: Wed, 19 Jan 2022 11:40:43 +0100
Message-Id: <20220119104117.2120127-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160696

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libuv/{libuv_1.42.0.bb => libuv_1.43.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.42.0.bb => libuv_1.43.0.bb} (92%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.42.0.bb b/meta/recipes-connectivity/libuv/libuv_1.43.0.bb
similarity index 92%
rename from meta/recipes-connectivity/libuv/libuv_1.42.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.43.0.bb
index 2dfbb8b895..1b536de1e3 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.43.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "6ce14710da7079eb248868171f6343bc409ea3a4"
+SRCREV = "988f2bfc4defb9a85a536a3e645834c161143ee0"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


