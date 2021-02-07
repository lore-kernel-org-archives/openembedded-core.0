Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.15463.1612662697094495265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pwoYEefU;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id z6so12826812wrq.10
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 17:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTexGQZoOSEpJ8G3iyqpDFQr85O71xGj6CWqwWo0AIw=;
        b=pwoYEefUvHZItX36nJ6LpKzMrq2aZjGuIBR/jyK9fkvwOy+aiW4FvPnqYWoCzWwQvr
         bNzCDwHtcFZE3+jDavHahQmOYGhp5D9U3Vw+olXS3Wpq+wyYaszq7F7tDW/VrsrUOYlJ
         Awui4o2cxiHau7Rav36yeKeW+mz67B3kRJ/+igKLuAi4FPbgS2ZiA7PgHNmZ82IsGxDl
         +x+hga9O0HzKIvJORhvq/ZPdL8BC2pbTIOwUR9pB/uKh+w87Gt02VIuSj9KSNHyZNG5Y
         PMtLSTW7+qYtRdC8XjZtLqD4DJf73ZihXRmVh5N5mp+daQb0n8nlkPtG+tOLygVTkKVd
         KOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTexGQZoOSEpJ8G3iyqpDFQr85O71xGj6CWqwWo0AIw=;
        b=SDVEaFn98nxghBZyXln6gon/J0JMKTAAwaWpxRLNdYgHGXpfUnShijiFaPmoiahXiB
         d3YJIkIDxgE6GGnZsWTKuKR2X9/VFAC58VOJPYSggJrjpw9f5yvPHFGAecpzBOvA4iXP
         9rWJGzVz7QTFb69jMVHR5rUIxPSgKRtf1PIBCKEjQxNffzzLlYUDnK5QgUbvsOXNMCfO
         YmAefIM7SUpxvnjyHLSQ/2l1WylfK4BiM1knsie4sN0Abt59Zm+XT0SNeFsOxFrLUJ9w
         bsvGArUM86YP7IEjibW4Z7IsP8Nl4IPMtirUgojdA0SspiTDUukiMhwT8vdYgb0VIOEN
         4NWw==
X-Gm-Message-State: AOAM5307PdBVvX3GrxN9m4lxSm6N/aIruCFayB1gEJ3aWfy2OszCEtth
	8FrpGirHZ02rqv5iCUYj+GWmiuB85o14yw==
X-Google-Smtp-Source: ABdhPJxN1CzlEAvVJQIe6LePw/v4I3MnE7TXbwhdcg4Pc0WCfRx7ysHmLt0W5p+y/QBfwCvDHA6AOw==
X-Received: by 2002:a5d:6089:: with SMTP id w9mr4601776wrt.412.1612662695790;
        Sat, 06 Feb 2021 17:51:35 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n9sm19129089wrq.41.2021.02.06.17.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 17:51:35 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 4/4] shaderc: remove the glslang-native from dependencies
Date: Sun,  7 Feb 2021 01:51:20 +0000
Message-Id: <20210207015120.1299136-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207015120.1299136-1-quaresma.jose@gmail.com>
References: <20210207015120.1299136-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- glslang now provides pkg-config, so use it

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/shaderc/shaderc_2020.4.bb | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index c7982dd815..94a6b081f4 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-inherit cmake python3native
+inherit cmake python3native pkgconfig
 
 DEPENDS = "spirv-headers spirv-tools glslang"
 
@@ -25,17 +25,12 @@ EXTRA_OECMAKE = " \
     -DSHADERC_SKIP_EXAMPLES=ON \
 "
 
-BBCLASSEXTEND = "native nativesdk"
-
-# TODO: probably there is better solution for this.
-# I don't know any method for get the version of a receipe in DEPENDS,
-# so do this ugly hack
-inherit pkgconfig
-DEPENDS += "glslang-native"
 do_configure_prepend() {
     cat <<- EOF > ${S}/glslc/src/build-version.inc
 "${PV}\\n"
 "$(pkg-config --modversion SPIRV-Tools)\\n"
-"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
+"$(pkg-config --modversion glslang)\\n"
 EOF
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

