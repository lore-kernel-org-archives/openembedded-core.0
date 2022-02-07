Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22250C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.16389.1644196124057560028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eTgC1AaW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso7526899wms.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLkKPa0mPdUL+iOhFyO27djqmM2XK07YYQ8AsJA1K0U=;
        b=eTgC1AaWTpyNHLSui8z/ZX2Gs7BB3omu+88de1TQ5iimrVxL8KttlYsbsDMagubzhr
         6f3ju/cwYAsXKlLhhE3eN3ZBvHcKYXOvxA7EcCCzkT70AjGHZfPqnj223Iu1rCuTS7pa
         5iHp4uhHllA35PjwGEW8Fw8/mndZqQaAzygFNqUjfsYUsUwSTW6Kt+fHLw3Lu9UQVDb0
         aHtZ3xMo2JFjiQbctEsLQSTdHHvG0TipADWuFA+YARH5f3BOd1xMj4t6AaAJr1OyD46d
         Z3JbpsRE13vJ/NQRqU0SFUesKCfIVYMOJFwS0l0DZgxxKbCTE2XvywmOlaXRJY+FppmJ
         Mvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLkKPa0mPdUL+iOhFyO27djqmM2XK07YYQ8AsJA1K0U=;
        b=06eKv0l1zuhoGLOV+y6aPoarI+d7fiBmfHYy9tCsvtWpSce3nL1LAWdRCDfA0TukH2
         0cz27ROe/sWrQ0gWazKmffa0lt6kdoyFNEqpRrkHU4qEn4RKo7CXNItfIRQLKVsTulj3
         CM1JtRu3DA7NOyudEv7Ilb3JpduFVsCaAEioLz67Rnilxz4eydtuViH8ttTzzbczuZWI
         lmGFFGb8e1arg/ciWf76tqvdEJWMT8rpYqK2Hh5Iq2I+NOIiJOvIKkNjtTmebXQbXKOT
         mXFD/bfVPazo05FSpIBQSz/fkKClffmzS+6/rHmNeqnCxqn9NuX1hs3nldZXGS0SFvdz
         dzYw==
X-Gm-Message-State: AOAM533ILT3rcFYoi6siUdYl48S80CzrQ1YF4kcwbpTZTyG9Bo4sMat8
	6L+79y8oss6SSHyn2BQPcZZYHAUZR00=
X-Google-Smtp-Source: 
 ABdhPJz4FZYwDYN+a4h8saVdLpQM5zuUG8PLobZtpPpkl9ghuNDzZWEwT/eGQb+cgZvJolmS9LAXWg==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr11880807wmq.124.1644196122330;
        Sun, 06 Feb 2022 17:08:42 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:41 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 05/17] shaderc: upgrade 2021.3 -> 2021.4
Date: Mon,  7 Feb 2022 01:08:11 +0000
Message-Id: <20220207010823.143664-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161425

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


