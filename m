Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.180992.1598214067499032404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ixjR+44V;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id dp2so3987297ejc.4
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLevrj53stt6nDz52T9izGJt/+GChFQEiKue5c3h1fA=;
        b=ixjR+44V3c4zhcABg1osYsYo5bAL+liN9ZKqk+rG9I/ywN+lr310P6a2SKfpmSv9A9
         Cn0hwJaQZD7QsL+JVU/pV7bjswkkZZ9BFmMFFgrF84IL7kS/UD053GhFOM07mmygwvVI
         LexJQEQyTaQnG8x5+5/QudZfQlHvJPt0G0drKvzUwkDwRECd/KRLtYPdHEAURf8lOugO
         YpaCshkxDXsJpZOM+e1IUiQuS69qwN5ScTbrk7QSo8xyRqJQMDZQY4VoGoT2GLjh5VKL
         WbLjhg9CydcXnssjxgIb88aeo7o8XWItcZmBSgsnEcuBuxDKHTyhNYGxzBRv8zGjT8ge
         Lhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLevrj53stt6nDz52T9izGJt/+GChFQEiKue5c3h1fA=;
        b=d1OwxjaDmsd/NdxsF7rHAfhZnB1NMCNbmFLJImM7IduhPUt9j0TwTJb2pN8WDleH5a
         6N0FGtgcPCg8ZTa4A24guAv1hZKNi2Rtn2JUz68C0Dleg2PN9349o8TMZVcPfJeGCtZv
         8oOgtxDY7czsV0v4hJizQsIETEuntXaZLYiC/QwXJq7dkztgGihOxEbwgOl8gqLUPA3m
         t84te9t5mER8XHLYQVKrFd+rjUxz39q6QOX30zL8SsRn2FvNe2wNqWgL37ftISmKBELl
         5wItD6Xo2cBHrKK7btxilEznF+qr9i37Y2UsnlLX7K6zZxrefhhIMKGbI+R9SlGqlgrk
         PnVQ==
X-Gm-Message-State: AOAM532UsBIYyidzl3I8g6mnULDV8Urvy5HaB9vpa5mij8QpwDZ+rAk4
	Q7t03W0HWUm+zpcUCacTEIQTZxB7r7Y=
X-Google-Smtp-Source: ABdhPJyChvJY7gKsKKOZ72Fe4m5uULwtQwIwSPrcSfYvEt2QrQF47jjFB8v8G/sGlkfLRl3kqNo8qg==
X-Received: by 2002:a17:906:add7:: with SMTP id lb23mr2805225ejb.335.1598214065606;
        Sun, 23 Aug 2020 13:21:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/37] bison: upgrade 3.6.4 -> 3.7.1
Date: Sun, 23 Aug 2020 22:19:55 +0200
Message-Id: <20200823202031.24686-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.6.4.bb => bison_3.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.6.4.bb => bison_3.7.1.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.6.4.bb b/meta/recipes-devtools/bison/bison_3.7.1.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.6.4.bb
rename to meta/recipes-devtools/bison/bison_3.7.1.bb
index f3d4d42442..a765a2380d 100644
--- a/meta/recipes-devtools/bison/bison_3.6.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
            "
-SRC_URI[sha256sum] = "8b13473b31ca7fcf65e5e8a74224368ffd5df19275602a9c9567ba393f18577d"
+SRC_URI[sha256sum] = "55c215521a13982a9bee68cd42eed51a65713f96c530a739a57de4438ac1bb69"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.28.0

