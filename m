Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80358C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.3731.1647299854662424999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CmvJ6Ue1;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id p9so26362417wra.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HBFUO2wGq6bc28BFg+i86HYZnKAsqAqBV3j8B89mf9k=;
        b=CmvJ6Ue1/LFvU06IpM/QdFoEQeAYZyllTytoO2Us8VkPxnwUuZDFLnBla4Yk/l7Upx
         K+Xvv5NlBdnuxLklKfp18S+Ynqwdfhpcl8PZTQsezEhGBcmxXNs3Cktp2+5R1ni+Mo/+
         IPyGn/wm1xOwmJ/MpTQ1CY8PD+nLevwuxZiCEMOTWp8AFVnYvFk+QprzuwJ2DzlV2DBT
         801TkW8Z8RuSxcyewVG+8U2xaj7l27SHbOfJF0s4nU11ZH9Evu10oM7QnT6fqtEQwVZA
         VKMeC4OfeMY6pCVy7N+M6oFzkUWZxeM5pLt5http6fPuBUqHCirPHUWBnlu/HxVNL9KF
         W34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HBFUO2wGq6bc28BFg+i86HYZnKAsqAqBV3j8B89mf9k=;
        b=YCWxQU9YcajUdCVLVFfVKI2rgpqo5qnu7kFnvGZkxcbJFWjz3m5qvtydkUUjFm2hJ9
         dP4j1UphPKhyrDl2OkwXCqez6+lyw5d2Nydaqf735NxHMWHa43iGnDlkDEe4UE0KyO3b
         Xyq572Z0RwND1X4SYo+mLgavHEdEW1yKGcZ3DMRQiL2SLVeMhpZFXrMtPbWc173vNN5g
         IFhJX6Xd4aA1so9bszrEsE5IL338Rc2JsaU5xhKejhVKI17Gp5kEl5Jq1t2QmnllnRNP
         0SaVEOvPKVDRpePp4QLCrO4K0Hd2WxiyZd8W71N5zTXz/UAFwThdykrYvruRKEIaov2V
         N+aQ==
X-Gm-Message-State: AOAM531l/23fiebehmVlr4JQBO1LH6aOsJZceVeXedL+w5b8pNuY6s1I
	EX4ktaERx61wz4ugOgHEIVmmNryvDt8=
X-Google-Smtp-Source: 
 ABdhPJzc1j2xhv3WEhuI4vSNdNgCSND3BdRnJerLxEqXedYGalfNzz56DITfMRXCtRSuohrZqE5HWg==
X-Received: by 2002:a5d:588a:0:b0:1f1:e6fb:4e7 with SMTP id
 n10-20020a5d588a000000b001f1e6fb04e7mr18353682wrf.716.1647299852941;
        Mon, 14 Mar 2022 16:17:32 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:32 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 11/11] gst-devtools: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:12 +0000
Message-Id: <20220314231712.296796-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163215

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-devtools_1.20.0.bb => gst-devtools_1.20.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.0.bb => gst-devtools_1.20.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
index e17f4ee09d..ade7cb7dc3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "69fc8756ec9d93e5c5258c99088434f203e91fdbc5af28d1f2c583fd819b7a1d"
+SRC_URI[sha256sum] = "81f1c7ef105b8bdb63412638952f6320723b3161c96a80f113b020e2de554b2b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.35.1


