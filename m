Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.3520.1616143512109213504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OYoKIqFn;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id u9so8363434ejj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cwBL0GSZ7bEDNXqxUpWR6a+fZXsmnMN3LvdSSs81kkM=;
        b=OYoKIqFn9ZZQ2jWaEF0yE97agQz6DRhB1scpfjzDNhZ7TAq9WLLNSO5mbXqQLsBTI2
         M+u1T45WmPbufAHDkBNnsCt3wnt5uZ5tbLF/AzdekK99xnP4yxffIiTOhUdlgc2heIOS
         iZoUbuQsC5uxdb/2ubT0EoioC3CjtosEEiCx6wh/UhVMLoQViOIfuv49DGGhJyNR/NfO
         hrwjEVFRILgyucAfI2cmNHcUZdBoYw065x9PJB6sTkPWLPq87dkNvGAstwPH+yPATl6Q
         yLsExhpARo2zXUmYX25BZTIwYmP/qOgjBmJ1fYRd8iVBqmF0G30aGSdE3kDRDx+DDghL
         av7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cwBL0GSZ7bEDNXqxUpWR6a+fZXsmnMN3LvdSSs81kkM=;
        b=JZ4MVfxUHD7CrG1hXr6+nFAnOvFwKKtglvCoZal6IJ5xyIhX+BnG0Obh0Ppbs5f3FL
         F2ojxFlpc26o50H3s0wHTL7+Qg8411Bs8nfCfYW/qqJk7ISI8Mc+bSZndqXkp/fxW9un
         yImpWpJ1nDFxFYMBPz9SQFDSpWPV6RqDRGDaAckBuyX6upGDNzJlLdt6UTJj1UbvNTxP
         eCzhmDSRjk/8axTcG8jcDG1aWMdz74j93jdMwgDV680NkKF2tO/2AtIn3C4exjWjBkeb
         0NOntDFEplPy1l49Y5RRDUpVX/mC2DJVuITLf9zTy0eP0PM6TZQEw0vwyZ/NkEeSkedI
         mXvg==
X-Gm-Message-State: AOAM5313VRvxmVZ/liN30z+iWghYHYQbw0Qg+cAtdIBEr2QRHqsXNB47
	9IOJjuudHKdBvn51q/CEqymMMyvmlHhfDw==
X-Google-Smtp-Source: ABdhPJxMkEECnZhaQ04vpdiLFnHUgiy803p70pKTY+8eexkY82Zs7mMm3QMhG28WkH4j6WycfwYCcw==
X-Received: by 2002:a17:906:dbd0:: with SMTP id yc16mr3087960ejb.71.1616143510775;
        Fri, 19 Mar 2021 01:45:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/16] spirv-headers: update to latest revision
Date: Fri, 19 Mar 2021 09:43:50 +0100
Message-Id: <20210319084401.576728-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required by latest release of spirv-tools.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.5.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
index 14723f951b..7a43af5e6b 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
@@ -7,10 +7,11 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "f027d53ded7e230e008d37c8b47ede7cd308e19d"
+SRCREV = "bcf55210f13a4fa3c3d0963b509ff1070e434c79"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
+PV .= "+git${SRCPV}"
 
 inherit cmake
 
-- 
2.29.2

