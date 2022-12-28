Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A09C54EBD
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.176133.1672213054614919195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F8W2orWM;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z10so14200621wrh.10
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Xl8rBWGY8or6FQcNmObJparYqoHEru5kjn4VU6Lr10=;
        b=F8W2orWMookCGUbxxNzhqYkFXfxKyXtIH6P4eUMoOjTGAfOeBlVH9Hin+qDJ1ChaJ3
         uuTUNu9y99827qACGHlH9oVXiHSPzpiQa1ExoPXfvMreP7qf6NdIxu9hGF8UV1Pg+Dr5
         m1RBfyhFcE1OJeCsaSekhqvjIFNVQsK1kNnu8AQKKNO0O1tvBFa1YoT8/xxzP+QXu7t4
         PFLGXmmJMQdPjseWPILmet7dx3VEcKv7I8l26A95QtfFPjwvR905NOiIvl99Ee97l4KZ
         +RgY1QsxDK+kS9sOTeEv7lBJsogovtyp4X/X0AFGwrrkth0dacwmvbXxYiBRtCqgNqEi
         rANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Xl8rBWGY8or6FQcNmObJparYqoHEru5kjn4VU6Lr10=;
        b=nCTg5jq+w/MGUeAfeCsTtsHifBKc55sYOPsuOG4g999Xly0km8OMdixuZfZ7LHTVV2
         Pz4l2vQQUbJHJfHWobQCEz/RLWXw7kFszkUgXBRTQ7qZugPBdwgIhFlTjYijE659hbJd
         170SCkUbosDuuni5vbp0493au0GZJP1s2u+j5E5Nad0TRo5p5Z+/MTX6JcCGqBJxY9x2
         PNTI3K3PKn/T1MWVzweEE8gX1gmM21mYyTuNHbNXMtwCVg0VVX0VRb10Dr5nvqJa0UwD
         +xHVyQwlfCcTNuX1Uu5jRpATbk7D/61NJWLjEwr86pKI5nbV0TQUpWo2ThDXnIFKxQnD
         fE1Q==
X-Gm-Message-State: AFqh2kpPebWT8gDZjEbR/Ve8SdJgyWc1moEMdIIwOi5scUpbzCUjS04L
	sclkeF8X9mE205rsJx/jXPBQCwF+YgY=
X-Google-Smtp-Source: AMrXdXsHPE2WDzV01ql5KQVtsehhQwAD5cur7dFGeB+Kz17xR1Wgua1dKVs4UAL1p65o6b5vJVQmhg==
X-Received: by 2002:adf:e303:0:b0:242:1926:783c with SMTP id b3-20020adfe303000000b002421926783cmr14984259wrj.58.1672213056730;
        Tue, 27 Dec 2022 23:37:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/25] xvinfo: update 1.1.4 -> 1.1.5
Date: Wed, 28 Dec 2022 08:37:07 +0100
Message-Id: <20221228073721.3454255-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175048

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xvinfo_1.1.4.bb => xvinfo_1.1.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.4.bb => xvinfo_1.1.5.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
rename to meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
index a913ae11f3..d7e5d917ef 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b664101ad7a1dc758a4c4109bf978e68"
 DEPENDS += " libxv"
 PE = "1"
 
-SRC_URI[md5sum] = "b13afec137b9b331814a9824ab03ec80"
-SRC_URI[sha256sum] = "0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "3ede71ecb26d9614ccbc6916720285e95a2c7e0c5e19b8570eaaf72ad7c5c404"
-- 
2.30.2


