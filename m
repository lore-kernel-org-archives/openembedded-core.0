Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.10949.1623535810332232150
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jun 2021 15:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TPxJPHL6;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id u18so3984961plc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jun 2021 15:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jlr0Y2h1dgaiTTyrQWuLGyIJfGyoYqzW+fyTBCYloP4=;
        b=TPxJPHL6ll/fzaFkMyZRbnzTqfDXHhFS6oZrPpx7SjNwKBBZoDNLZC56ihNMxs8FEu
         wueYZc4p3tl3J3ktgCg1bQ5KbI+M5g+ktlW0T7H50owFFBLyRrmtBOhZLdxNhl3K64AL
         FSOknHKzOsqu8d2rMYcdUXxBqywvWnb9YH+LaKoeZjnTR3mttG1AuZPpL4yHuxvTIeA/
         uaQ/YBsdgSNdtVfd4u7lgA1pFDIHWXqG9JPI/5k68By5LMy8ENsnkm1JY9lLgThKBgmK
         e2giT7aOvtq/nP1SWSg2iPjCFLs1324g5Y1RBAgXFbs8HUxmCOLJDDRUsEqznU1hOudZ
         E+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jlr0Y2h1dgaiTTyrQWuLGyIJfGyoYqzW+fyTBCYloP4=;
        b=PI0q51IU7W9RsOG6cL/BcWEysIYnur5TGKGr5wc5Ik6Ci93LKmuEhewqYfF7sTNPbQ
         c4VgNrZEg6pxbtFNa9lUg8Fo1htGzk+QLqiO5JqRWRNVxoS6BrZhaFJ5CE9Ig7Gvfru5
         TufBsftqbYFTuEyu58RLWZbyPOaEp5x36m2I0XOsKnR1liSeKeDzUNixa7Ko9oxBoRJs
         dxqrLIs3+a6JMnGOtHsFlaja1Ke5Ltfy0S/Nbm0H/p8ArJ9IT0sHI+6evAZiko8fEJPu
         4LwlKutHWDDQoAyyHP+mpd/22v/AMDLrRlOi/VRcbh/RI15LQ4I9N6+A9fn4Lq+2MdOY
         425g==
X-Gm-Message-State: AOAM531L7+kU0FKTtPC3qF63MQrM0MTXAp1DanPihzE/hst+dVbfW3k1
	3jP0+BYtpMfou0VSy5sbypULx6R4bM53TQ==
X-Google-Smtp-Source: ABdhPJzps6HnWi+7Xrp9FGvWcIv2Gkt5BmamUsTTvmdfw8rwLo/9AkRkgQ3E6visM6JRgzshjv3ShQ==
X-Received: by 2002:a17:902:7c03:b029:f0:bbde:fc1e with SMTP id x3-20020a1709027c03b02900f0bbdefc1emr9864455pll.57.1623535809713;
        Sat, 12 Jun 2021 15:10:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id z9sm8591897pfc.101.2021.06.12.15.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 15:10:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Set UPSTREAM_CHECK_COMMITS
Date: Sat, 12 Jun 2021 15:10:06 -0700
Message-Id: <20210612221006.2888173-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 6569d1b37b..bd9d5f1d4b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -84,3 +84,5 @@ RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 LEAD_SONAME = "libc.so"
 INSANE_SKIP_${PN}-dev = "staticdev"
 INSANE_SKIP_${PN} = "libdir"
+
+UPSTREAM_CHECK_COMMITS = "1"
-- 
2.32.0

