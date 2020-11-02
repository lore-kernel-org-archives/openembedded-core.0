Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.1242.1604335791780258877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CzccWEIe;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id oq3so17944441ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aCtOxMc1wuvIlY7S1t8t8YtO4pL7HsUVVR5K0E8foCE=;
        b=CzccWEIeSAoZqD1SgfnRJdzoxgM27khikmU0P132f0eeXuqci5Lteopko4mr4Y/X0v
         7O2SOjQBmQRzaSh9hz4GlyIp4FGle10NNeMBv95ccIDp98B/whD07HyuxM0PofFuY6O3
         SP+kRM5zbTE88Qdp8l+sw/kZAMvghXwkOKK9ma12NiGiQbZ9CCQ/vPyEPBKsXU7/+kpf
         mvryQXsOMw3Y03Ci+2lZf553ext11pTvtskdHJ9S9An08Kkri5ElNJyMZy6JV9V0XfGl
         8WW2JEBSAy3c7UeVjAcOzVuqqlgIm5VMgiMjYmLeExqJ02HZYoaCcEvdh1d51x8bXZB2
         UITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aCtOxMc1wuvIlY7S1t8t8YtO4pL7HsUVVR5K0E8foCE=;
        b=JroZKqanjCz650DK7vLrzIadu0KEWy8jp1tcKJSTh5Ux1uvjswJspUTQrv6DX6noN6
         b87IzdUJ9BqKrL/TUcZLqFMpB7k0QAgJJ/Z67dKE7LvTKzhIWTyhikpS87+BlAC62GWX
         Vo9khtO0CZCbYzrhAnTT6matJKjdwdFdrhCITF8btfzpYy1WDNsIJ7O38BTFD+b9q1yM
         bm0MwozmxuOrRL4aSXyOBpSMEDGveVieaaFISJJdYn550LQ5zQrnwKKtsEyG63OlKyjy
         AFhHIpPD/yLWfMZyxO/CGHU9qjUdy8vNJYtr362Gy9RAwvfYFny0wnjMJqZhzzDRFJDb
         Imlg==
X-Gm-Message-State: AOAM531FCnPnlePirAyu0KnKi8m82NCYnpvssDFfbP2R7bqLF21hYPS4
	hhTLvEEW3oA0mVHHaYsLTYuNdfCVs7ga/Q==
X-Google-Smtp-Source: ABdhPJxRHj+M3R+k5TbsGnC+gV2ZKP/JhLyaaGVaKCmOnC4oNdt4B4VsXdFCFv5YgmUFgJD1dk1fww==
X-Received: by 2002:a17:906:6805:: with SMTP id k5mr16763190ejr.79.1604335790093;
        Mon, 02 Nov 2020 08:49:50 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/80] libwpe: upgrade 1.7.1 -> 1.8.0
Date: Mon,  2 Nov 2020 17:48:24 +0100
Message-Id: <20201102164907.27572-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/{libwpe_1.7.1.bb => libwpe_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.7.1.bb => libwpe_1.8.0.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.7.1.bb b/meta/recipes-sato/webkit/libwpe_1.8.0.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.7.1.bb
rename to meta/recipes-sato/webkit/libwpe_1.8.0.bb
index e25d9404a0..a81e6960b2 100644
--- a/meta/recipes-sato/webkit/libwpe_1.7.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.8.0.bb
@@ -14,4 +14,4 @@ inherit cmake features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a784b7fa0c658b28071100f6f6749b0d85bbcddd82de028e07672ce13982d340"
+SRC_URI[sha256sum] = "a6f00a7d091cbd4db57fe7ee3b4c12c6350921d654ed79812800a26c888481d2"
-- 
2.29.0

