Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.25193.1591602531553307409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RH0ynkNA;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id x93so12555603ede.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zUyZo0DPPMtSwWZP1Pzy6kGwFEfFPGsZedytA1+pgM4=;
        b=RH0ynkNA68+d64f28SHPqaP5Fqhi9Xq2V1Wy6dM8+Zc3PumxzgjUVcfmi/lgNTYiTY
         MVnV3GTxY8nixhXnUzYwkN0L4oIGNhI+c4VhH5ZESDIAG8w8EZ/apvNvDZdzHU+LJbtu
         dQzLzM73sqYg3A5JkuOEZkTE9YlG52EEwbUFW5sYEO0Xx7srjg17HXNi1MhFAXsmYxhw
         nCzkvV+1AKoVwvb/MEInmF3jS706QAj1Io0uBBwKSM2FNcJAHPRdSRsPTjk/NO/rTrzP
         snshBHWRRsqjPe9uPd+06SM+1kEH8TbKJkX50QJeFwv38ncPzuXcgmZtB8020QO7u107
         EjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zUyZo0DPPMtSwWZP1Pzy6kGwFEfFPGsZedytA1+pgM4=;
        b=Rnwck4Sv1lUvNGmL6FN3GjuemiVHYVyPDf3CIeoxaADM92JdhQSOrDeFX7j/N3wS+A
         JpW5Rjhc2DWbsYDC0Ruh1qgIkUHLpgt18ADu9n8LjpOzxy4Cu1kz58HllcgmynYVqQPD
         iGt1yISMJ0RLml6o+ANSuyw42aIaYDAFaoc6xpKCkIi0Gi5WLN0x7G+TIyDoRXjqNihf
         pKmRJd7E7zo9YHm1rNzIq1rXaw1DgY5yLekRFueTi944eRpBtTCXlt2T8wgKHdMEDFna
         he5/iK9MWWXFbMNMdSiiGCFaUiVWQbSMkhzD2dliLEKD3YJofnD9JC0gOS01Egkps0jx
         NoeQ==
X-Gm-Message-State: AOAM530Nv1SZQrAWZOjD6jGaz2/7T2CE+bmNV+OhaB/gq8SRNGBrZSs/
	NUedHgKdib+hcpP4R8eMu9jnR+7VQIU=
X-Google-Smtp-Source: ABdhPJwPQDzZpZWeXPK/o1i07MUr31h7XPq+Yd8did96SB7NDY7vbFP6uJjyP6i4vOu/7xlyGSFDBQ==
X-Received: by 2002:aa7:d9d6:: with SMTP id v22mr21664689eds.66.1591602529865;
        Mon, 08 Jun 2020 00:48:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 40/42] init-system-helpers: use https for fetching
Date: Mon,  8 Jun 2020 09:46:57 +0200
Message-Id: <20200608074659.7051-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

git:// protocol seems to be down.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/initscripts/init-system-helpers_1.57.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
index 46f5bbf442..e41ac21a28 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
@@ -17,7 +17,7 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
 SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
-SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"
+SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

