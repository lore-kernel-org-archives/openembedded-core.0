Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.583.1598464153207857378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 10:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m46MlIEZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id q9so446070wmj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1GyXXOOVlrOUknWEfsaWLUq6KTZb95zsCBp5cxZe2gQ=;
        b=m46MlIEZo3oxMBX/iAF83td2ZruQYMjD1wOXHKscY/T2oCa5Wr1QFnAzJUMCYGDbuE
         cwnOwglt+jwr4hj5qSKH0vzL0qJwssSWP2IKDNw7lDnBZT61rOLMmEmjzSIhSiutIMjN
         2KB0KoO2TvgjCW6ai2CxnUkbeb27RMVES91wzM9B/y+gjNc9+Pbc8nnWvfBKm+AWFm1T
         Y4OfSqCg4AGFr0jvg+TItygEdtezcaXJM1a5olC+6oDDHKKMBGJEBB2m3QIRkhk2h9eU
         BMZp85orKqK1YXYEon9bXBQgdZhCTpoP0FloUETXPqpR8LxEFgfHQikGcuMk/xTas7TP
         ELSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1GyXXOOVlrOUknWEfsaWLUq6KTZb95zsCBp5cxZe2gQ=;
        b=hYIy/AxZZA8VzOcSstmvWMhf+qEYb8sZ46j4JGBcd9ifDt9viLhPbVCl+mlR6pK5NY
         kxKbjOh6DQYfo8d6w34LnLtf5wXu17G2qAFDCCiR4WlcyiY4vqTeNukrWx8991ZsZfaJ
         0H7CeD2DaiaCoAfXo5ED5XwiXbcfPRdMwDXg84F8YfEIV7qq9CfT8RmN++pS3vyhm6Do
         VkalcX1MzjbpOsp7LsgHUiX8sPu8xQAKYfq8s0jJYZNtT7Vv0wEH9SJqKTqQEwLjMfxn
         e8qzvF9PVANHO/nSZ3h/KWqSbe4N/wL0D0AiuBSRKhBsWbTYQdBHui+94QnM3rk+eEor
         vbQw==
X-Gm-Message-State: AOAM532p15AjrXvkuy30/CUMKHwdiwI2sIzP6CDLXXkBBWMG2eD3F24G
	84P5EjP2boihwMf6u8yB07xCTCtFGtDVrA==
X-Google-Smtp-Source: ABdhPJwzw7rNR2K3MDifWz6J64OczELQPT3hYeH4oYqx+/IQzw50u7ApGc9WNhW1kTDLyhgZtB6N8A==
X-Received: by 2002:a7b:cd09:: with SMTP id f9mr7697185wmj.184.1598464151546;
        Wed, 26 Aug 2020 10:49:11 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u17sm9168529wrp.81.2020.08.26.10.49.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 10:49:11 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	anuj.mittal@intel.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [dunfell] [PATCH V2 4/4] libubootenv: inherit uboot-config
Date: Wed, 26 Aug 2020 19:48:53 +0200
Message-Id: <20200826174853.8838-5-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826174853.8838-1-liu.ming50@gmail.com>
References: <20200826174853.8838-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

This mainly aims to involve in the sanity check of UBOOT_CONFIG and
UBOOT_MACHINE, it will throw a error message at recipe parsing time if
neither of them is set, and libubootenv would be skipped.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5)
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
index 47e64f9114..07711484ac 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
@@ -15,7 +15,7 @@ SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
 
 S = "${WORKDIR}/git"
 
-inherit cmake lib_package
+inherit uboot-config cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
-- 
2.28.0

