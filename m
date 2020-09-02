Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.913.1599081244014349142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XXBG/d6g;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a15so653784ejf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AV8DKzkWjPrW7k/6jb6BhSZJq7AaarTkeyEYQgi5JVI=;
        b=XXBG/d6gZNJ70q31lxgh6obnlG4dmBFJgGR9Pog4dv48P7k7McoF5U3xgcYqUbFqgg
         SvCCECcsfkZYO7Yvge487gV+QPK9ohIdZHGAb5PKziW+pKVpQFb9m3m7ZTPEgmltgCc4
         9/JeNNds0pf5NXFzb9aAiqnrgUEPPlMDkEX4MljITcO/cew7uPBjdLWmc5C9oNrVwY3Q
         5ZrcrFK1vbrbrkMtUaUHBAkVFkbWgMMpoKg/i8bAa8eLPrR8/f8Uv6Q7uNzjFB7zi1R5
         N5QqQtRMva3hS5HiAgciseL0h9leij7KTvivswsjJBfKTPANHLZTRtS7ZpllB2+o5YEo
         nLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AV8DKzkWjPrW7k/6jb6BhSZJq7AaarTkeyEYQgi5JVI=;
        b=UzPYhbOhY7TFGE630skwsMXAnpVJ0UcRBsgK8huF2+zGijhR4JjO4cAZhfrdlHdAmW
         5iLX5cnKu9hWH74npGGT2cX+YM/WU27GofDF7R0aRzLBqDRxQpkvmxQyw+TjZS1O+wcP
         NgVzj6aauHaNSfGTVA/yBLIyTUKHgDzpBtopmzIYPkKb1kXlUwUhcI2QX9M8a71vU58Z
         hLy+enqC4145anJIzsvw7sk1pvbNMMfC+ak+VakhJZc2xXeL+kxVFuTlDaRafz53796A
         eSHbMmXXqegT4lLjEDYVghb5uboGGPfLsC7ENPeiJp6BoyaaNt8M/4OnFWl8HQCdwu7Z
         CbtQ==
X-Gm-Message-State: AOAM531gZhiHZomkLssimFZsj6JI1GauY5fcnq0XrF1GKbTjX4olGakd
	rh4i+kBw9nkn3FVHOggywAHQaRTN108=
X-Google-Smtp-Source: ABdhPJzJCngSk6EojmlEKcpfllX6bekTEtvGQRsSmtiPO4+Jp4h6UOzZVSQa029vdjJUK7l2XUyjfA==
X-Received: by 2002:a17:906:6a52:: with SMTP id n18mr84208ejs.58.1599081242275;
        Wed, 02 Sep 2020 14:14:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/23] libmpc: upgrade 1.1.0 -> 1.2.0
Date: Wed,  2 Sep 2020 23:13:14 +0200
Message-Id: <20200902211330.4853-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libmpc/{libmpc_1.1.0.bb => libmpc_1.2.0.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.1.0.bb => libmpc_1.2.0.bb} (62%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.1.0.bb b/meta/recipes-support/libmpc/libmpc_1.2.0.bb
similarity index 62%
rename from meta/recipes-support/libmpc/libmpc_1.1.0.bb
rename to meta/recipes-support/libmpc/libmpc_1.2.0.bb
index bbc673ff38..b51ec6ad14 100644
--- a/meta/recipes-support/libmpc/libmpc_1.1.0.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.2.0.bb
@@ -5,8 +5,7 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
-SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
+SRC_URI[sha256sum] = "e90f2d99553a9c19911abdb4305bf8217106a957e3994436428572c8dfe8fda6"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

