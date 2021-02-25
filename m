Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.5010.1614213403139320495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=COzoql0Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id l13so3384928wmg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 16:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=edPvHjMN55HLVH1BISZAqCGuffiSqjQvy4tXrKJ7MMo=;
        b=COzoql0Z5BDiKrEpkM3Fd67Vb9m9CEXdxMQOpil0O+dvKxohBE1eIG5+2xK9rjWELd
         AbVdTSTng4Y7qPfRoPQyIGeqrPI0N/NTGWaq8CcdEZe8M2GVm8aRQ9w6fnvTSOkarYKm
         oS+h50jet26WaLxyH/aVVnchV1ScCzbCFeCcQJWaFiTXmSEe4eRJBpVDeFGpuO6Wpvq6
         +PKEoXOZNUzsn9DD6lUcu4+5bB/CWDu6JjVyVpnM4FEftT/LsgaJAQkwx1FJTjKfdkbu
         408SBhiVHeXxG1Ca/STivQ6cND8KQmwwQfnT+d+h749NmRvnUJpcMXPDx1pR9fVt8f3E
         IE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=edPvHjMN55HLVH1BISZAqCGuffiSqjQvy4tXrKJ7MMo=;
        b=SEGIGXc5jWdY+PRutkeFgPHGnrW49vuj944dfCjoH1L7IeeeNQp+Jukw8y0jmA9o0M
         Owp60uo7ps4kFs+nlKqbPrAVNBJRW4HqlzTsEggMgEkTTMdASGunSv/+mm7j6yrAH02T
         8ZEaEcEpjs4geF6NrnnRL4lUAqdKlf0klbK84E7QgmxTIOmn/3KHiGA06eWvnqOaV3G5
         KMvgCegRU1m6N7/mS580v4nRkj/yY0s4AO3ON3He3zAQvVMT5uTTalqDSa47RLlf5xxp
         SY4KmFq9xD8+bmPiwRl+qrjl5BFJ5aAAor+7mtPSxfGA8Al0njDa3AceFFVcuNzkB5/P
         2yWQ==
X-Gm-Message-State: AOAM533dsGElxtQbsGKKLp4COmU8hKzjsHIjw3kD4nD3JxMFuaEhy4Dn
	a5P4ZR3wXeBIRnTJzQ498n4V/akrXvc=
X-Google-Smtp-Source: ABdhPJwtf025QB+hRzZk/79QhF529Bvj27BDnZN+Aw/2YsMzKLEX14E9sRghqNUN/AEyvffU/DTgoA==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr537659wmk.161.1614213401352;
        Wed, 24 Feb 2021 16:36:41 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.99.217])
        by smtp.gmail.com with ESMTPSA id c6sm5892107wrt.26.2021.02.24.16.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 16:36:41 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] gdb-common.inc: add PACKAGECONFIG for debuginfod
Date: Thu, 25 Feb 2021 01:36:30 +0100
Message-Id: <20210225003630.17878-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added PACKAGECONFIG for debuginfod

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index bfb8013d67..ccc911592c 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -36,6 +36,7 @@ PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 # ncurses is already a hard DEPENDS, but would be added here if it weren't
 PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
 
 GDBPROPREFIX = "--program-prefix=''"
 
-- 
2.17.1

