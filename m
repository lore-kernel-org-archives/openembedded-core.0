Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B450C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.11534.1634657701691093260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jz+ctd+/;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id v127so12471464wme.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jPuzhdHd3dVQNX9aiQ53yheUuFqCBz6+0Jv2pjzNPVg=;
        b=jz+ctd+/5Z05Rr3aPq3KqCIT55bJmj6GKpsDYd0vCuq4fMK+3SDJCB+jTJmlg9FHC1
         IMLK3SmqrsCYY+A6A5qlHw1NBpO78Q4K7fOj6dOWsDF+xqtlNYtxUVyYWg2JpJtTg2Rr
         uCPtaBbHVSEZaK0J1OvBLXxBcsrUZ2uLxPXKtB22LQekzKL+z2xfTPr25mE+CGJmvdni
         5WB5hra8u9nCemYiJ8VoWAmLKGYG+y3K3vILE9wV4ZfMDR3dJ8dGa4i+4lACgki10cg8
         qdWvyEqxeEVRab0SyIAXDLo6cUVwhpZYBttTH+yNFRWJmsGzqzi5Y350Q4oDV2oBtZ2m
         qeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPuzhdHd3dVQNX9aiQ53yheUuFqCBz6+0Jv2pjzNPVg=;
        b=mmfsGIAaGYsrp5GKy/bcX0Ao9GCFZrXOgdFbASR4osfUlSnYcj3sMFarxT32lcPOgO
         CMv4thUDlaasBgnB2uqnKxl4RtQzJiRwfShbmqK9MeRB7dXTSSlwdLlsW+NB6/jYQisQ
         nBw2ZRQja0uE3FXoBiiFyeCGCTVTrMHWSep7tIjGiVGgKL1t5ePDWjJiyPKqdor1dgvC
         Qs4ic1F23DZtkjZipAKmkD/IxcDyHqUPTYK0Wc/mc2jrFlHvuwa5mGYgDtJTQnWnI5QN
         j2DNPC3mCmNNIoG/U5kjqjkYy5Rnl538Cf2ioH2UDb3jUkEevXlCvtyc13WkOKG8n91y
         rCqQ==
X-Gm-Message-State: AOAM531IBPnbMDLBMdPFGr11SG1Ng8CmhLWJ128BK6I2q/cGBaUygmT4
	c6xgF/DrOLljDTWeKaTUZVWOocLmO8E=
X-Google-Smtp-Source: 
 ABdhPJxcTZ6vdRSXDm2NXzayNKJCqbkDKVLYIoY+2awB2zFS5WIiSaQbgZkTwhV1xltUFWsTaTrmzQ==
X-Received: by 2002:adf:a1d7:: with SMTP id
 v23mr44522642wrv.171.1634657700304;
        Tue, 19 Oct 2021 08:35:00 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 50/65] libinput: upgrade 1.19.0 -> 1.19.1
Date: Tue, 19 Oct 2021 17:34:04 +0200
Message-Id: <20211019153419.3319802-50-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157169

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.19.0.bb => libinput_1.19.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.19.0.bb => libinput_1.19.1.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.19.0.bb b/meta/recipes-graphics/wayland/libinput_1.19.1.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.19.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.19.1.bb
index 341c0cc065..adf63933f5 100644
--- a/meta/recipes-graphics/wayland/libinput_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.19.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "3d3a2f12b4a65cd82684121ae4b33cdc3ad541c761a55e8eb73a8e5e443cccbb"
+SRC_URI[sha256sum] = "0bdcf5b1783b737854b7af1ca22df67bc36a6fe7c9cfa71f01e9149f9220446d"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.20.1


