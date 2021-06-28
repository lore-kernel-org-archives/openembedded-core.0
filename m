Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web08.12503.1624892795493262515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0P2zTWAC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id a5-20020a05683012c5b029046700014863so2273119otq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fZ2f8uNaHxW9MqBSU+1D/PNATT8bAN4e/LhuU2goONo=;
        b=0P2zTWACexikhuyErCeBSy6C7vrRukKwDVwVxsHkaqQp7vz12VN/bCeesH+0m12E0c
         SZCp41Lwz7iN0wzFYp/8Eme6Ywn8545PL/zqmoODFl8c6q/Fa1bYhF4+vVCM5qgbeb5l
         xjOoK8WhxCRiRBUJNUDc+Ju+WocgujtkC9ZDmo8WkWiqEg+6DETHORmrel1QSqI5QWmF
         mAW0+S8vO9OAmQolE28k459eGH5cNMssIO046V1ZXJC94wdlhyJCC1fGBr/8NdqAKyB4
         nYuF99ZOADRlaV6oPIn1Hqyaq6ijIBvt7bmF7ZYuVfTAoDhCDYn7Rkon6vVqCK6rFb5F
         oKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZ2f8uNaHxW9MqBSU+1D/PNATT8bAN4e/LhuU2goONo=;
        b=ANCglyMiZvQ/M6Yb+SegdhoCoftqSxQNHr9Vft//wATp4A1RmOJt2Is6pgjzc6VVWm
         DpCslS9K72RXpu1gvG4HfRudUikiIFdOqfd0eFdnIGL1oQpxveZbasA/wQS9FU39maYa
         +0aC4/6G9N61N7TXOtNxDERon48w6szBKbZ2yfJGXQFEJJfSSwprxjl+Vc0t3gZB1EYU
         PDgLoymoSoNhkXyp7dra0UC9eU8vVBwnPCs+U2FQmAWsIXWc2pAw/0NbD00Z2yUdCJX2
         BkKDpKP7KwvCIwWUYRToed9OAbmYU9mScFa1d4pBb7w9wnfly2x2O7gXgWUlySbDEqOI
         osMw==
X-Gm-Message-State: AOAM532HS+kYkl154KZ2cE2YsvWvj0F4MULn2TDxULtKf3D2Txnp9VXA
	/rYKuiO1d5gDX3NRAjAkxyirkYwRyEVqm99Y6e0=
X-Google-Smtp-Source: ABdhPJz25NAi+TJzLxo8ejHmiyWme2qTzGo2Ind6F8IVYK71TRNpu0U/fdecwmag3jXd5FwSMB/dtg==
X-Received: by 2002:a05:6830:1049:: with SMTP id b9mr10456otp.203.1624892794397;
        Mon, 28 Jun 2021 08:06:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] python3: upgrade 3.8.5 -> 3.8.6
Date: Mon, 28 Jun 2021 05:05:25 -1000
Message-Id: <2fd24949d3eda9e89239f63d1c5034b96eb2756f.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Release Date: Sept. 24, 2020

Note: The release you're looking at is Python 3.8.6, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

References:
https://www.python.org/downloads/release/python-386/
https://docs.python.org/release/3.8.6/whatsnew/changelog.html#changelog

License-Update: PSFv2 -> PSF-2.0 and BSD-0-Clause

Starting with Python 3.8.6, examples, recipes, and other code in
the documentation are dual licensed under the PSF License Version 2
and the Zero-Clause BSD license.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.8.5.bb => python3_3.8.6.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.5.bb => python3_3.8.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.5.bb
rename to meta/recipes-devtools/python/python3_3.8.6.bb
index 21b6be58f7..bf33fce891 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.6.bb
@@ -1,10 +1,10 @@
 SUMMARY = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
 DESCRIPTION = "Python is a programming language that lets you work more quickly and integrate your systems more effectively."
-LICENSE = "PSFv2"
+LICENSE = "PSF-2.0 & BSD-0-Clause"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -43,8 +43,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "35b5a3d0254c1c59be9736373d429db7"
-SRC_URI[sha256sum] = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"
+SRC_URI[md5sum] = "69e73c49eeb1a853cefd26d18c9d069d"
+SRC_URI[sha256sum] = "a9e0b79d27aa056eb9cce8d63a427b5f9bab1465dee3f942dcfdb25a82f4ab8a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

