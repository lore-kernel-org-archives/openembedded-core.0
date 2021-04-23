Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.437.1619199577558479765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 10:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X0oLFbXl;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id f29so35654026pgm.8
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EY8e5q9cBJO/yNi/ZzmAtYyyJxJOjVk+re4GwyIvuz8=;
        b=X0oLFbXlMTsFMJsC7xRXomcc192CL9Id8UyEtmdmztTc73nxWWijgRWVF9+AV98xGi
         3zppbpRMANGBk9Rhjfk976oXaYuWXDruLFGuLsO8YoPQ+fmJVDrxDENc/gyccUwW7h1v
         PD3NuNApBjA8j9QwvnnXXxq5sKld2HCDWl7v9klAtnEuBuwhqrLop10aBXPlHqfijRoW
         f0bCEjubB1ymP56jqFJ+NGs3poUCMft8uWzrRblhk5zHNjS3PkrPgZzX9jCTGNPBq/lA
         Cf9j6L6CEjx2pM3X2xGk7w3N7UQaEVsnpKSPJDCkKSG0vassVgIqBQ2QIuCgMJd7jgli
         GOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EY8e5q9cBJO/yNi/ZzmAtYyyJxJOjVk+re4GwyIvuz8=;
        b=JciU9ear0x3inzYEsWyqEafoIBGURJZEHRDa69p3c51uKutPcUpPPkM9aDQqnaqimp
         dc03MoqKcAUmV1YXHBDbbJ/yvI0G1L25eY5ujc9gOHDFGUm5zukWJ3Rj9OmZypU9kNTd
         RN/zsgVmsRc7XVDpbceKfNdNZ6Oa6ugYdag65em8H+e99l1zxBwfkN+FaG/eeBPsVcoH
         EcoAp67j+XciSCaxFFGWn2WfU1JHVOENNTX5AIkqft8LvOXx1T7C1ZUAetzVoqKFQdSE
         qc/Fl9z/NcDDF16yloehHMyNdgm7E/Y9nKGjNyIkm81sRtPBOyN7KjwtvQLf1ZG+E/Kj
         33Nw==
X-Gm-Message-State: AOAM531lCXsvcCWknjBLV9pJpImx+cIdpnZyXV1Fig7b6UYTvGCTNXfg
	iNewJMCFi+nKbi5/PmedrzyKOx6w+rhBsA==
X-Google-Smtp-Source: ABdhPJyaWaCAFan5Y4AcaRSERLYC+/LxR0d6wUXf/qrLxIvJF4k9ABSyINeBdYdf6fzsVK2sRTkF7w==
X-Received: by 2002:a63:4758:: with SMTP id w24mr4903924pgk.33.1619199576804;
        Fri, 23 Apr 2021 10:39:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id 123sm5184620pfz.127.2021.04.23.10.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:39:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] python3-docutils: Upgrade to 0.17.1
Date: Fri, 23 Apr 2021 10:39:34 -0700
Message-Id: <20210423173934.71336-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was in meta-python for a while so merge the changes here
and  upgrade, once applied, delete from meta-python

License-Change: Deleted legacy stylesheets from LICENSE [1]
                Updated URI for BSD-2 [2]

[1] https://sourceforge.net/p/docutils/code/8487/
[2] https://sourceforge.net/p/docutils/code/8554/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Detect file rename
v3: Add info on license checksum change

 ...docutils_0.16.bb => python3-docutils_0.17.1.bb} | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.16.bb => python3-docutils_0.17.1.bb} (25%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
similarity index 25%
rename from meta/recipes-devtools/python/python3-docutils_0.16.bb
rename to meta/recipes-devtools/python/python3-docutils_0.17.1.bb
index 50547a1b0c..54a809847f 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
@@ -1,17 +1,11 @@
-SUMMARY = "Text processing system for documentation"
+SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
 
-DEPENDS = "python3"
+SRC_URI[sha256sum] = "686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
-SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
-
-S = "${WORKDIR}/docutils-${PV}"
-
-inherit distutils3
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

