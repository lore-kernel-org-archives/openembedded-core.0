Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.16786.1605656928362603896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=D8kfqCY8;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id f11so171299oij.6
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VP7eITLN4f+VUX4N2JjqVQtDZBgobnrytZTSDHbXiMo=;
        b=D8kfqCY8h70EBAvFBV3WmPV1EdXyqjy/3NQzVSwzyxcf4eLzRmOx9PVbFlwB8QK7wT
         sdfl52cfD9iBIh6zmR9J1tkB2g7ZVJmQpRdEaLGxnwuLUE8xhBraTtMo9WRS2O0NAGcb
         RAXu+uz8XsspPrAPBu1P7oZVMdwVgYcyINZzjZQcYwmsI8HwEw2ofUZYF7/FqU06bzh0
         fjRAwhhKbGL+IdV7nvY+PTciH4Hl2sOS3gNG6wCuRg97moZYVyn0fmvSshqtD6NG8tmv
         KBUKxLLT7GJdrzZgX4eAys4+Cx/wqJs6sxQoTTpQ2SEH4At4vkzR87SOYEz2TV5cgvVq
         BEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VP7eITLN4f+VUX4N2JjqVQtDZBgobnrytZTSDHbXiMo=;
        b=qaY0Cmm5VXCP6l6/meOfSlJsGmK/Z9iEZ6lwZEF57eQy+OEblD3szu0SGjj02z401b
         OOxkcUq4F883+NXyxG3m41S3W4lJJE4Ax7wlUek21LE7ZZolVAebrzBplVLrdXRXhhnU
         XkPaXCWlrOdJIncqqxsANlxxnDHEu1kvUt+P3FopRWwvRUvnSh5gPRTHj7r7jKmurd+4
         uHfTOCE1kOXtnUR0zSnNfxgEX2VZGdapcL47FwPvsXw3vnEulKu6wGLIJvakY95RKQBp
         v+qSZ7F7t3qVdkmWnUa7JYZRWRUfvbwQffqQ0k5AYtt/3xZFzaTsDB0csUHobrf/H0oJ
         3cPg==
X-Gm-Message-State: AOAM532vXR2OPV27UX0y1WpD1ynzk5GhXXNu2r717BEXqYFqZGlhe/2+
	iyfOualmpudpQtLKn7YJpLOdc2XvqTIfYUY6
X-Google-Smtp-Source: ABdhPJwXde6W0wJWy1g8CyZ+2Wi64Xk77ddEgB2V6OeYZrbqDKE+vmUnqwsCgUL3191jrJufCWzZKQ==
X-Received: by 2002:aca:af57:: with SMTP id y84mr1042608oie.122.1605656927298;
        Tue, 17 Nov 2020 15:48:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] glib-2.0: correct build with latest meson
Date: Tue, 17 Nov 2020 13:47:38 -1000
Message-Id: <b95d8fa49f26d48e821017e555f90887974c89b7.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a91d2b7d463abfd8f39a9f9d5ddde40a939d6e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
index 83596e0efb..adad7e62ee 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
@@ -2,4 +2,4 @@
 have_proc_self_cmdline = true
 
 [binaries]
-env = "/usr/bin/env"
+env = '/usr/bin/env'
-- 
2.17.1

