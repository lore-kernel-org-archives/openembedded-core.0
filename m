Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D09CC43217
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9241.1635325663558815459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cJTwENO9;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m22so2967032wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LHMO763YmW+5Xbohgjq59pHj6Jr3ZfOO5TkdgkAkGx8=;
        b=cJTwENO9KxtrBgzdt1iBphcrJuKo2KLxvi/iBDhLwy0oaFiiNK1Qd5u+hMrxrghOSP
         4AfoGcbnEZaP6WOApx+u0GdMs7PP5WTZIaxNOXzRr6p3KmOOHHufcWun09OkdJlHRGXB
         HWWR6yPrXZliM3SuOalHd4yARl4BTijr5H74TS5LcsjqPh/oDmL/iYGPmlW7wE4511Vs
         ugJ9z3IvlTy37rm1F16RwxcaKgkudtf84c3SSf/cFznvSyQkQlNnYNmRRBl8O9srTeDm
         q8ycxOT9lEIkOs7YXCtGebiXijfJ5Lv7W9TRWiO3niSrBFfXEo8RkyX0IGmqA55BWqds
         KGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHMO763YmW+5Xbohgjq59pHj6Jr3ZfOO5TkdgkAkGx8=;
        b=buHmwEzNWCCZDn6NZoQCsXEHPLJEmqNn7O0m6QZCRa1gGhvlplX3E2fSApYiHhNh/8
         5Azk5wLn0MT7N2Ybr2BPkezzA32iETYi63Y1UedOS5N4Nmv+LHGkS0YfcS0X0GAY25bu
         sLa/zePOffoP6kOV7milSMlLap5E0pFs2o4YHogknJbur/S5r/BxOKuUU8rJ4JABqWRb
         7/Pj19DQGGv0N9NrHfeygy9M+N/7gvWQe0N4d0DmU3WBoG9USU5p9zvBXyIuuumZp7Wd
         e7npr8eevbcnCaMAbwZqsM2t2n0O0qomrX0iakjZIIKzqEM0nULXlVCyrkS2w6Rm6Hhw
         JaVQ==
X-Gm-Message-State: AOAM533pVa95i5Whsvvh6n0lF2TEKFAk1MCBkhgnMEU/0wJy8SfKaWgi
	LtHCEoxkd736jcEedeQN114eo8IXYLo=
X-Google-Smtp-Source: 
 ABdhPJwpAnc2YIpMsXrLNchvavT08C9up/Y70m4dxUDjTTLCiXQ+td4fEBaddPGAfoETmNFNS7isQQ==
X-Received: by 2002:adf:b1d7:: with SMTP id
 r23mr39282427wra.145.1635325662231;
        Wed, 27 Oct 2021 02:07:42 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/30] python3-pip: upgrade 21.3 -> 21.3.1
Date: Wed, 27 Oct 2021 11:07:12 +0200
Message-Id: <20211027090736.2546759-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157482

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pip_21.3.bb => python3-pip_21.3.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_21.3.bb => python3-pip_21.3.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pip_21.3.bb b/meta/recipes-devtools/python/python3-pip_21.3.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pip_21.3.bb
rename to meta/recipes-devtools/python/python3-pip_21.3.1.bb
index 924a564f62..6ddb1d6296 100644
--- a/meta/recipes-devtools/python/python3-pip_21.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.3.1.bb
@@ -10,7 +10,7 @@ inherit pypi distutils3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "741a61baab1dbce2d8ca415effa48a2b6a964564f81a9f4f1fce4c433346c034"
+SRC_URI[sha256sum] = "fd11ba3d0fdb4c07fbc5ecbba0b1b719809420f25038f8ee3cd913d3faa3033a"
 
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-- 
2.20.1


