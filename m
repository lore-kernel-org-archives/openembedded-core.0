Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.964.1599081252018346292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=llDEh5fd;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id ay8so440644edb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sZxxM3CVMfJ7g70fHXOsGlAlAtMjxNQigxqpslgH5+o=;
        b=llDEh5fdyAWFWJGYLYMDPL8PYHUSftAxxC1ssACX8vOFA9MTl2dJO007eqrrCr80ET
         lpofswl8M04FrTbyXf07dVCDRxWvxUPpIRQ2Hu1+HtKk7FnUbMQ/b5odsO0JczApZgvc
         HrhbAgHmiFkJ5fT/Pv2m/XUB0PLypJvhWob9msMukDbzpXrHvW6yZ9VndxlBluShFd6N
         btS3ulbtOs/UlMWirUTcn/vmpcdsYTvcbqc/TWiVk72FdYwqjcsAPJyD0keOxXFyvzsx
         M1dHHOmIRag/auvyAAU/lhSLyXWgMjvDYsiejQwoTznculwe2xTXWgj1ww2wa3vJQhv3
         rWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sZxxM3CVMfJ7g70fHXOsGlAlAtMjxNQigxqpslgH5+o=;
        b=mhbEoJodQawrpR9SEGUty3VHTwWOxvDvQUDo8aI3DuzyDJm1N8lPahFHM/ZjTsl2c7
         tnoRihBwXznzsC7Iiy2JR4Uqd7vCRlA6I0e+ZXgLFA8zbamV58fkQ1hV06ek3+iIJPtS
         WJm9Tjybid9kqnmEY+d1AULoy9uP8MMBNTsuXacFk9nTemapnAbn5274LKGgktNJZe2G
         2IIN6IkdzL/A54201Mpwl5GTSqFfJm0Z57s+st5xMdPXDcf3kQnFfVIyxFE+4uZWnQf+
         s168RwKGF4M8lNV75z8BC3Dm2LHKm5/9UF3JrdsCaoM39EneWkGhw4R3APA1CCp4ESQz
         pEXA==
X-Gm-Message-State: AOAM533aW3RlIaPtdnORlXXw/L1sNyFtBx74mQOOYBLDe1zQAwmkbpG2
	y2/qSvi7AaO/QHAIsMoZWaQUP9YvWsA=
X-Google-Smtp-Source: ABdhPJwjHButHfoTCCg3ZeGA1lER/56PDP85exweEoY8SWX3xyFNxBEPAH8wOuzShOeB9g/gDShFnA==
X-Received: by 2002:a50:9b5e:: with SMTP id a30mr2024037edj.49.1599081250254;
        Wed, 02 Sep 2020 14:14:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/23] stress-ng: upgrade 0.11.18 -> 0.11.19
Date: Wed,  2 Sep 2020 23:13:23 +0200
Message-Id: <20200902211330.4853-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.11.18.bb => stress-ng_0.11.19.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.18.bb => stress-ng_0.11.19.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.18.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.19.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.18.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.19.bb
index c668d8cbde..f1af99e512 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.18.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.19.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "07c82a5c89538b5b696a79192faa70d0232352004c9e532946f7f3613d0adf23"
+SRC_URI[sha256sum] = "a50b753f00a9c880eda4f9d72bb82e37149ac24fab4265212e101926a1c20868"
 
 DEPENDS = "coreutils-native"
 
-- 
2.28.0

