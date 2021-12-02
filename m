Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F93C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 22:06:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3754.1638482778164035104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 14:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g52FueBF;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id a18so1644582wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YBzX2P09L6cgCi4kIrrWcxBsOsOW3oZ1Fi6t0Bs5mtQ=;
        b=g52FueBFuWYZ/ujnvQy+iBxuBIUSCdwpfoEdSOqJnqUln9P2o064IjiY4V8mOr+/4f
         n5plLNKjxf9VzPlx5y3zIdTqXkbT+xDFaP8lAlG/3c0/d9CImd9AGSegVXXMmxZryEoc
         r+YCujegRayz0uopapb6pVxgiI1tay0XYm0u8+V1eug732bKj069yKbg5Lm/x3TlpATg
         xckXkI2NlMTEbsjfFVIOfUm5ensnxc3q4rgw/Z2Du/pEkc8XO313YKbbYyEHOhOpE2w1
         8KzMQxRu+ivwVM8AD7YXlv4kav/v5K44lDuU05t3VC9bKOwMe7WeTxMLBk3KfY0l3LRZ
         7w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YBzX2P09L6cgCi4kIrrWcxBsOsOW3oZ1Fi6t0Bs5mtQ=;
        b=8GQqbJ9ZeItTpK5tWaYpXTDHezPVdqIJGd4Fj6YGTOb0aXCeNQQCH9xksiZGmzCx3w
         eQVr/3ah8ifEygYWrPB1IHbK0Sty7lufaT1MRT6gRytei5LfLW9Knch9ttK9vHJNty/h
         d3yyRScNCq/wM+t/fEna4RZmPfys37zi2hdR2tiKZwB9D2C9W69kMkiBxvWdHU8uDvJI
         oX2UcDCBn6gbK31rG71uveYiabdJ7amnUaWsp87YTbpCqFhtJcufyTP4qOwweAbV39VW
         tBau1n8tlAhBczya7/fgG9dB6quQB1GjOPI56Jea91RAC4LGyH2i1/NrajfgCxp28nOK
         7Sng==
X-Gm-Message-State: AOAM533ylcSliweHDYkVCbr64wIwAdi9ZwyKB+1awz8KDxT7f/igwpor
	7qF5nEqyTNq9MjOqE51puxcpMtoe0uc=
X-Google-Smtp-Source: 
 ABdhPJxVf9fiNYxH7D5+3YLmyO/wsirLgRC9XRTxeIr9werMYts/nytZczvGQowMmrnOfgf5P93oRA==
X-Received: by 2002:a5d:4ecd:: with SMTP id
 s13mr16887258wrv.400.1638482776301;
        Thu, 02 Dec 2021 14:06:16 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 i15sm3872863wmq.18.2021.12.02.14.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:06:15 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] glslang: upgrade 11.7.0 -> 11.7.1
Date: Thu,  2 Dec 2021 22:06:09 +0000
Message-Id: <20211202220609.2106991-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 22:06:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159108

changelog:
1f8c8b88 Revert port of GL_EXT_shader_realtime_clock to GL_EXT_spirv_intrinsics

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/{glslang_11.7.0.bb => glslang_11.7.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_11.7.0.bb => glslang_11.7.1.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.7.0.bb b/meta/recipes-graphics/glslang/glslang_11.7.1.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_11.7.0.bb
rename to meta/recipes-graphics/glslang/glslang_11.7.1.bb
index 0b4bf21bca..30d9954ea5 100644
--- a/meta/recipes-graphics/glslang/glslang_11.7.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.7.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "925503088e2bcd76921b1e102c37fc320bace254"
+SRCREV = "c9706bdda0ac22b9856f1aa8261e5b9e15cd20c5"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.34.1


