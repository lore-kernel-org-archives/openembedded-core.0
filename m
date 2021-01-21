Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.480.1611242807063655430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 07:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YRg73A5m;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id a1so2139664wrq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 07:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KvN4OKt1nD37rFx00RAWzZ28KSoxe2cUlnWb1hHYm+8=;
        b=YRg73A5mlHWMw9xgmlkMlluLX0rKeF4UqU+zjN3Xl2nP6dVqdy4lMzDic+4qrT84DT
         eMSWedpShrOXnTSrzNAptKdVBSdbEJHeJL+AG+Hdxndrz76elH2rBkZk4lj8Pe1a0mgp
         9AfnKfCmn6Ub/D8XVqr8MdknTByVXwhg0Gukk4rCur+oVb/I4p5YdGD76qPEAq3fUH4O
         8r90f4mT7Jf13Ya/w3wz2ISD0uT271yU6xw1SSGlZF0CzpFgVa4mYretk0MR+Ms+5Uq6
         tAEJ0hY4w37evyTQcFvILWgs3X0RR+l9177fRIZZ6TcXp3yPfNvwX4x98fU5p4H3qg3/
         IwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KvN4OKt1nD37rFx00RAWzZ28KSoxe2cUlnWb1hHYm+8=;
        b=r+ASDhzqA/4F2kG/RY4ffbVm6HiAtNh0wwDdE3K37r2AO8+oY9tROmR4/s6GmAyiru
         xkTqDSw+0KVV+dMyh3rPvMMaRk/wFJkZive1is6m6MirC32lbRjbpMLJ960holxuOJAq
         wuFilqNL4kfHM6cDSXP8e8EJkxoeV3bVMmpKoLd82Zp8lRhajGKi3CUbvSuqd/hZiQ+Z
         ojxFLkyEPs9YbGEYJ56kGCWKSVkLm1OnMkjYmzDoI6Q3oc+Cjc0DbPqJrEMOlIl0/aiL
         ajeQnPNmwHNcGmZXKCJQj/5UzfOiKaAKznS3oB3C+TU5Q8i9DEWbUBldHPAhgyAo9b/t
         DWdQ==
X-Gm-Message-State: AOAM531bk3aE+HtOLlN23XoKghq05wE7XTvCb2OdZ1S1WY6q6EhfYUIJ
	jWcm6/o5/cNioWU3dVD+P+Tmz1BdKq5Wsw==
X-Google-Smtp-Source: ABdhPJw7z7i1Q2xdwC20CeGyGcloLN4ZM+0niP3t4VBwlDUlwbkeY9QFphgSZYr3dLkpXtHepRd/cQ==
X-Received: by 2002:a5d:4112:: with SMTP id l18mr8789wrp.116.1611242805445;
        Thu, 21 Jan 2021 07:26:45 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z184sm9186711wmg.7.2021.01.21.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 07:26:44 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] glslang: upgrade 8.13.3743 -> 11.1.0
Date: Thu, 21 Jan 2021 15:26:50 +0000
Message-Id: <20210121152650.618875-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Add additional licenses

- [1] BSD-2-Clause & MIT & Apache-2.0
- [2] GPL-2-with-bison-exception

[1] https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c609289666b60741b8
[2] https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d54e3817a8

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

