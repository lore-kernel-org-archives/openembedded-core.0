Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB514C46467
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.177180.1672213060440140445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PBkw4bV8;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso10784447wmb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VfQ11IwGV8fA7lH1w5ntG0odKYWDKNdy4xRd8OLt+w=;
        b=PBkw4bV8Z+of3g6phF8MUUrNoYgcFdtxzZXg/cPpOx/SMX/RlPcTGfa914hb/oT/4h
         TlYl3ZOuO9pUHIZuMIm+uK9oYnfCgjCNc5Hzj1IGniqoa9gLjx3RknLuBGgK7Mb8KTsz
         EHnEnl/Ltym6z6V/PouCtiNzxwj057BBFjkvEhPbLHh38oGWZQr7S+KwVpE7BXKrcQ0O
         1X8EmtDYWO/0FdCPCbVeu1w69gNzZ8ui9rySwbsw5dsjJKYPlLOATadhxz1WD/oX7Wb/
         SQiPEviklttGisBfLL5L99R6X43f5jrLgJY5sWOzXJgGDM19jqvXq65oqm/RdXVEJJ4r
         FNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VfQ11IwGV8fA7lH1w5ntG0odKYWDKNdy4xRd8OLt+w=;
        b=tYr0VdkoVi1mz5vGhTCtqslo6tyQKFAjxFcj4K/V6fzWWwEgtreFVjurhjTlSLw2ux
         MICnbhpnlDnrkDbiwfc7yVReyREdK7ybmgnAhJlVCiPx2h+UWSquI8qH7Vzd1ab5lcil
         CbZq2KykHYqAtTlRxdtV101YfsoRFBgW0QfD0Yw3DzzXonMYVe0NUkJ5vS9+oBnFo6Jw
         tHr/XB12TGDWyY4p2BKQJ+KdSgCOgPZA2iRiDag9xBxm13QydUUSdYsBgkmnnKUVCUPs
         SqEF77bZQ4NNDYkDtQSCldk+b/cIenGFksQCCqHbs+JSPZU2/qGXCYhLX7Y8gVAO1ANE
         j/Xw==
X-Gm-Message-State: AFqh2kq1lHugXK+X7UNNV8nEhAT8Y7eQLskqLn/FWjvrXDtMghoy5Lsf
	3V+KLNwNuQwADnQP//70HrRTRv1H5+4=
X-Google-Smtp-Source: AMrXdXvP1IGCVQ0kDagxCuJ8glV7PHMvl9RLFT9QSgiCOXlQ9pEu6p1Rh9rF809TBrtizDgzqhR+nA==
X-Received: by 2002:a05:600c:218f:b0:3d1:fbf9:3bd4 with SMTP id e15-20020a05600c218f00b003d1fbf93bd4mr17047697wme.10.1672213058957;
        Tue, 27 Dec 2022 23:37:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/25] libxcomposite: update 0.4.5 -> 0.4.6
Date: Wed, 28 Dec 2022 08:37:10 +0100
Message-Id: <20221228073721.3454255-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175054

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libxcomposite_0.4.5.bb => libxcomposite_0.4.6.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcomposite_0.4.5.bb => libxcomposite_0.4.6.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
rename to meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
index c07f31b92d..cd7d56e810 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
@@ -24,5 +24,5 @@ XORG_PN = "libXcomposite"
 
 SRC_URI += " file://change-include-order.patch"
 
-SRC_URI[md5sum] = "3fa0841ea89024719b20cd702a9b54e0"
-SRC_URI[sha256sum] = "b3218a2c15bab8035d16810df5b8251ffc7132ff3aa70651a1fba0bfe9634e8f"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "fe40bcf0ae1a09070eba24088a5eb9810efe57453779ec1e20a55080c6dc2c87"
-- 
2.30.2


