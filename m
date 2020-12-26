Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.19192.1608974887422457131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iC70okiJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id g24so5546167edw.9
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ayRozqa5cIFaTUcbXV7fYaYBiLiiIiLNKL/Zimkd1I=;
        b=iC70okiJUz4peVSRvyt3qdxuQffyfDAlRMIwprXmlChJsNYF4Lzchtrm3VTasibvZ/
         hQvEuzyUvKnjaAf94Jun03mJMyIqe5igGs8KuMIXSGomXiuUzX9kEpaim+VRJJ+q2dpy
         X1TvPvhpfWBg0AZqv/0fJDb3pl0L54v2rwZE9Yk7W6kIByKkh/iWwsi4oZ9BSdc040cD
         OmkXj45ct6bZHWzNuVRY97VZe9WDduwJTUcZxVkD+HtBVddGyksGGTfzsfQldGJgWTQg
         ymjvhlalJ0XXjqpMP0txURv2CR1I0Ns9OEaixm2fV5bJbU+GXmftRMUf+DtBW6iVBGe/
         PZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ayRozqa5cIFaTUcbXV7fYaYBiLiiIiLNKL/Zimkd1I=;
        b=WLkbG+LsXRQFWeJV4FAnXjxBVfDlwhNrp3z3toT8rzKQjMHKRE/tylLY2ADrq/324W
         oMzaT3q4ZMG4s3cf65MmmhMvwRTgpxC/na1yeUvcN5BdZc4ttB9rycTD7Y2HaAMwLJsc
         lC86+areXghgPGNTxd0+DOwtyWRTY5i0xhXEHTez9DojqUNKcZcS/ssMR/BsdvmfRBMB
         L6VmcBfAyFJNlEJ0VkHGCYG0qSQ+7muWBoIFxWDMcNAJUzJKm/9jgttA4mRKgWd+KTdD
         ws/pNdVuv+R6dGhP2SJeldvpQgalG0s28n0U4D2CMbsX/+HGxLXNUkeAP3DCwkYLULo/
         1bjg==
X-Gm-Message-State: AOAM533qCF7szKK2FseHyuavZMEe3spvswLumwJokV1OCyXedz9iYPZm
	AtHnJjoxAoHzUxVNlrSK/BfK5FyMSQ8=
X-Google-Smtp-Source: ABdhPJzNoOK2SvBXCmDRJDXM1jjmMsufDDIwXnmEqAtRUOwwrNYGsNAZr66N2zOCdjfgbKW1PAYM/A==
X-Received: by 2002:a05:6402:1597:: with SMTP id c23mr35086166edv.212.1608974886052;
        Sat, 26 Dec 2020 01:28:06 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:05 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/48] vala: upgrade 0.50.1 -> 0.50.2
Date: Sat, 26 Dec 2020 10:27:14 +0100
Message-Id: <20201226092732.52323-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.50.1.bb => vala_0.50.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.50.1.bb => vala_0.50.2.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.50.1.bb b/meta/recipes-devtools/vala/vala_0.50.2.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.50.1.bb
rename to meta/recipes-devtools/vala/vala_0.50.2.bb
index cca7eef523..b5913fca8b 100644
--- a/meta/recipes-devtools/vala/vala_0.50.1.bb
+++ b/meta/recipes-devtools/vala/vala_0.50.2.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "958d9f06c9c3d7d1b2145512a9bc2a7c6aefbbf0416a04c7a0ecf463f7138f6c"
+SRC_URI[sha256sum] = "2c0d5dc6d65d070f724063075424c403765ab7935c9e6fbcb84981b94d07ceda"
-- 
2.29.2

