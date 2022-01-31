Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1409EC433FE
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 18:42:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.36707.1643654524854985268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 10:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oDSYBrSI;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so14308894wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 10:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5tsI9utKb2L65dx5GhaoggM2UIpPF+6mLKclE+9H1CE=;
        b=oDSYBrSI0v+9piH9Px8c0IPyKyNuXprloTUWcw+aTJWhEcnb0FucB8Pb09QZy13QeW
         ayk7Cy90wwtHefzKZdtu/3Dmk+xTcoROlCtBcfk+CYG/XrI+6BJAMlhsDzxjRA0zNLql
         JAXJJRXgbwyMJW7XNa7p5GFJ0+Ao+FLfQQniTlDWtsNBwpBV4hcxB9fgLwtfPcoGnvsi
         JvLqg8SzHHBfw4cS4xMpvxChkGeq/Z8b1upp1E+YMwAww0MFt8RjMB7OkK3HNc/wR1Ao
         NRbA7pYijRWaWVlH9pDGc/2zQ8lqair+tEprZtOMdeT4TIPxl9BqHhPay4lx9zkz0Gm9
         bTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tsI9utKb2L65dx5GhaoggM2UIpPF+6mLKclE+9H1CE=;
        b=bAWmZaomfD5hOo0ja31PICZOqChWX3Cox7CMqtdkCMN587dlRpdNCxbIR8N5vMOcnW
         lG03Q6AfPxAAXGCnT9S9rj+QxKgNuCwJL9U2vnBQr+BoHas6NU5k7aUXKHkfeAzNdZwK
         Ow4Zq7F5tDD//mJ+brkh+uGMdm7WuQK3Xq8zIw9mJf1tw/UfntUQhDK34qTq/WGw5hbz
         r4oYT05ACK6YdgE2Ovpg2xsaZUz+HqmMofypWeP1UJwA7dfaBjJ6l/uOQRTRVo4G4JI3
         fCnpnvRvbI9lErW77tvpqky0DXvqK+qC9mzfiFxV2oQQLEEMI/fnIlRyQ2pUWjYhSOdt
         FOEw==
X-Gm-Message-State: AOAM533yRUEyjwkzdrB4PTYnR06muS4QhuyeuoAQsHYY9ufHUuTuRxTS
	O5u7Y4io6AUA6lOruG0yBWwQ4bAl70E=
X-Google-Smtp-Source: 
 ABdhPJydONVBcDbeQEwuRBp4AHrRHhP93o06jHMjW6BK3/gU+BersCogqUIErS/KBGo5K5nseZfbaA==
X-Received: by 2002:a05:600c:1d17:: with SMTP id
 l23mr19549948wms.174.1643654523063;
        Mon, 31 Jan 2022 10:42:03 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 l24sm115554wms.24.2022.01.31.10.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:42:02 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/3] shaderc: upgrade 2021.4 -> 2022.0
Date: Mon, 31 Jan 2022 18:41:52 +0000
Message-Id: <20220131184152.46233-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131184152.46233-1-quaresma.jose@gmail.com>
References: <20220131184152.46233-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 18:42:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161134

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


