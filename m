Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.210.1588040165059174314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gIxK/8FF;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id w3so7739670plz.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 19:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=q9cAZdnPu2+vLNb1JL4r36swkS9wS5IdhuISfx9DnUU=;
        b=gIxK/8FFPLwilfwLT47OBI9MCL9yNocKJOYnFhKvbGlLxjWOQDL2IhFsve7c9nDJOY
         uDie3oROOKSdz1M7r2aar6Y9hplAP0EbVeeIsHEBOYBcxJ+yraDdDEfD6+PYKAmaRV3W
         4AJKEf5/UQKpMYg4EoX04X5Kz0n+lbXCesGSO6VJZWnDK+3ByRtmLOMd/vbF18Jb08is
         6OoS7jNr3GWir+AjyZIguN4T4siUuUmCGOnFXP0Zws96m2SRFT2BQVuCWJwwdQG9chgs
         4lvehTGyJMoWRfBGSR15J99J+txfRrQfpcnfpy9C8UFDMky3vIAgnFQUfrdE/Y2x6GES
         /KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=q9cAZdnPu2+vLNb1JL4r36swkS9wS5IdhuISfx9DnUU=;
        b=iuw1I0L11NJTD5h5y7yfg9RzJLiQ4lpQtes0aS2hNUcNL5qHCPn+pOrIv8zq4hdJVP
         WTUjajB3ir/s2zjWGzJOcd8UoKwPPfleu4W0x3o+9YbjMG6BRrD2sfQ4vM+7F0SFd7h2
         oSUpDlmEz5xckizECpPhNIo6hglaohxH2IyEhX55pAcL7OD4LwLZnK0hx/X3HaUnsYmu
         F8RRa+tq4c3+dYgTuIEBJFA9L8oI0iCEf1q3gGGlv8IcAnlq3hlaVs1xws7cZjFfU2AQ
         Qm/WO0nHMSc988ITFakl9c1+coeaqOkjIgnu7tgEcbJZu1LJO5RHBHJRqAPnQhf+E//N
         gtfw==
X-Gm-Message-State: AGi0PubSLxhPM6Ar4Glqb350/tx2GhcNrHSmYre1Ao+r45ySvVD/4ETf
	vqwXawrI+XmgMQlmZgNeOaY5hOEH
X-Google-Smtp-Source: APiQypKPegu8bq7sWWWPyhOoo7jCC0F1LSu4ub4T5dgo4nYa5yqNIvHQq6r2ws7p+QSDNnphnX7H5w==
X-Received: by 2002:a17:90a:17ed:: with SMTP id q100mr2205672pja.80.1588040164356;
        Mon, 27 Apr 2020 19:16:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1bf:759e:e8cd:49cd])
        by smtp.gmail.com with ESMTPSA id 6sm12328390pgz.0.2020.04.27.19.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:16:03 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus 5/7] openssl: recommend cryptodev-module for corresponding PACKAGECONFIG
Date: Mon, 27 Apr 2020 19:15:54 -0700
Message-Id: <285957cba45a15c90ceb062a55c957e81486a031.1587931177.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57fcf9b517fe95e871122946cb99fe7fa9fd2e26)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 169824a8bef..a8ca7163090 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux"
+PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.17.1

