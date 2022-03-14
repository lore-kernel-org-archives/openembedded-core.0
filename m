Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C54C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.3759.1647299850377566470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J3Lt7GP3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so474950wmf.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2OfRhkEmUpMwSAAdrMN+/GRGHslJ+Zz5YJtgl8XNnVQ=;
        b=J3Lt7GP3ris0R4Yxcg8ueSiBgXufFnB+z3RJqYawtEMnlYHFK3Y8z9RJYFECa+wGZx
         T+NMUZ2ZufK4PpEqcAdDazH+QD5nbDWmADYYwHzwSveY4/wTcdOge80gsOdTVvDhMIka
         iuBHgr/bfJnic/DZN6PA9pXEU58XL0CFDX/6E//AE3qKMUUHtNSgSXfK7mlxwrjPHJmj
         eXMRpMhugbViVip/rKKSZTWws7L5dwvT7E71afj3qA9ba98SY5QF7qkWfBvvpaHDi2wB
         KChlZ/zz5hBO7Ys4nLin1Va3A80s3JvPdMulQutribhlFAacC7UloKi9AQxVMUyzWtSr
         1j5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2OfRhkEmUpMwSAAdrMN+/GRGHslJ+Zz5YJtgl8XNnVQ=;
        b=QH4DUHWdpUMp5dMzdHqvUJc3tBa+mkKXxK0jfDo6JGMb7S2eIzn6F2IAAOavbQIYdm
         AdtE5rdqnNbOAe24Dnrs6IWFXb35eIP+PsY7wTKlkqo0QSL4f1z0ma+vjURoBpHysb0n
         WCAcakMfXqs8jxnZHY+55rPQD1uukymcs+3L9oUn/53esXRVv6S+Wps5msnlJOrZhClU
         6kuTVi0V5zUynjbn1eW4a5u2p1N4bSfz6bVn2HQpkJw1V+DjcDBqtgp8k3J7IhUCeq3t
         ibyCvFpgcnR+kAGjc8fKcUjrdOp37dNfJEXqISj5bSTCHvrlDx7K4A7bmOzNPhzM32Bs
         fJtg==
X-Gm-Message-State: AOAM532l/p4qFBK4hhTlqSOpn5RP2AYcxwh+LML3xUGSwH/AnYvMBCrR
	H6jcRSdxqREirj0bnTI8eMDcnwvr1N8=
X-Google-Smtp-Source: 
 ABdhPJyVjUan/ExPWGvJNi7xoC/x2LsJjwnZE3RqNzM5Fed2vxfBFtttxKR/ha7M4lUE882YfFw0cA==
X-Received: by 2002:a7b:c30e:0:b0:37f:a63d:3d1f with SMTP id
 k14-20020a7bc30e000000b0037fa63d3d1fmr1075595wmj.178.1647299848707;
        Mon, 14 Mar 2022 16:17:28 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:28 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 07/11] gstreamer1.0-omx: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:08 +0000
Message-Id: <20220314231712.296796-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163211

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0-omx_1.20.0.bb => gstreamer1.0-omx_1.20.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.0.bb => gstreamer1.0-omx_1.20.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
index 94c5214a37..835f9a31fd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c1e46b70ac379ac7b3646506370c9e1007b56ae293f4d334bc0e724c76c345dd"
+SRC_URI[sha256sum] = "86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.35.1


