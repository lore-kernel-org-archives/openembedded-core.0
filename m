Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3770.1793241621223711176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 19:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=A9iCLA8K;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1409751a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793241620; x=1793846420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQKNx/4yg6jMu+GLzIcz1RO9OU1GOGEq/wrBqL6+YxM=;
        b=A9iCLA8KHt2Ugqndj0UD7+KljclZ+0NWoxbqC9DyyrLVo6dv7k2C/o0QLOSOjiCbZp
         MniuvvFmyYFRVAEeRducGsa7ywKOrsPvMkmV4GkPOlqdcw65DSmEfWn/51Za81MqnPhh
         x/F3XOixx1qV7IpIV6cVZfR7L6S6+d+lz8fBZGorOj8u7wjBcTwT8LLZuVObLAnSAt45
         TQEGpe1xWFxBAeBe/Z0B+1cDTVP+Gy1+kQJtASr2FANtciVYF95rMKffu47rw1ejlPG0
         j0OSLlsDIEbUUvKVEWensNrtZ/LQ3z0WJi+4HRdO3Mm6jGpzhpsG7tfsGW1nzFIghSoK
         7cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793241620; x=1793846420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQKNx/4yg6jMu+GLzIcz1RO9OU1GOGEq/wrBqL6+YxM=;
        b=BRTbSC1vYWHpkzsDuNMbNLtKCserEjWS00sJ4wZnCOAOZgb4PY4VG1/mOmjfFffb2S
         bqZhwTu5P6boD0w4W/Y1lQ7MpXo5x1iM2weq1cR7kJZidSidvWlEQlwglqPiSIOUwOiv
         l+vZdtVESISrQ+lf0ISpjg2EtwOtbBaxI922Ie206OFifAkmBUijPJ3yjdgceIC6x+of
         D5xbt9psNihorfqXpLHpYowiLZoWoFUm7IsAqc0VC20qbv33QpIteTBX4VOQmFpoXYGt
         TTINx5tXcC7strAlVBRTTwxoDqkcpEQs7ABA0F9TO+PkWDQXR6/nQ2SfgJtYBy/fTFfg
         1ePQ==
X-Gm-Message-State: AFq9FYLhTFc/Wrgc4KM0nTGXi2orXtpNnWFd09o0nkmdWR7xAo4Yu6tc
	e3MkqEORdJdq+QUJJzmNDTwiZxBkb8Hrf+JQ02IPJHMqwj778CLg9RFcmG/vkGXs
X-Gm-Gg: AYBFou3nclBGq5WoyiB50014si3GWhwHXEiRHvH5qHAfrezs+ykuc07bnOzALhR8XiQ
	XiLyamifvyaKoTRL1h2I9p8d/VHixWUY0EcNap9sfl3y5xkXsxFSnsdqcFIAJlA61Qr5wBdV7F2
	Jtzq4+JwX9SJR3/QcQ2G5buVcD6MDL/L8faa08OjNPGgCjS6bLXW0dORJwPX0QP2honIoarQWhK
	DtmteVS9ZZONsXuseGpts9UAwM+NNix2BzeJhuHKvnuoyR4/IINiB4NK7Qe6mdw960Z7qULrRX5
	Jagct8uHgdrEVAAQSrCxt1H5uBkxmQ77yfa+zmmkzWANNFSEoSyVdH+Mnu5K2GHdMsEsy4dLJmS
	ZcEzgj5SD0+uE5a+275Jq1rUwV3P+dLU9+j2b1H2CdRfZqyUxXQEvFg9gMkN5Qi9V1wIew0IRwF
	pQk3vHooefHpzPDSqePZK/c9NPB+YPZ+VdF2WI7gKN9cSNaUFwv7lH0nYZbqsic+3yAY0Ga1R5R
	mjPRUupYRRj9dHezQQI4cqeKZauOxzibxzo3K8Q5AbiL4MsEW4vH+d1j5x12Y0tyKrukg1v4Ofi
	Tx2gHz26YS+qo76F3kLZFxNAb3/o7g0cM1lgL1n3ugntXcrcjP27c2V1HdZSRWjA
X-Received: by 2002:a17:90b:2e48:b0:3ac:af8b:6f4 with SMTP id 98e67ed59e1d1-3ae58287a6fmr3355960a91.37.1793241620568;
        Wed, 28 Oct 2026 19:40:20 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm1823761a91.1.2026.10.28.19.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:40:19 -0700 (PDT)
From: "prasanth" <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH] kernel.bbclass: fix -dev files when KERNEL_PACKAGE_NAME is PN
Date: Thu, 29 Oct 2026 11:40:10 +0900
Message-Id: <20261029024010.2113092-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248901
Content-Type: text/plain; charset="utf-8"

With KERNEL_PACKAGE_NAME = "${PN}", FILES:${KERNEL_PACKAGE_NAME}-dev and
FILES:${PN}-dev from bitbake.conf become the same variable and the
bitbake.conf value wins. The same happens for -dbg. The kernel files are
then not packaged and do_package fails:

  ERROR: linux-yocto-7.2.8+git-r0 do_package: QA Issue: linux-yocto:
  Files/directories were installed but not shipped in any package:
    /boot/System.map-7.2.8-yocto-standard
    /boot/config-7.2.8-yocto-standard
    /boot/Module.symvers-7.2.8-yocto-standard

This matters when a second kernel recipe. So, Rename the kernel variables
to the ${PN} names before the keys are expanded, so the kernel values are kept.

Remove the old warning about bug 11905, which was closed as not a bug.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

Notes:
    Tested on master: without this patch do_package fails with the
    QA error above; with it the build passes with no warnings and linux-yocto-dev
    contains System.map, Module.symvers and the config.

 meta/classes-recipe/kernel.bbclass | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754108..b018c164fd 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -60,16 +60,23 @@ KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
 KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
+# With KERNEL_PACKAGE_NAME = "${PN}", FILES:${PN}-dev/-dbg from bitbake.conf
+# would replace the kernel values during key expansion, so rename the kernel
+# variables to the ${PN} names first.
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

