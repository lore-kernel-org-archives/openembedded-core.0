Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7BCC43217
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:24 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.2294.1643826502743195938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R34MfjNs;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ka4so183424ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tvCkSjb10jemQrXEMXXKUL9UwZUwqk0VocXydenKBOM=;
        b=R34MfjNsxh0OQ6CJM6e9T3GoMz/1aJU7KGgSq34At8FB1vJXb2jxNbguPT8+SIATdm
         MV/TbzpWZVkbQWL3DHW3+6e1oQIDf2hlKHLOb+Fu7ITTfjcRtLaVG1GJZ456mBRG1lFt
         gjCa3Z59wKNyctEhWPEPbwjklcG//m33dt54YrB9cIkCZkXRcUpGpSNDtUXBo8L+ldkg
         ehkra785QWx7NE5/29yEmdfTFY/+Yqt2K+VV/cngcMjEt+WkCF6AG6qjP4y/pCEpN+O2
         1/AwZaSx8C95rdObAaV/bHtVDWE/80boEzeaYWVBqu8el6a+wMtU0mIWFcY9RW0e97ZX
         Wsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tvCkSjb10jemQrXEMXXKUL9UwZUwqk0VocXydenKBOM=;
        b=nQVUzt7UZzSmlvMzLGThQ69AA7bJ9gOue0jnjNW9HofygckNBrQxGPytmL+vgUvHbS
         YH5v+qiRvvPtVlij0uP+HXX+hICdJ1RMKGclE50Uz//kO/qLcTInpiyjHsQ+l5JeAKtH
         ibCrwO5zDQeYUpEsJ/UQBL9vI6B1MO46dFb9RxUid3zjhxAE/1l0R7WsE3rqzsoG9FOE
         oA7Hp9vPI3/OB48n+ATS0AqnKGD2wJpZiVmMB1G8RZHUpZp/ikLwHZmM/ndqm40KI56r
         ForIaendtaFARiuQ1hlYl2ta4U/hJ4Rb5vO7ISiAZyb5s0KomqexsZNdhUYdAFw/a7O5
         yHMw==
X-Gm-Message-State: AOAM533LR3WmRm0OHeOoPiTMzp3PtTnbvBK7QdifLF4rt4yQJ5MbIL+3
	fdguBvSOFZBmJqUo0ANL9T04GSXpgCI=
X-Google-Smtp-Source: 
 ABdhPJzoxbq+R/+OjoXh0iFy39m5KejL3yKG8ANzRtCnbfnDIUjqM/DJCmUTnHyXBGiIjuona0wcsw==
X-Received: by 2002:a17:907:1b1c:: with SMTP id
 mp28mr26625604ejc.624.1643826501381;
        Wed, 02 Feb 2022 10:28:21 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/33] python3-pip: upgrade 21.3.1 -> 22.0.2
Date: Wed,  2 Feb 2022 19:27:46 +0100
Message-Id: <20220202182758.919991-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161246

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pip_21.3.1.bb => python3-pip_22.0.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_21.3.1.bb => python3-pip_22.0.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pip_21.3.1.bb b/meta/recipes-devtools/python/python3-pip_22.0.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pip_21.3.1.bb
rename to meta/recipes-devtools/python/python3-pip_22.0.2.bb
index c893135059..e70a9556e3 100644
--- a/meta/recipes-devtools/python/python3-pip_21.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.org/project/pip"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c4fa2b50f55649f43060fa04b0919b9b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030"
 
 DEPENDS += "python3 python3-setuptools-native"
 
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "fd11ba3d0fdb4c07fbc5ecbba0b1b719809420f25038f8ee3cd913d3faa3033a"
+SRC_URI[sha256sum] = "27b4b70c34ec35f77947f777070d8331adbb1e444842e98e7150c288dc0caea4"
 
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-- 
2.20.1


