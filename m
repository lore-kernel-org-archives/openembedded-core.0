Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBD1CCA480
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8671.1654338396073729844
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bA0Gc9s3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so7506821wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bHhFeg1ucD8L2WOOxZlDjMnFjbTBBhv+qqtOzCofm2Q=;
        b=bA0Gc9s3uhaXF0pa/y7CMVvYpPcgz9dH11i9jS1NBq5U4IiIfH++KV1r9vH9Z+ZFog
         g3EuPxLiOWQCuBstPoT+ERSJlhKZsfKd6xm4xB+HheVypdVMtHLYgFgmhu6oHXhxlyTK
         b5XKAaObI1Jbprb687qePDUOSEDTyGBc/KPPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHhFeg1ucD8L2WOOxZlDjMnFjbTBBhv+qqtOzCofm2Q=;
        b=kXU2i9JHf4z3TdB0rCV5RWtyHWFgHpAaDfOxwW2fVnFBMP8kM6cE/KFwNoJvScEGzF
         E4FeMxczDrX+A+vZyCQAClt8NgGVEBEPouGns/iFuS9fLRSjEh0PiUYZHZFp9EoaMSSK
         i9cMBjKVPerZWG8OwWnvl2CbiRKUM7e3wnxbcjOgQflluYcCnB7ZirQUWVv2zTvtplK/
         z93aS8QNBZSiLphs/DtVSmS/oyD2tUJpDITPFHMOutdQUZS389dmynnlqfCM08PmvkV/
         i2L3MstB/n7YR1dJBNxlpl9mO2/4satxwRv57HWvKaqizOBE9yhQxF1ODLNF/8d+aPDJ
         1EMg==
X-Gm-Message-State: AOAM532cIQ7/PzDwlRHqNcyldKGjw/eKtSUFx2nBlQOod1fANyg2VeXt
	3YVDD3+q9flWnG4+Jm+fMXJB3bVDS4drVtrX
X-Google-Smtp-Source: 
 ABdhPJx2J9tuXzg0thzduglQENs2Hd/sa2wEjiCQxNDs3YCOZ6s+xSKR2eVZGZSReC1l0LnYZ0954Q==
X-Received: by 2002:a05:600c:3ac6:b0:397:7520:c78e with SMTP id
 d6-20020a05600c3ac600b003977520c78emr12947026wms.23.1654338394375;
        Sat, 04 Jun 2022 03:26:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/17] piglit: upgrade to latest revision
Date: Sat,  4 Jun 2022 11:26:17 +0100
Message-Id: <20220604102625.199845-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166555

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 28f76fed379..08f664ca610 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "65892137809f7d0d4d7d65dd84af59902b3e7f1e"
+SRCREV = "a1a1824b38f1d7bfe851633db416c6bed84ba557"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.34.1


