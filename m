Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7B9C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 13:35:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.15274.1646573739972970176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 05:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gqh+C4Ou;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t11so19414540wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 05:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qS8Ht33qbMK+qggoKfFuLBrAM/UwbWxksF0vfWtNrU=;
        b=Gqh+C4Ou6MIt8pPyOvinY5lcvuYZH9B2ehwvMeVHjdW4DPRBK2Ew+Vxr4SGOcKeOiV
         thsroWY1GagYfuG23XJC2rxZ4rWXaYNVrmwJRJLpi/LH8hWDYaImvqp8lzL9tS6yf8Uc
         6Xpmltjx2s8TOzfCl9VwB4anBM8dke1w2j0CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qS8Ht33qbMK+qggoKfFuLBrAM/UwbWxksF0vfWtNrU=;
        b=tnytI5BXF5M3V7PLsnju0oT7BY0cDjgYJ7BLV+CPoekzlyfvyUVSW/Ipn18dZYbQNj
         lWxzgN/GTIpbjLqG9zGxZzLNs6d9r12SCRNz5MS5Hrj/gXMZ42YCP9SKRqfT4Q43SdG6
         ZlbLqB4pAiTHlweN/KbrV7IuLIFy3fPyF90wxEEmSskv7u+lT9jLMFduuIqLc4uXztt+
         b/T6BaV243/jlthYCvJElmgK8uDCyvoY/35kIl+hsj04eYqQpd8qu0UlELtz/N566ZSg
         pjpX3R4m0YVguNxQrbzbvlby5/uk/JMFYrKwy92ZpRrL9ACmLS02lJ440CDHCJROkZOM
         f/EA==
X-Gm-Message-State: AOAM530yMihsiVC87XqRFir65H5U3AEn+Xn3yyB0lp6MsRAx55dRLxIG
	XxDObq4OghCwFPJGNTCy6QbtEityTLBkpPNJ
X-Google-Smtp-Source: 
 ABdhPJzLdmdEYurNkvt9mpXnXGLezz1vRXWEHILSv9ZaWrt6xHePmO5mzxhDVM8RVw2Q+Nv6Dgu1ZA==
X-Received: by 2002:a5d:4a0f:0:b0:1ed:d377:288a with SMTP id
 m15-20020a5d4a0f000000b001edd377288amr5201263wrq.3.1646573738154;
        Sun, 06 Mar 2022 05:35:38 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:455b:9320:b5a2:495a])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm8832168wrx.47.2022.03.06.05.35.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 05:35:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Upgrade 2.4.6 -> 2.4.7
Date: Sun,  6 Mar 2022 13:35:36 +0000
Message-Id: <20220306133536.442900-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 13:35:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162783

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.4.6.bb => expat_2.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.6.bb => expat_2.4.7.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.6.bb b/meta/recipes-core/expat/expat_2.4.7.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.6.bb
rename to meta/recipes-core/expat/expat_2.4.7.bb
index ef245242bc1..bf1ca8d56ed 100644
--- a/meta/recipes-core/expat/expat_2.4.6.bb
+++ b/meta/recipes-core/expat/expat_2.4.7.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "ce317706b07cae150f90cddd4253f5b4fba929607488af5ac47bf2bc08e31f09"
+SRC_URI[sha256sum] = "e149bdd8b90254c62b3d195da53a09bd531a4d63a963b0d8a5268d48dd2f6a65"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.32.0


