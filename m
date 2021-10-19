Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E701C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.11472.1634657673932712924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mBcurV59;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3321441wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JYVmkghrRFVN18lkc/ufBfwGexA1dnFRPWcUUTpgp90=;
        b=mBcurV59N9sCE16SZ2GD1GAvuuNsF6Z4ifaAR11pSUfmLhr2R5fPIgEKa6KxrSAUQI
         jLit5bZDcHH8S5q6GPiVymHutd3Ko4IQ8iF1PzgsSzQlJTDMRFcZ8aSEK6vjs2wVJ9Oy
         xUMNDK3rh4xigLFFvli1IVOXtvqWR0W+UkTDQQ7dBiHP/hcvYO68wFQwUtP02IVKyEQ0
         S6KINEckl3Z2w8k2Lz9WLS6AuVn9r075Dl8rM8ZtGX6+F+kj3eMO7eftXlrd5AV+cUQY
         /Ev7+tD9LMaENHFxZhyDH+N620ygopVCuccPq4TtdB9Vd9F6ipbmXd5uGoQQx+1WBDb6
         4/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JYVmkghrRFVN18lkc/ufBfwGexA1dnFRPWcUUTpgp90=;
        b=oDwJ0+h34k+fI6n0G3Kdm16xsrizdjFL68EMZNUwvC8UWiTeO0MegYjdZ9XH+wem0U
         OGrywIdu4ezj7DRgXZirrZuH9i1buMzMdFfaT3RV2oIEBX03X/OqYnSPrv4xZUcYl2sK
         ldnRxtbD14eA5g0I5dKvjgMVxYAPPXSUpEW5OLbYBC62SjG+FnjzITjt+WedEI2q+Zd/
         uSrMwRJH96f8fS8jps6lnELNHOUKLvlx43OuKfsof8naDF3awPm4C/gUvcrUzF1wqm0n
         xLbH8pNIJWPDN+8+k5uANZqsxHAseIxkbODLv7Yz7f9vNRixlPCuOjF6yc6JCoeB/+sM
         yRAQ==
X-Gm-Message-State: AOAM532E/VVvB0eDfjICIQ6fR2Q3yQdvfUNlutCluxt8KZW2Ou/eXoum
	c4vZNaCb+BgAxliDWlWKEAMVmrG10NE=
X-Google-Smtp-Source: 
 ABdhPJx9e9GmhjgdaDbrINWGGTL5WoZAWNVslQlkDoUSfuNe5JORCQ054OWMlMit3Epnpx/MI0wQXw==
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr6816203wme.185.1634657672598;
        Tue, 19 Oct 2021 08:34:32 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/65] libva: update 2.12.0 -> 2.13.0
Date: Tue, 19 Oct 2021 17:33:27 +0200
Message-Id: <20211019153419.3319802-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157132

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libva-initial_2.12.0.bb => libva-initial_2.13.0.bb}      | 0
 .../libva/{libva-utils_2.12.0.bb => libva-utils_2.13.0.bb}    | 4 ++--
 meta/recipes-graphics/libva/libva.inc                         | 2 +-
 .../libva/{libva_2.12.0.bb => libva_2.13.0.bb}                | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.12.0.bb => libva-initial_2.13.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva-utils_2.12.0.bb => libva-utils_2.13.0.bb} (90%)
 rename meta/recipes-graphics/libva/{libva_2.12.0.bb => libva_2.13.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.12.0.bb b/meta/recipes-graphics/libva/libva-initial_2.13.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.12.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.13.0.bb
diff --git a/meta/recipes-graphics/libva/libva-utils_2.12.0.bb b/meta/recipes-graphics/libva/libva-utils_2.13.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.12.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.13.0.bb
index 096d80b68d..baa0719f85 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.12.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.13.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.11-branch"
-SRCREV = "c0145a895ebe9b24cde5c441733f90482f1e3d71"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.13-branch"
+SRCREV = "7bad184b2cf2ffaf4fb3cc71d4df63d7b142d592"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 3d65ac501e..bcf9757c1a 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "d3f4873715077a8c969c9bfe4ba8455a133353176be0ffe0c41ffd4155c9a8c8"
+SRC_URI[sha256sum] = "fad383f39f36115814bd0eda1496a4cc01761643bd962635400df2d4470ad460"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.12.0.bb b/meta/recipes-graphics/libva/libva_2.13.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.12.0.bb
rename to meta/recipes-graphics/libva/libva_2.13.0.bb
-- 
2.20.1


