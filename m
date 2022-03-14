Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81972C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3820.1647299852381858047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dYLm+/Lh;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso620170wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bQMr/9Ef7dgabbaZ5OAB+YZkUONz1HId1wbx4hBsR5w=;
        b=dYLm+/LhZ3BMgqGFkJroRFxE9oTOYg/pheyEV1JDUvCA303TEAHOGcUZNz7ejamPDE
         gz2sSt4CC+f3hLwPM57xDoCLjIwfXLf/s9gFz48XphIS1+4ldA4WpR3MA6aHPJud0N2h
         SUQGsNIjKtGknNjtxZEzs/BDdkVODjGWs/dUIUYm4659/DwNdHYLu9Pe3cJ7/ANp71Eu
         e3Ey9MFAbGkU2do5MElgpmUX3G9LwyScpm09UKaPkXrgIgbK820Q0NgBOkmVDjvxH/lf
         pXMT22YTUGDS5C7EctjBEA2OSC0UWX5IPEdBXKM6fP9ZEAXGt+70ni+8Hw2mkWU/cqUu
         fEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQMr/9Ef7dgabbaZ5OAB+YZkUONz1HId1wbx4hBsR5w=;
        b=tteupcMewxW8XgNPT8zSoaLAEm1UkZU8R185PrR6+uINKwUy/dRXMOrk7gqonDr6Y7
         yKK9Ah4fkzgeR41yqIuNi+UzbS1cZHcic8qytiqlRDpF71iWErtr6xQv2p3SahSTlauM
         Cbxh2sA9FhXSctJAPo9MLvjER7jdMRYdH6xwWmgcE0qGANRp2taIAx5WTw2IqNIfkCtq
         /CFHVJN9sVXb1kZpFKuSFpKReTXlDZ2Fje7lrkVWg+2KOt5KU0EDazfQ9Br8VC84J4j7
         TmqfzjR521LUyAB0ifZ/liQoQ3F2Y+4bzWdLvelD3uvwND/pvw/8N2kSRhfoSpC2h6Wq
         pyaQ==
X-Gm-Message-State: AOAM532fr57+8jlslo+z8Ce6e5pwMBVkhWJV4mHxu2iu0lgKRvOiuXip
	ocam1E/2S/wu0Y2HSZT5ySrS6CK7JAk=
X-Google-Smtp-Source: 
 ABdhPJxz8Yjr08HXykWoiGZTlC9aCesWTe13YnzhQz5tN/Vwlo/4uBiUSDK4vYRSKQDsi1JAa1U1TA==
X-Received: by 2002:a05:600c:19d3:b0:389:e7f7:5a8a with SMTP id
 u19-20020a05600c19d300b00389e7f75a8amr1048308wmq.126.1647299850492;
        Mon, 14 Mar 2022 16:17:30 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:30 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 09/11] gstreamer1.0-rtsp-server: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:10 +0000
Message-Id: <20220314231712.296796-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163213

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...rtsp-server_1.20.0.bb => gstreamer1.0-rtsp-server_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.0.bb => gstreamer1.0-rtsp-server_1.20.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
index be81f87616..90d788ab80 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c209f5ed906da713fdd44a8844e909aa6c8af3dfb630259b092cfb77a7755843"
+SRC_URI[sha256sum] = "4745bc528ad7de711a41d576ddce7412266e66d05c4cfcc636c9ba4da5521509"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.35.1


