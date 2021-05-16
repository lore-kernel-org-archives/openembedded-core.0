Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.11630.1621204380909021068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FvRgbEiy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v12so4456344wrq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X1Fc22t59BagggGFxySFRv1d2IL6uMDhScB7ZtG4DFk=;
        b=FvRgbEiykQle8qKtPwj0nH5BNL14UrORq5Ey3jtXLE8d5COI3g6Gol9pFUzYmKo5YC
         yhvNHGW6rfsb0WLzr+CCE6EYkk7yWVD6/EEMw9V1Nr98U/+lvqu95Q+euxkbXl/rPF6a
         /d//X0BFrCXrh+7xYdChUjx09dzR1ZoEsJTQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X1Fc22t59BagggGFxySFRv1d2IL6uMDhScB7ZtG4DFk=;
        b=KZG9UIwJKhwhTlFl8LRyl0Aupfnj7NjLRAiIIsKG/t3c7EnV8jerwwk3lcIhVfM1QK
         r5EugAc4Hduzv45kcH5U1N3lFPIbLCHtAXzKMxx42uq4J4Tl1Ica0VVXMpTX8DXiOx7j
         KTTmCzHDntGQtZcKafyLbNhKFCmuU/NDcM+ADSGJ7C3h8mMwfdDXq1iuf0oh2EwaW1br
         55h79u54P/E/H0MoX6fD6TjSZJy/hhQjCRD1GxR+88c4gogXH8Q7sK5h111hgON7jI8x
         HHVur5SulHQzewteiDW2lr6AG8cLCXx6IXfYKpV+TPQZpoNajIogA9TRu9eXhq/PkaP8
         xM9Q==
X-Gm-Message-State: AOAM530RQEhHZr1vuyDE6Tifu5bqx1kOfJkD7j79ff8Ee5yqyO1cG+k9
	4dtlt0Hqn/xHvqa5axvBcX0+22CWrS+Adg==
X-Google-Smtp-Source: ABdhPJxoxctl3FgIAB0LW8X8TiORlvf0OK3bv416+eMMM3ry69MaJYezPfuLfTSURcmEXnS8aE5hmg==
X-Received: by 2002:a5d:550e:: with SMTP id b14mr11506294wrv.406.1621204379454;
        Sun, 16 May 2021 15:32:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/27] spirv-tools: upgrade 2020.7 -> 2021.1
Date: Sun, 16 May 2021 23:32:41 +0100
Message-Id: <20210516223247.2401235-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../spir/{spirv-tools_2020.7.bb => spirv-tools_2021.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2020.7.bb => spirv-tools_2021.1.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.7.bb b/meta/recipes-graphics/spir/spirv-tools_2021.1.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_2020.7.bb
rename to meta/recipes-graphics/spir/spirv-tools_2021.1.bb
index 8be698533af..5795d93e531 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.7.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.1.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "2573fd781b5408cd7fe5755a78b60d767a748ff9"
+SRCREV = "4b3707b788c84449a55f67257ae6aab3ca3552cb"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
            file://0001-fix-strncpy-bound-error.patch \
           "
-- 
2.30.2

