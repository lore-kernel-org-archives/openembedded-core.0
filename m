Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DDCC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:46 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.16545.1644196125138637107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KPgUcRpv;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k18so21953299wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5tsI9utKb2L65dx5GhaoggM2UIpPF+6mLKclE+9H1CE=;
        b=KPgUcRpvbUDB/pDMCmiwRS0EXZn7Dn2tscrSAUlZ5QVpFOgHNyk+Cd3jW765nwexZY
         zNRs2gklzx6AGOQCuhW4oXy7J4FOrOtoUemXDdhilnVCS02Lav+9Yog6OHKNvk248WD2
         DOHQIq/aBCgw8dFGk4aIaSy+QjsFfw/u4YHAb5rK9ylWxq2VbHLcJDUzaTrZxyuLHC4J
         vaEGqQNdCQVGVy8gdnHxSizzbsf9QnsLIsiB+LWXJVZFs8CrZ8rNtYZRAUMYYLP/q52x
         U1RYwmNFfggNmNcYckiaToy8Pu025oJPQUuPnklNcJbjHEIxpRWYFn7McwA2VFqOVvya
         /Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tsI9utKb2L65dx5GhaoggM2UIpPF+6mLKclE+9H1CE=;
        b=5AEciEOiE+HjawcOvzATBNiJyJqY+7LmNlZSa2jOdjRmMS/tG4X+8TjJaDLoP+wzvo
         XCYLziBJag7qfp+PUCYUZ1sM1BNOaMQbsQcIk4kHqan2MMZK4uEEIaXN6ejJLyOWEInK
         R/qLlqyg4OZ1/sotySpVNKZJWnqyujwYdq+hRJxKB6ox+Gkf8jKsExFnw64vME+DxgM8
         iNzT6+yZCroytx+XKyKxFXOY9HCpMkM1j4RhAX8zu4jRfeIwUFvKZ/zvf10mvJNlWI8C
         FelpuyatPEpuu3jYfyNduDWuI5e/H6KMSehAmp6NQ+bc15Qsd1arB2C+CGINuHPLL8hc
         vGAw==
X-Gm-Message-State: AOAM530xWD6IyMoUJARjnXIW0pPMnm8rSshbkylZIMu0rvPjhtEzglbE
	BsIkqZtO5P6nWCYuQg09d7rQnnEmE0c=
X-Google-Smtp-Source: 
 ABdhPJxd2gqT7ct8u3R1S8+4dq1p0jsRajJ3W0/nizwXc5pT32ndBHOG11Zf8Lp6LAEIUGIhlsFEYA==
X-Received: by 2002:adf:d852:: with SMTP id k18mr4343892wrl.239.1644196123264;
        Sun, 06 Feb 2022 17:08:43 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:42 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 06/17] shaderc: upgrade 2021.4 -> 2022.0
Date: Mon,  7 Feb 2022 01:08:12 +0000
Message-Id: <20220207010823.143664-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161426

- Update to Glslang 11.8.0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../shaderc/{shaderc_2021.4.bb => shaderc_2022.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2021.4.bb => shaderc_2022.0.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2021.4.bb b/meta/recipes-graphics/shaderc/shaderc_2022.0.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2021.4.bb
rename to meta/recipes-graphics/shaderc/shaderc_2022.0.bb
index a35a41ab00..f5ad0bf3bb 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2021.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2022.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "9d0b3848b054d62b5b1e0eba9a50e386c9de3e2b"
+SRCREV = "b0aa18323d65d2ca885d0affeef2aa0b56eb45f7"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.35.1


