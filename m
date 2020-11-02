Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web08.1144.1604335764092788071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j8KpwDKW;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id e18so3869518edy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Thb8WU5ZPtDiZwNHWNvr4myGdHNJvez39ndBtupo7Ew=;
        b=j8KpwDKWiBeshwnjyNmxPZFugnuxGI2xG95VjCHb8c0Q9+P+lu2n11niRt3l60perO
         Cm+kLnAakk+VfUjX36vFkqciNO6Rvz+SnpoLw6dKW/5NTzoHya+Sbqwz7ca0eAPwfuTD
         X8K9e+OlZeZv0wCX99I9muyMnG4M7LkxFk3Pi6u2LGMnrZnG290k7T/Ib1v3MHvOzgOx
         0E/HsJEMYZfefL6Rbh5+r9Xs331OX1sEEQmPiaklsFRadxzxqaTaCH+3S1HrBn2hYdqm
         3ttJsiBeY6MaBylf2/exKBitzZRUL5v73uivyABn8T0T7GcfxzNW7hyzzM7LCxYS1MXK
         rEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Thb8WU5ZPtDiZwNHWNvr4myGdHNJvez39ndBtupo7Ew=;
        b=gWJeyE58qiop9JxbLwQ9E0wHzapamY9emEHW41/7fkOY2Y3srsIOGjaVj+ugSdMOb8
         y45iyQ2GSXNS4Kgb51m4S4bs9ZSMYeDmcsrk1b2rY9jXTQ2qnHW0IhpOWFxYPCzNDO5T
         k1eK9w454yP6RanvX9uyP/s3dNmNKMqW5l4YWYqqjIN5XzjnDaB/QHoeWVKoQ+6D1EdT
         b7OttL01XOjFzEb3A4ZL/GBymXGjMiw8Bo4RjC7+L8pb0IOJnas8mnojiouVXR8bqNIi
         YBgFaRknJnNa+Ky+PMXToS/xr61PZpON5+qnDq2HjcrDcS9Y7VrBsI5o2d323yQYpS6Y
         okyQ==
X-Gm-Message-State: AOAM532iyV9h8mphoefNbxHUFSfNh5GeQclWQ8w5k3xbMJ9UOwHY6Wng
	0hhpvlqFweRfphJ6e+xTagfO89SgfX2asw==
X-Google-Smtp-Source: ABdhPJxnfc2SRYGNYAULUw8PwBEg+hPMgto8aqsoz+oBsNxpJXswxTmzs42GOv6FMYJV0D4rKltcsQ==
X-Received: by 2002:a50:ed90:: with SMTP id h16mr16796072edr.255.1604335762392;
        Mon, 02 Nov 2020 08:49:22 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:21 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/80] glslang: bump to a newer commit
Date: Mon,  2 Nov 2020 17:47:52 +0100
Message-Id: <20201102164907.27572-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed to support the latest release of shaderc.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/glslang/glslang_8.13.3743.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb b/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
index ddb90d89f2..2c4f4be5a2 100644
--- a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
+++ b/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
@@ -8,11 +8,13 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
 
-SRCREV = "bcf6a2430e99e8fc24f9f266e99316905e6d5134"
+SRCREV = "e05cc20ec20a154d94256c744a3837c23719c0f9"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
+PV = "8.13.3743+git${SRCPV}"
+
 inherit cmake python3native
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.0

