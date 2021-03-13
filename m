Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web08.2537.1615661470312336261
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=N1U37/ID;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id x135so25919433oia.9
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xx66gqpmtX6gbG2DvcKFfxEySqvoTEbA9wDyOxLVi8o=;
        b=N1U37/IDVWnYX7o3HSnHeLCbTLRYR0iW+sa0F1Zde20zbLFMLNGhm8ma8e8hBrwY6n
         ANpQB/C/dr7kryvxWrDAPIIxGSiqiAfEXD0DxmV1MvkVk3YNpiGHY8CM/fbjvEGfx+4K
         Qav0jBIdCE6h/SsEo9zmL2B6ACJLhLESspoy0lBfChQAZpqbA5TH1IZzMjnd4rBYmYvo
         Mez0hjiDFl+ZplLZiVEt1Qep0Po46VWfTGCjOmqaaN+C0jY1c5PfKBjaNNiEL+G3WmbN
         XRXwaniSgg/X+Ht8sOvzfKSR3lvX5cLIfJ9GMMT3j98gk0OYyua6yVBYUWg2E9Toe15l
         xKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xx66gqpmtX6gbG2DvcKFfxEySqvoTEbA9wDyOxLVi8o=;
        b=e7N4XMo/tvBun8tPSdomg6hvrOULgJ9eMXCXQfSsQfVg4nAIoIm+87N4Zc1miTwjjy
         /VqXoKxfz40KsYqhIuG+wLYzRwqA3nXeMuvsLecfC8euoFb22jQ1IZZpSBO9km2wYnXj
         RkLMs8LLOvA7glaM7bQi/uo+rAO11PFoAQ2cRxs8mUI6yaa1xW/gBmchajVf6I/sfzvz
         oJfL93s87BtXieAIdCj4Mb3IgWXtG66Jwzz9Jo3dFIWZ2jWwxn5DXNPc/mvCQ6VGZ6Rs
         fNXXT/HUkDzq3dmqfDJ2ueib2j6+5iQOAk0IVXsZFH7K2TK9I34xSwBSqv9IifF13vGs
         ddaA==
X-Gm-Message-State: AOAM531PUxTqVQ8jzbD8pQxnxXIOn65vJuMVIfy0eAksraSTI2aouSRb
	R3aI1oacu/6ZrlDVqGlnP5UfS/hpSrSb3XGz
X-Google-Smtp-Source: ABdhPJyHOM1GXF/hpPHPkpkvhgqvifmFNGM/TFyFDfWr/yloEQGhiJhjIQQqEpQ4wE3GoEP2ryM4jw==
X-Received: by 2002:aca:3195:: with SMTP id x143mr11382001oix.74.1615661469181;
        Sat, 13 Mar 2021 10:51:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/38] meta-skeleton: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:04 -1000
Message-Id: <90e24da5fbfafc4c5b31093a5fc9ec65fabd31f5.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89d8f20353bacb089bc18833d3ff032b525613ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../baremetal-examples/baremetal-helloworld_git.bb             | 1 +
 meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb        | 1 +
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb       | 2 +-
 .../recipes-multilib/images/core-image-multilib-example.bb     | 3 +--
 meta-skeleton/recipes-skeleton/service/service_0.1.bb          | 1 +
 5 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
index d8633702fc..8db57f202e 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Baremetal examples to work with the several QEMU architectures supported on OpenEmbedded"
 HOMEPAGE = "https://github.com/aehs29/baremetal-helloqemu"
+DESCRIPTION = "These are introductory examples to showcase the use of QEMU to run baremetal applications."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
 
diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index 3d33446500..bc9acccd5f 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Example of how to build an external Linux kernel module"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 6194d4f8da..d53f9c7a40 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -1,6 +1,6 @@
+SUMMARY = "An example kernel recipe that uses the linux-yocto and oe-core"
 # linux-yocto-custom.bb:
 #
-#   An example kernel recipe that uses the linux-yocto and oe-core
 #   kernel classes to apply a subset of yocto kernel management to git
 #   managed kernel repositories.
 #
diff --git a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
index f13186f933..e7d50aefda 100644
--- a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
+++ b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
@@ -1,5 +1,4 @@
-#
-# An example of a multilib image
+SUMMARY = "An example of a multilib image"
 #
 # This example includes a lib32 version of bash into an otherwise standard
 # sato image. It assumes a "lib32" multilib has been enabled in the user's
diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index 6416618dcb..669d173ad1 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "The canonical example of init scripts"
 SECTION = "base"
+DESCRIPTION = "This recipe is a canonical example of init scripts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
 
-- 
2.25.1

