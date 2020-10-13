Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.9214.1602632737378930791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gnvk+vgF;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id d81so520596wmc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tNmoo/aQGBqC7ADbfpMhrGCGKgUHlP2pOsq5Cm1FSTQ=;
        b=Gnvk+vgFuL27NyYmW1cKVZWH6kb31B41++4Z/85CCtlptkTXU3Y9SL+48Ab30F0N0u
         y91lN15q8eEWEvSkHpE4hutyTwjmh73SZ/MGMMSd5ZKP5Ypf9uh1EipHiH3kO1eb8wwy
         2kPvi1WxgA4pOOhA7+KS4LGslywY+v4WB/gQIpGSjNGoYSfYVvIrdy4jbl+WVmuAVY1Q
         d04byox+er3fithMBo/BwgHFtxUpaXcx+MrajujSvVaJOKLaxW/o2T24Py8QX9JcK8HD
         EigogbPb49Ppz+Fb52B5bo7nnq7kmfYrgZ2c+chpohx7TCdZvhJJKEWanpwcF0h34a6G
         DHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNmoo/aQGBqC7ADbfpMhrGCGKgUHlP2pOsq5Cm1FSTQ=;
        b=Do/2TMXRCcsk8knB4alMJlt52HwP2SKksmv24zxteACj+OhhPhFf1q6+aSmvK2yGg3
         cxa388eoke0V5ZwELncHShy2VsfgrmWasyLW1homnKQe7G/Jt/YoNBbXe1RD4BN2Ep9I
         p6T1t8mCK542KZcHSPAFXmWCytuHJVYpKiuPgjkrIxU3NcBJxtOyVqrzUBdYqetG45qG
         ifkC/QJLD71VSeWYWmtcI6q4CtcXkUC3neiB8a49gotyOwgUSbZB9k0/8Z5vmOZ1EnV1
         +cKeoIbT3ondiVeuHMOrEP97E7yTbVfiqsmgU4r3ijizoamzZs1rCn3am7xMkTy8AWfe
         YcfA==
X-Gm-Message-State: AOAM533DkOli8ieKWKbthQxd/CMuKkBPLrvNL+wTP+OHQEjGPJbH0dgI
	ziiX6GJi/dc/0zB3Z1jnEMklQSenlS3vyTGN
X-Google-Smtp-Source: ABdhPJz+KbPOxC3Q2sf/o3m3StZWU4x5eJ6mrMEXEmmkf/SbvN0MS+V/f7P5rlJ/8Cc9EwRcB3sbnQ==
X-Received: by 2002:a05:600c:228a:: with SMTP id 10mr596493wmf.123.1602632735676;
        Tue, 13 Oct 2020 16:45:35 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o184sm747718wmo.37.2020.10.13.16.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:45:34 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 2/4] spirv-tools: enable native build and install more header files
Date: Wed, 14 Oct 2020 00:44:50 +0100
Message-Id: <20201013234452.2294860-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013234452.2294860-1-quaresma.jose@gmail.com>
References: <20201013234452.2294860-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
index 8e8388e8d4..89ebd72d31 100644
--- a/meta/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -28,8 +28,12 @@ EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
 
 do_install_append() {
 	install -d ${D}/${includedir}/spirv
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv
+	install -d ${D}/${includedir}/spirv/unified1
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
 }
 
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*.so"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

