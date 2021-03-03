Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.1328.1614736936218106792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 18:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tREobM4b;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id u125so4608271wmg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 18:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4EnBDGjcOu/Im8Q0PBS85K6rc3ggZTBeGjQFfPLOrrE=;
        b=tREobM4b0W7Db7ZqkaUnToulkWmATDOwdwWZRPqHkV8YGT772gldWyCBgAHQkTBbUF
         GxTqygP0YmLEcso/1hj8uGPVGZ5otpDCmUdi25UuooDuY8EgH6WHBfvjoZfePbm5fs+W
         KYlevXy6IhUV6HDc0oIiHmKUvUOZSWGGoitsSwXSJMa+JBt7i7A7MkgtZG+ueIBx9elu
         j7aw6uM/eRAkSNeYeJnDT2YtxwUH79fpjqG7jAg4H7nXIyqXr/JN6Gl97DLhexUDqckI
         M7+YBz/7cgjLvndXtnhOz9//7zPrT9cGNkbTFYTFgshhHqSYuStCS4HG9WHLa+m6uflh
         k/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4EnBDGjcOu/Im8Q0PBS85K6rc3ggZTBeGjQFfPLOrrE=;
        b=YjFBTf2qLrLVRubcJo0jw80UJjGgKxcTyTiM0CTOw9jroCHS59KysRnHao9uHXtYCy
         +TDQLZQ6Wwb0jIUak6OW6SGc5SkUCl8gE1bb9LAh1zFKloh2LN1frDx7g1+KuMRNIfVZ
         Rsimht1FgFlzFJPT7C8L4gJ58fU841f8gjQUPfUK1IXXwiR8+6rtuua7ppKwi1YtqadV
         M4qiIcEcz1vKiNonWSL2nJK7gXK+6IRiJdme17epaLRT3qFHcV11Ou38ekbLq9mfblfX
         WGt4FyXbq6q6MYHRWEzZ1uZ/G+M+3pq0gs/fEXeF5/aDN1X9OgFlU9AhOky+Jq5eQqpl
         wdgQ==
X-Gm-Message-State: AOAM533s2fxM+B66FiVUt/scPRcWEPk4DvuZfmQoj8QcBJX8FH6VhaRR
	CdkXdqvw5JFTCQIL8lw3Ol7KENYf+AQ=
X-Google-Smtp-Source: ABdhPJyGh/rOUcnLxOG7Fx9Sf1EcB2QXi95Haw4ztf/7mPwlCEPV/CMFK/o/BbNqIU+YZDAbKlNHFQ==
X-Received: by 2002:a05:600c:4c11:: with SMTP id d17mr6819567wmp.86.1614736934333;
        Tue, 02 Mar 2021 18:02:14 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.32.149])
        by smtp.gmail.com with ESMTPSA id g9sm31489279wrp.14.2021.03.02.18.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 18:02:13 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 2/3] meta-skeleton: Add HOMEPAGE / DESCRIPTION
Date: Wed,  3 Mar 2021 03:01:51 +0100
Message-Id: <20210303020152.25093-2-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303020152.25093-1-dorindabassey@gmail.com>
References: <20210303020152.25093-1-dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 .../baremetal-examples/baremetal-helloworld_git.bb             | 1 +
 meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb        | 1 +
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb       | 2 +-
 .../recipes-multilib/images/core-image-multilib-example.bb     | 3 +--
 meta-skeleton/recipes-skeleton/service/service_0.1.bb          | 1 +
 5 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
index 946a12d0a5..ee945c1ff0 100644
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
2.17.1

