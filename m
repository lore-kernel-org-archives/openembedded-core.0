Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B81CCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.51534.1658306688169368332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G4fYal6n;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id k30so22839941edk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JEcFscsl9DG7WlcCvysdAnbf8ffVqoPqrtpTL8CEvWY=;
        b=G4fYal6n9DopPoNosxucZAXVjm1KQ2AnN21MeMJRPsSqOfDwro8Plx6+6xU1NBhS3+
         vTOyOm4j9gDo/A/tRdbvMYpa6XFNO6NwrXGM+gcdEYSeiVbFoMnDmvAvhysR4c3N++AN
         pd10loDPgFPdvAzrXDcnuXUK1C8ddtvGZiCP/Bp4P6dECqkdQj4CnvLHbIsurySoCvUN
         Hj3FBFRLOg6QEVzjZOWUnGbRQWbo88wnlvHMLSyDClOe3DPQIXWseQib7jl2X1SUliLK
         iJFyUdD/1OeKBSNproXNdGzCKMt3mjm+nVtmhAy1/jfuEzpcptu8vMyigtOVlgdJzTFt
         S08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JEcFscsl9DG7WlcCvysdAnbf8ffVqoPqrtpTL8CEvWY=;
        b=QAkHEjuP3S1VlWPCCpnJ9+23E1VM+ddkNn7kGYMCxmwGbxCgT7jtcIpxqVNmK1li7p
         /MEboeKp6fSniHN7grl8mAHSDSPeGvvXu0D6d3St3dOWBSVLC//x3E0mjBraNpGR1VzN
         tLnSNZKx0OQdowveBTv6lWLCJQytR8d5Frb2WPWWGflz8qZ4TlDmlHYOXjPUjRpjOuex
         /aXrMbhYzNdLeZBx3I2TIUdD/WEQq2dtikeppzsF98GqVjlgLPkGT5UuMNXOt61/Ywzk
         OySqD2E0HWw3e0YjaxLTsBucV4bCEzXRWG2C9qjDZRUjmGwP/vk+PpmQi6flgrUUDbi5
         rSKg==
X-Gm-Message-State: AJIora9mOccwaIAhTq3BchSHblfuXR32kCuygQ82KVIeHjfMncwLu9DG
	U1a524dxEpryT+yyuQKiPH5k76MR1uI=
X-Google-Smtp-Source: 
 AGRyM1sCeQQKT4QcSgS0JQfJ632fR0vQ0/NEfThaCRg7jQv2qsRiVR4MHmUY77QZLv4MFp1GoaWmRw==
X-Received: by 2002:a05:6402:5d6:b0:43b:2391:a07e with SMTP id
 n22-20020a05640205d600b0043b2391a07emr41291816edx.366.1658306723593;
        Wed, 20 Jul 2022 01:45:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/51] log4cplus: upgrade 2.0.7 -> 2.0.8
Date: Wed, 20 Jul 2022 10:44:25 +0200
Message-Id: <20220720084442.2940187-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168328

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
index 3798b93f76..bbf4ce6218 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "086451c7e7c582862cbd6c60d87bb6d9d63c4b65321dba85fa71766382f7ec6d"
+SRC_URI[sha256sum] = "cdc3c738e00be84d8d03b580816b9f12628ecc1d71e1395080c802615d2d9ced"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.30.2


