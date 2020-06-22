Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.448.1592848909476070650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MHNEslnw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id e5so13782400ote.11
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bYIMbp2Te9qajjqyJxKpP+x4XXqy7V2WU5C/YdYmYMQ=;
        b=MHNEslnwmHZh66zWPZP9V3TmuBKNa9W5AKka8ZyCNXwYcbW22Qv2DpzmkWzLHnx186
         IqwaORfRTFkRF3mz1oJErBLFWKRW1Sj8VwYbyl+dklUdaqfz9kRGzxSjhJewZQ7vJ9C6
         odxuybBF0rlda6v0p6+tMpKzJ0cJ1RYhbKFmnuUzZBOFWcpbFrH5YJ4tqzFI4AqKfu8p
         wiHJKdCZpeALzB1Wz/Eue7PWv+zN1Uj2BsCYpvelmWAQzyoMfAAoVCgriGK4TtamjGBN
         HS/X30X0iuLxAGLM6GtKVm1LRvqPdkdtoCydnVr+iAlYeUv8fOWH+4fkobC6DQT5Ah0S
         9PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bYIMbp2Te9qajjqyJxKpP+x4XXqy7V2WU5C/YdYmYMQ=;
        b=DTrAWcsZp0Pw3DDwgtE/eESBjL7vb+cH2e8376iffBrmZUMLn8gCi9KaEvA8e7TKNS
         mFxE8GlhW1dNvJ/sLZsOxRMvJWVGhViClEN9Mx8qCFhcyQlqM+Bcac5zyUoznMINtvWG
         yqFcpnd6AqVgCxRr0GEo2fMhQsOrJAsx3Pp1RCrDbAwmaIhngIm5dHT203A+oMs2bntR
         RzS8eM/JjFVOA9sYjHJupoZhrzXo/v4r+JOiDSqwj1aeHiLXShQWMYwUz5woj6zQTEK+
         nN/ZdoN7ehyvbj8tVwQ8CuXhN3cKdCrWQhm1/ERSxmJUcP6WG0LzQviihHyWCZ3SFyyR
         aYcw==
X-Gm-Message-State: AOAM530R2TuVmbhSjLEfjp60FUrbZ90qEU0uZRNfDLuQC7cSqqyQpCMf
	eLJWONSdoOHj7H6G3nUwqEQtm+GFBFRB6Q==
X-Google-Smtp-Source: ABdhPJx0x0qzvnEwSTILaP+DKhCAdpTaRKxY6Y8lVRrJwQDaeyZ//vYZ+aPWkwQI1jEdlXNq9XkeHQ==
X-Received: by 2002:a05:6830:1657:: with SMTP id h23mr15620851otr.339.1592848908297;
        Mon, 22 Jun 2020 11:01:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/33] go.bbclass: Add `-trimpath` to default build flags
Date: Mon, 22 Jun 2020 07:58:22 -1000
Message-Id: <a7c0c2a6cbdf89d72c070964388a7d49ad9c01bf.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Otavio Salvador <otavio.salvador@gmail.com>

The `-trimpath` option is important for reproducible builds so full
build paths and module paths are not embedded.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e3df027b3697b6a92b417bba8d442a5bd15525fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index c99689ac59..a9e31b50ea 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -41,7 +41,7 @@ GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS
 GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
 GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
-export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
+export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
 export GOPTESTFLAGS ?= ""
-- 
2.17.1

