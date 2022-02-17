Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D673CC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:15 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1775.1645114214535436351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ni3kfjm4;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id hw13so8397519ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XGdsxit/wzWYlhz5yB12wcbbCAfXv7tyiMEOixZQdZQ=;
        b=Ni3kfjm4z1Qkfk9mRrNMUwMdW6/WLOWk6D/BN2MNTBERySlrhB8jSmhBU4VwVH63Sg
         +0onfXPABvVmN9gkv3YhoVNQNfS5RSHyFGBaaL8ycScaWwZ3iBGKBFEhm3xtJ3WH/vVM
         Sf93WDiy/SMPlUMv2b9QFdzLawXUxnqjR4DqDfFq8d2+ch0vkX2tmzBdTe30rti61QQZ
         G2jbJd+hm2nm9PvOdyE3FSCzL94HAAPCQ/NdBn6m+i1zrdg0xA6wSObl/Cn8oDRWrnDs
         FmmNui7GLeuMSWUZt8f0DY/us99WkV+/Dbsmpijk6hT7z8uKEOKd2Vi6yF2QQKLYfZPH
         n4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XGdsxit/wzWYlhz5yB12wcbbCAfXv7tyiMEOixZQdZQ=;
        b=5UpVXiIXn5RwzLIqi8cweGURhxUInO/MfBDXB7028qKf9nDfEcWvL3B+KdB8NPR9+3
         XbKV2on94PGm507nx4/ww8DpuMupb9j4tOI/u4/N/68pf3TLUPdvHONu3Bp0Kk/xslUt
         Y5HYgNKQNtotmHvtH56lEUPEpjDEWNZLh2Q3IrGgh4kQ3hIw2pfE7huIgigjpwjnE6wK
         C2JOENch/BOsmmS7FZH7G6tEYe4NN5cuwBaZG/McZGftPOyMgnn8uFqDbkXRsHTVFTum
         3F0DmnQIpCuEfq5RsqKudhwJzd8w7XpDeG9tX2hsqad4flK1tN3U3RQV38WjIJ9gQTfi
         EGBA==
X-Gm-Message-State: AOAM531HfjnYXhgbWxjj7cx4qPeWw/dvLwj8yn9f7A79ckZXtaVcitsh
	2pGo+RDkHMISMELTT14U5QgGh/hdSFc=
X-Google-Smtp-Source: 
 ABdhPJxtYs6j1CB+Ecq1SoUdqGJkQnnRamJ/KGlYaMZxxe0p+RGj8YQpoLcAucLwVJ18o+dHq+JZPQ==
X-Received: by 2002:a17:906:8505:b0:6cf:2767:f447 with SMTP id
 i5-20020a170906850500b006cf2767f447mr2866591ejx.321.1645114213133;
        Thu, 17 Feb 2022 08:10:13 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/28] gst-examples: upgrade 1.18.5 -> 1.18.6
Date: Thu, 17 Feb 2022 17:09:37 +0100
Message-Id: <20220217160939.1424397-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161843

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
index a720bb73ff..2a7a3c3111 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
+SRCREV = "70e4fcf4fc8ae19641aa990de5f37d758cdfcea4"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


