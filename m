Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A852C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.14271.1645301749743624181
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pCaWmPHv;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso8695274wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AhoxU5TL1GAk8UO+5jPJq4wH/ElcVVCr6HB5ZX/8F7o=;
        b=pCaWmPHvzv25o2SW9tnFWTyYDlikkTBB3OlIRWlA9h6G5MxO47rGjUyeFe9SiP07Q7
         yVQL3TNdS/Uq3OqnUzV3wT3UcJom6gsHzcheCtxFURI0UYGb5CEf95RlGs6wqJH9e/Ra
         tofv7+vkAf7B16uGj3UzEFTgOcv0gA0ylD/2IWpWQvrSZ20u8R55x/RCjuomIPMqirMo
         u9HETAhPhocX1q0CNUrvxkjuFYQlw0F4Gcj9yq9INw7vYfQMxw9/1vJkcqkWgYPxZ3Kb
         sTXe5XJC+ybVxVXj7Wao2815aYnfXqk+RAiLiFcvbyfNlHoZ27iG+/E6COynNN3EvzNR
         IWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AhoxU5TL1GAk8UO+5jPJq4wH/ElcVVCr6HB5ZX/8F7o=;
        b=e+7NyvkXrlNj4vT4tUfsFJG7wQuzNM4Jh1gLze/RuY64mRN9ffVqqgc3Et9V9Xt1Wh
         zq757ByTVOnF7Dz4mS5h2I4nUXgSmvxJdE85iSBGvw0FBpswA/1kDYfboqGc8jOc/0KE
         eFhs6FKqiLt/4MArE7EXOxs6guFolRPoYYR2WNCsBPrk6jxa9D4Fke1Y3BRyg6ud5fxd
         WqRuLfSIeTQLuGnLpTNhcyaGb6eJ4C0vNuDIFAWzRru4Hy7YGuDJSISkwXdd4hwNc5Q8
         R6V3yfH6VCZB24Qn0BzH1t2qc0zypowMXz7mhlfowltSLMQP6M28D9MyC3RfDp8bf/y5
         hUag==
X-Gm-Message-State: AOAM532MQTJ7BxMCFYjrNzgu99v40eMDumeUN3JntcMPkoGpx9PzmdaU
	klLtY0AUS3VdQaz/MVMKka2Q9iKV+Ks=
X-Google-Smtp-Source: 
 ABdhPJwF6DQ1tzCNJMdVongrEn8FIrAb6/lHk4tidNfpPejB5yxz/O6rCwdFuK8rG1uksWM/kjuDoQ==
X-Received: by 2002:a05:600c:1f05:b0:37b:d9aa:e210 with SMTP id
 bd5-20020a05600c1f0500b0037bd9aae210mr15811492wmb.63.1645301748069;
        Sat, 19 Feb 2022 12:15:48 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:47 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 04/12] gstreamer1.0-plugins-bad: 1.18.5 ->
 1.18.6
Date: Sat, 19 Feb 2022 20:15:06 +0000
Message-Id: <20220219201514.1551306-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161968

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.18.6.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
index 6209a62712..df148c0aff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e"
+SRC_URI[sha256sum] = "0b1b50ac6311f0c510248b6cd64d6d3c94369344828baa602db85ded5bc70ec9"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.35.1


