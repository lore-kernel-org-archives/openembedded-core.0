Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6986C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:14 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.3051.1639000814152436064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nZW1VS0J;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j3so6543763wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/GdA1o2IbfECaLbgKf5tK5LRM43XiEUY3dfyJ46KT8=;
        b=nZW1VS0JuRXlvYcPpVBe8mTvlPpBeu+/1W74eB/sfbtXnLEHI1GM2HruAupi6hFL2y
         UC6DFiJyGW4NSGd1VgeCyI4OiW5pHdRX6uL5tEOomhy/DHeM1+inuZ/HL9HZogXCKfb8
         47Hvgl/BuhCp3eV0zjBI+OtcJIfJ3acbjUO4O+ouadvcUTGYFeT8Z96Be1xt9NrRxQ3E
         08BoSWWVmDtgZlDp2CsXyN+/Qt2D+3g5EESv28vbLXaNoWF6lNGgGqMiLWxUuHgjELsp
         qbUq2EvK4KWt8VCzznTQIjQqVJOAeRDWTxELo0EVpYiFNcswUaiEs2rV9NYF+8+QIyK8
         WQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/GdA1o2IbfECaLbgKf5tK5LRM43XiEUY3dfyJ46KT8=;
        b=ADD9BXHt1CvBYSagR8EP9ms5P6aAd6+rMoxwY88gUxYqJjUX+OkaT1KMwibo08bGEs
         qzT+hMq+FjBxaUQHnasCfdzQYbyr14JJU2JAfRag5YSmQ6RRRUqIE5SdpP/E3WdXW3W3
         nZ4FLhJrBAmwfQRPSnbBetTpEfAIU1s7rRFhDDNA3JpmqAv6TN/6HJFfweboSKW1MN/6
         2wKBOCaeIYo5zBdM/RMvJFYUUsj7STPE9dvCS2CzrDe7yEp0ZFqq/Sr4xelSWDXSzPmY
         Ui5cB7VR0wDT5cWESiqU3cVRfxw5e9KnVty6uJc6dAVVT0Dun2eCDRZSoMgB6KoNNM+e
         lUkw==
X-Gm-Message-State: AOAM531dRSHqhWMSPew2tzHrZR1h7GSYuoR1YziAMTh67LKVl8py42eP
	lT5UFiDA0pBAqO5j7TbgzKAbDnteppwSRQ==
X-Google-Smtp-Source: 
 ABdhPJw0tLfHHiZW9mbvcDrirxYGC+ah79txKidcqYFRbk5+Ifxjm+rOpS43FmLxt8tsGTIwx8iMWg==
X-Received: by 2002:a05:6000:373:: with SMTP id
 f19mr1549904wrf.311.1639000812770;
        Wed, 08 Dec 2021 14:00:12 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/29] webkitgtk: upgrade 2.34.1 -> 2.34.2
Date: Wed,  8 Dec 2021 22:59:41 +0100
Message-Id: <20211208215947.1979470-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159389

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.34.1.bb => webkitgtk_2.34.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.1.bb => webkitgtk_2.34.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
index 7a942e9cb5..413e0cdf92 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-without-opengl-or-es.patch \
            "
 
-SRC_URI[sha256sum] = "443c1316705de024741748e85fe32324d299d9ee68e6feb340b89e4a04073dee"
+SRC_URI[sha256sum] = "584677d6e7cae12e27cdcc8e05b4cf73b54849a24afc3d7a40cec91016deff00"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.20.1


