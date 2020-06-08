Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.25172.1591602496302248876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hz8xJLtr;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id q19so17149634eja.7
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HRRpIrlc59VQlWAjsfanvUtcHHXTiaptn8S273e3SAE=;
        b=hz8xJLtr1Kuj2UBVdQ3dxiRn0Xlzko20F1etLfmJ4jcIz1yyYuGr2lH29dSotb3V/w
         z4oZAdus9YV+P+vh0yGFUrZt7p0LsHNuTk3ouzZDBgrnB9YEvrUUoxl9ubnuoBVC0Vwb
         VuDG5ekiBJWV/5AwgJMK1+W6or6hENzdV0rcL5jT+ZA1vBYtFW/jQiqZXRvn71PSeUxv
         PHGTDTrI9zu//AELaFVMlyt5B1Ztet4DJ+CnxA6JmxfbXwxUNI8XwiLWZgiBW9jviRVq
         GYK4l1BhaBJNGQ2ekpb8e8dOu2Xs4Drda+lIreG/S32ywQ6HLORYvOtxiScwEKUXjrqZ
         7SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HRRpIrlc59VQlWAjsfanvUtcHHXTiaptn8S273e3SAE=;
        b=NE/q0/VEO1p70zGBhlCX9cTuiulUH8k5mJ2krM98zj/impbtYrGiOkVUpO3XQXlUY2
         0piY7yJR06Sbw/F6Qqg+Fetzr4ZTq+5b9STXp/i96OC9sbOVRMix5nfho8wnP7DeizP4
         vujf3/P19a8ZtHPL5K2/Wf803v3bTFKAtTynvXtbI5tb/fw7U7Mj0SBO6AO54zh+iOEc
         KqiV+IKT/vFde9BCOQ1+H3COUvg8yUyCX14sBYOHcpfPUhysXAVlPYBd7LEKHuQI5yjj
         e1EohIwudTSDUPxGutjw27Yc8sS9UvYYvPuGM5CHxrQUKQj/K1nvI/3/7USXpwvC8WAi
         6HsA==
X-Gm-Message-State: AOAM531eKoB0VspUT8aM/eIjDwjnKTCnMhLZzvUIxgvIrOTHsXObQAgU
	v2wriDia3LuMCLKAMbo7h5f/XJFyQVM=
X-Google-Smtp-Source: ABdhPJwsUYxgivM11cVjzGXSvqzdPZ26hf1JbhtAL5ZtBwk1NVOZGbLaNh0pZpSuwfJci4OhSLEd9g==
X-Received: by 2002:a17:906:7e50:: with SMTP id z16mr20455629ejr.277.1591602494591;
        Mon, 08 Jun 2020 00:48:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/42] pciutils: upgrade 3.6.4 -> 3.7.0
Date: Mon,  8 Jun 2020 09:46:19 +0200
Message-Id: <20200608074659.7051-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pciutils/{pciutils_3.6.4.bb => pciutils_3.7.0.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.6.4.bb => pciutils_3.7.0.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.6.4.bb b/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
index 034bb63dc9..4f0edc01ed 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
@@ -11,8 +11,7 @@ DEPENDS = "zlib kmod"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[md5sum] = "4343b37e19f319ce8f3d59c30031790e"
-SRC_URI[sha256sum] = "f67ff732976e2db2a5ccdf3960020796526ba6b05f6b1cdd24b7b206af706055"
+SRC_URI[sha256sum] = "9d40b97be8b6a2cdf96aead5a61881d1f7e4e0da9544a9bac4fba1ae9dcd40eb"
 
 inherit multilib_header pkgconfig
 
-- 
2.26.2

