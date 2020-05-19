Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.5554.1589858122620896181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sJbb9KbB;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id x13so5871803pfn.11
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 20:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7BSKi94b0vN8glmwnyyOb35gSRgQXHtrmkmkf4kyTs=;
        b=sJbb9KbBd4D7SIuqPtrYtwI818d2MxPvrGCZR5h9o0hiZ2IasyAnWTXNQ5haiUjLCg
         xaS9sRumNJq+39yD3hDBw0wll3fptVIZe+wHe9l96AlFwrVOTADf4Z9aptm8+rdCtcs4
         Ejj3tX6xZG7UXj5YUa6p8ngWZTG0aAPq6fgHkOuBx64DoFXwc8qwkBhC75LWpAHary/c
         9SlAaztpe9lPsOXnPyoed0sd/Qw2kLXRpCh4sSDefToYcfdHcii7YWVTl0pkWQosfi9P
         e1S+YvLEO+0dgl4YeUKHVmkG70cS9uGTTddV1jhy3j/E5/N8cfh535V0jvKKCpzpnXFg
         Jkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7BSKi94b0vN8glmwnyyOb35gSRgQXHtrmkmkf4kyTs=;
        b=tfCjwUp5GAldYADSNLyQRLAdNhziHW9GzJNTTiy4u1trInrs1FTIx5XEiZKA7cLGzr
         sjRpzQ0w6Xnh9Yybj2FWUU5L1XNSgraiWfGD79Rzf0tw9RnI6e/UgQtGD2E9djZV5eJ6
         yps1TbwnZpX4swskF0UfURkBxlPSKmXZMJaqGxA4Nqc6q/kudeUC1jI7CT4N7iFR0DZI
         rKDm7rvI6g5GZCkxty261omKS5R+7BJRX+s4RJqikYlxkTqlvoKxa+R4OG04UdzpDTsa
         pStkgDr4UUdu7CvcgatX8p7crPYgVZaCZACx/ijMadhUOuTCV1A+zW2KQFqH6n2SGTDq
         J1cw==
X-Gm-Message-State: AOAM533d2qa1mWXEkQT72oOlkKseiMdPjFKIeOK6w9N05mbhwm0oP24G
	+SkpWm2lKKtjM0DNASzGV7ugw5gNmnY=
X-Google-Smtp-Source: ABdhPJy1b/6FXQpCuSTorRmKeSF76NCjJn4G5OWRnnB85dFTBwvjZS0C+daxYgyK9qlZ1cEqEUxkLg==
X-Received: by 2002:a65:6694:: with SMTP id b20mr17431526pgw.303.1589858121603;
        Mon, 18 May 2020 20:15:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id a5sm4545706pfk.210.2020.05.18.20.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:15:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] re2c: Upgrade to 1.3
Date: Mon, 18 May 2020 20:15:18 -0700
Message-Id: <20200519031519.401004-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License-update: License moved to its own file in topdir instead of
checksumming portions of README, the license still remains PD

Extend to build nativesdk as well, which is needed in SDKs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/re2c/{re2c_1.0.1.bb => re2c_1.3.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-support/re2c/{re2c_1.0.1.bb => re2c_1.3.bb} (55%)

diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-support/re2c/re2c_1.3.bb
similarity index 55%
rename from meta/recipes-support/re2c/re2c_1.0.1.bb
rename to meta/recipes-support/re2c/re2c_1.3.bb
index 35200ecde8..0e1d938748 100644
--- a/meta/recipes-support/re2c/re2c_1.0.1.bb
+++ b/meta/recipes-support/re2c/re2c_1.3.bb
@@ -3,13 +3,12 @@ HOMEPAGE = "http://re2c.sourceforge.net/"
 AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
 SECTION = "devel"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://README;beginline=146;md5=881056c9add17f8019ccd8c382ba963a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
-SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "e2c6cf52fc6a21595f21bc82db5324f8"
-SRC_URI[sha256sum] = "605058d18a00e01bfc32aebf83af35ed5b13180b4e9f279c90843afab2c66c7c"
+SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "f37f25ff760e90088e7d03d1232002c2c2672646d5844fdf8e0d51a5cd75a503"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
-- 
2.26.2

