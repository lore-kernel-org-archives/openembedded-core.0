Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA04C4167E
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.3437.1652871553271838343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CMQlBzVi;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id dk23so3020482ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GMkyFF3UkO1Li3TWmOVJqReTbEq7jVAcYZbI1jCYoOU=;
        b=CMQlBzVikfJfyad/sEJmexRadXkkm4t3ibgQRNizPjtizbb5BihcYzN8Ruxxeyv5u4
         2M0z2o6+Q9k/ZQkrtu+A/sOljCXPcFI1SLAdBZtFMuCBYW/xuJogl26DOTsNjXjvIO4q
         59TRC+hmCPCTAbKf9vET+RDqB06RqDTaZ4k22bAy1wg4QL9T1oxwA+a6X+3vC788bpFf
         zPhceaT2KO5vKoVqUEoYExkFmjsbFORpr7wY5cuZGlOCMfS8oeGbcWzpiU8egB0+esk8
         0JTo5gqVLa+iZyI6MaoqRDff++pU7MFzlbVzn5OGeJLWWsUSC12zHmKPMInAqioY7Swx
         Zgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GMkyFF3UkO1Li3TWmOVJqReTbEq7jVAcYZbI1jCYoOU=;
        b=bWy2C4fo84w1dLQGEVaFLnpCNeLrYCuY+8t+9+Bd4HG55QdvWWABHCFrpmGOs/sutb
         EG6x0zGpWGE9p48bLMCdIQFO159tcWcTxzil1o2Exof0KANgPz47Fx13mVZS7JUDIGJl
         TROgpIAFGsTuuxjKOyiG6t2KFfzL2tErZpeTV9CfXzKKLbnsu0jU6CscG3nEekorfvD5
         8wcPWNIGTFS1xT4kTod8frINBxzD6qhCIn/BYN6/s/IQe26nUUPxTzZZ113vo6nwBVAK
         apIm3DHY/JHQNcOJ28rFE+0BXzwfQs4vsFnm4ycKDZH0UVBh7mnGtc4BBoYODwoJd3MT
         ODDg==
X-Gm-Message-State: AOAM531Nrt46kDJroslRisVNKmuKFceqFKbl9h0IQqOio2AD6wHVNABl
	7OmDjKxFCcuRiXtWPRQY7qmCWQ1lfHM=
X-Google-Smtp-Source: 
 ABdhPJyIzQhGG3IQY06yHvWAJI/FiRq/7yM4K+AnOX4fwb9Ujhwzi6S/xkJnSh9CEqYB8GjPM8/Lhw==
X-Received: by 2002:a17:907:3e8e:b0:6f4:ff62:a399 with SMTP id
 hs14-20020a1709073e8e00b006f4ff62a399mr24998686ejc.298.1652871551886;
        Wed, 18 May 2022 03:59:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/49] gstreamer1.0-python: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:18 +0200
Message-Id: <20220518105843.3299331-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165822

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...reamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
index a8ae274631..34bc4bf4f4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422"
+SRC_URI[sha256sum] = "853ea35a1088c762fb703e5aea9c30031a19222b59786b6599956e154620fa2f"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.30.2


