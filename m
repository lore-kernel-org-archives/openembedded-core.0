Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.992.1613177966439001597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uov2Pqml;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u14so1473892wri.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E47iVx8jbQZ25QMdyRy4ZFI4v8FDVYnBPkFVAx103YE=;
        b=Uov2PqmlrPOcTHYvcTfxz+Sq//VlN/ojOHWbFUg+Djj+z/Y2JKEgQAUHeM10N3RrSJ
         ah7KcX93ROwTyovFWuHQngSVteWDjgE8nRNZsk4+7YDy2NphoBlJ2yFH/8Y01EEjpEnu
         nj2dZp1zZ4DRqvyPRTvhtnMDfZs1AmsOWg250tkIrrtwRqwav1Umna7q/0QOMe1NtOsD
         9zl8kzoyTAfhP/uogmeoIyG04FAH8+Ju7NHhelpGEsEnKOWWF5sZpFUs9o4qG21XFReJ
         DfqZBeN/QXTMDBMe8fpCxVNrlWRVJ/Y/JIcITg9x+B3Yx/jDIxqM2Eny7SBvSO9IM0HS
         fNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E47iVx8jbQZ25QMdyRy4ZFI4v8FDVYnBPkFVAx103YE=;
        b=nSV1BsTTZ7iVSB2Hc/oxThQA+FRNBunGxbPcsBw+fgjgU1PE7xzTUF/dEqx1/3f9bp
         7ciQYX1x8Y5Es07L98tTZTo1rnEG7U5/TAKwpBeVEpZMfiNKBDC1EJTzqxfeeLzwq8NC
         OgJyP5Kdz0uq2CljCMIrMLyBoCQwRZm6kXOdT8M5KvMuqUD75reS3A/PsIUSdkA7GR2l
         2XSrDqDXrjOR3XVdpXDpnam9KSPGmYcBaxtBnSi3MQBtnguNBmsM6V3h6W35MKnM3pO9
         4n9vH4/PXC9z/0BTsthOPU72e6DIhgfqYz/ln4/cvQOUhdNsIfaMD4RkPBZaow3lhA08
         vsTA==
X-Gm-Message-State: AOAM531uHdxP97xgKbvP2uFGnkBb23C9fcN4Ah7gUtnRPjen/cFjeodY
	3rofUQJwOp3Ngg9m1DacEOgH7sLJcW20Pg==
X-Google-Smtp-Source: ABdhPJwqpA9h8EDeXNVAv2qGFXi307a8Kye81CpIgAvW6Dv6J48Bm7VNrsX9QLcienO8HPrxZL+PjA==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr6261341wru.407.1613177964870;
        Fri, 12 Feb 2021 16:59:24 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b15sm12259195wrr.47.2021.02.12.16.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:59:24 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/5] spirv-tools: disable tests
Date: Sat, 13 Feb 2021 00:59:18 +0000
Message-Id: <20210213005922.180552-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_2020.6.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index b1899d3957..a2cbaf426f 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -11,11 +11,14 @@ SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-inherit cmake python3native
+inherit cmake
 
 DEPENDS = "spirv-headers"
 
-EXTRA_OECMAKE += "-DSPIRV-Headers_SOURCE_DIR=${STAGING_EXECPREFIXDIR}"
+EXTRA_OECMAKE += "\
+    -DSPIRV-Headers_SOURCE_DIR=${STAGING_EXECPREFIXDIR} \
+    -DSPIRV_SKIP_TESTS=ON \
+"
 
 do_install_append_class-target() {
     # reproducibility: remove build host path
-- 
2.30.1

