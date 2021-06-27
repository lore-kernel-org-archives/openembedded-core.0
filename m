Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.3725.1624831748699369549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdgeSkls;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id g7so13793886wri.7
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 15:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8QsddUP5bspQ3d19jXDIPs8z7SZ1I/uE7SPykPo6Vs=;
        b=PdgeSklshJzJXu64+m2eANxvWN2F9iQhj/6NtxRW7R3qzgZVBK5uOSU2B75O9J72ue
         HzKqC+TgK4FMOtz83q2BaSYOIy0GOG0WbRnXrBPlPCZjQyQ0Tu1nZIhiEudDSLe97aGi
         YSG0HnA+UnxuQs33mB4HB4d1RNT10WxERM4mBnZVOc6AGpMdUyV20zRc3yy8MRRh9lGi
         MLwOqvNho1pFtj20ePEy4QoeJXdP2R9p/bpHIn6rqO7vVTxKtqjRX5EaMXx8IgU3j/yu
         RX1OYnXb/2zzrbvcWN2uL6ipSFK9AR6+ceNb8BdFj2A4Ud6I/ps8rG9NnXDDx+mXJXNJ
         bghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8QsddUP5bspQ3d19jXDIPs8z7SZ1I/uE7SPykPo6Vs=;
        b=eYpaXnR94YZttu2OoIICPpJwNK40ww8hyhIJRGXquXRGNjhd2S8gc8yxV4GuOicNgM
         xpUovKWBzIXIo/oxlkw+Y9O4XgcSCuDhqKQbPzERKDkIFPeP7Zr+6Q7JsA02FtFLYjjy
         fKy07wgeI6ffB29cbR7VEdGE/8SCxY/Hs9DexvwoM/tFJsfxYYWptPoTAGBrwhGDRPnn
         D/w+NxZ/LL1Fmc9O0U/6KLjp3opMvpZJAARGBKPaLHz69KDRvB8Oq/KwrwBMCQDURLDE
         6zQaWvHPKIDZYoVBuXI627+uARyeFGZnTdUrqYfJ4Pe864nmtyoV/hXqAU+UqI7ZhPfg
         aAXA==
X-Gm-Message-State: AOAM533bYy+SUKZG6TrYWqq2mJV8JouGgiV4ARWnn4rr8/Y6WHKPp2YC
	kpnwyRk0vT+y81K4ZmNEAOtIrSL9TewpXA0k
X-Google-Smtp-Source: ABdhPJw2JkRU9gEjF+pZLrNmiZEnYXzEA4IaQSaDKa931iTc7U94YwfeioEdfvTC43VUwl4WFD9/Lg==
X-Received: by 2002:adf:edc8:: with SMTP id v8mr8072890wro.279.1624831747045;
        Sun, 27 Jun 2021 15:09:07 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net ([2a02:8109:b5c0:8990:1c2b:a2e7:1796:da69])
        by smtp.gmail.com with ESMTPSA id l15sm12672704wrt.47.2021.06.27.15.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 15:09:06 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] iputils: Update to 20210202
Date: Mon, 28 Jun 2021 00:12:13 +0200
Message-Id: <20210627221213.14667-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iputils/{iputils_s20200821.bb => iputils_20210202.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iputils/{iputils_s20200821.bb => iputils_20210202.bb} (98%)

diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_20210202.bb
similarity index 98%
rename from meta/recipes-extended/iputils/iputils_s20200821.bb
rename to meta/recipes-extended/iputils/iputils_20210202.bb
index e43abf2629..6200b2c1d7 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_20210202.bb
@@ -13,7 +13,7 @@ DEPENDS = "gnutls"
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            "
-SRCREV = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
+SRCREV = "cc16da6b574ce6637f3e6e9ab3c1a728663006ff"
 
 S = "${WORKDIR}/git"
 
-- 
2.23.0

