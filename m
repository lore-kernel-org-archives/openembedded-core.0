Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F664C43217
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.3405.1652871533876738192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EgBAdvU+;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id z2so3056964ejj.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/spZuUwi4W/BQtbiSvwmVobdttomIWPqHVBZzw1+2w=;
        b=EgBAdvU+UD7Lk4h2fRSbkZxAkpXcBmkCpSYm7CrgFcp2HnBRMstxxG2y6aefVtcvQ0
         RaPOlo3xHYM4CViAt/7YxDPae1r5gthG6LrTZ61AuKxTp8OJVdcGtd2BbR4RlJtavBUT
         BXB7FRfB7/kYC2WmwXFFq1tUnyOxeUAIXc2zRXvJ18KADW6O3wSJX+mK/Ivfdo5PJk9Z
         a0BqNx/pm/XYO1XUgpwyGBFpj4tZVMZZhgfN84HshdWqyehq35PYwTa3B8e9IjXviDsD
         /jjvgFoQZQ07Ia3UQyi29PmWVq0HkW/Wf9incKk5SPd21BrJmBWC6QHZslwmFlizXrhG
         6MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/spZuUwi4W/BQtbiSvwmVobdttomIWPqHVBZzw1+2w=;
        b=pcEofWDo54/FR0EGbsfJ/FLMOmENm+qPUC3yEnYQejVTmnm08bKOFELIjWP7OjYU17
         CnV4UnKNxJMgWh3xRH+wzg4ISe9suNiTQmf6fLU6ZltIFM1K4kXTETlcfFacnzZDhD44
         Vn/V1hBwLjZVhk3jaWwOdOxnP/dKA5rnJr+1Oj9ONYn34gDnB/jWM6wHFB3ZsvDxqW9M
         dj6E1AfJuZn1bjLJGZAL9AwkCJ0wIcFzFAAU7PsebI/gruBRP5Dnbsd9ompNMDyLd9U9
         RD1FoJyqwRNkBR9X38npyLGwtA1vDnjZdSUFop18KlGKsxh2PfGsU/g9y0qi/gCJ1qor
         ZjlQ==
X-Gm-Message-State: AOAM530ku5tRPFxElrNb+BmXr37WDSKClFzxuRhFWKUD9LSLkxlzj09m
	pBv6iTWlj9KbXTTZ+7DtZzjm46bkzLs=
X-Google-Smtp-Source: 
 ABdhPJyaFmTiWFcxhSKIIkdbX1AVlCiG1whf95PVyJ8gli+lQrTkFWg0Pa4zTkRUUnN6tKZ4LKAE1g==
X-Received: by 2002:a17:907:2cc7:b0:6fa:88cf:c31a with SMTP id
 hg7-20020a1709072cc700b006fa88cfc31amr23241252ejc.471.1652871559890;
        Wed, 18 May 2022 03:59:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/49] mesa: upgrade 22.0.2 -> 22.0.3
Date: Wed, 18 May 2022 12:58:26 +0200
Message-Id: <20220518105843.3299331-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165829

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mesa/{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d3571467b9..6f2fd62020 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            "
 
-SRC_URI[sha256sum] = "df4fa560dcce6680133067cd15b0505fc424ca703244ce9ab247c74d2fab6885"
+SRC_URI[sha256sum] = "9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.2.bb b/meta/recipes-graphics/mesa/mesa_22.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_22.0.3.bb
-- 
2.30.2


