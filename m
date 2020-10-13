Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.9298.1602632738435030649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6ARTstN;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id e23so514323wme.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 16:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HB8zWOaadhlFTOCd3guG2mLHGHlm/atmgZUConlG/mo=;
        b=u6ARTstNjs943I3fF68ynrwAFw2DcFYGsWfX0kTtvCYCUh0j5P4xo6biH+flyAd9LR
         lsFTw3Cgh6Wl8mOovpZnf7psqwHUEqwGVRggq/ezl4YKIRtzNmnX9cRPuh9YWAyaKDkL
         OdmBdG9DaQXWkex2Boq3McxhMQ0yiioYgfA5B41JZGXY6xTcGx2G8RjcZev3kl8Kpzvb
         mVtqmbQctustMdtqexi2h+WFxOisWVFnD9HQImY9/iGJiuICQM2WjMGyUuTAC3DBcOkE
         +39SjHD3LPxIXgfeE1k50sW3NtYk4dAg2BgcX7/Bc+u3QxXhskVcavyGXw5O3DHU0KB0
         mbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HB8zWOaadhlFTOCd3guG2mLHGHlm/atmgZUConlG/mo=;
        b=SSM8cUsAKi4e3zc8o67qs2ZcM30pA8T5H0y0Lk7ME1bVR4uvOwvxlZDwlThruc7jFW
         ecAkUkZs9cRpH90E7pDvpdaWTSU20fMtjznnaF0o2Fe0hFpx0lXObbEhlu+xGrrMSvF8
         7JHSyqUoxRPwlFpVd1462jVJanl7G0vrEdgej+wJE7Bqtg51ERxX45h8oNHXDMYak8BG
         ggVDlCCOUAU/ulX0pPpE3RTfq7/VNyTTRg0YFa2rN5+Y44NfHNpWVCn1zAIzjehSdndz
         BmuJOLFB+K273Z2qGcuThw98KI2XVaBDOLPZohcE4wGd9fG3G9YrQb/I1oFCr8w/E5tN
         4YEA==
X-Gm-Message-State: AOAM533emkWm5Zon10ndqi/13NbhQF3DKsG83aVXZHInmZxXIpoc9CLx
	SFts988RGTeh9dPJhGoZbWbVEmVXSoai5nnU
X-Google-Smtp-Source: ABdhPJwG8f97F/f975vY2CJO6d6WGanWMQNSl588HsxZwmdvsIHnH4kd+AVFD0X0plAdU5sFH+aEcQ==
X-Received: by 2002:a1c:3cc3:: with SMTP id j186mr634402wma.155.1602632736803;
        Tue, 13 Oct 2020 16:45:36 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o184sm747718wmo.37.2020.10.13.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:45:36 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 3/4] glslang: add receipe
Date: Wed, 14 Oct 2020 00:44:51 +0100
Message-Id: <20201013234452.2294860-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013234452.2294860-1-quaresma.jose@gmail.com>
References: <20201013234452.2294860-1-quaresma.jose@gmail.com>
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

