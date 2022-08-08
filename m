Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C57C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.22613.1659940986365386645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rky2x80k;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id f22so10052893edc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dsf1gs67gVGGPAFMW3ie5rhiXDxU921Lv7tVnhMg69w=;
        b=Rky2x80krq6OJ5m/StqvWFSEiUXS+1dUsLtrGJSVakwX2PY5FxJKDLKOV5sExB7FP/
         eTeE3QwdogqNP6GpXOyU50s9DKfC+XD87mDpc/joPWI8NrA3eEYau0E6e876cJuH+ZpB
         TIYNdjN0fK/PNFPqepz/g5SryxOBFXHwytES89iEYn87GYdt9BrggVPUp1S2o3zGtP6q
         J0GQwL9dnAumZeoR8OjfG7TlbGokO/SIsHaPSzPk36SRymMpuwg1Rxa5CTl9OrL1Qb77
         OMTgHxqNrbDfCPGFvaMsjPlEmcX2w1eEBuQ+J26fP8fM9Tyc7eYjx5vktsxc7PeP0RaM
         jUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dsf1gs67gVGGPAFMW3ie5rhiXDxU921Lv7tVnhMg69w=;
        b=HPyv7ZTk86J5x8dBS9XaqT2NPRdUVZa34+rFOUSeOGrHpyQyU+ZTmw114JWZ3RO1Q3
         O9iJJLiNo48VwTCrC/bVR5bBtOugxenQDcy6iRSK1HBWfIbZZTEjCMQNOhptmSKO094t
         Eu2W9MMm+V9FPrqUUSzPhoG72rvabzKlQOV7UOOrJORDKyfI5i8kMuubChJimB7Hiu6I
         VvcoHhu9zWSPY+93cwVm7aSDt4xha9Uh+32E/eNyVP+wkxcjrA9wylY1bPAOW4Mg/77f
         aoUxaWDxukKQ/6G5bPY+uOeSxs/WCrmbjjyEWkq47PuTVBQe2ZHCPwteZzHoLJz8TaPT
         TRWQ==
X-Gm-Message-State: ACgBeo2sSPMZ9T39WqNynEKQC1nKgRZuJB9X2LAHfWJ9CAQDz2el36pz
	nZsw4N0Gl8vprOvTbYwVLu/DEhBoHB8=
X-Google-Smtp-Source: 
 AA6agR713xFtY5b4oyl6lqXKY7ghIOpf6a/FObTUxgU13dTdgh3K+3euYqIYZnKEQx7j6E9wZgGjDA==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id
 h4-20020a056402280400b0043983c28be2mr16878788ede.292.1659940984851;
        Sun, 07 Aug 2022 23:43:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 27/44] mesa: upgrade 22.1.3 -> 22.1.5
Date: Mon,  8 Aug 2022 08:42:20 +0200
Message-Id: <20220808064237.3975347-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169051

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mesa/{mesa-gl_22.1.3.bb => mesa-gl_22.1.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.1.3.bb => mesa_22.1.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.1.3.bb => mesa-gl_22.1.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.1.3.bb => mesa_22.1.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.1.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.1.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.1.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.1.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f02ef2dc2b..838b20d94f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
            "
 
-SRC_URI[sha256sum] = "b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c3f093e3"
+SRC_URI[sha256sum] = "6fd60d38efdd25317948c61494b5117e01d42da695278728b1faef9f5f9a47ba"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.1.3.bb b/meta/recipes-graphics/mesa/mesa_22.1.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_22.1.5.bb
-- 
2.30.2


