Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4889.1793247249011299652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 21:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pvAhVLn3;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-156cbe59622so1905881c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 21:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793247248; x=1793852048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SS52GwGtPgQJMNXeVyCJ967T+BzVWN2uQ6rGeseR4pQ=;
        b=pvAhVLn3pkC+GA+3khke91SBdeYWYWT2mASbMy7gL+62a8mqnds0+zE98QWLHRXeMz
         v8nLXbmyoCEob0d3aLL6dwdNi/LZ+NWXjdEywUC6ph2+zBEEdZOC3CMHLkG7aWYIcwhb
         J94TeTnqV7RdV5X2Oq/7GJOf7WfkySfbOYaJYWPRMqPIGxuIuz92VQe9aU6fL226s9uK
         rk2wFmdIYjVC2u4/RdUvdaqQvdjqrnKPQQkRyw/FXTcmbHK6+vFGGi2lXYG3/8C4x7li
         +sH2vH6GauXxioLwM5/1Odt62abarfKrPgaCqdjoKwWwV0UG3AsI8znGYeafD4lOIlGE
         eizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247248; x=1793852048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SS52GwGtPgQJMNXeVyCJ967T+BzVWN2uQ6rGeseR4pQ=;
        b=P3LpiPP+MkvlINNetyz9VwqiKHdQksqKFtYfhftBrME3tCEeSSPMy74mbw1jTbRFl9
         nuBafQyjDk6/Lyk+73+Tkkkis2Zrp4f5mo/4LHBqnJgYl9GmNeTbac9vJ7Qup7ec/INs
         tYrAimpnCNT3cV5MzKa8gWoJRYoQFTbqDWounzkZR5GGZF9pJGcuItLW/AOrdeJvsY/Q
         xo3aF6OLBhFd+pzmR9zgsRgJAGN+M16jH2VE2U+6Fs9Xqw81Yl4D4H/IIxype3NlpGBx
         lR0m+J0b9MLb07Gc8FGLFd7I2h/mLH7xSq08YgW2Obzw/eorUupHZeICrRbPhu7fn0kK
         24XA==
X-Gm-Message-State: AFq9FYKGcyTVJI9TCvUYj8V8GU84P3NBrfWqm3kg6WZKxY8JqyidegS3
	AD9yg6aSwjys/wXmX/PMZbUpL3ombzJKJ3EAjTCRFhghz8z8pVFoS8YSYcLHs6vg
X-Gm-Gg: AYBFou0/0c0hr4X26lqU2L2kcz0vkFTbUwXx4bX9VRGVN6QKffJFaxhcDnPFcCezU0b
	knnkl7YCM+TYS94oALdyZSiinAcYkm7L/dLpNUID1F5XSSgac34ryImQZmLU/+mTWZV7R9fUjQE
	pjqTQjccLVBCidK0v2ZjFX+SwaZvTwObiQc7DmDULonuGW/LRAR8syVsdntY8X9R8DZa987Fljt
	3Vfc/SRcFBQAgX2J+0GRHJ/whzau1dqOAE/eoMCMCH/xH4PaISuYnOodbQLC7yIEQL24o5tXshq
	9vCJMQJRoKIkVZtyuChvW3fbKs+kAcaSnHSRy3BXUfyledj0tzlolDZf+RJKtHjcoJW/WdjeOMR
	akIe/GmKvVDzBTEMBLXqCaUTcr7GvJ0RGcsx1oTeDVtwNR1sUIujk8EKgLcUebcOP2XBXc/5dP7
	Y0rcuCT5yk4rSBnvQRWgFxka2RFC1qzIKVX689PGo+T22D/Y3EaFuhWwoZzeq6ZfwQwgjSkaCHy
	qexzFMWlpvnzh8qQlVczFlF7YcsfQBYvGcF3KESTQtPxUkGm+ddPNFPqPm+y3k2MlGrZyfI6HKK
	ashyEvOF5BCNy0vhJ/soGHNMzH2DsgpvGomL2+CcOhCduZ0Td+Y5bCPpr3UBCDro9MJ5CvA91fG
	f3bjpXhw+vos=
X-Received: by 2002:a05:7022:b0c8:b0:179:a1d0:be39 with SMTP id a92af1059eb24-1a6d0b622b4mr6604054c88.29.1793247248094;
        Wed, 28 Oct 2026 21:14:08 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814aa1sm19495463c88.7.2026.10.28.21.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:14:07 -0700 (PDT)
From: "prasanth" <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [PATCH v2] kernel.bbclass: fix -dev files when KERNEL_PACKAGE_NAME is PN
Date: Thu, 29 Oct 2026 13:13:49 +0900
Message-Id: <20261029041349.3464379-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248903
Content-Type: text/plain; charset="utf-8"

For a second kernel next to virtual/kernel needs its own package names, e.g.

  KERNEL_PACKAGE_NAME:pn-linux-yocto-rt = "linux-yocto-rt"
  PROVIDES:remove:pn-linux-yocto-rt = "virtual/kernel"

FILES:${KERNEL_PACKAGE_NAME}-dev and FILES:${PN}-dev from bitbake.conf
are then the same key. Keys expand in sorted order, bitbake.conf wins
and do_package fails with installed-vs-shipped for System.map,
Module.symvers and config. -dbg only gets the collision warning, as the
bitbake.conf value is a superset.

Rename the kernel FILES to the ${PN} names in a RecipePreFinalise
handler. __anonymous() is too late and would drop bbappend :append, and
a class :append would still warn.

-dev now matches kernel-dev, without the bitbake.conf -dev defaults.
The default KERNEL_PACKAGE_NAME = "kernel" is unchanged. Drop the bug
11905 warning, as that is expected bitbake behaviour.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

Notes:
    v2: added the use case, why the handler is needed, -dbg/-dev notes
    and the comment.
    
    Found while checking the bug 11905 warning in kernel.bbclass. Tested on
    master (qemux86-64): linux-yocto-rt next to linux-yocto fails without
    the patch and builds with no warnings with it. The default "kernel"
    case is unchanged.

 meta/classes-recipe/kernel.bbclass | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754108..77ae9df4c9 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -60,16 +60,24 @@ KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
 KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
+# With KERNEL_PACKAGE_NAME = "${PN}", FILES:${PN}-dev/-dbg from bitbake.conf
+# would replace the kernel values during key expansion, so rename the kernel
+# variables to the ${PN} names first. This must run before key expansion, so
+# it cannot be moved to __anonymous().
+python kernel_package_name_handler () {
+    d = e.data
+    if d.getVar("KERNEL_PACKAGE_NAME") != d.getVar("PN"):
+        return
+
+    for pkg in ("dev", "dbg"):
+        d.renameVar("FILES:${KERNEL_PACKAGE_NAME}-%s" % pkg, "FILES:${PN}-%s" % pkg)
+}
+addhandler kernel_package_name_handler
+kernel_package_name_handler[eventmask] = "bb.event.RecipePreFinalise"
+
 python __anonymous () {
-    pn = d.getVar("PN")
     kpn = d.getVar("KERNEL_PACKAGE_NAME")
 
-    # XXX Remove this after bug 11905 is resolved
-    #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
-    if kpn == pn:
-        bb.warn("Some packages (E.g. *-dev) might be missing due to "
-                "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
-
     # The default kernel recipe builds in a shared location defined by
     # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
     # Set these variables to directories under ${WORKDIR} in alternate
-- 
2.34.1

