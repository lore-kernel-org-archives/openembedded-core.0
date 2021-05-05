Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.9829.1620227971393633919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M9gajxmB;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id l4so3428126ejc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=myjzOcPp+XhmG5BoHRwf93S3P5sYtwp5VId5rfDCDuw=;
        b=M9gajxmB9y5RFtt8QfrsJZzzx0CZo1sKpXNzkmo2HxhmanRgj6FjxY14UNx7ms2IjT
         Beyl1cCyPUmevt+URbXoRWBfP1z16WgNZR/BvB6tXBexFODO7IpBF4CH06tfXjvd3bRu
         FmmROvxgbt5naBM+opH3tVm4zVeV30gTzRAFhLtheJPf3TeuKQFxY4/XSh7YU8/RuDWY
         rf0ONfia/PRzTUgdLz7Rb6cs4eXJ4QDfJLbqBkKlqhI/ddbNNMz3erO3Vc6qi4aqATUf
         cKJfZiExwXvxVw1sgJyXmXbo+0BAs+v51JhzQ7JFlu/hAFldkm6y98nsJNnKKjuImyNp
         Ft2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=myjzOcPp+XhmG5BoHRwf93S3P5sYtwp5VId5rfDCDuw=;
        b=qP0+cctpDuQXPPqRI9VVfMABHVlYsljs+VaM8dNN8qa3ELREI45aBrcPwuYC+03jKi
         AlCN9XMoUCsVqyVFoYoEQsRtfOJFYtCZI0ql4YUQaJKsEzHIipcEzWygtetpQkTCgUki
         oLP/JawrVE+OO1N4lDw+dpgRqgxRyJeX6gkBeJLAx8fLTz3txtdaUZB7DzShNVsAkkCu
         aN+zWx6fhOhP2gfooyGh8N3Lx7yk8B/bqSx9sLu+xZ2XcgDXwblxJ0aZhXVULodpLqkn
         hNk+AIvYDREXssMlXvjUCzhRxkPVAoGgpo5sTTVp7xNFqNnXXJ+WHlw4oYFr0u0XjAL6
         Fa/A==
X-Gm-Message-State: AOAM533GRufFQ+u6Ybl5tSpJvBXgaL5C24CUmraOtzpSPrWWENseiyMR
	c8mE2BTnqxVo7JEsRCcnJQqcSi6RvD6BFw==
X-Google-Smtp-Source: ABdhPJzATNvZ2xDMpddrXLI/C+nqPfS4v1uSnUuFX3B5bduhp4MdVpdkNLwItjq447jppsVM3c7Lcw==
X-Received: by 2002:a17:906:5ad5:: with SMTP id x21mr28174648ejs.422.1620227970039;
        Wed, 05 May 2021 08:19:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 43/61] pango: upgrade 1.48.2 -> 1.48.4
Date: Wed,  5 May 2021 17:18:32 +0200
Message-Id: <20210505151850.660512-43-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-graphics/pango/{pango_1.48.2.bb => pango_1.48.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.2.bb => pango_1.48.4.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.2.bb b/meta/recipes-graphics/pango/pango_1.48.4.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.2.bb
rename to meta/recipes-graphics/pango/pango_1.48.4.bb
index aa279bb503..8f11bee3c3 100644
--- a/meta/recipes-graphics/pango/pango_1.48.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.4.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "d21f8b30dc8abdfc55de25656ecb88dc1105eeeb315e5e2a980dcef8010c2c80"
+SRC_URI[archive.sha256sum] = "418913fb062071a075846244989d4a67aa5c80bf0eae8ee4555a092fd566a37a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.31.1

