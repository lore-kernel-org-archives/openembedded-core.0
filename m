Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72927C433FE
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.2557.1633304543125323561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WxJ9+BfW;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id u18so27248032wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yLOPy1ZwLwj2ZGLA2WxOpZ1ezPm6an+eIE2PhZq44LA=;
        b=WxJ9+BfW7p3oOiORLKky7nSxI02idXYpQKlXFzGFYU8Ai+D3o/gImOm86gacrXg3sn
         44DZN1X/a32oNVs8xakxJiClu5RdUFSw0v2FuFZ6C/IddRdWDyc/NxxKLcbdS2BU4rrV
         GZqUyX8oLd47VsM9nrp8GCkCiiuDHA5v//wD7aaELSIFxWuqRRSYBniAzZVqC7WkgKD/
         hZ0N1YKVDa7S09K/8i4ICNrHoNop1uNt5kjlcj5d8w9QeIbyBGc/pnDdo1dch5FD12GM
         8sExKWpsKWFEAYBAgR6MjjJBkzDmEWxTwiqNFiKSOSSSRgAlkjYNDVLJo2O2dVZEMey8
         Gcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yLOPy1ZwLwj2ZGLA2WxOpZ1ezPm6an+eIE2PhZq44LA=;
        b=lUsH3OCn+mSlSeg4oUfrsiR8iAVLjX2RFa1MX6UmVpXrTNQ/lH8t6HfJmE2Za//tjr
         FrC+mYy36zUUPv7u4ZdVflB/eDlYF0Sjd8wbUbRqen/ewbKaa8ZMsX7icggt1rLsyaA0
         U2jxCWvOgcMECrGy1Gk6NneBjBKbVvBGdJHNJ1J9n1vfjIP5uzmJoZAkyJ9JRGMah5GE
         fewAb/HTROjsJeC2XU975QmlLwW8wwKhrmmX0Igd8sxT9HFBMwBVJuxA6iLTEZS9Z7dY
         NtHxj4EhEUWZffmoouq1SGX+Xltnmj2PvKcz6hvDrnVRkIHQFp2i52T0ac7I+SoRPBdB
         jk9Q==
X-Gm-Message-State: AOAM5338KdhzdUd4OQ5hjw2ZX5mGjoTaEuSwL05b+W9gmwMa8jfF8/MM
	GKwfjyeqPmqsalEYVJye3277b4A7V4XvZw==
X-Google-Smtp-Source: 
 ABdhPJxfGT76sWQW4httMa2BNIJ/6h0Jv+bhboVwJOYS4liaPa4ii79sF558qhrqqDVCOhpwyp4myg==
X-Received: by 2002:adf:b604:: with SMTP id f4mr10826788wre.111.1633304541453;
        Sun, 03 Oct 2021 16:42:21 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:21 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 09/12] gstreamer1.0-omx: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:42:03 +0100
Message-Id: <20211003234206.949967-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156573

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
index 7baccfe288..b2c1eb3ea0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e35051cf891eb2f31d6fcf176ff37d985f97f33874ac31b0b3ad3b5b95035043"
+SRC_URI[sha256sum] = "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.33.0


