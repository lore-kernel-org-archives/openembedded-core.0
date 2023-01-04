Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911F8C54EF0
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9363.1672830368120524387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ShQDStMe;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z16so16084610wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmQzCc5/cknPwxaMgs6VWxa1mr3iU9SYaBGFh8vlpgs=;
        b=ShQDStMev0FbNVIS8pDuHHDgkAM7KBDh3B7gi03C/xUqc3JaUZ1sTC2CfTdzDQlq/a
         rr43THmagefUKv5q1jeyGSCZRwwfeAAIP1AOtVk99oZXqTLTrcqIM8MK7O4bpHdbKw3u
         GeIlnu0+JMU5uYVSwEC2MjLdT5PbBL/FyCH/4cAu9TNlHGY07ZntL2siSBdFOPbeUK+r
         PuVuqHDQ/tM8+ruTve3CUv/FJsnr3/fXKnxPv61FA72OwXePaM97Zb/91hFF1C3N8g/H
         +u2tsTeg4SCzV+UCjMccGivq47NywFY/fbIovjDY1SmEIAir3lA/OTT8Erd+V1ji274w
         AYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmQzCc5/cknPwxaMgs6VWxa1mr3iU9SYaBGFh8vlpgs=;
        b=OV1hOpkgeYb+prSFcuPeVZCAmuHBUlDPho7AzwA6VbN4+Ts9FF7YRF+e2QhWLBg+aU
         ux5QNVPM1egGsPciweWmI9IiUnfHeDjTtQeIBUFU1WLSqv/pF+Eq7tkrU2uX3VGP9qEW
         I1xcQl4yZsXvOsOettA8danu7YBviV/K7Lh/6FPX5fTLHJrkr6XRr9ZaMH0m5laUFMyd
         mo/OMsOrmzv2R4D4ZshY6hnzCqFWBkX0tXKeC6dyh06ZjUQvjyNcq+2uTo9Bs2mevMVI
         iuh8+mzTQFG4KoN/pA6ua212NhExC43r5cvPLamKFCyw7cajnnbO4YVgfrgRoUM6cgrP
         quLg==
X-Gm-Message-State: AFqh2krbn2cCzhjrL/eztIsR9Z2p9I66DGLayW9IN1+scyvDtphFJwN2
	6EjS7jIG2Ut/cY9MmcZmSPGAcTh4Gl8=
X-Google-Smtp-Source: AMrXdXv0v5UZNc46xvf+RCD6fklFkWtUa4tk6v4gVKI701jToMtGZzKabVTKz88EGSLtJirf+jVYVg==
X-Received: by 2002:adf:e283:0:b0:242:324e:b3d with SMTP id v3-20020adfe283000000b00242324e0b3dmr27961249wri.1.1672830366642;
        Wed, 04 Jan 2023 03:06:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/77] python3-hatchling: upgrade 1.11.1 -> 1.12.1
Date: Wed,  4 Jan 2023 12:04:49 +0100
Message-Id: <20230104110548.2537259-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175404

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-hatchling_1.11.1.bb => python3-hatchling_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.11.1.bb => python3-hatchling_1.12.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.12.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.12.1.bb
index 04f5f5fd4c..fa56d7a42a 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.12.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "9f84361f70cf3a7ab9543b0c3ecc64211ed2ba8a606a71eb6a473c1c9b08e1d0"
+SRC_URI[sha256sum] = "5b36c903d4d76790b1c1f2b7c8f5446fb733fab6ce39b203401d2337d441b411"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.30.2


