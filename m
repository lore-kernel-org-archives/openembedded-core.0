Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852EEC4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.4304.1667832928871683551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NcmwDvWm;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bk15so16552020wrb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha7ye/A9Ni+tMVN4mPgXmAFzuGPh5ibnf9cwbjyL7jg=;
        b=NcmwDvWmLLUEgSlckDMk4VOvDP/UtuoEoN1JcD6dllAMRNIzkiq/Mp9SQrM2weDVxI
         AaFifa4aaowB5cmwuVbiRJah16M0maUlNdQprldfE3+ckadFwr6yjMZRLQ0vdm8Qvhhd
         dZ2ACsjuoLte+mgqb7XohggQt4EubohM8dLZ5sRZ1zmA5O98TX2TNRSaqGwOkP5wUSw2
         XFbOjSW0w0JlFlBgkgZzVvM4qmUpWyXWtWNEoYy/WeA8slO5MlbAdYGoKjeUROyMPyOv
         F4AVDsngVKoq7MDgT/TX+NYJE/RRxny0MJZ/phxd7JX+QKh3t/mtFii1chtxpB8zuGxI
         /TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha7ye/A9Ni+tMVN4mPgXmAFzuGPh5ibnf9cwbjyL7jg=;
        b=2y53m1lixeL2V3/oBhf3f0VfKm68II+3MGe3+ligkoBALN4QO5nIzL6HX5HVfdJiaG
         EOQ/TDeFCFSkotrojR5kiCyPBfkS0fA193UzYiG4UHyGvFI3RYVYTZAliubJAVZzDT7W
         zATrr9/e/qoZihzELV4sAt+CtrumjcBYD5Xt/5YAe6bDTEYALmDWu0SfZZfx0V4hdfZr
         xPy9oYsyeNfWga+G+4TZDbKhJUYplMCRpiznm+ccH0aOrTraLl5xXVtWIndlrg8RFk9i
         TlV3KtNxq27VrC7kT/9U5zsN/WV+G5L+t+GC4+8YbznRms2U4d0nz0OYFRnHT//G14U6
         k6+w==
X-Gm-Message-State: ACrzQf3RPX5O+anL/0EzxqAoy0u/+OxbMzdCycaQlA8anObxonuzpj2v
	lewc/AkGXCkc7leBgLzacPx7RWHtKWc=
X-Google-Smtp-Source: AMsMyM4H5rMrZdaHrBD17Y3tOWaiS2Eh7ZWHOZvgL7zBy9uwNwlOX9BV1f3yXGHfCccfrRzjFcgyqg==
X-Received: by 2002:a5d:6485:0:b0:236:4ed2:409c with SMTP id o5-20020a5d6485000000b002364ed2409cmr31605338wri.110.1667832927411;
        Mon, 07 Nov 2022 06:55:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/48] python3-git: upgrade 3.1.28 -> 3.1.29
Date: Mon,  7 Nov 2022 15:54:35 +0100
Message-Id: <20221107145508.1051404-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172865

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-git_3.1.28.bb => python3-git_3.1.29.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.28.bb => python3-git_3.1.29.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.28.bb b/meta/recipes-devtools/python/python3-git_3.1.29.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.28.bb
rename to meta/recipes-devtools/python/python3-git_3.1.29.bb
index cdcd862be2..e75f8b4e3f 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.28.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.29.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6bd3451b8271132f099ceeaf581392eaf6c274af74bb06144307870479d0697c"
+SRC_URI[sha256sum] = "cc36bfc4a3f913e66805a28e84703e419d9c264c1077e537b54f0e1af85dbefd"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.30.2


