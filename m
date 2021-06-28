Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.16031.1624907345210533293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 12:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hPhlAEWO;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id m41-20020a05600c3b29b02901dcd3733f24so151949wms.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHB2ykcs6Ssh9Cm0iLOMXlEFYyN7qz26gTQ4VekOs1c=;
        b=hPhlAEWOdXOIKatJLDCJfhrh67p6Z5pjUpwvEf4UtJ5a+82bPSX9JzVKbdgzKo7nb0
         Mzq4NKh9i765GgEov9tY9kvsEArcLdQCWF/qW3IKCLJfo70/aWJb+sciREVeZHwISrBJ
         8lh1zbKHiOvKt4J6eg7V8simVmBp1SoXd9zHJ5mq3MSyhL2O8ab736qGRmbo6AFZbo66
         6GDHVbK/X//mqH6wzq+7I5QAtHZFDZ29T1oIuvrGchPTmOEHWSB1ngeUKBHVYGoMt/yy
         go7yqel29BaS5ozqPWGne4niOAbCaS99R0nMMOh5ZQfGiyeLGPS7nJp/22599b7P/z48
         6ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHB2ykcs6Ssh9Cm0iLOMXlEFYyN7qz26gTQ4VekOs1c=;
        b=HQVJ1Z/HIPxPKGAosguNoC9TnJ3T7pUIapr94W2ipkBtPBJhVggFC2GENzkgaNSaEV
         KgAQRetSoSfyDYr0tNELneDFRdYOP7+0Zb0AUXUPvRVxE6SUr5IGqFYnIJak9BKYQXmA
         uaC9nsLuo1QxX5Zcu0lSfJ91xu4u6gGJ3sodLD3vcllx1tqjvKxHHpFFmMs9U802AH0A
         yzuEs4v+ipd5TM6cWV51kGGh69J8qALYzA3ifd/vn2hF7iLdx2gIKy4OcoZ9e5gn7Hm9
         zfYLQ+a5O+GZXzje0Sqs2Tyg4dc4Q8lbFwNE9wvc0xzvZvtjk26hm87IWi+HpYUFxvTf
         1xBw==
X-Gm-Message-State: AOAM533HP/MuOUsRocTb0Sb/le9eHGU8u3OUPaIko4Pq7e3QqUFowxCu
	jnmjfeyTWSgzUAlPAUSZrtpDiAOMEcbn4w==
X-Google-Smtp-Source: ABdhPJy/HG7M98lu9Dg3KHuu9BCG/gM6M/l7XHOH8eemNI/ukX53CoMPY04Gsjv07opwcMsPceRcNA==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr28143529wmi.69.1624907343036;
        Mon, 28 Jun 2021 12:09:03 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id l12sm16009527wro.32.2021.06.28.12.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 12:09:02 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] glslang: upgrade 11.4.0 -> 11.5.0
Date: Mon, 28 Jun 2021 20:08:54 +0100
Message-Id: <20210628190855.821421-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/{glslang_11.4.0.bb => glslang_11.5.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_11.4.0.bb => glslang_11.5.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.4.0.bb b/meta/recipes-graphics/glslang/glslang_11.5.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_11.4.0.bb
rename to meta/recipes-graphics/glslang/glslang_11.5.0.bb
index fd4cf6d538..e3eaa2ac63 100644
--- a/meta/recipes-graphics/glslang/glslang_11.4.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.5.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "18eef33bd7a4bf5ad8c69f99cb72022608cf6e73"
+SRCREV = "ae2a562936cc8504c9ef2757cceaff163147834f"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.32.0

