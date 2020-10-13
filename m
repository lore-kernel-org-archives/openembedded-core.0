Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.843.1602610541277319363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=axEgjLCi;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id y12so283499wrp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kJ8l7bPBQAvtne1NHYfcA+MEneKgFFnGzTTUWgrNyeM=;
        b=axEgjLCifWNrWVXfkf0LdRz3ti0AMApfAB7KN4TOOnmc5Tj9KtEoHG7ipZ5c33Gy0I
         g/z7ffGM8zrXt2F5EMgHrYJJ3gu82BICJ5gEaYzF5KpdV7H+ByeZootTuh68qyI+LRr7
         1TMZTRA4w1jorcYiwp1qjiKNj4jNTkf/Jd6BlEIihPqojt8DfvNiE/M9SVXv9nXjdlzt
         ZVu9qepfzQCxbHaKdW83b8z1cdcOeECbqhk0Wj7J7sKkPflDO4brF63gtDVQt9SGyUBi
         HB5YhgNy8ec2A0pyf/H+FrMKGRj19Ou5M8ztpmsrCnJAdFe7g1SvyjSI+2lzEVU+IKQv
         OnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJ8l7bPBQAvtne1NHYfcA+MEneKgFFnGzTTUWgrNyeM=;
        b=lj6wp7unOFaMmmOp0YRZEEPQJzjFAEv/FcxkbvjDf9wLFwLNts7w/GpBIY0A7ExfS4
         VU50biChrRx9AeJBy7F4GdYBZTlXmKODftuMdwH75ClfsF8hhKpB2dA5xUHhge3gQV5Z
         vOIFFt6b3Z36BmH0xBaaJimaOPlBLoXjXHiqgK6ZU0JKMdLFGvE0pm+hn5mz+qGbVgsN
         bPS6JRVXIUyfpl3qcMTMQMzITK/ZJz4DDQrTJWXXbp1TGfpBBIfdVVO/I8zKWi1tiwkG
         RRqThZNFR8n0UVd0k5DVVemxSBVsiey/xNeYluufH4hTGkUZXxmZmXmA4sC7EGFOSQ4e
         JlLg==
X-Gm-Message-State: AOAM533mJy/6jhufDfIpSl/9BY2gLqLyYOq40sZHt4IJPPNmb35xkJFJ
	ImhvxrZoFWB7rtIffc7b6wDOXSIr7WFcIw==
X-Google-Smtp-Source: ABdhPJygIeD5UcouPrC1Md4NoQz1+twmTlJ2stJ5YhU5HBFasl4T8fRFqHzD1WryKoWrlrJOJ6m2fA==
X-Received: by 2002:adf:cd82:: with SMTP id q2mr938335wrj.118.1602610539577;
        Tue, 13 Oct 2020 10:35:39 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w1sm297412wrp.95.2020.10.13.10.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:35:39 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/5] glslang: add receipe
Date: Tue, 13 Oct 2020 18:35:00 +0100
Message-Id: <20201013173502.2245733-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013173502.2245733-1-quaresma.jose@gmail.com>
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Glslang is the official reference compiler front end for the
OpenGL ES and OpenGL shading languages. It implements a strict interpretation
of the specifications for these languages. It is open and free for anyone to use,
either from a command line or programmatically.

This receipe is needed to build the new shaderc

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/glslang_8.13.3559.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-graphics/glslang/glslang_8.13.3559.bb

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
new file mode 100644
index 0000000000..2008ba59d8
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
@@ -0,0 +1,19 @@
+SUMMARY = "OpenGL / OpenGL ES Reference Compiler"
+DESCRIPTION = "Glslang is the official reference compiler front end for the \
+OpenGL ES and OpenGL shading languages. It implements a strict interpretation \
+of the specifications for these languages. It is open and free for anyone to use, \
+either from a command line or programmatically."
+SECTION = "graphics"
+HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
+
+SRC_URI = "https://github.com/KhronosGroup/glslang/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "cb32322377cee2bc1cee5b60ebe46133"
+SRC_URI[sha256sum] = "c58fdcf7e00943ba10f9ae565b2725ec9d5be7dab7c8e82cac72fcaa83c652ca"
+
+inherit cmake python3native
+
+EXTRA_OECMAKE = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

