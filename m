Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.4015.1632003281387307901
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 15:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com header.s=20210112 header.b=ZwoZtpmz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id i4so49326048lfv.4
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 15:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YJRQ42rKwjAHuebZwZBpeIKbGaQyquSI4l0JEFLLBdk=;
        b=ZwoZtpmzYtlhnsFtxcmCfGwl7z96fXhisB8M0ahW0kyX40cz2SCq+1yt9m3T/KFPRT
         l+rgyzBLM3iLSwy/LKA2H5yiME3xUdlr6qS+o+JMGojJEj6wpjSvaBwv0k4oHwbB0a6c
         A7O/V9/5e5k8DyskLxqIfUU3UQX62o06sjdK0vQnUHVojIR6FdmA0cDZc+rW+s84NJCE
         0fgR8QK652AcRzhl9LUMERxV/8D6JDuV0ivW42FH+Si0694taFZb0i1ILpjtoFGy6gSZ
         uZZONJr+k/06nO9Eg9VJEg+QGWpF8O0n8WaQ89yOnLaw233n8VZPjoTajQyn2m+CrP4L
         U/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YJRQ42rKwjAHuebZwZBpeIKbGaQyquSI4l0JEFLLBdk=;
        b=QT4AfVCLL7RtfmejF8GhTW1Q8pu3s0mNWkJ2E7YeP6DtsVaCOOkPdbBZ3hs+HTbatG
         /Zvsddjk3KitEQ/p1fK0zzEeBqrHcmpTfuSrZE1YedOsU2kNcxEirJMtn5DBWcM3x7r2
         a5CQf8VRaAD7yXnu4rl2I8ngVv8Plr8eJ20j7x9Fd8YMB5O9D8Ia65LLkLdShyfUVrtA
         CoLCJi2LRE+T6kOKv2jdfEHxa0wNsVgiD5kq0N1B+kBZWnnUX6XgYrJ4m/m0ZOCgpYD0
         ledtJoNwRQqwSdk7RgAdIf4Q1r0i7RwrHD6Nc9EXH8B/Ps6h4r44qvQj2YqXbF8tccbG
         i9ow==
X-Gm-Message-State: AOAM5323HraRtqy+sz1kvG+1Mdbbp1g9JyJPjEmQOkO7JL7BIcW2YHU4
	MWqTF/gJKQf9Z9HbW9hm6Zc/+pJjW5Q1b1gD
X-Google-Smtp-Source: ABdhPJz6U6wmDSPSXez9oM3VBeZ109Lf83Kcp/NPI+X5hJZj1xMqozDCVqSdWgaiTJxKQnq4LIp9Rg==
X-Received: by 2002:a05:651c:b12:: with SMTP id b18mr15692567ljr.512.1632003279382;
        Sat, 18 Sep 2021 15:14:39 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id u27sm617541lfm.38.2021.09.18.15.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 15:14:38 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-git: update to 3.1.24
Date: Sun, 19 Sep 2021 00:14:36 +0200
Message-Id: <20210918221436.2248061-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-git_3.1.20.bb => python3-git_3.1.24.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.20.bb => python3-git_3.1.24.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.20.bb b/meta/recipes-devtools/python/python3-git_3.1.24.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.20.bb
rename to meta/recipes-devtools/python/python3-git_3.1.24.bb
index 2c20d3952f..445c7b0235 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.20.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.24.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "df0e072a200703a65387b0cfdf0466e3bab729c0458cf6b7349d0e9877636519"
+SRC_URI[sha256sum] = "df83fdf5e684fef7c6ee2c02fc68a5ceb7e7e759d08b694088d0cacb4eba59e5"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.25.1

