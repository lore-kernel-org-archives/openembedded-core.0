Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.14170.1602945011824706249
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 07:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qH1jsQAX;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id h5so6624507wrv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HB8zWOaadhlFTOCd3guG2mLHGHlm/atmgZUConlG/mo=;
        b=qH1jsQAX050pBWUceUVMeZMlWl0PIrHmG43J4eB3rNKumSR3KK8bz5sOivgrpItpaF
         0vpQpmWVD8NckrNWCWowRNHc645i2rCJkd0bY+XpU6t7R2mecdm+eZ/mG0uBVdDuxKEG
         GjpfQDwVCWCm64OqOhgdKEuuhtPT8Slc5nXCNJ1m33M1qR+Jgf3m+9m27ik6priqQcQe
         3X18aiyl0wBSez1EYi70MOjQJwRD08X2Ad/sOwLX/RSZsdLLpA2h8mPap1CMakwdK/UT
         Rze7pcXOGcsqkGwazkM/Fe6gkEZfVSmqF29wjy2bCp71dFBGctZ7hh8Ffiu4troZ7Dco
         5YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HB8zWOaadhlFTOCd3guG2mLHGHlm/atmgZUConlG/mo=;
        b=KapnVbCF/UQr1QiNgP7bFAjg/7ZYqgG1MGn2H6bhz+GS6/AbNBhrlsAHGTzMlY3L8P
         S33XtZ6NjtCAcyyVzrWL5YXGzcYdRFNe98aIIW6gQffm6B7q3wDNd/Qmx2fxUXYzxEIA
         WKCBmv5gl+iWfRZax1Xn4Q6esurN1FvdvRGEUT1ZJTxODz5IMIaPiTBTh7MiAZZwE7OR
         NwDFenL2moKoFi0ozZL4WRP0SrR/hN0FNBc+6x7pyn7pInaN14Z6APNxktDQZHdniMHJ
         crB/P3DZgUOslA5GQJ3Nh+vyf/3+DCJL2RAg+jWfD79JsG7W3ERwk8zAoguszrooMCzR
         nvXg==
X-Gm-Message-State: AOAM530mFNYt6BIl1mLPbbPN7En1qCMj0qXX3Iy/ud4Mg/ANMMCzVdOR
	52ifTcZBx/syKPc1Vyb5TZboM6EEjXUo5Q==
X-Google-Smtp-Source: ABdhPJzeim1CHmP7ZupkkFnj4KAakHR8B21iU5ikO7gWFNBDfqK1FJCVT7ie6NhMgcawCDfvG0oiaA==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr10688273wrx.246.1602945009834;
        Sat, 17 Oct 2020 07:30:09 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id c18sm8816700wrq.5.2020.10.17.07.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:30:09 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 3/5] glslang: add receipe
Date: Sat, 17 Oct 2020 15:29:33 +0100
Message-Id: <20201017142935.3605756-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017142935.3605756-1-quaresma.jose@gmail.com>
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
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
2.28.0

