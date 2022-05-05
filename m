Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4173C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.7380.1651727173906248632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qZ/sHuXe;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id a1so3909771edt.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmattvByu9B2pzCZ1I/+1Z7iWWJ4isMsEfN486FeA7M=;
        b=qZ/sHuXe3mr68YTfqslN5SwbN82tU+jl19JXFhWCj3J1xQkDxBncmCm5ZX79EW9Es3
         1/CqAcZZpHmGyDCSgzv09Z3kh86wg2M+W7ve/iOanYH5KWqjez/rDj35h/tP3uxctegB
         T+m22jnEmPjJeuvLjPS9MhSqLkeFYNfJ6aRZvxvX2sPP9VSPhs0gY3/tEEeZG3u/+N8d
         lSBNxxKPsNZOR+c9rGYxuIqfIvE/Yhbeu9VkwpS0asuVSOMGCieQ1jM+Nhsu9QIJ0v/W
         qbkzRhhELZuGfHtHicyQ8vsuINpNrtELo67A4lQ81pyl1OV4od4SuLIuf7HrrICwgIK5
         aJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmattvByu9B2pzCZ1I/+1Z7iWWJ4isMsEfN486FeA7M=;
        b=FFlIDTF0N2wzNFbx0VSkzrlbHgNAMq83YDN9u33XiW/vtqYRbxez9mMw0XV7AqO0gk
         o49UVRXceRZ4H7zlvdFMNhcSkzkC07cC96OF4dGfxZp+o2a7IiBIW7Q9lKkIIucXOBQy
         J93LKWuMSyadwkCipnS6CYe4wj6VPBRxqOQ8k0Fk5H+hN8/RHl44wTOBuTZXrDwJXtJz
         +IZD90gBJzcyXAKI96/tTRPto23eHjmeUD5cJ897RWNLnWgGl75pzaMndJ1KxWDW1i8R
         lGNbHCev9aU1Bygk5Dj+BV04IJRg+1uDT5zNGCA7fQgQG/IOM7B5hyo/iv0x+nVTGU+7
         2h+Q==
X-Gm-Message-State: AOAM530Zciq45ZyErUxZxdGEko2PrSDv+ZKetoPFLTg1cmRSsYz2vzy0
	LEzG9ZBjHMXfm22V8JDdx0ECSjmy/Us=
X-Google-Smtp-Source: 
 ABdhPJxaMOmWnmEI8719okt7RqNwpDxc7nsI5aYue3Rwq1KkBhnEY9/N4/eIL4bRmvxeji7B0i/ESw==
X-Received: by 2002:a05:6402:27cc:b0:427:b593:62ef with SMTP id
 c12-20020a05640227cc00b00427b59362efmr22172403ede.409.1651727172532;
        Wed, 04 May 2022 22:06:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/61] pango: upgrade 1.50.6 -> 1.50.7
Date: Thu,  5 May 2022 07:05:15 +0200
Message-Id: <20220505050544.651895-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165261

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-graphics/pango/{pango_1.50.6.bb => pango_1.50.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.6.bb => pango_1.50.7.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.6.bb b/meta/recipes-graphics/pango/pango_1.50.7.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.6.bb
rename to meta/recipes-graphics/pango/pango_1.50.7.bb
index 93e1653464..727c170288 100644
--- a/meta/recipes-graphics/pango/pango_1.50.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.7.bb
@@ -22,7 +22,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
 
-SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
+SRC_URI[archive.sha256sum] = "0477f369a3d4c695df7299a6989dc004756a7f4de27eecac405c6790b7e3ad33"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.30.2


