Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.360.1587835719600310216
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+qgQs7E;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id g13so15411568wrb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KSnE13/rNbsL2me8PgpTyQPxbSUbdqwG18TtJs/ipwc=;
        b=m+qgQs7EQYx6+OX+bk2wHwyC0+saHUUGds0tU9WkltOLS/LFhyHWdEcLOpG7c2uDgf
         9xHEYvBDux/tFOQlfhyCwJ5yTdSdrkFbiM8/BWR9txLeOT+NnGQuPwOq8nijtU976Sg1
         RJKDerlDgwtHzUWRNFeV9408zuz+v4RIlCRAwECTpnzwcfmwsq+1Vi5ZcoB0NG105QCE
         Iu/qs3H7QKZvhivSfDGKRx6+dfG7q/s96UWwaYEkIi8vEPTmf9UtHbnajC4FiERuXF5M
         pE1i9138HSxey5sh1//+NEmRRWFOiDRBLPAfN8Nf9cWC9k2uD5FSQKStOZXEzYJtmIKu
         /h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KSnE13/rNbsL2me8PgpTyQPxbSUbdqwG18TtJs/ipwc=;
        b=OssuU+0663dcZxgASId/0wBpEmotCTz60i2uWuNKhknKEGy/hJO84+cVXFQy8MQeoE
         qBtHuF/5F1Y9XKxfuFO9wwF96bqH86mMCtcluINRa35kkNUJ4Mtar90xNUkT7OaZcKAN
         GlPxOwRDQVwEst0u6mZDJC9f5xwZ/G3XnYwN3NP6gKkKX3iPDr3Bq39TlcdfgPchGVwU
         XaavC3N7OQw0heOAXZomY++kHyeYkVK1BLhntbIEfLQ/iU0eA0RyfmrOuX/2bje2BIbB
         lCLZO3kJ4XK70ffxk2fEBUH6nq0YTYp57I43FUr9zVnvWnHF5jgXsOmZLiUgOt5rT7o2
         r9gg==
X-Gm-Message-State: AGi0PubpZflS499N/PQqDRsVgsE0f8rfzaima3GfUmJnUmAWEltfatXZ
	1FSxOyMFGeBVHmamS222TTd4R8vr
X-Google-Smtp-Source: APiQypLeflZTQI4byaAaNFR87frwpF89X2/l1WbT6Gngd0bZVlGP+0a06hf9jsaiRPAybf2vDjSA9A==
X-Received: by 2002:adf:dc50:: with SMTP id m16mr10927554wrj.329.1587835717950;
        Sat, 25 Apr 2020 10:28:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/15] python3-cython: update to 0.29.16
Date: Sat, 25 Apr 2020 19:28:12 +0200
Message-Id: <20200425172814.27370-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-cython.inc                | 4 ++--
 .../{python3-cython_0.29.14.bb => python3-cython_0.29.16.bb}  | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.14.bb => python3-cython_0.29.16.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 3d1df41308..437e796629 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "6e2f139e30bb08d68366f9370d87964c"
-SRC_URI[sha256sum] = "e4d6bb8703d0319eb04b7319b12ea41580df44fd84d83ccda13ea463c6801414"
+SRC_URI[md5sum] = "a899abaa48b68bb679aef45ceb4b89d3"
+SRC_URI[sha256sum] = "232755284f942cbb3b43a06cd85974ef3c970a021aef19b5243c03ee2b08fa05"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.14.bb b/meta/recipes-devtools/python/python3-cython_0.29.16.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.14.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.16.bb
-- 
2.26.1

