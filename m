Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.24486.1611511687552979218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hML89bWG;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d16so9354293wro.11
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L04Y7ZDjXNgMGiGEL4S3GDodq5q/M5rw6LKbJrwhvpI=;
        b=hML89bWGAXLiZ6fP5e+dzESUpdkFv2a2NHCgIv/OScV5IaBCIQxlpCsd6dk3/XIGTM
         RosC2S+aiqG4PS5Eqm3LJ0TVpE9w1hS0+ZO1jWNzF6RMlt1mauZb7jJnsIkKHAwsIB3R
         4EhWtKiBhtGhBGBCbOyZMMQhwRINns986ux5t9+w0UQNieQ9sBi5mkeHwOS6YyckuqrE
         1s+cxBbVymtYhrvYo5t/I+tZMlXoJGY6tSAdLmVNHHX2DI6y0Uq8gLsKXyqWPbMa1cNN
         QLW2hHZOWBe/lIn1uISMZSKtYH/ThdS6EqucOvYQ2ocY1kMVqf4+wgCihIBeGoLObEcs
         i3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L04Y7ZDjXNgMGiGEL4S3GDodq5q/M5rw6LKbJrwhvpI=;
        b=gzoV65qc9lQR/3ptbccKwrsTnERXgsG5ryF+1wls4Il2BD9mAr37gINupyDdrz0p6I
         fVQ29UBukaTQDhWbqkubeqIIyPb+b7SIsXRi7obpCsI8qAroYVk7S1hJTzJWF19Mg3Bi
         OSU/D35YKdBObCOGiHtcA6WA2f7Cc4edSAN2q8jf4o3Jkam+lCZtGyVrMCIjHQxfb34g
         /FuQF7hcQ7yGcGyith0ygrGzc4yVYTE0MuTVED9o+IKvenvb3FBros/SY72EQCA7z43z
         K3CjH/Xg79fsHRFsJtFTJXScCTQ6GpYdVW0BJQVmoWlxCq6e6z2ZGSdBJQGQm/zxf8X+
         iD8g==
X-Gm-Message-State: AOAM532gkOGpnvzXIxMdMOWK9I7c9swt2NeONF7tPqani40JXIF4Eb7T
	5x2VVBX40MhWAmK8crdwzC0gThs2z4F0dg==
X-Google-Smtp-Source: ABdhPJyAhnHH6399sSbZu7qdVd3MOSAW79TDsK/fQV7uQBD0K08DNK8bZMT3jnh8OSPQ3UmGkaNcgw==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr13454547wrd.134.1611511686096;
        Sun, 24 Jan 2021 10:08:06 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id e4sm7554101wrw.96.2021.01.24.10.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:08:05 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 1/4] glslang: upgrade 8.13.3743 -> 11.1.0
Date: Sun, 24 Jan 2021 18:07:55 +0000
Message-Id: <20210124180758.1610301-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Add additional licenses

- [1] BSD-2-Clause & MIT & Apache-2.0
- [2] GPL-3-with-bison-exception

[1] https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c609289666b60741b8
[2] https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d54e3817a8

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb}   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb} (74%)

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
similarity index 74%
rename from meta/recipes-graphics/glslang/glslang_8.13.3743.bb
rename to meta/recipes-graphics/glslang/glslang_11.1.0.bb
index 2c4f4be5a2..f1cc966b2a 100644
--- a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -5,16 +5,14 @@ of the specifications for these languages. It is open and free for anyone to use
 either from a command line or programmatically."
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "e05cc20ec20a154d94256c744a3837c23719c0f9"
+SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-PV = "8.13.3743+git${SRCPV}"
-
 inherit cmake python3native
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

