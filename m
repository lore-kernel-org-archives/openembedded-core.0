Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.1275.1625540582472440686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 20:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZjaOB27G;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id a6so289300plh.11
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 20:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lj3EErg4KsdV9PHrVob1sWD3VFGHBdHd4QUept9/iiM=;
        b=ZjaOB27Gz95MaxsliUKGKdemw04aeDflqcM0hzyC5UWM0YG3sIyIe3a532zx/e7g1b
         jc7OPpbDW/l+EX5Blbzqa4GsQZGU28TxKQ7fZxbSzd4rsxXwVFPP5kBGhhklabB6oxMZ
         RDjwsmMdz+3lVK5xjbgcuxeZj7/hoHz/mI0m7eMlgHcrsre6A5yzqJyKVAf8mlMFPaJV
         qE4/G/Cb2VkEVrOt9dGnZhjun/Cd3hAbLmwmoFZcnF7NJSolnqI/wQI+ru0bD13HOdEw
         N/fCVbhYibgqEtU/r6iHjAmZjxKj6xhp0R+Bhlfwq1bElNgMAbrzE8Ldv2EtM0Z9onmc
         nhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lj3EErg4KsdV9PHrVob1sWD3VFGHBdHd4QUept9/iiM=;
        b=QgltKMKukO+lO/CKLjJLdRz1dqP8vm6ZR3f4728Ta8FYYq5lMfsKz4Kr/T5i7pGnDo
         Az0rgb1p45lLN/FIxcnzGSsPaf4u79QM+EDOxwFjz71rwLe7TvBKmJPuCLGYD7p0DqQU
         /9u6e3MXBIwGo1++IApzH7+BTCAaLjjKVpPvV+3MdYTqIkbEhot3yusHcYcYkEeqVkl3
         r/2d/PyQzetU6B2710YF36PBnfpxCrI5+3CWXGSrcXqZaB/Am5rNx1D5vM/ACYy5+B8n
         nyy68+vvfgJAoqv+FuhJUNtT1dQZqgI5/gb4YH3m4D27kENK5tLYciYDLXToIMDjug+y
         OqdQ==
X-Gm-Message-State: AOAM530BUlJjVrYQ6R6v8tlmR+zEpacSnF37BMFy9oFcmvrCZXm1iq9x
	XJvhw53v8IE/GzFgSTdBkC2fKivHIoxY8A==
X-Google-Smtp-Source: ABdhPJw9lc2Rym6e1T/nHLyUpZzGHOyWOn/5ZKFd0vVBaXmB3bDN/guqhWPySUlKB6Bu55WEiGve4g==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id h13mr18681011pjc.20.1625540581564;
        Mon, 05 Jul 2021 20:03:01 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:4baa:c5cf:22ae:7c01])
        by smtp.gmail.com with ESMTPSA id o20sm16000395pgv.80.2021.07.05.20.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 20:03:01 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/3] python3-packaging: upgrade 20.9 -> 21.0
Date: Mon,  5 Jul 2021 20:02:35 -0700
Message-Id: <20210706030237.307204-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

21.0 - 2021-07-03

packaging is now only compatible with Python 3.6 and above.
Add support for zip files in parse_sdist_filename (:issue:`429`)

References:
https://github.com/pypa/packaging/issues/429

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../{python3-packaging_20.9.bb => python3-packaging_21.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_20.9.bb => python3-packaging_21.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-packaging_20.9.bb b/meta/recipes-devtools/python/python3-packaging_21.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-packaging_20.9.bb
rename to meta/recipes-devtools/python/python3-packaging_21.0.bb
index 92cf6a25fe8..23ecd9df5ea 100644
--- a/meta/recipes-devtools/python/python3-packaging_20.9.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5"
+SRC_URI[sha256sum] = "7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7"
 
 inherit pypi setuptools3
 
-- 
2.30.2

