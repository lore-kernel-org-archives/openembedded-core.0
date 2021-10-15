Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EC9C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 19:55:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.2191.1634327750826943286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XFoRTlY2;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id l6so7029462plh.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jj8dFDSaEN3uqWVTrLsDrCZ9NevWaEoKuHGvjZMrK44=;
        b=XFoRTlY2xn/LXz50pmgjOFZVexKsAszNcqJxBsERmAsE4uStbxBA7Q/CWSTw8u3kOF
         R8VtAn66qi2KjFQhcL0bgom3012T0cihyqg3ULvxyMTwg6df7xySIdVdTY35UevSq6k/
         jxgxsMXr5ekFpQp5Tl0gAsVzcZHeWfYD2VVf4hgRiYIKtrAUlchiYzx5GK1GCgIZoSzn
         lrjCR2GElj0SITEeYVt1r4SANW+ObHDSSk8oInK3rP/XCO3Dd3TMb4OJOWobayJ+Wmd/
         JHc631zHA23dGnzxK/9RgtdANqF7iba2jl3xJmkbvdAMym81uYtsGivgdOq56LDP7zzF
         UTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jj8dFDSaEN3uqWVTrLsDrCZ9NevWaEoKuHGvjZMrK44=;
        b=ZnuX9tdWWk2yjVBAnOrv3CFONQCPN9QVafBq3kl25daACReiflLnxqgRcRDEWfNlkw
         GcY5WPcVY5NiPYpdcGDrw3L5hI9NhFt7fN1mskWkQCtJBIeB65zRIEklEirQNjGynTAH
         SEwPcirZX9CimbWLS0rT92/4PlawZU4pzv1OvGQ+QrhdiFASQPkvVGCrWoYt3Pf9ZUEb
         E4xVQaily4eS+oQaCQFo7VGwbbe2bUnREOjApe0zTsm0cAIArVMR17hlMeo2FI6uXCVU
         OSQHdATTXlS4tAkOrjZrlLaRuX645B2a2B2002qJpToLJoRahfypxULrwLhEYn8mo8BS
         C0+A==
X-Gm-Message-State: AOAM530BOBQAh0+vWNTIWORWpBl6uI8fk+v3UUkaOdisFXMTp/sGviHm
	JRMS4E2OAurjOvlCzMFBJfNqJs6mYHPKDw==
X-Google-Smtp-Source: 
 ABdhPJwkrK1FnRIqj6K2DnVvVe0qFbCj88TEsC0X3zieWkPVa0aHdCYVlglzSpUDUHAnQbsXpulinQ==
X-Received: by 2002:a17:902:d48a:b0:13f:4411:8ae9 with SMTP id
 c10-20020a170902d48a00b0013f44118ae9mr12730885plg.86.1634327749881;
        Fri, 15 Oct 2021 12:55:49 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 j20sm5265412pgb.2.2021.10.15.12.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:55:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH v2] at-spi2-core: upgrade 2.40.3 -> 2.42.0
Date: Fri, 15 Oct 2021 19:55:39 +0000
Message-Id: <20211015195539.2415828-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 19:55:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157008

Add patch to ensure x11_dep is defined.

What's new in at-spi2-core 2.42.0:
* Set X root property when Xwayland starts on demand.
* Several dbus introspection fixes.

Reference:
  https://gitlab.gnome.org/GNOME/at-spi2-core/-/issues/42
  https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/60

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../0001-Ensure-x11_dep-is-defined.patch      | 33 +++++++++++++++++++
 ...-core_2.40.3.bb => at-spi2-core_2.42.0.bb} |  6 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.40.3.bb => at-spi2-core_2.42.0.bb} (90%)

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch b/meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch
new file mode 100644
index 00000000000..4a9bbbcbb1e
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch
@@ -0,0 +1,33 @@
+From 9e726133319298a835f724904c80e5adf78f475f Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@intel.com>
+Date: Fri, 15 Oct 2021 18:00:04 +0000
+Subject: [PATCH] Ensure x11_dep is defined
+
+bus/meson.build checks if x11_dep.found(), but this fails when
+-Dx11=no
+
+Upstream-Status: Submitted
+[https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/60]
+
+References:
+  https://gitlab.gnome.org/GNOME/at-spi2-core/-/issues/42
+  https://mesonbuild.com/howtox.html#get-a-default-notfound-dependency
+
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+---
+ meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index b5104c8..85d7a0e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -62,6 +62,8 @@ endif
+ 
+ x11_deps = []
+ x11_option = get_option('x11')
++# ensure x11_dep is defined for use in bus/meson.build
++x11_dep = dependency('', required: false)
+ if x11_option != 'no'
+   x11_dep = dependency('x11', required: false)
+ 
diff --git a/meta/recipes-support/atk/at-spi2-core_2.40.3.bb b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
similarity index 90%
rename from meta/recipes-support/atk/at-spi2-core_2.40.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.42.0.bb
index 427ea7c1650..e09c74ac7f6 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.40.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
@@ -9,9 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           file://0001-Ensure-x11_dep-is-defined.patch \
+           "
 
-SRC_URI[sha256sum] = "e49837c2ad30d71e1f29ca8e0968a54b95030272f7ff40b89b48968653f37a5c"
+SRC_URI[sha256sum] = "4b5da10e94fa3c6195f95222438f63a0234b99ef9df772c7640e82baeaa6e386"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.30.2


