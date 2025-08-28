Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351DCCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:18:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.4518.1756405071862424458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAK5sKY2;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78ead12so204115866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756405070; x=1757009870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pbf//fooEx1R2d5zRcoYDT11pIixosINfvSze3ZijXw=;
        b=dAK5sKY2w4j8/z59Zk8sPLx2JA1CdgvbbIHvwFK2fDe5gwdpT+9rtlj4DIPUCM/6RO
         TM+UuUCrmHI591pq8kHlKP4d9cTFIuGjqAgQ0tr8bLxedZ8NQg9O1jttMEZ65QNUR+Jm
         2XcRVaNgaudAcfWjTxh7gdQ2zsgnBVq7Obh1nyS6DDfmLW19WW/QAMim84XYRTPltSs9
         UkvjdybgUHnyA9mfTQrFVohcYyjstU2z4oADez1nWFQOFnAMURgz1YAHAvkJIwWVGpsn
         sjwW0t+eV2LW/kACQyiN5ehk5vLO9t9DwLWIuE770IMqefeXFGK5Kvoqbi7MNGOG3W+h
         oiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756405070; x=1757009870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pbf//fooEx1R2d5zRcoYDT11pIixosINfvSze3ZijXw=;
        b=D3KYo7AB5PbhbVI6qDtKqSlSTC6Ej1A1japDT12AA7LvcU1YSaDboIh0G5vFhCrSFY
         0CRUJdIBMOtG4D/FcAepppVAFUXYXy7r1hAtdJFNdN57ubK4p3/6e+8zUGQm02ak0seU
         tb27gSwj0gN+hSVEYsSu8yiizuK7pHnmZuQcUGi3bUEnc5CgYsxWqch9AmIjj6C7l4OO
         EbVnZVPy4rdX/1E3weTx+n731NbRa8kxwXANqVqygCBTtSWeN/cFqVR5JoiuWEL2hNvY
         8/r8npOKXHdUVwN1ho0aFeZz58SdyfCiUVDXc7iUeDdYiTar8H6yy7ZWrQuhRagSQ2xF
         k73Q==
X-Gm-Message-State: AOJu0Yx8/R6s5vz1Jy1rCB8a2/t+8cfV02G7mcyPjaoELH39gAsnlfi/
	WVOPjd1dgHIRJWIQzC7BC0Fb4zyvKuJkEUHuCWMMUhl8eUE4ikUar+AGSnue7g==
X-Gm-Gg: ASbGnct0ksM12acdzz8DREt29wPaQRfKNZUIyWkFycBUgXc/hYQzIPqjsdjUqzsTRkr
	fLriZA+Mkxjkb4YKmugRCrxA1U5euAFCEgX9cHoQW+279t7dMJrovuhD050rIibJ+cbkzdfdGOr
	HF1ks6FyubM1+/6nIgIuSKiAXeDGmUCaQ8T+Q4tdM0tHhPaXuJpRHrOeVV70c7lw7x6VH+PRMlR
	+2wNp/epVJmR6g/gqyU9wXeiPjAkaI4tzO4VlLRhrEW4M2/KJ4Eea7iKUbL2uA0Tq1qjsBNArrX
	BYC6oGJXtJsmhqUO6dGGzr3JMidwjpBLAjsKj0ZKsbUoQEtpT8/37BqVATdAmj6oRUQuC46Gpz6
	NRHbkoeABZd5y+xoQ/4FL
X-Google-Smtp-Source: AGHT+IEw5e6XILH8INhPowQcZnUAgM5GhDqRAHDxz5NWMWEhaCg+hM4xWQjWRsqEm6ZMF7wMKSY5Vw==
X-Received: by 2002:a17:906:66c5:b0:afe:98cb:e624 with SMTP id a640c23a62f3a-afe98cbeaa7mr918346066b.51.1756405070025;
        Thu, 28 Aug 2025 11:17:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefc7edb6fsm15096366b.18.2025.08.28.11.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 11:17:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xf86-input-vmmouse, xf86-input-mouse: drop recipes
Date: Thu, 28 Aug 2025 20:17:48 +0200
Message-ID: <20250828181748.1120821-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222592

xf86-input-mouse has dropped Linux support[1], so drop the obsolete
recipe. Only xf86-input-vmmouse is dependent on this recipe, so drop
that also. Could not find recipes depending on on xf86-input-vmmouse.

[1]: https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/commit/d719d0588c580ac0ffb8546e864c05c521b1ab9d

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 --
 .../xorg-driver/xf86-input-mouse_1.9.5.bb     | 14 ----------
 .../xorg-driver/xf86-input-vmmouse_13.2.0.bb  | 27 -------------------
 3 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.2.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a875ce8176..8f23091256 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -904,9 +904,7 @@ RECIPE_MAINTAINER:pn-xev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xeyes = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-evdev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-libinput = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xf86-input-mouse = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-synaptics = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xf86-input-vmmouse = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-video-cirrus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-video-fbdev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-video-intel = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
deleted file mode 100644
index 92e54d9701..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- mouse input driver"
-
-DESCRIPTION = "mouse is an Xorg input driver for mice. The driver \
-supports most available mouse types and interfaces.  The mouse driver \
-functions as a pointer input device, and may be used as the X server's \
-core pointer. Multiple mice are supported by multiple instances of this \
-driver."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d213a69053dffe9bcab94abf60013d33"
-
-SRC_URI[sha256sum] = "4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968"
-XORG_DRIVER_COMPRESSOR = ".tar.xz"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.2.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.2.0.bb
deleted file mode 100644
index 7567b1ef2b..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.2.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- VMWare mouse input driver"
-DESCRIPTION = "The vmmouse driver enables support for the special VMMouse \
-protocol that is provided by VMware virtual machines to give absolute \
-pointer positioning. The vmmouse driver is capable of falling back to the \
-standard 'mouse' driver if a VMware virtual machine is not detected."
-
-XORG_DRIVER_COMPRESSOR = ".tar.xz"
-
-SRC_URI[sha256sum] = "56f077580ab8f02e2f40358c5c46b0ae3e1828fc77744526b24adf1ceea339b8"
-
-RDEPENDS:${PN} += "xf86-input-mouse"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=622841c068a9d7625fbfe7acffb1a8fc"
-
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-
-do_install:append () {
-	# We don't care about hal
-	rm -rf ${D}${datadir}/hal/
-	rm -rf ${D}${libdir}/hal/
-}
-
-EXTRA_OECONF = "--with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
-
-FILES:${PN} += "${datadir}/X11/xorg.conf.d"

