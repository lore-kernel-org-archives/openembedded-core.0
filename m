Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web08.11250.1603712357156723914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GX8+L228;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id h5so12018498wrv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FeGTMEMZUjeka8S+N+AA9G7cKmoHLfyj7yoDCfqsP3Q=;
        b=GX8+L228jKXUWX2vQlGJx0UPj74WbSKtV3xfvtn+qyVu7oW/2MXtF2mdCAwQJsbyME
         NmvK7g78Z9GkbdUNebyI8PTF4X5d9SoQfsyay8ou4SQx80FaI3IelTU43v+OzAauODyE
         Zg+fjz4tmmPdHz4pgijcLXxiVwxp8rYyg9trERGRHf+hagU6BM8Ugk0QgPo7qEWP/F2B
         nAe3UHxdspzIf/Q3Fzt5jIcN+tygSV2a68qM6SybFbRTJTqJpDSWR+9SWLi7nWErh3FC
         En7a73hPTRsw1ssHilC0/tyMuhlwv9AnyqNQts0nik9lgd7gFYzbD+TBNxVpeoAmpQTC
         x7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FeGTMEMZUjeka8S+N+AA9G7cKmoHLfyj7yoDCfqsP3Q=;
        b=asP8FgvZQUf7r7+jNuv6tzGVD6cTeD/ZBkFkNPIS2FzrtSMSEl9u5K1Z5Z/RkmBvr+
         rUbaw4QO+AH4T1+SLSfEheW52J83mN6MHeg3P7uDTeSZB2xrUGh6oEGlQypgq3lWDtPg
         KGVryUEisBMET/3zGD7Sd4rZ3FHweXDOY+I+7C3frgwAR8n8Y7XDlLwQnbNVrKlFfd6t
         PxrHYfFyt0ttf/IXtYtRkfq4AuSfIma8NLqqTWvEDQO1sNtQEgIQE/2gCYaHHh45ylBq
         +h/iw9BZehcB2I0Y3jaiTLRdT0lWs4ZnJ319d9qq3X+Mm3BdV6weOb6KqKmqTWqTdaJX
         jv0g==
X-Gm-Message-State: AOAM532hPAuUemD2+syyoHt3JPgSqPAuorJ6cJVUrbOn1KsktiM/KG9h
	/LwMcR7KWJ8/J2L3J++haTLpbgcBDUohV5F0
X-Google-Smtp-Source: ABdhPJwBJPtSz+UtlkgNq96ng5VSrpSjARCox4Zr/qqoqBKkn/1PtpqE5DJufCPwzTXI1ofWuA3u5w==
X-Received: by 2002:adf:b30c:: with SMTP id j12mr17078634wrd.82.1603712355457;
        Mon, 26 Oct 2020 04:39:15 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id d129sm20348493wmf.19.2020.10.26.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 04:39:14 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 3/6] glslang: add receipe
Date: Mon, 26 Oct 2020 11:39:03 +0000
Message-Id: <20201026113906.2217226-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201026113906.2217226-1-quaresma.jose@gmail.com>
References: <20201026113906.2217226-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Glslang is the official reference compiler front end for the
OpenGL ES and OpenGL shading languages. It implements a strict interpretation
of the specifications for these languages. It is open and free for anyone to use,
either from a command line or programmatically.

This receipe is needed to build the new shaderc

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/glslang_8.13.3559.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-graphics/glslang/glslang_8.13.3559.bb

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
new file mode 100644
index 0000000000..6d92513bd9
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
@@ -0,0 +1,17 @@
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
+SRCREV = "8db9eccc0baf30c9d22c496ab28db0fe1e4e97c5"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
+S = "${WORKDIR}/git"
+
+inherit cmake python3native
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.0

