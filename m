Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.963.1599081251069923317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JZXC7mxb;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id lo4so686946ejb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1L+/FY55Gljbd1qadaJ48lBHPghfg+5Ja/ac77M/tus=;
        b=JZXC7mxbKAEus3p/hseVgGRXKiMOIZ+lmyuCZQ61fOO7T3ZJdLl3WtRSSjWy+vF5qa
         ovXAcvLJnAp8ZFfT05Mc/C+1C721CncG1eNDlOZeuH5etnNJ1DIavNX/TEtX2d4vkYOo
         AuZHehaMXNhxesu6ssYS9tk4GwKsKW2JcO8jYAgM2bjMrt+zJt8zoR8qYyZFE7xnMHFR
         5T0+q74qm2A2encipO0Hx0Jg3kWhWKGee6tder+U6kXFO+yGHdt82YG/qwF94OspbpYh
         DEwoYISvb7aO4rfvnwnJtJ7BqXAU+wVdRUalnYIgVDjgNYcwkd5Tj0F8hWoKG8nse1qR
         evTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1L+/FY55Gljbd1qadaJ48lBHPghfg+5Ja/ac77M/tus=;
        b=obdaeEfoYvstvNiwo3iZFQaTcwZ7eNLPNCuvcvrmqtjiy0sddBPALNpFS3wP+KFGWu
         ghWQF+xKnmp6GzmBIjm48kbXAaUf5tDMq+1U2eX0/fVRz5r8VWJCCrx79Om7vWBqHUcQ
         f58As1aZZsO65Xy9YcM3yhfpCvs8yYE8/DwKa0p8ALYjSqUvj/e+KWkEsPuKBrTW8OgR
         X8Mr5IuULw0VpXBLDv3jLXbux9E0HoYB2lwN5nBDp+qoGsLQQCNPhWhktRiYwzNll2H+
         EVb4vFVGXd6b7i5OgSHMXiyEh9ThpQbNI5z3b98DWGfzkzQCHvDRodrxwKauFdFukWJY
         AmcQ==
X-Gm-Message-State: AOAM533AI1PS7u/q7+sFrn4TofB9dJEM7uhWizA2cAjQ2o0GPz3TFeww
	2ZovjsMij1MpPImVs6ZMtkCY2BGtTio=
X-Google-Smtp-Source: ABdhPJxO282dRbl+xf6xGyzND50+VFGkFuK3r2aHBOKfD5Hezwph88lCAvIpISOXV6M3EPnWgvviuw==
X-Received: by 2002:a17:906:68cd:: with SMTP id y13mr77381ejr.132.1599081249362;
        Wed, 02 Sep 2020 14:14:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/23] resolvconf: upgrade 1.82 -> 1.83
Date: Wed,  2 Sep 2020 23:13:22 +0200
Message-Id: <20200902211330.4853-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../resolvconf/{resolvconf_1.82.bb => resolvconf_1.83.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.82.bb => resolvconf_1.83.bb} (97%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
similarity index 97%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
index 67959576e8..f0ffc82241 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https \
            file://99_resolvconf \
           "
 
-SRCREV = "cb19bbfbe7e52174332f68bf2f295b39d119fad3"
+SRCREV = "d001dd2b7ce4c854eaa29e46b9640ab66c6e70bb"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

