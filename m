Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745AEC433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.2558.1633304544521449220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IiFne0Qv;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id s21so27169851wra.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hk8P5n5gCUvysmS8nZwylw2FERMVPSmNhzUVPqu7Lps=;
        b=IiFne0QvVWnHbPS62Hff1hdc07vRaNF8J3B4Q08RVTG7VE1KYtXdOiZijnug0w+L4i
         gPB1UST/+uywyrbWSL3QyFX3b1HbDEnxkKvG5xXQEw+r6+X6/el6JS56PuhTvZ+D/APu
         gvOH+Y/3nY+GLB8TauO/SzdcSGw47iVFi/t292oh9M1YN1pRZqf5kiQfYvG3AgrF/mAH
         ToSocMNEJyviRFWaivVJiJn6YlLO6T1z1NRHbQzDOBuZTv5+tOE1rqnkfLwEIyk/jU/U
         r1AsTByf2NDlk9pJ7qmSYSGIp7ZaWgGlLG9jOZEoCPPjjSfC2ooDc9ITbqFdOrhMoMgG
         o3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hk8P5n5gCUvysmS8nZwylw2FERMVPSmNhzUVPqu7Lps=;
        b=ezLDSGmWSQMQqvHcP7jslJeoUeV3R7eMZYWH3pdO/R5a+hU0B/zyYif4SvDPxacTmg
         ifQs2hFzxAUiHaX/uC8WTklyQ2qiZPOI8Pwi07yYnPDk54zyiMKLijwO49XE//PhwT/d
         TiezjUGyKaj3VIz6kfqctncFaAE5Wille2P4KiXLr3Ccn3nPCCRBp53zEFeP+FOBGnx4
         p+G4KpmKFeK5vOj4+8iEeNR4JivDtxbP+CETn++V6/v/xZfhrXXxq9xAyZBNe3Sozv7/
         Ej3epfKsjN8TH7ZwbsgzHly6Y357YxF4X95C6bEzdVUcvrUPNWQjj8XbVskDk8zCPlVr
         LkyA==
X-Gm-Message-State: AOAM530ezML8kfnmCvWsBu+j2mZbrmslXNA99vDxZ3/j1NRMyeB+Py0S
	XlGCw84lILgO2ovqHh41JlxezqVey3tr/Q==
X-Google-Smtp-Source: 
 ABdhPJznithgY1mH/mWCzi8eDFex7YtkEXQ32jTx5h8/BiXqgWT5YrGHCShHIqJEa1qT+8SIlsUCgQ==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr10927627wri.62.1633304542761;
        Sun, 03 Oct 2021 16:42:22 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:22 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 10/12] gstreamer1.0-python: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:42:04 +0100
Message-Id: <20211003234206.949967-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156574

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-python_1.18.4.bb => gstreamer1.0-python_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.4.bb => gstreamer1.0-python_1.18.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index 2fd73cb389..74dd15b3eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cb68e08a7e825e08b83a12a22dcd6e4f1b328a7b02a7ac84f42f68f4ddc7098e"
+SRC_URI[sha256sum] = "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.33.0


