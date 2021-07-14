Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.5922.1626265580130241542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZeSJWcY9;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id o30-20020a05600c511eb029022e0571d1a0so1290889wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oY0KFebkd9mLDSDvmpijb1WBo49aWZvlCUTzOVB1QVY=;
        b=ZeSJWcY9dy60pbTAxx5PiF7TOilqzCs5FhqG+ipYk5O40Jt6y+ey5TBbGhDE/umn7J
         UmT9XIEZFfE9eZQOmPZD6f+XSbM0PRuErOn7zQ9RysZW3is8UTh/1aLW5qJqG3SGj6FC
         fOnS96fnHlifegUH/vqZLsgVpVD/cZwPsVcUqqGc+SThTHslGF8XEK9+2s366Iimt+ig
         85uIwdkch88Q0XtDaB5J5I7gip0RLKysZly+nWldZ0a58OaY8xTmmkteNVPak/Z4gPt5
         DxWx63SzWAcumRIL3UZYeTMuwMoNO4d6fF0mUtiTdWYi+3WyDV+qLXX9kS/p6+TKTALc
         zuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oY0KFebkd9mLDSDvmpijb1WBo49aWZvlCUTzOVB1QVY=;
        b=BIclGW/JidkQObinTuBfflI1V+W2I0UHT89xWaaqvz1IdFqO7PgzIQWxTCkIdpF2qK
         tH+6Yy2XVsIOP1tzcWvpj/jLZw4dVKPecjMGYWVitTvqYZtwkhn/nG0f8dbJUEUn/xxv
         LR5ZDFFrxc7adQBWe/810NEh/v50pvJUgVejLYqbbQ8ddVbwL1BAsddHS9nowZp3DZUF
         seaF1I9404LVAcmRUAFBZ4F3H8EjFPyFYYSybi+jeAYJgp423dhfV4dS0Pcpx3YzvoEW
         4s6zwCx3DV0vnoaa3Tujj3bIp/hwoPxRkFVrRLTfVs2Z11v5+Xs+BcAHgwQsjKyCL2vs
         qjMw==
X-Gm-Message-State: AOAM531+2AfetUeebkkIO8THQ/qSFcfIfa2q94LemXT8aXs+tC8e5noY
	HI9kN4qTeMMa8rjDax2Opr0gDrM3DNc=
X-Google-Smtp-Source: ABdhPJzPXdNGEbPToOmcZO5DSi8qhPRkDfoVy/69dYFZOH9G5jEeT77ZKr1HBM5O/XeSAwWjxLgk9Q==
X-Received: by 2002:a05:600c:4e88:: with SMTP id f8mr10917208wmq.14.1626265578717;
        Wed, 14 Jul 2021 05:26:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/21] createrepo-c: upgrade 0.17.3 -> 0.17.4
Date: Wed, 14 Jul 2021 14:25:54 +0200
Message-Id: <20210714122606.605142-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.17.3.bb => createrepo-c_0.17.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.3.bb => createrepo-c_0.17.4.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
index 481c4bff29..206c27c04f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "8196982f0974c268898a5550d61b374bd58103e2"
+SRCREV = "cb74969736bdea86465e85feeceb895ff7a42610"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

