Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05D3C25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 07:19:15 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.4651.1660979945886251606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Aug 2022 00:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hpAddg9F;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id j1so1244602pjg.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Aug 2022 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=STEfvSv3q9EYuzrhfNUh979rZuY0XKaUSDf+XkCp0Wo=;
        b=hpAddg9FBqr7xSxc9RCZosHdbmO0VeX4UZ2bVZd796tXlTf8PjWo9Bhs5URflJsRFz
         jAnw9ilYtIZjNWEcRt3rAGp2xja75yZk0dOnMVCVSMskME0BsljWhXiDphm6AQJE9xBo
         sSeekfLLaAh1h5pC5hgiXho7gsI3+l9N8shFxWWXTC19sAFaBnKXSAx7KoxAAWS55Suu
         NhBH7j/2cD3nBYMYYJ44sC7hRjDSj3yg85WD4V3rweto4QiHXibZH1pPjpbrsASl5wiq
         A9+MCQ6ROvqODTv5ivwl+9yUf1yMhCwnpdHMvp/LjO+d5MtheIvSWL6xe0LieNz+5Oaw
         SPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=STEfvSv3q9EYuzrhfNUh979rZuY0XKaUSDf+XkCp0Wo=;
        b=OtzA4j+63V9ZyIADzy4Iez3mOp/30/5teGYiHE1CaOr6VBO8VypurIIHbyVgcZfo1T
         87v60XsLz/Uk0nIXTUjd1a+U3CUNrh1KANszE/IOx4QRGIa2Ah3KjVMBqfUCHyim0kH+
         bwNP+/IqtccxmOZclpsov8kFhYMpzJjK0F2O1P2CoRcK1kd/lIx/LqMbDivEPPJ3iFr4
         p595xT4HarjyKD+areZHBw0TNiXkUZJ/cc9e23S1ZoPO8jxi6/yNU9hnynuRy6b38Bbx
         z6gBj2iMLb15+u4DeaDtLC5+N5X018TPCmVKwEmjUVB6WOlcl9LEU0Lj/bO1WE2Zxnt3
         vebw==
X-Gm-Message-State: ACgBeo1+suPRg0Ae8b2BwPvS0AD261xR3WnqsPaI+L+/X3A+rWxBLcse
	TaT+VIhF0OgSbhTU/iGoMnSRM/NK7HQuig==
X-Google-Smtp-Source: 
 AA6agR51Xcc/TyxrfFL/fVkdt5kNn1SjJe7GqZDoMnbtvn4Nb24gUuwPNDxEi3VQth1BHvSWhKEuoA==
X-Received: by 2002:a17:90b:4012:b0:1fa:df52:16ad with SMTP id
 ie18-20020a17090b401200b001fadf5216admr8269869pjb.198.1660979944966;
        Sat, 20 Aug 2022 00:19:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b00170d34cf7f3sm4259365plh.257.2022.08.20.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 00:19:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cargo_common.bbclass: Add missing space in shell conditional
 code
Date: Sat, 20 Aug 2022 00:19:01 -0700
Message-Id: <20220820071901.3174011-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Aug 2022 07:19:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169647

Fixes cofigure errors in rust recipes e.g.

tmp/work/riscv32-yoe-linux-musl/rust/1.62.1-r0/temp/run.setup_cargo_environment.3047487: line 215: [: missing `]'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index eec7710a4c..dea0fbe2f6 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -88,7 +88,7 @@ cargo_common_do_configure () {
 		EOF
 	fi
 
-	if [ "${RUST_TARGET_SYS}" != "${RUST_BUILD_SYS}" -a "${RUST_TARGET_SYS}" != "${RUST_HOST_SYS}"]; then
+	if [ "${RUST_TARGET_SYS}" != "${RUST_BUILD_SYS}" -a "${RUST_TARGET_SYS}" != "${RUST_HOST_SYS}" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		# TARGET_SYS
-- 
2.37.2


