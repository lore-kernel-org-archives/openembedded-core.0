Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00F0C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:07 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.1768.1645114206620676538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RPxRRds1;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id q17so10571983edd.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QQhsgvMhfXrYJMLo7Qym11K1//qg7lBgXoPqrN0FRoo=;
        b=RPxRRds1FwtDKkWMO86/k1H4VW33+7Ec9bdUM01zjMuvIyejY5z4c9uuFq78tqJIUJ
         PbbtFZHZjr2Oh7U1GOwB0hk6QZvFOVVdMxL5kf1EhG0E8XRYxyC1KL7zkKdJ/rfR8xNF
         ts3seRu4LHNI8TxJcMBoPEEdSHWxbkE6GYRhrL2CnxFKQ4J7+SPEEOrO2ttznmYYNPJU
         0SSXBgvpJc9Hfy1hvWLRkGRzcqVb3hRsGYvoVG9D1SvK52JDQ06tS+4/akGKac8vUKo8
         K39Wf5LU9IAQXQLFMgtThuHeY4SDAaG/VsbLqWDTJNW2KA0MjWbTTneJyaOKTZYcfcUV
         OjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QQhsgvMhfXrYJMLo7Qym11K1//qg7lBgXoPqrN0FRoo=;
        b=4Bny1elzIeg0eN+sQwQYot5AxNkh77QpmHdUmO0GIzxUiMSNq3VHUfVpsN+KAxANq8
         29cKcnHDPbUNt3nYMW1LplT641ag0jU2sVb7eKczAhIhW/soATO8C6lsfCEEY2cfPEp5
         JH+6AQ704hb5vcSLlwEUIKBZp6fJqh2gnvvdJrJPvBs/WnxR84y6HPG/WJmi0LpbuUGP
         A8X1uJtdNf5Fz8K0mgNPNWJF89mHpfLF64qPBn/TvVBPOV5j1pYh8+siLGfuxJHFAWjA
         Vx5YVx8LIMPBJiwbOKEPe2Tm6QsQ3ihmjvMBIJ6wmvmbhROgZbP0C490jU86CJmVoAbB
         iddA==
X-Gm-Message-State: AOAM532SVYjgIy9/yNmU06z1yBVqvxMysEbkWSwc+jUQSymtrZpW0Y/q
	OX2Pv7+dfSOXFMT7et5MGCzXQVPiFK0=
X-Google-Smtp-Source: 
 ABdhPJyZn2hItmZFvqeS/O6/YC6n7nx3CLGE4lh+C141HzvLaohZmQDox6mAmGttRsjbGnuBUN52BA==
X-Received: by 2002:a05:6402:cb:b0:410:8094:872b with SMTP id
 i11-20020a05640200cb00b004108094872bmr3312815edu.378.1645114205090;
        Thu, 17 Feb 2022 08:10:05 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/28] meson: upgrade 0.61.1 -> 0.61.2
Date: Thu, 17 Feb 2022 17:09:28 +0100
Message-Id: <20220217160939.1424397-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161834

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/meson/{meson_0.61.1.bb => meson_0.61.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.61.1.bb => meson_0.61.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.61.1.bb b/meta/recipes-devtools/meson/meson_0.61.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.61.1.bb
rename to meta/recipes-devtools/meson/meson_0.61.2.bb
index 32b1240012..45938af6ff 100644
--- a/meta/recipes-devtools/meson/meson_0.61.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "feb2cefb325b437dbf36146df7c6b87688ddff0b0205caa31dc64055c6da410c"
+SRC_URI[sha256sum] = "0233a7f8d959079318f6052b0939c27f68a5de86ba601f25c9ee6869fb5f5889"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.20.1


