Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.12784.1614955623592957879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jReZ8PSd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id w18so2208951pfu.9
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BXjPVTQytWbQt7QoRO0bPzuZf2m0JI2087PupLPpZBg=;
        b=jReZ8PSdD74hWK7P1lTyCpRsd+1qS3u0d4zGDnwdVEcQTB0QQNAwfWg6iD/Xwd23su
         Wj0gME593UpdqbIK7pzID7+yep6TmPL8Sr5Xboy0rRjfscG5nbjSRjcnfA/AuKjrlf14
         G+fWrPJUNu1zR+Wlt8WCV4VbTU3qHlCmLsSZTQhvvYe+k6r+ZOgUFhl9mc6nu1/puUcg
         SaXqRAV5qRtflH/x3YSqwoX7u5+dOqO3tmSjVZ07olwFQDmONMtSdfl9f8vuTJSZgmQ0
         97Px6zikizh7yVNzEdr/wjj6c4uWPcOM8Jd3eaEf2N0pBYf5O8w6jb9AFRdyyJcy9bDQ
         Z5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXjPVTQytWbQt7QoRO0bPzuZf2m0JI2087PupLPpZBg=;
        b=XWsg5H/0GQqIv4T8AfxXQAmozS4TEQ2Czyvmy+el1qy94vUpI0Z7HkRol79q8kEM2b
         MTOrHIH2xastfXCAezOQxw1perNkC87sseloB0SjgKpHGoGfzlFo2Zds4o3tUp9JPWIJ
         WlGE6/41I1PIc6aFPEZLp+o6AmmjF1JFtU9dkpQMgNh9NltrYSuQD1TpZPT/Da0zBNG4
         o/vTe6YUOEvcIXAbqrZT5MzTVO25c0ndsrceZ9NxHd3WFG5I8/kYDGd6jmqnbxHP4MZE
         hWr6xwJWWWeSkj0V5Lj/Evw1iso9OHEKg1CE7AbF3BLHfud+Hd2fuspciW4NEBNiH84T
         kamA==
X-Gm-Message-State: AOAM532AG3pE6VX+/rKtt7/7GOv+1pUz/stm8JoBYqyQyKkKRv3efMQt
	AoOpB70NwVOiWPIPXrp/OfVwijsVE6D0iDIh
X-Google-Smtp-Source: ABdhPJxhesUYjOT+sL2ZzuZSg9y4E6gx4XIsx4ZUKvFljV1q2lOTkkSrUwWYT8/2e1aqSLfgD4NXtA==
X-Received: by 2002:a63:4e1e:: with SMTP id c30mr8969064pgb.149.1614955622520;
        Fri, 05 Mar 2021 06:47:02 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.46.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/27] openssl: upgrade 1.1.1i -> 1.1.1j
Date: Fri,  5 Mar 2021 04:46:10 -1000
Message-Id: <c3b4d7500366092d99f7bb6f30555424e66bddba.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a67635ca2c7a016efcf450e4011f2032883e995d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1i.bb => openssl_1.1.1j.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1i.bb => openssl_1.1.1j.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
index 5d22c511aa..f054d2fdba 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
+SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1

