Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.4121.1609193810235851916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CqzkBnlD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id v19so8032767pgj.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HQjjkzuIspr62flSU+32KFA0GsfXcxbhZ/SloO1lOxc=;
        b=CqzkBnlDXfM901xKHQu5QZ7L6TrA8CjnJx6scDg4COe5/Ez9pMkaHv77+auj6OJyAQ
         SFLzY82aVpb7tYFw6ulItWmNd8krzMGmLFjZwv4MWDqEqsiFraXe0lS7AAR/smdrcVs5
         A/LCWg+oK8kqzJmuuWcLckGZ0CLbkcSHxhDlOlHtxexCZsO/qWFDC6DTtKWEZj9i2q+P
         ExF3qQQgtoEJjdqYmhnui8JKgZZZojz0N/mPB/7OGoC1FFqhWajS5TWuMuS6pC/14hxK
         mYTS9CRw2vzHWx7y7+Dg5eBT9pSQYXc7/0d3T62XqGx03854G5XR4QQwnGD7Fk1bUP1R
         0Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HQjjkzuIspr62flSU+32KFA0GsfXcxbhZ/SloO1lOxc=;
        b=bHAkBpg3mUvE5N9zIWUyItnZ+kA7pHiw7Cd/wc33Wh2rq9aoU3pzb8Q1YYVuHHTfQ4
         01TE8wQwBcf/9+SIR0Fxdq0plJTVD5JPxV0SqllAuVVxlwkSLRIrsC+XdU3XdpeKmV0M
         rPzbY91SKdUc4ttiNVcUagPIIdwZrMNeX8CJO6y9Dm5g24WGEXZCzyX8QShc60VXKTWf
         vJeWJwhR2RPtpQpCix5aQBGbKPsgVWF0MAvXsuks+EILQInrl9/MbIHo6GpLAofi7gLC
         lWYrM4Ud4FyH47QzEhjlGivPaGZeqmkYy0auXOqEJkK+m3GpwqlkccS9DrvQU3ir+fu1
         DTSw==
X-Gm-Message-State: AOAM530THnagKoXzMuAHkIgAzfvBgZxILwr3iARPI+isYijEqdoe+qCs
	hlqI+oBBuvYY/t9wcE4cuN6uvcTpZB6Sxc+qJPU=
X-Google-Smtp-Source: ABdhPJwtbi+oROuIE10UNc38c3tFOQQHNtwDnTuyW55jbepqdhWyWUlWjXSjRKVxmXR4pTIG0VWmng==
X-Received: by 2002:a62:7693:0:b029:19d:92fb:4ec1 with SMTP id r141-20020a6276930000b029019d92fb4ec1mr19406428pfc.4.1609193809318;
        Mon, 28 Dec 2020 14:16:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/17] openssl: Update to 1.1.1i
Date: Mon, 28 Dec 2020 12:15:54 -1000
Message-Id: <b0b14c7e0dff89c12ddfbd4de9da4f2b8c7d9514.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Robert Joslyn <robert.joslyn@redrectangle.org>

This fixes a NULL pointer dereference in GENERAL_NAME_cmp function.

CVE: CVE-2020-1971

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 815955837b..c2db596f03 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
+SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.17.1

