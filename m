Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3349.1594933697523111561
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ntrvxc/g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z15so8571163wrl.8
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2lKMbF3dYVNH8QUYS3C4t0meqY5ONZwov6CGvtAdOq8=;
        b=Ntrvxc/g+Hfwa39VRBpGAoVfbJekt8jzNR/g9E3AxaU79mIHiokR5lbzvI3uEhniTa
         Y9mjb+mdX0KMXjj0B4isLhdyX6zBYrouBO5bLnCIjGjwBxx5senwOKcXRdu9Ecyv7qhX
         Se0FmEa3g69g/s+mHAHwX25JLna5Lm5tPZiCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lKMbF3dYVNH8QUYS3C4t0meqY5ONZwov6CGvtAdOq8=;
        b=K+IvJtG/O7SV2Nlnsmb+6Kuh8UOTL/k7HtzErfHQQWTUCCodGcOfQk3hVy6CPEyeYY
         FQshtU6ALleWzHAs338g2ujMaoIuD/Z+AmECDc0Tn+AcLGcY/Dthk3F7et+KMT8jukPR
         Hqcupoy7M0wJFdLBcWgAKKkTA40A9LFFp67SAgd53lWzwueU0g/znXP8jUTQ7+1R06Xv
         arsdAYRwlHiFKXFHz21vkI1eOmUM2/w8cGk2T5xPHPTq+rJWpbT06dMM3vXR/ZQu9ERt
         fMeb2cUid+xxW92W1LNmuSCdgS8javK7xPkcijzSlmBEdkebF0nkb4I+vQlpo6kP3NBm
         xBFA==
X-Gm-Message-State: AOAM531Y7R6d0S7CtJmKsRRv1kWTfSvgxmVSxnBwd8OLAjUigOy0IzPI
	roAUNhLcZIWpQBSleLcJdR2m5tBdT3frIA==
X-Google-Smtp-Source: ABdhPJzyVM02FSwPfJyEDB0z09VRSM1v2kzN4aYECJ88KibaVLEgIlp/ZUmg3tXcA1gNLEA6M8VMIA==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr6841853wrp.206.1594933695831;
        Thu, 16 Jul 2020 14:08:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/20] python3-cython: upgrade 0.29.20 -> 0.29.21
Date: Thu, 16 Jul 2020 22:07:55 +0100
Message-Id: <20200716210808.7438-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.20.bb => python3-cython_0.29.21.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.20.bb => python3-cython_0.29.21.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index a0cd2a5fb46..b1e71f3ccd5 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "22d91af5fc2253f717a1b80b8bb45acb655f643611983fd6f782b9423f8171c7"
+SRC_URI[sha256sum] = "e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.20.bb b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.20.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.21.bb
-- 
2.25.1

