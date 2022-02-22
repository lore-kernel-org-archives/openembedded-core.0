Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DA2C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:53 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.1983.1645557472363578406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X63pKRTj;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so468301pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vKd9KDacdqODRW6o6RKgtKg0k966zg3sVoyPoK6lRjw=;
        b=X63pKRTjbZKfDgTA8PrkHYAT0kKJ9UjG7wikKzQBv79yKWesWXX/lJXRXsIAwgSXwc
         +QHsqc9bCVRhp8jZtVkY0ZeNoZ8VIpJ/mlHKhFdoK03eq1QCEiB2zqCx/WBLAmm3Gioh
         7Flxd9rfjTCVSF77m7Qd841mabBYbLqFKN1DPCqUXir1hGfcAkA3FBmTIzY5+u3N7Wlw
         H+GbrY/xLo06sZzkWEb2EddysVAo8EPw7krSqYE4mHvDHt92dtRSLyguvkWlrNWwb8i2
         P8DFLCisGv1iNiz59a3jYhyzS8lHfyo/plM6kxhfEGE1/VKKK7JHDC0UqpLVAOr7PAOK
         bE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vKd9KDacdqODRW6o6RKgtKg0k966zg3sVoyPoK6lRjw=;
        b=PAzBsjHBRcmAz47EOD3m5377K3G1Am17f15R6GJCZL4CHJd8pQHA2oZhjgE/n6wbEH
         tRzBEQOM+gCoQC88j9DqTCrBTCemYn+J+Udqdj0GI0bS1xZgW1mpLvQSUKbZOqn+RaPi
         3Vmw0FHNWOPK1J75mfpP/V1Wey3KB4J1KBI1sYuJIXZrvNEGa40dPxUv1vko8WREcBjk
         ubY5FJG7EfTf7MF8ylzOXNJAq3KXnroYwvCGiqwnUwj36LXlZygn1qBtmdac62QdgoRJ
         8f9QwhdGUfcerAcdmRNBg3Cmb1Xxw82Wotx7NUMY6nJLuK1PRDl5Izp/SW+5a+9XdsBq
         TjfQ==
X-Gm-Message-State: AOAM532O6LPwRBrnxgnMZfh4VuVb2+wNdouLcr+Wve/xDnp//tk8kZ52
	e9gNuC3IPf5HYFTzGkMR5I8HeCIMquherQ==
X-Google-Smtp-Source: 
 ABdhPJz57f/fMaMOPXm14xVoOUGrzv0npd5EThlbgskqeskGcJ+SfbM+8kzGeNiDjxlDAFu6BWLmyg==
X-Received: by 2002:a17:902:ce8b:b0:14f:c5ec:9f38 with SMTP id
 f11-20020a170902ce8b00b0014fc5ec9f38mr8513535plg.62.1645557471323;
        Tue, 22 Feb 2022 11:17:51 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 29/32] python3-dbusmock: set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:55 -0800
Message-Id: 
 <c5d7bb4054b4ba5e95d785ed62ad8195b65493e1.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162220

The name of the wheel as built by bdist_wheel is "python_dbusmock", set
PIP_INSTALL_PACKAGE appropriately.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
index 8d97f0d360e..3a9cdda5f62 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI[sha256sum] = "6f4ce7650ecbb022684dc158df720e199635f3a3df75f7020f4fe8f6ff0394db"
 
 PYPI_PACKAGE = "python-dbusmock"
+PIP_INSTALL_PACKAGE = "python_dbusmock"
 
 inherit pypi setuptools3
 
-- 
2.30.2


