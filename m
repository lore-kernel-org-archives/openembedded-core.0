Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.13193.1589899885289378574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hnKWiWEJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id t40so1544426pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=A+ZrlNCt7McHeW/DxQXWouspnVsdXfcs0LP2BXihKwY=;
        b=hnKWiWEJ+7CdXQjr50udUI9Kvki0l0pnYIhm4RY2Iw6ABv4o1vulYtqfdXpsDjf9gt
         JezB6IZkVNwUaNePtz5MUUEyK7gI8aO1G+jc2fPt7pyRCW2/13I6jhXmL1PhUoF/KJDc
         I8Jsz/sWrf3p+9eZq3TJni7n1uiVPettj1tyr0C5rXewjl5XQdoCpDmlgaJwx8nkakrh
         Uxolu/if2+6Il9zt8vTeu276Mb6BpCEgcpmMnJodL8GuxdgX0NIezJJLGaHAIOVF+Rmx
         V9Mym5fBtlON5D8+xvO1NcKLTChxOACCSjuSQALP9WdL/1DwZ+Gmnj0RiqqzeVaIiBBp
         BKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=A+ZrlNCt7McHeW/DxQXWouspnVsdXfcs0LP2BXihKwY=;
        b=FzpBRT9BetJnlaFwEjhRvfpxy4FTmqQm2EHLp3cdvTabC5rzXMx8HmqKIiXC3itQqb
         182G8ByxMbbC18ZGFknqBTu9X2vOtZV4DLWwTd2P2n5orSpgdgschyMku/tB+8ojXMZs
         /Y1S21k0bAbieldhROKu/iTgb5yMle8aDEjgpkV3JE/NhlOFBW6odCJfv0FJwB5fggc5
         vKygN24VJYKXbw2cx5zWcV0iZtOcAO9xw7ZyVnmPs/hV4Ne2zmYw5SS4UFaQg/TaGEqd
         a42Q/Wl5ucdniKM0IttffhiGFZOUF1VryIlhnrxdY5K4F8En+/O+fEC/ZPLHFguyWwIp
         ksjQ==
X-Gm-Message-State: AOAM530BCUiaMj0HusXe/t6dkcdPXotZh8uqsiRVZHKwhtdrnjYvnrme
	DTePMbywi2/nzJPsSgjULdRoLwgU
X-Google-Smtp-Source: ABdhPJyO0bGNqUTMh6Xl2rBIuA0Allf6bJkhpXIsxBRTU3fF3inY/8GFlAawyBkSLGh6nf+labW0ig==
X-Received: by 2002:a17:902:7088:: with SMTP id z8mr13580243plk.71.1589899884624;
        Tue, 19 May 2020 07:51:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 4/8] openssl: recommend cryptodev-module for corresponding PACKAGECONFIG
Date: Tue, 19 May 2020 07:51:11 -0700
Message-Id: <5de53272951bfc3c8c73bd09fd0b296e2ffff322.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589899663.git.akuster808@gmail.com>
References: <cover.1589899663.git.akuster808@gmail.com>

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

