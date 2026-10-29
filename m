Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5826.1793254128835472368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 23:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JSednZID;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2425532c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 23:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793254128; x=1793858928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SS52GwGtPgQJMNXeVyCJ967T+BzVWN2uQ6rGeseR4pQ=;
        b=JSednZIDDRy9ISli544LaZrV71cCFjWZXOq61zJ0ZztEf1SIydJxDVPB/qBN0HZu1o
         LHCxWGV2cJhBvrda2nJyf5M/j2MR2XxKHgdfxAL4nbMwkdpunVsVXCi5bRNPymFtOm9E
         4ZGmmNgfFC2x4hZTRi8QKPPHbLTmoXbxQxHvclki9ZebTiUjTDdwLLw93q6G1QMQG/Rv
         TZmQ/xBzb8gvpUZ8Xqz/NQf2vJd7/lGMcx2w6wCAzo9WwTpP35zKxFs2M4TtiIaitpsS
         9ZGDXJmqNhy/YsqyTyngxd7PJkpwImrgVyYTbz96KOqHi3E+HbIYM77UJP+Zsq5XgyUu
         0y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254128; x=1793858928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SS52GwGtPgQJMNXeVyCJ967T+BzVWN2uQ6rGeseR4pQ=;
        b=r3sJuhP485ucxKl8C4hPh/q/kMLIjbkwKffySfYV7+08zRheU8lG9nIjnXFno7wlxX
         fZcbiZWEromFEqx6O2aPwQCBXdb+jGp6h5bE7Nwo2Xri0uWO8PEls31wNKQoBKk0Wd42
         8kYt5tsqTFOgqCIMIYsnBgSMmflK6/RT7mt9nxae+Xg3xwtm9ERrizSbWIkZomBaA4Zb
         ewvV6GPZjhCJvLP6TKEfoareVg5/SzXBaOE1aNU0lcQNxcloD0b4dhUZ6PoQMEmZDRGV
         RWnGTGk4Ol4zH7hV2lPJ6xfigJ6MWCVvSIWO8+DxnW+zlcb/g9k0jqEuuvco704RVbDS
         bCvA==
X-Gm-Message-State: AFq9FYLJiaskJvVIZcqRO/eiHmluQXbYTgUb+La1+TP6UxQynEJOkSZS
	9CsbDZ1gXZq5PCVROPzabWbAbQDIDMxWp0Izbmzr5UXJ7ALx7dfty+77ujhbPybf
X-Gm-Gg: AYBFou1PoMMEkZXt3ogXX0tMV3M7pss+aWGOJ5OV1v/CI24GJ8WpbZe6Jk2JXpjKpjK
	p9v88q02bSmelVpox2uE7tRohImJT1hmDuKSYIvueCnQCjoDFvFbpkX7aMZrfjjiFJn4akjbrUF
	C7MfTusdpyo/5eroJy49dIjCmJWJN1uuPe5niFuV9NSPydj8XFRSqVelRzI4WLn6XZTMHkWydXV
	bqZ/LI9fGP4f13jOKrRG1bbgdW8LT5/afwlXezwR1LOHdqOu4tsuQLzIhT3HBwhXz7JqtW8h1Vh
	5qUFiPVxBV1IoLrBCpFjUXYOYB/oN57SSwAVmCbC0gKEICVhrJ27i1/6R2h1O2+H278YTg/AdqX
	95P0QxvhdQxUTauxmOA4aVBZXu+c7fdIfbLeE9K106TuUk5rwaBqUsG3UrnDr2hzh5KfPe2G3kh
	ZBm7OLWYQBkRDrsuFsfFXkkmVDBpzl214jaQ9RWoQWaJioFBsltv6Jp348mexqc5U7S++2iWgxE
	l20SVGsI+y1y/LEg0X9cEbyS/pWh6sWuKixbgPlgWgHE98OYgcGYz2zRD/jzawHgMFxNYrRVV2a
	275dvxB7ekYsIho7L58PmGBrBRvt1Dh+HBU+XquV6cAKbEBjCOQGieOM6lnP7zQnIlRtQH2FiHw
	BHarMf31WfQ==
X-Received: by 2002:a05:7022:3a89:b0:1a9:b7f2:3015 with SMTP id a92af1059eb24-1a9b7f23dc1mr1782572c88.39.1793254128004;
        Wed, 28 Oct 2026 23:08:48 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aa2f100684sm2042714c88.3.2026.10.28.23.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:08:47 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH v2] kernel.bbclass: fix -dev files when KERNEL_PACKAGE_NAME is PN
Date: Thu, 29 Oct 2026 15:08:34 +0900
Message-Id: <20261029060834.1586465-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248899
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

