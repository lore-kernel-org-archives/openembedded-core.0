Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.14032.1590157587161559788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M0ni4QnC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id k22so4447769pls.10
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=A+ZrlNCt7McHeW/DxQXWouspnVsdXfcs0LP2BXihKwY=;
        b=M0ni4QnC668txiLfJXYTGuPnoVA25EkJaDBSnC8YwjzmOPERRjYKfUy7RoyfIlzrKK
         R0oJli+O14as7N9sAjqT3NYO4+AFfkJE1oYeFqNvbJ289j3FEz8vrfxcFLpAMQ4EQ0OI
         eIv2azBVMhsCR09lhNe4Koe4t9DO9TJxXAQLmprpxIaPOYoH1i7YMigjDyOjLHixTwjQ
         PdFCdwyt82ITJR3OZG+9bETSHSblPeauZhu4QalmncXOd1JBFAk15VZATecCpHoSAyiY
         TnTBF4BZMiEPG3QpVntt5nMMJ+kpG5NSRgz2a6ak44jpH2cnGfWa2qtAwgMza2BJrGen
         BBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=A+ZrlNCt7McHeW/DxQXWouspnVsdXfcs0LP2BXihKwY=;
        b=f+jp+QP/pEIk1NqNwj1q6J2O3welRoBl15tB77VOB4ridPDdDxMefYqxtmzxPYp0q+
         rjtMCr3KfsbF9VUoG88tx/ia6v25AYdl1TDLfRHcT1YNevQeFcG3rz8l0FFQgRO9qVaV
         2tgPm4oacVZwBEt+/KN282E9DGwwqPKcrMb73Bko9U+f9Xs+kyUozZzQTgqswwW8JfX8
         PykQ+8KHJCoQ/rdHEkO25BbuJDzRa52LDt+IFKz3Ty5KKC5xjgJyROevI06KsUL8tCSg
         1fX+FJHIrgi9RFiupDq8khYhpXSR6XUaQSrG+gAvsI2rwMl00YI3y2/gSauacmJyxdJm
         jWXQ==
X-Gm-Message-State: AOAM531Ik6goZDjmepH/0YAMwlX0RW3+u4wmzcWwcXjaYr/NrUBJLrmE
	a+gvmbdRh3kwV5yVaOkGvUhUtZX9
X-Google-Smtp-Source: ABdhPJxwlNirL4xJgqBapM1CZ7/PKPxL1J+TnIQMz6DbuSrGga39a9YjCELhOOLW5zo4jc9CefXs6Q==
X-Received: by 2002:a17:902:7086:: with SMTP id z6mr14922533plk.294.1590157586439;
        Fri, 22 May 2020 07:26:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 4/8] openssl: recommend cryptodev-module for corresponding PACKAGECONFIG
Date: Fri, 22 May 2020 07:26:13 -0700
Message-Id: <5de53272951bfc3c8c73bd09fd0b296e2ffff322.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590157490.git.akuster808@gmail.com>
References: <cover.1590157490.git.akuster808@gmail.com>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57fcf9b517fe95e871122946cb99fe7fa9fd2e26)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 67eea6592e..d656cb3cfa 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux"
+PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.17.1

