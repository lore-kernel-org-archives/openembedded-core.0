Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D38FC433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 18:42:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.37323.1643654523882539851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 10:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZWvTp+rn;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id v13so27168275wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 10:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLkKPa0mPdUL+iOhFyO27djqmM2XK07YYQ8AsJA1K0U=;
        b=ZWvTp+rnvCLUh0bhbsIpSx4ASIDekXgSZeYCTVr9LZDlVPuY2yCoaMRRqZuUBMg+KH
         b29b9vjKdeYDai5RrwPzjq9FnWWXe9hhM+GwxrNuKOisryBqmgkgAmU+KHX2relb7Itz
         OfxCcVQvD7O4cAH73AaPvKgxe+nM75ox/14u6svEeznS2CuEruiEQ2DeByArnsxwJdBr
         fySDeHU1BLC6FMilHh5QHvqZQ/oOyOsvEF4AB0BPXhXZ6bKfAU4kqZ3dbPbvEQgWC9OR
         peVBWSqvC2dmQuBUpGraWpCafnmxOlYJBJWjCckPxzqk8ZC8YOwO418+QkmZAzBR6B1d
         xHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLkKPa0mPdUL+iOhFyO27djqmM2XK07YYQ8AsJA1K0U=;
        b=QIfhh91yB+/+ImvFpVZLQOIGfz2tNr21YqSKDf07/bfbnM8iiMoYqxW4s5xvGeagwW
         rikiSVWcFqxtkUQ1zJd13a0Qtrc+b8gY7GEpiBRs+bh1HEkt1UVKngtG2f4PSMfEH6ik
         BDhxssaxZvadMbEEUTDvZoWXrzEpdMFsGVDuNP4zjdOLW+r94EPkmWBwPooQcawiGxxZ
         i8+966QO6gpvkNyEBBXlWq1kFF/8NyO8yT3P5NatLIC+WpcCwXlruRtDfRJCJcjBKqqq
         QPb7haJRzwuk/SbgH4Z4d9iG9d/2w76SHIgOzqO2fY50Dga4saGwCOr3Pl3ZfPmqPHfx
         A+ig==
X-Gm-Message-State: AOAM530M7pM03qG9zeOMYU+Ish26Vwy3qX9Oj4+l0w/ExUO8p8lIjU3Y
	zw6o0OznGPOATTwdHmK78OGgda1vK0k=
X-Google-Smtp-Source: 
 ABdhPJwIGKw80XwhaNzLfzeTUiXHEtUhbzkIJZnVu1C0YdQDDQnSYyj86nb8nzJwUNmoFOYfsqpi5g==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr18344831wrp.13.1643654521987;
        Mon, 31 Jan 2022 10:42:01 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 l24sm115554wms.24.2022.01.31.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:42:01 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/3] shaderc: upgrade 2021.3 -> 2021.4
Date: Mon, 31 Jan 2022 18:41:51 +0000
Message-Id: <20220131184152.46233-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131184152.46233-1-quaresma.jose@gmail.com>
References: <20220131184152.46233-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 18:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161133

- Support Vulkan 1.3
- Support targeting SPIR-V 1.6, which is the default for Vulkan 1.3
- Updated copyright check: Excludes Glslang generated files when
  building in source tree
- Fix Android.mk rules for building libshaderc_combined, to adapt to more
  recent NDKs that have removed the GNU binutils.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../shaderc/{shaderc_2021.3.bb => shaderc_2021.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2021.3.bb => shaderc_2021.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2021.3.bb b/meta/recipes-graphics/shaderc/shaderc_2021.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2021.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.4.bb
index cc2cfc18a8..a35a41ab00 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2021.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "6fabc36fbebacfcef8cf82463df2a8247120ebf0"
+SRCREV = "9d0b3848b054d62b5b1e0eba9a50e386c9de3e2b"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.35.1


