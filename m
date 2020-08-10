Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.37631.1597028392213942260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 19:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=quQtUQzU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 128so4102749pgd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 19:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XMoH2w3cWZ0xSYE6QpPxtnTO98Z5Cklv4T5nIAQqMXM=;
        b=quQtUQzUhaMmlOum5mYCsRvuPJ+st9fPPa/VRXjycuBeqaJGScNMleIGBKZkDODPM2
         5d2/T+hSf/9A9k2lNN6HAQMz7p7R5/+0pzp0AeX9JUm2xP1q4VUqBvIi0otRqPPuOCNO
         SmHoxXjLM26P2BnBGNf8SOeq7NNN/OzNh76T7GQ4c2zoavtla2wy/mftFihldZX6qD/a
         Cdd4a7fYGx8HvpZOyNQ9MpRPtl0GkxhUWrvEeiN8oBSQactf0oiYQQpZPdkyDON6zMd+
         aJwQb2eKSODAdW0K+WE/akAF++tXHOCqYGXKvQEuCKntYe96ydVCkmollugyl7959x2U
         4Ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XMoH2w3cWZ0xSYE6QpPxtnTO98Z5Cklv4T5nIAQqMXM=;
        b=Yffkc28xRqnXgt+8i1tMnibuJVZFomKIZjEfXuKVWTATJ/oUsh6bSXHlgwYm2vZNwm
         9fEeG56MU0wg0CtoaxnHy22uC9AAkEKIYCgbKz2/X6Oq5FP4WwRbcCdGm8mmTh53/QyQ
         wlB47SxsOYJmmS6ZBXQpd+Iuo3f/4URAlmOprZLLi586cT3JmdyYkMeJPcLoNIerOK81
         kOg57Wj5ZRhpq6hEL5rx6sayelKXFQISfsF8aQxLD9srGrbAhpaoCQkUjuzCPxS21tWp
         E4nLnEfAd2tBsJNVZ5G2WBjW9XzxbqLSCYSXjLKx1Vy22p8qpdpIfyceV1RyRNChfwqW
         B8Yw==
X-Gm-Message-State: AOAM531h+AA2sg1bE1ZPGDiZ1kJO4bN/Cs1paDZzpLUvpg5vPhwyiI8c
	HJBxrFp4cZ5pYF7hYbY7hTcWBZuXmqf3vg==
X-Google-Smtp-Source: ABdhPJz6GJfjktbDDq6UknD80HtPU/gBJAMikTSKjUhmrxXOYydrRClIyUfaDCcTsfBNFlsmUz7+NQ==
X-Received: by 2002:a62:6083:: with SMTP id u125mr24258823pfb.286.1597028391108;
        Sun, 09 Aug 2020 19:59:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.19.59.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 19:59:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/19] ruby: upgrade 2.7.0 -> 2.7.1
Date: Sun,  9 Aug 2020 16:59:10 -1000
Message-Id: <51b45ec3fcdc3c338f8a141110abf8aa5d374e5e.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

This release includes security fixes:

CVE-2020-10663: Unsafe Object Creation Vulnerability in JSON (Additional fix)
CVE-2020-10933: Heap exposure vulnerability in the socket library

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d9b48bdf25363fb115a6311b031a7e5da8e0d4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/{ruby_2.7.0.bb => ruby_2.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.0.bb => ruby_2.7.1.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.0.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.1.bb
index 7f07080497..3dd9fb0a62 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
@@ -8,8 +8,8 @@ SRC_URI += " \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            "
 
-SRC_URI[md5sum] = "bf4a54e8231176e109a42c546b4725a9"
-SRC_URI[sha256sum] = "8c99aa93b5e2f1bc8437d1bbbefd27b13e7694025331f77245d0c068ef1f8cbe"
+SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
+SRC_URI[sha256sum] = "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.17.1

