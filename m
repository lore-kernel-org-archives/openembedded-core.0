Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5002FC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.11511.1634657687386396563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CnS66mUc;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so3345128wma.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eEiHjKaIplepK5KhkMv8M0EXyDsy4MZYH5po+91x+/o=;
        b=CnS66mUcEQgVPEmjajaD550ENXn91NfK9JDXbSrEGaOTbFwAgPrKdJ6D8VFb2F25Hc
         fcwl4H622eJcOUypp70liWiXBjAHlejYMVLz5NlWvbBGA4eqDZ7mkNCHSZ14pTrWBtQm
         orbBUc/LQLZGXJYDiKcLUINK2hC97IO7gg/eDLvF5MvW5EMKLVgMOTAfgYPUpF4rwg88
         hsJz2AVsIKpppnxNS1ZTwmNgXb85woC0/o08bhQxfptj5FoaavJUGVemdrRPTy1HAUBA
         QxXzT205QTKFWde2U4BnXz9EwrNJPgMmj1sUIisOD4kQ6zqOlO7Tn0J2NEi2rQqXurTk
         0Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eEiHjKaIplepK5KhkMv8M0EXyDsy4MZYH5po+91x+/o=;
        b=Kmnbgbp+ghlJy2Nua/bbk7IsWNjrI51m8t9JvGfZPGUSJwviaYSPvUa1Oy4e4G/b9V
         k+uLa3gmacgSjKyxD+hwoKJhTqDmAH6UTdwmssTqoMwZtZcQin3psDIc4L0z3JDsSaDA
         kygF7PxqzpQbJBG5j4WMYMHRIIvycGiskatqPxeSNmb1yI+q4RnwUEu5G4R/JczAaJar
         8iUUmxELQL4WctQzPZzSNB3BMytiSANmfRCDb+xVHam5lB5IBOxqWFkzrMjj6XKWaN31
         xu1UktcSGaW41ozuPB4hb3VKoGpEAhs4hKoKXCKKXZ1FmWPflwFQF35QaxZ7r8bRcm7k
         hQEA==
X-Gm-Message-State: AOAM531iuyPsaLreYSlXxBpqtuZjbma5utajycjOg1URxUZ4K110QjNV
	WFbRYtZrrM3XJSg6Za2EX+X8dU/wcl0=
X-Google-Smtp-Source: 
 ABdhPJyG5DDwLyaLYpVUE36RLVJjTC6sMvQdn82avpH8SlSJrt/36TluipYBPA+U5NDG6g6kb8FU/g==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr6827915wma.174.1634657685997;
        Tue, 19 Oct 2021 08:34:45 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/65] libcomps: upgrade 0.1.17 -> 0.1.18
Date: Tue, 19 Oct 2021 17:33:45 +0200
Message-Id: <20211019153419.3319802-31-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157150

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libcomps/{libcomps_0.1.17.bb => libcomps_0.1.18.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.17.bb => libcomps_0.1.18.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index 502bc4688b..8fe43ed0c8 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "dfaffdce1969042bda4a184865861573bb07a5a3"
+SRCREV = "dee4ae37f7818709802de28c4d16fa823bd83ae2"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


