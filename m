Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F7CC433FE
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.2566.1633304541372836844
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ozcv7d+Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id o20so9233618wro.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reC9Qvq7aIafhNMt13y3Mdm8LAECK4hnxNl0I7RljPk=;
        b=Ozcv7d+Q0j74eGmXj90LHwOLnnSWnoEs1/L4d89ZisfjKKRzEPiX44nYnhxFk6wSRA
         u8xm3tdsz4F7wA2uLC/lHAlwyGw58W6lG5xzcfS9Qc8DR4gXrvsVGEds7OnkxTPokLlm
         Q1ub9+CZEIn6X/w6lfY0wAHG4odV8IaMXYnuu0SMM6FcNXgLTkRzur9lFKPQ8CgwkdEM
         PjxyFIPSgVTdvNXNQ9H0FXUyR/ZLnr6cbHUN7lG/VFIF76uIDoFfGcLMux6cm0E5TvxR
         a1mRv4ppqVS6l3dEEL8adeEJ1Nu2Fqoc2VUMuhbEKyM8NB1tY+qJagcREsOntbMP7njX
         RxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reC9Qvq7aIafhNMt13y3Mdm8LAECK4hnxNl0I7RljPk=;
        b=oc6XZIWmu7LjVhlz9xIc6sxnRUy0WeSeukuA75UZ+n4OztUhv1k+8hLhI5sDWLkMTw
         vljt/Cgb6jeoNz4V13jN6HoJxMcQxQ4nwHh50oV3r4K6w+vNaW7HZwk7X25bUL1d363g
         8hThRcxn4FtVTaElFtgY582dLYu3cCKDRxAc95M+DdAF7n7TpXJXtCNFqH+pdzSxnS7o
         x1r0pnZBX9WKlKzkiCDpm0pNyThkTjueEWKw9XMyj3T90rtZNMxcNoq06elsdOnOEY8+
         EncK9HtoBylk9axr0uiHVUxmfsWSYkyH1lXju9pSjnMPRQDq+Saixmdsyllv5wNVkPVD
         ergA==
X-Gm-Message-State: AOAM5310zgvnE8dDuQnSo+JJSS1CcaqSQzFwzRPURodqE/6fGGhnHQI6
	QmUMOqD4jazZwoCsa52wUO4wQIJu1Moi8Q==
X-Google-Smtp-Source: 
 ABdhPJzUzo23w9uIRGf1Hn+SalI70HjaKQ5aHcGDApi86u/V3LYkYZUgcpr8mN5MeHwq9pYrQzDT8g==
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr10699402wrp.44.1633304539741;
        Sun, 03 Oct 2021 16:42:19 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:19 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 07/12] gstreamer1.0-libav: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:42:01 +0100
Message-Id: <20211003234206.949967-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156571

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...streamer1.0-libav_1.18.4.bb => gstreamer1.0-libav_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.4.bb => gstreamer1.0-libav_1.18.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
index 0c4f50c564..a77ec62759 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "344a463badca216c2cef6ee36f9510c190862bdee48dc4591c0a430df7e8c396"
+SRC_URI[sha256sum] = "822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.33.0


