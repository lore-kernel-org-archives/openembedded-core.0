Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.1500.1588648884239416653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rsUgN0Od;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id d22so417279pgk.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vsP3UXIKCZofcIoFZnopJGS29Uk9z1wNQlgUbAu78s8=;
        b=rsUgN0OdtxDJ0mOkcENjD0I/+cpVYfL2B6Mkk1BPy1R+pNrPt0nvUTz4aW+X34k96r
         1qtntHPsMX2JvvXxbG71pRzIwNQ/EW+dTW+Fnnnda9gYrn6VpjKjqEPLbqkh41HvX+kU
         Eh/0jxNMF9rNI1Rr71nZW13bGZKxylcfBxo0DMutdWuisnH+iLNX4JWlEtNDA1Jm/Siu
         GduLb1JVV1B6IWYxbqbHReddEMdfY6zpHokEraGKRbFLudZhuBPVsrbnl7gXf9rYd8bB
         KCmveoggE/ZpcXR79HhGZJIV+nSHcMxUlH9Hc78bE7vjJRSfjuvcmeiFtttJUF7eZuoc
         gFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vsP3UXIKCZofcIoFZnopJGS29Uk9z1wNQlgUbAu78s8=;
        b=PgZQK7BJJRmNbF2B1WvOshUTNrLp6wSW7lmO1J/6Wepz+JDneF0iqlz7A43KIIH5aT
         raQ1mct5NKzMvBsWil9a/jdzSGFnn+3vSaBADLCvKC24JvpZm/OCpnYXk8uMo7/rLeQ0
         VVEvOjgETwNMK48ygYsZFQfO5mPvjfGfY5FCUZZwDeo7cBK10b6zUvUWEet1wiGJ7Oq8
         zulqxl416qXmIaL7AYDlkUBqhF2JDS+MQEmCxo0rLCQ3yy1ynZ6Pae5ZL9A6qaRnnXwe
         97+OQvwKD8Xo3WOI8nHqsJnI3kUXv6xIoeLHNyFzxN/qxbuSnks0D208COszXF0SZlDY
         YxCg==
X-Gm-Message-State: AGi0PuaeSNTu0qZVd7RU618QyjS1BIjvQ6dkAP/l1ThidL7rHTTjxjW8
	Jg5pfXYQtIej4/xZ6APf8MxnZExDZuSwIg==
X-Google-Smtp-Source: APiQypIjenJ5LNEWNAk4OQQkF3DrEtGRZliYf32c8n67N0GznmiErZZym79v1CUPzZHnAc+D1VAE+g==
X-Received: by 2002:aa7:96cc:: with SMTP id h12mr1137193pfq.298.1588648883279;
        Mon, 04 May 2020 20:21:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.21.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/28] openssl: upgrade 1.1.1f -> 1.1.1g
Date: Mon,  4 May 2020 17:19:22 -1000
Message-Id: <f0bd52e5b50a1742b767eefe0d9d67facbb6c53a.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Jan Luebbe <jlu@pengutronix.de>

This also fixes CVE-2020-1967.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 3fa2b41fb9..66fa8f7d0a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
+SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.17.1

