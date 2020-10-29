Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.3074.1604001815771810043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 13:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BLRId/dG;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id p22so967618wmg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/rwKdh0nywB1NBXTQulj63w4O9apRfQmv0okmRSZd8=;
        b=BLRId/dGa2dfzYcVy3s3fhSgOy33m4NCuL2FQ9V8lDn+QbePVAL61GjLO0u8DGXkBV
         D3yRxnEnCVAClBAVM+anUqfS/Zyxzis/nEdZtMNp2Z3VTUHni6Um9bMJgzMy8waxfB8G
         wFMY8nOQESS6NbyRN0IeFXWtMDeRaPHVsAppNG7D08XysGdAABhSKoO+4OK2tL3MVV6i
         vAamjnCrqZIOPHoMaOJvAPi4FJump19GFWEf4evKruwOUwfKbgpV69SlzGuXU7O0Ifks
         8/av34PDXpW9lbLJe+6hmb7bwCY0yKWHYSJMvpokDvz47ymuOOTOnOkOmcoLQ522Xp7H
         bLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/rwKdh0nywB1NBXTQulj63w4O9apRfQmv0okmRSZd8=;
        b=JGpnAviHgFLKVV+qG0hwsJXH3LCCK6D2FV8AK9640Rl86hXBg0CzrjXVnBgkLmlxU/
         GRMmXJWkUSasSbK+y3s+xViruJFewpavk6jBvEodBpnTZsA3ns1pyJ/PIWlghAa7jVA2
         XVNV1cWI01C8y6WXlp1IUL5yPKRernNTj1XoZ5oYh/EL4PDyBlamznGaJN4ajXCxpDC/
         vXTR9qCm6WaoqOaXu+da/M6AmnVir07Rhhl/OM0yrBgoxnlGxSH2FpYHSWbvUrzkaUns
         SUkdt32iB30tPMnRs7xtV8X8VxcwA+bYudvurraMMPsX2AmJxLF7bY1g6CPqYavAMes2
         Jvjg==
X-Gm-Message-State: AOAM531BTmHVSLZMUeRIv0K5CHjtZ9n4PHR8PNt65MD2ES7ISI+6EKO1
	izj3wFFHBOxUYtZt/W9rqtg9qnkUCpUDSw==
X-Google-Smtp-Source: ABdhPJz1x3cMbaR4gzGbkh8ItT1tZPr3RCTmh4QcAow/MsIgEv3YRA3kr77nCJPKom/kwdJS4d+A9A==
X-Received: by 2002:a05:600c:21d9:: with SMTP id x25mr541577wmj.145.1604001813583;
        Thu, 29 Oct 2020 13:03:33 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b63sm1519422wme.9.2020.10.29.13.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:03:32 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 3/6] glslang: add receipe
Date: Thu, 29 Oct 2020 20:03:18 +0000
Message-Id: <20201029200321.1886511-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029200321.1886511-1-quaresma.jose@gmail.com>
References: <20201029200321.1886511-1-quaresma.jose@gmail.com>
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
2.29.1

