Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9D5C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:49 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8700.1654338405160745651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SDPddFlz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id q15so5251526wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bWd8IvOrDFI9wy4dNzdtti13BkvrRP1LXORzqghvPeI=;
        b=SDPddFlzXZ6p7woYdFHNmNJdkgU+XwLl6cZK/fddcEDbhE0+yKEBKkzuans0YRtRQM
         B0czMOG3VrO9Pi43Zps2xcU9EUDnhzP0R4F1fKbGv0RpBvFIWzPW1obKruchCQxxPp+r
         S7D2Tl5Hz0Yopt4zD3oxP0RmJ70QdcGAWyoXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bWd8IvOrDFI9wy4dNzdtti13BkvrRP1LXORzqghvPeI=;
        b=sA8veH9F2QkKO4qbM7F3AKgQK3bALsKbx4q1EQjrfKHnlcKS5ZD6UTU9y7Uh7Bf6r2
         OvtwrZmOnRDBHwi9T55qMv973RPdbfHtfdWGhXRtMJUKT8edrAvxwN3N8ZrX3dLC1yhx
         6K606BZCmpof+MRF38Xl3vPV58ZY4iXBSCwyJg6OwI4Q1WmM5Vjg48K355TtVuDK6uGq
         SV95sFbyR5t4WT0k5BKMsEibIHHURuLQ9ucrJNcf7eaCNidrFFVBHXYD5Tu5saEZDVMD
         P3gRz9fLZ/VGwOWI+LyHVf0VifiWF9XGcOy23Ab7i83+6cIfuhz9ooYJU4d+vI5MOJfY
         bVUQ==
X-Gm-Message-State: AOAM531qg5P9HCW6bA2LPXbdw4ExrfZjcMSxoVr74FlmQ+zjUuOFbQWK
	J2+peBLREY/2MlsfZisYQRpi7YSyAWMcFasl
X-Google-Smtp-Source: 
 ABdhPJxiQIkudsuTcBaYZ/JopnFSuYKxK1PeqMujbtawLUl93v+qptrg3mgmxhfH2gbJWg8SPqqR/Q==
X-Received: by 2002:a5d:5942:0:b0:210:131c:a81 with SMTP id
 e2-20020a5d5942000000b00210131c0a81mr12251745wri.306.1654338403428;
        Sat, 04 Jun 2022 03:26:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/17] diffoscope: upgrade 212 -> 215
Date: Sat,  4 Jun 2022 11:26:25 +0100
Message-Id: <20220604102625.199845-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166563

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_212.bb => diffoscope_215.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_212.bb => diffoscope_215.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_212.bb b/meta/recipes-support/diffoscope/diffoscope_215.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_212.bb
rename to meta/recipes-support/diffoscope/diffoscope_215.bb
index 41f896d74f4..a61d68f7eb2 100644
--- a/meta/recipes-support/diffoscope/diffoscope_212.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_215.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "744260ccf2bb869c58c50dfab68957dd494b12e446520993d0925b2394ea1db7"
+SRC_URI[sha256sum] = "4754ad3356b0acc1d2ceffbfa516961a7df0a2d816cd3cce6c9d084ce54d9433"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.34.1


