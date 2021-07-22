Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.2066.1626982284342100190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iYpm4KcF;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id a14so454621plh.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XUJ5Xt4dGffSXwf1rd0zsL04RaQfirKerkhOUfEfeNo=;
        b=iYpm4KcFRrNi2quyhRrIWi6tXwOlAZkNfnCHX2tA8XuyVlpUiOCtXjSFGfF0qXa9YT
         R0RkEUzK+u7MMb5Y8jKDU2qCPzbT+37f25OL2Pxufyssh7SMVCzMjWqTYW9AfI/NMTwB
         9fXWVETan0GtqPATLyNma8ruasQmodqbo/DbllcMBwfkCgFMtAtSkmHYlm2WRV7N1BzH
         qkpkJW85oaSm07VIkln9E/R7HpxPmo5wFYZgVeKDEBFAgFjnq6DwOQ4Cv0ZMQG+mU9To
         k1pW8vFERWt5OWd/eellInf4QZv/yBZV8lw4RuLWWUZfTCP6fv2vvhKIwfvKvH6ylZ3N
         m43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XUJ5Xt4dGffSXwf1rd0zsL04RaQfirKerkhOUfEfeNo=;
        b=L75T9XxtJOU4+w+ALJvcgw6dQaQwSVeVVM/wggsX7eHDylrFDzBzTBKzIIi1q2GTRe
         2spKOcDxbJRzQxS37VSPaP1dV9IiG9cB3O+GaQsiTvCUIojBu30iZyyyPcnX9E6qizZK
         +03BRdk/UJpyeqrCunzQV7n2dZ/a2SP4b4spVFe9CMDYfz1kw61maLO2JOyrjdgyEAKD
         ykZ+dCeaiHktdbao7vltzw1aqiZJa7UaXIVuGKECoSbqiaVDs301G59Pq610njp6xMuw
         qnP+JxG4PCY+d9VvSS6Yt3G+cfEjyBJ7Yzt87lBErVmcT+MlR2y1aKdncLtDyN3sPS0e
         wneA==
X-Gm-Message-State: AOAM531pXzGSwvh/U6ZYqCcOENbAmf9I8l7n3ulXtCjAM+/SQBZ3m14d
	Z14/YUCkoPBcbFW+H5hbgJJoElQWM735Xw==
X-Google-Smtp-Source: ABdhPJz4upmxk5cnqo7K38MpH232AiQG33o+ess4T7MaVV1lUFtyhxQduj8ZN5QBAyGpj7OJZC2m2g==
X-Received: by 2002:a05:6a00:bd6:b029:329:9432:9660 with SMTP id x22-20020a056a000bd6b029032994329660mr1135195pfu.22.1626982283636;
        Thu, 22 Jul 2021 12:31:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e8d6])
        by smtp.gmail.com with ESMTPSA id m16sm31141715pfo.152.2021.07.22.12.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 12:31:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Remove obsolete --enable-stackguard-randomization
Date: Thu, 22 Jul 2021 12:31:18 -0700
Message-Id: <20210722193119.145837-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this has been removed in 2.34 onwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.34.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index b396cd1d59..c713faaff2 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -80,7 +80,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
-                --enable-stackguard-randomization \
                 --disable-crypt \
                 --with-default-link \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
-- 
2.32.0

