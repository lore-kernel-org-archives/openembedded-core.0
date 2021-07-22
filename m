Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.1169.1626993917159840719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rQw/033B;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id w13so4217825wmc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jspfcdjQ6iX1y2D0uyBnIXpl8H2dgJ0lzWhbiG1G870=;
        b=rQw/033BNd7Ky1H2N2R2YfDUSFSL1yOFEPtr1xK9V1w7ddgex10gafKDb8TwSqoMao
         ddYRCfxuS6/cC27YJK2k896ndktdTIuArD+NtukoKdRWz3ea+v524QPN0nGulNHGaW51
         mEfKR7iYM/jpc5h8RYGRT/8WmxfnE18c64Sy1yDyEwCrqsZzgvQrQbg7p+Sl6bnnWvWW
         JGvzrHDhOjAL85H0Ptcgf2ujg3q7noks4a3SwA4Xfmm8nhPGNdvk6GFyjlwzG8CxGXg1
         kzcVH7WiAh44d+6cmg4Zy7Sihevp+BSQyVpO5HFZPmc8K7plPjcEeAHxlzh7+e4Qwpon
         ZbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jspfcdjQ6iX1y2D0uyBnIXpl8H2dgJ0lzWhbiG1G870=;
        b=g2mTtaVF33UnshzYooCyBkPPrPJZpYy52hi26R7eW14UYNfzCAqfV1mmrYh7zBD51I
         1ax/cFXAzXHSP32U4reCJm0mlElMAjwjwxBBtgmli5O++/NidA+9fakXSI/U9n4qzj4l
         pGPLvmkGFnjW6SI8guOZNPnVsKr38rL7SiqhF677bK2BfkO74dxtouVT2zAUN0fSaBzO
         fzRV9xnmQXqr1kmDarnxMfKWfGJZI05QFxRcTOla+tTON7eg8gI6SWCccdAE9cx/Xl/I
         CliVrX0Zh6+LhXx09J4hHiWtSdIvTD20q2GHQunLRAWbK5Iq70SNKIUqn7rLgiQwxWe+
         5DEA==
X-Gm-Message-State: AOAM530syqDkhXWtpW0wRKsWH18RFWi7hVJz1N6IFrP2ZQS6eG2rOZFo
	JVtK13z3ut9XEmp2/wBrnXpUuAsMvgLutA==
X-Google-Smtp-Source: ABdhPJz00SIFMTYi2y+9kTpDCHSv8mIQEBtGYKno5wH7L7nXGCmjWkOSRn+ts2iuPqEAEL3keA2MpA==
X-Received: by 2002:a05:600c:3b26:: with SMTP id m38mr6430524wms.80.1626993915535;
        Thu, 22 Jul 2021 15:45:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/8] python3-testools: update 2.4.0 -> 2.5.0
Date: Fri, 23 Jul 2021 00:45:04 +0200
Message-Id: <20210722224508.51967-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722224508.51967-1-alex.kanavin@gmail.com>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop no_traceback2.patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/python-testtools.inc               |  3 +--
 .../python3-testtools/no_traceback2.patch     | 23 -------------------
 ...ls_2.4.0.bb => python3-testtools_2.5.0.bb} |  2 --
 3 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
 rename meta/recipes-devtools/python/{python3-testtools_2.4.0.bb => python3-testtools_2.5.0.bb} (54%)

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index e8d308b717..de463fc2c3 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
 
 inherit pypi
 
-SRC_URI[md5sum] = "e8fc7185b47cfb908c641f8c4b2a6add"
-SRC_URI[sha256sum] = "64c974a6cca4385d05f4bbfa2deca1c39ce88ede31c3448bee86a7259a9a61c8"
+SRC_URI[sha256sum] = "57c13433d94f9ffde3be6534177d10fb0c1507cc499319128958ca91a65cb23f"
 
 DEPENDS += " \
     ${PYTHON_PN}-pbr \
diff --git a/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch b/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
deleted file mode 100644
index 594510342b..0000000000
--- a/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-traceback2 adds traceback for python2. Rather than depend on traceback2, we're
-python3 only so just use traceback.
-This caused breakage in oe-selftest -j which uses testtools on the autobuilder
-using buildtools-tarball.
-
-Upstream-Status: Inappropriate [Our recipe is python3 specific]
-(Once py2 is EOL upstream probably could/should take this)
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: testtools-2.3.0/testtools/content.py
-===================================================================
---- testtools-2.3.0.orig/testtools/content.py
-+++ testtools-2.3.0/testtools/content.py
-@@ -19,8 +19,7 @@ import os
- import sys
- 
- from extras import try_import
--# To let setup.py work, make this a conditional import.
--traceback = try_import('traceback2')
-+import traceback
- 
- from testtools.compat import (
-     _b,
diff --git a/meta/recipes-devtools/python/python3-testtools_2.4.0.bb b/meta/recipes-devtools/python/python3-testtools_2.5.0.bb
similarity index 54%
rename from meta/recipes-devtools/python/python3-testtools_2.4.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.5.0.bb
index a254b90a75..896ecee65c 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.4.0.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.5.0.bb
@@ -1,4 +1,2 @@
 inherit setuptools3
 require python-testtools.inc
-
-SRC_URI += "file://no_traceback2.patch"
-- 
2.31.1

