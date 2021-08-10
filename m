Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.1379.1628631907669871694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 14:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JMYjss33;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d2so349918qto.6
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 14:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8O8+xpdvMO1BUtWtoIYv64k+IFQ+aCEDzbih5uqYrYI=;
        b=JMYjss33/D5XAWbtbsAoqXlcUVrlYAQNn3JAyJmR1vatAFX6vtzdB4CMJiJXUWIBuq
         U9mic9fjS3iDBHtnM/kTcG1E2wtMj5fFdGi0knkUJWGhWLszzNq303d4t4qlwUziKQ5R
         2HYw9ZJismJm+vZ5C3vI7jbvDyOwMNj2ofVLGxHFWJuc3y0uxf/IHR1OdXBiS11CR+34
         sFl6ciq3X8i9Hm7M72TgpAkbUVV1SypWlcqy+F1kYgawFLOOOkTx07SblZPyV8U19Ah0
         UJRRoBh+g+6CELiCA7sj0X/aoUT0hypAGCacfBGuZLjKpBqV7nBfDobTP1PYnl3uSFMy
         s2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8O8+xpdvMO1BUtWtoIYv64k+IFQ+aCEDzbih5uqYrYI=;
        b=RuJJY4q4P/zXJrxLOgbexLsPMGmd8fXUCUNjr7EzPK5RHARFaEsSMzN7Z8Vpd9oiGa
         J1asIv43YfXIIW/XrB7RugpOH3dAP2tYNC2XlivkMwrHCHw8dvVoq34lc5/D3ovcoMmw
         +11DZRlQrLthCDyYzY2Z96u+8LN/vo8DWsX1hyztPO3n+1kxmqUtPlEKJWlwpZKdrsj4
         LYo9aSPNfMCgRo4SdG9Lidl5X9LyLkkzD1zH2+KGpdI3v6N52aChTNJ71/apdtgUjWRB
         65nMQlTDlOq6DaILrsu2zh+FB7zr2Rp1AsDTYMem1d6ZOttKvRIVTSeBRqatpXotaTQ5
         Hg8g==
X-Gm-Message-State: AOAM5336qICqBy4TlGCT7nznFemXrL5BKz/P8budOBB/0v0dPPC3Czx2
	mH3H5JEQH1hPtx2C5WjpKVekGFo0pFG0Jg==
X-Google-Smtp-Source: ABdhPJxxcDk2dLI9GvURVTvZdTmnZ6voHj78NYG6pSbVqHO/WhKbZ1FEu3CiIDO6U/i90aT2gl45zA==
X-Received: by 2002:ac8:5cd2:: with SMTP id s18mr12383323qta.118.1628631906641;
        Tue, 10 Aug 2021 14:45:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:3d70:ad83:63ae:3283])
        by smtp.gmail.com with ESMTPSA id a8sm10754599qkn.63.2021.08.10.14.45.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 14:45:06 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] docs: update docs with new tune locations
Date: Tue, 10 Aug 2021 17:45:03 -0400
Message-Id: <20210810214503.17791-4-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810214503.17791-1-jdmason@kudzu.us>
References: <20210810214503.17791-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 documentation/bsp-guide/bsp.rst        | 4 ++--
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 5f62376d69e8..956d90db1aaa 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1266,7 +1266,7 @@ located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
    EXTRA_IMAGEDEPENDS += "u-boot"
 
    DEFAULTTUNE ?= "cortexa8hf-neon"
-   include conf/machine/include/tune-cortexa8.inc
+   include conf/machine/include/arm/tune-cortexa8.inc
 
    IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
    EXTRA_IMAGECMD_jffs2 = "-lnp "
@@ -1344,7 +1344,7 @@ Project Reference Manual.
    .. note::
 
       The include statement that pulls in the
-      ``conf/machine/include/tune-cortexa8.inc`` file provides many tuning
+      ``conf/machine/include/arm/tune-cortexa8.inc`` file provides many tuning
       possibilities.
 
 -  :term:`IMAGE_FSTYPES`: The
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 115094013313..1c4897bf65e7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8245,7 +8245,7 @@ system and gives an overview of their function and contents.
 
       These tune-specific package architectures are defined in the machine
       include files. Here is an example of the "core2-32" tuning as used in
-      the ``meta/conf/machine/include/tune-core2.inc`` file::
+      the ``meta/conf/machine/include/x86/tune-core2.inc`` file::
 
          TUNE_PKGARCH_tune-core2-32 = "core2-32"
 
-- 
2.20.1

