Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323ABC3A59F
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.23152.1649632623084912108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FLRpkEY4;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id f10so12407834plr.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gYM4oq/oJ2I/Yg91FLq3qrYxtiIXfdBX6409DNR1fh4=;
        b=FLRpkEY4BCN0bDtIdvEOV8HmQ+D29m1P064/zWbKiQIRW+H4bWckv+Qxdl862764c6
         S3fha/MrmcIOqTgKKRp0/osT2wMWp8xuAu86py+mo+/7qn+flia+BoRG9BQDjnxRIhnK
         +SWIM6K+lWn2Cv6bCdD9D9v4uw6UXLMQAhdWe6vAPoWWYXH6nbDenD2ETCOe21Eh4L9/
         sxo4bWJ6dCGguFskYEGMhX3wJLyVbV3i4QfzEVEMPHCltaV+hTARbZ6BzQybIJpQeDaQ
         w3xhZkmIPxXkHt56Yvu5Z1W6RJJoImIEj9hGLTihZvIcavYQdqHpy016Tc2LNn5b+vdP
         8c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gYM4oq/oJ2I/Yg91FLq3qrYxtiIXfdBX6409DNR1fh4=;
        b=EsdOZjoZQaoJEfXJlfq6fg+VsG8ahnoEP+A7xzsGYVWoQ+iaZWvwlcwbLY/LckEgtR
         DRygFcXsZrFkakb406riF5v3NFkf1Wyv4JFCdNdVczT+G5KG4mQO2cIlAJpNKNoyctyu
         2Pug2H/a7JjD+hQTZog9VzPbztcxsS7+6rlqGh2wcGXGsD5Hc/kgsOh68OkLT/TR5TCA
         i2nkMapPfVcvLlv2KzQgL8M7j7taghj+B6oB2r1Y0TF7zfWeiK93DskX5RW3eo913gss
         6aXJpfTqoqTyLltx26Ou0fGnbVrpb3OqOAVLo80Jn3qe9BRIf6K78GQbxix2ux5RAghD
         rApg==
X-Gm-Message-State: AOAM532oI0HSqV+52VKPyXIrXEx1FGm/IRXanNMzuPlSmIKYOfzkdvhL
	K7Oyf46iMpSAaGivkUdmniNceJf24/HzVw==
X-Google-Smtp-Source: 
 ABdhPJzqDPbssp45fOprTg5IzUCHLTrmPcitCerl/dj5VHZLXVN5EpRRBNxcR/p8ojfZa4yi3SCT2w==
X-Received: by 2002:a17:902:7d86:b0:156:434a:a901 with SMTP id
 a6-20020a1709027d8600b00156434aa901mr30380226plm.77.1649632622337;
        Sun, 10 Apr 2022 16:17:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 y63-20020a623242000000b00505c49bd2e9sm1008208pfy.219.2022.04.10.16.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 16:17:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] libarchive: Upgrade to 3.6.1
Date: Sun, 10 Apr 2022 16:16:58 -0700
Message-Id: <20220410231659.717650-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164210

Changes in this release [1]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.6.1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix subject line to reflect right version

 .../libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.6.0.bb
rename to meta/recipes-extended/libarchive/libarchive_3.6.1.bb
index f078c8ad03e..c795b416289 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF += "--enable-largefile"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
+SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.35.1


