Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6880.1611234917945559044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p5530rLK;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id b5so1692592wrr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 05:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFJTHVU0ZL4eiGRT8eVbIoIofRlDaPg14OgnuzlGAk0=;
        b=p5530rLKlJ6vHqUTJjJYkUfYwnktgwtTqRRDgcNzfkkQeLWnNd8J4V3MUm22ujUZ7L
         3DYMzeSCc/++HRHfYDvgljrbpIYAJ5EBdY6ZXnllNVG9Jy6MOzWinLL5fbnABv9DmHkk
         gNLziImN21N2c8ML4BYaTUwnGwZNSbPceitTEwcWgx2d0EoR7H3pKH73FT14Mv/98Txy
         IUc5Q9sD8r/wHXvGTqneExHvyvCla4F+VdlFZ9+dcjSxAI5eFpiPOF5Qd0eLe0FzxJvg
         JPfLVvXqDrCHCMukZkVTO0TSm0FTF6CCBWnn7YwiHHK9y4Vx7QBq8LQUuhxpI9u4Q4d4
         gHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFJTHVU0ZL4eiGRT8eVbIoIofRlDaPg14OgnuzlGAk0=;
        b=JIS7ZNJLAphEBbXgnzKex76Mj7aq5vuDYRBfbUjYIfPy4JkzIQKItco+za5Ue6Y7b6
         jnroQXKRjylFUqFeT0QgeMVGbuxp1LDhLVwdXGYCf7EcnoKzNiimTGAkr7ugBxX/8m+9
         nVWz+aqZP4r4SdBAWCn0MdmCJcDN+80qwORcG/wk8svLAetoLI6VQIoY3hs8tceBSwzx
         iDq6JG35Qqi+nEieGamrvRP5S0NCyavOWQ3Bp83EDIG2otREzCsuR+rV1rvU+nYvucny
         Sc7VVIgF9+lLu/0AwQ+fLGnpoMbpqyHlFvhU4wCZs0adqy94+/9BmrTqpE7I5xGeKx+q
         XLyg==
X-Gm-Message-State: AOAM533Pjd3OUhouwFmhYv9C1TUCahLSzj8j2l2kwRc5NWh1sD9uJaBj
	MoxkRF1uWneK3GEn6zJhh6Oxpsewe0pqVg==
X-Google-Smtp-Source: ABdhPJy1po6hUIl9XQyv6qH2d9dTWICBBbXXr3bvbhtCR8O9sCx13rse1/kmS5GWGwTTHULFzl2IdQ==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr14420082wrq.425.1611234916415;
        Thu, 21 Jan 2021 05:15:16 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w8sm8861808wrl.91.2021.01.21.05.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 05:15:15 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] glslang: upgrade 8.13.3743 -> 11.1.0
Date: Thu, 21 Jan 2021 13:15:20 +0000
Message-Id: <20210121131520.608546-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: add BSD-2-Clause & MIT & Apache-2.0 & GPLv2

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb} (75%)

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
similarity index 75%
rename from meta/recipes-graphics/glslang/glslang_8.13.3743.bb
rename to meta/recipes-graphics/glslang/glslang_11.1.0.bb
index 2c4f4be5a2..1afa46954c 100644
--- a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -5,15 +5,15 @@ of the specifications for these languages. It is open and free for anyone to use
 either from a command line or programmatically."
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "e05cc20ec20a154d94256c744a3837c23719c0f9"
+SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-PV = "8.13.3743+git${SRCPV}"
+PV = "11.1.0"
 
 inherit cmake python3native
 
-- 
2.30.0

