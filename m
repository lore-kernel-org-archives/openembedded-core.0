Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12471.1795767410039948984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 00:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Hzxz+229;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso55785965e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 00:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795767408; x=1796372208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SA/cEw4x420r6T6Q4P5jjSO5sbX+G9Sd4hVQPn9uhIU=;
        b=Hzxz+2294b62QY2NfcD4GyyHHqETg7dradEV1K1jY2kvYWGeBYqSnJYeP42uuLmSmO
         isYvuzHqY3OOjP1gvYg9nEC4QO06nBnw53ZnN2DMiW61TVEPQyB4gJEZjvqcJBGCF25w
         5iy/BV+Os0PCu/q7Wt8yAyB5gimuKB3yYmM/HryTe7M7RjG3XIKZ+2NSob+u4I1+6lrS
         50DoixUdz9NtCqFCmdmXCxC4UaBs06OBGQBz7+CFYhMg7KtNRtS4N6XxcMqyzWAtp6uV
         y4k1u54C6jYHqBbGZKhWVghMrWPugM83YerJAJePkpkinXEJi93eHF07WGoEJ+j8JnnM
         zbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795767408; x=1796372208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SA/cEw4x420r6T6Q4P5jjSO5sbX+G9Sd4hVQPn9uhIU=;
        b=DejaF4NPIHWR8QOAbrF7EjALsYqp5rj8AAqtXVFbrSMrQwNHGdoh6keOkmllYxawBk
         LN9I0gLiubEoxAIktXFRks4Nc9nh5waQP+BVvj1H9dFRh5RnFI2pMT9jB2p/FQr7yWX/
         1tMMObpSMCsluZ1pAS9nKGvQZijLAlj2OuSfOdQuGbNbh5Ol/aduMxeRGwzFH1F3roec
         4LVTRBgeNOQNW4zofaGoSXpXw6nJcTNqpf0NcR4cjN7SgyCf/XLL1VLikhHX3tSk54WQ
         CNQHKNtREBjamWxG9OcY+71rVBsFzHbl+Yr5m4NkN9s4jDpFxzpSwgsZOLQpaRjge9Z8
         8xdw==
X-Gm-Message-State: APuU4Z8Aj07zfHrUSF661PQAoJ2KSuz6hsRuW6TpmEOn8bSCJcnBb9WT
	0UdQmN9iDl13iLf+il6GC11T6DWnIYMt8/HqTesrow+oVlXRC3HJ+zq8ja01zw==
X-Gm-Gg: AZFdTZd+N7czgD0h7ACr+GWd/3Lu1FEFyGuhoOc+OztssBIczd35R1Aq14nn59q8DPz
	xX0B49qJNx7ncejOuui3AiiQ77n34aW5NZOGx9P/bCPYWTUPEipfYMG2MnDmstYo1v8SDUmecAf
	EA8zxnLD4P9rcztp6KVuEWN0jDceL7p5WZTC4tJnwMnoRDTq0GBH9C9Kd7W5ztyButPfc8lMoK8
	lCrlYhBI1hRcIsUPebESiWC6v0XTn0BLR3Ns4uJMJzab51Dm+hamjX+3P016fmwQOJ2Pv3cUyXO
	NQWhtgclG9UYXuhu0GFPsGeI4ZpgTfe3zHiB4+xIr/2USgWdFwV+A1nSgNW/9CFQSrIrTasdMlP
	mNQTlJTiQLH0UFVRghcUFT3OyvP32zxDv1lHAv52BPIydWaL0cn2/L+ENfLpUbwSWKUDc7L+etp
	3oUaWEEOZIP1eyAlGyoK9v6nSBOcJQ7+KE/opsLW5xiBaIE70Cus+ce/EzZxeaabygUIcBHzNPP
	5KnZCUg8GXa9rHuBNuBV8XNfPCQyP/dlwWgDkDqgti1UY7QDqppe1/2UGlj0KL2S3WLAXrh3Fai
	09QHeaLY3irnex1A90cOvXfmviE6ZuKqF5/KKTvnLqWRxN9YMVNDRWz1I1sP6vB5y1cvd9Ig1lT
	MrMMWvHS8Torzig==
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id 5b1f17b1804b1-4bb88810708mr537629475e9.15.1795767408055;
        Fri, 27 Nov 2026 00:16:48 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm658920475e9.1.2026.11.27.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:16:47 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-core][PATCH] shadow: split the subordinate id tools into shadow-uidmap and libsubid
Date: Fri, 27 Nov 2026 08:16:26 +0000
Message-ID: <20261127081625.2560320-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 08:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251354
Content-Type: text/plain; charset="utf-8"

An image that needs unprivileged user namespaces - a container runtime,
a sandbox - needs only newuidmap and newgidmap with /etc/subuid and
/etc/subgid. Installing shadow for them also installs passwd, chsh,
chfn, chage and gpasswd, all setuid root, and on a read-only rootfs it
means taking shadow off ROOTFS_RO_UNNEEDED, which keeps all of them.

Package them as Debian does: newuidmap, newgidmap, getsubids and the
id-range files as shadow-uidmap, and libsubid, which only getsubids
links, as a library package of its own. libsubid keeps its name rather
than taking the soname-versioned one, so that ROOTFS_RO_UNNEEDED can
name it. shadow RDEPENDS on shadow-uidmap, so installing shadow is
unchanged.

A read-only rootfs removes packages without their dependencies, so both
join ROOTFS_RO_UNNEEDED; without that they would outlive shadow there
and leave two setuid binaries in images that have none today. An image
that wants them on a read-only rootfs installs shadow-uidmap and takes
both off that list.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes-recipe/image.bbclass             |  2 +-
 meta/recipes-extended/shadow/shadow_4.20.3.bb | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 1e3c784ec930..12c0478f1cc5 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -50,7 +50,7 @@ IMAGE_INSTALL_DEBUGFS ?= ""
 
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
-ROOTFS_RO_UNNEEDED ??= "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
+ROOTFS_RO_UNNEEDED ??= "update-rc.d base-passwd shadow shadow-uidmap libsubid ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
diff --git a/meta/recipes-extended/shadow/shadow_4.20.3.bb b/meta/recipes-extended/shadow/shadow_4.20.3.bb
index 683a284aad13..c1e621288ac3 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.3.bb
@@ -174,7 +174,7 @@ do_install:append:class-target() {
 	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
 }
 
-PACKAGES =+ "${PN}-base"
+PACKAGES =+ "${PN}-base ${PN}-uidmap libsubid"
 FILES:${PN}-base = "\
     ${base_bindir}/login.shadow \
     ${base_bindir}/su.shadow \
@@ -186,6 +186,21 @@ FILES:${PN}-base = "\
 "
 RDEPENDS:${PN} += "${PN}-base"
 
+# The subordinate id tools, on their own for images that need user namespaces
+# without the rest of shadow's setuid tools - Debian's uidmap and libsubid.
+FILES:${PN}-uidmap = "\
+    ${bindir}/newuidmap \
+    ${bindir}/newgidmap \
+    ${bindir}/getsubids \
+    ${sysconfdir}/subuid \
+    ${sysconfdir}/subgid \
+"
+RDEPENDS:${PN} += "${PN}-uidmap"
+
+FILES:libsubid = "${libdir}/libsubid.so.*"
+# A stable name, so ROOTFS_RO_UNNEEDED can list it across soname bumps.
+DEBIAN_NOAUTONAME:libsubid = "1"
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "200"
