Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.415.1592848903735263953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s1Ive0Gh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id d4so13823353otk.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TKhzQgLwNb1wRuJNeKbBn8GiUpCZAsX6W36DA1uRhmA=;
        b=s1Ive0GhElQ303dOHbjJHXSOO/R/7tIaVcW8WieRYgBa00T4LIDULYxmW97yR7qEPo
         JYOI+FJpPYsCmg373Q7fyEcprBBUoBO/0JWbxXOfbgH4UUZlEt0Zcf9tb1Bukl2hM8LT
         KRmdisGOQEW7cuNrZqP5CYOkr088Ad0We3jwIstr2mQILTRCZN3xX+GxR6wZa6tR0YKE
         u612CwE1VKidTHesTtE2AjINYt1RWYPvdZZQhinDpI1FDIA2PLWSo/R++kEmpslIqGAh
         1e8VMagK9pbIYa2g8GiD1LlQQN2FXo+OW79WTLKHk/aoK0khGAhI/hOGPXv7oJL22SQ4
         7C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TKhzQgLwNb1wRuJNeKbBn8GiUpCZAsX6W36DA1uRhmA=;
        b=DylDDerqsSNS+jAdHhtLoKrUJxVF+HWQcyvXEziQihKFiNlN8VqZ9ujGTULNTbOveB
         hDDb44RvJ6UUuOGMOvo/0INPgJN4SGDt8lwQuC2wW/h35wHnMY4S4OvEjw53I0HIKTDL
         T1KyTFEtsbd1VrzHccDchSqb3wNlNEjDaMvMFuTjMX69vunBqj1w/7XSsjYY0VreJLh4
         87Q7DfYIuNsNZG1dsbEKmTS1o07Bbyfl0E2TbRXnjf1Ewaimfj4l/GtSh1MvtSOl9RO+
         82tbS2mJIxg84Cs5zfBj1wIjvM+FrxeL3zJZ+Noa839oDM6i2wYqperP69gFKjd+Z8fp
         K7KQ==
X-Gm-Message-State: AOAM533+lF/W13R/Jzxauh8PPk38IEvEfnUvjbItWJnOWk+RgQrrWnMI
	ylDdCDKIRWzoyc+jt5ySAS4aK79YUM9z4Q==
X-Google-Smtp-Source: ABdhPJwyWstL+o6Bsz3Ooy4BUETF0So8hEjpnM/5ElqKopktzTvfbTEFABeCSyjp4qDI+Vmxo7hYVw==
X-Received: by 2002:a4a:345b:: with SMTP id n27mr15339488oof.25.1592848902587;
        Mon, 22 Jun 2020 11:01:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/33] go-dep: Avoid use of 'go mod' support
Date: Mon, 22 Jun 2020 07:58:21 -1000
Message-Id: <dba5c4956e713b177d80695d0081b8d8d139d7a1.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Otavio Salvador <otavio.salvador@gmail.com>

dep utility must not use 'go mod' support, so we explicitly disable it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b34000ae3dd6e0a1d7fc332efb35c5da84cf2275)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-dep_0.5.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/go/go-dep_0.5.4.bb b/meta/recipes-devtools/go/go-dep_0.5.4.bb
index 615cb289e5..496224a5cf 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.4.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.4.bb
@@ -13,6 +13,10 @@ SRCREV = "1f7c19e5f52f49ffb9f956f64c010be14683468b"
 
 inherit go
 
+# New Go versions has Go modules support enabled by default and cause the Glide
+# tool build to fail.
+export GO111MODULE = "off"
+
 GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
 RDEPENDS_${PN}-dev += "bash"
-- 
2.17.1

