Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 67B1F7F7B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:22:29 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z3so19111225wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 09:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zRiLCgM0gYcAaCXc18hBw53erHxz4w3kWbst7X9tELo=;
	b=uHmjWqy13tzKa49hZ6dcscwer7drE+NvmfIPU3yiBrlhl8uGVlpDgvifoQ9Ep+PTHS
	iMXuUHtKdV/LXk4eh6NoTyExnjVq55JBAKcPhOyNcRO/XS4cyrpMnmSoHQy3x8FgjPWX
	VMZvVFxVcHdflrf5QdSbv4fBzVL6mtqFOQVeEPh5oaEMNBt300Qc0l2ncRHy1TAlmGFZ
	O/x70j9q93iXzjt66LFVU/jetz5hvIOJnsoWEH4c1yd7T5Mcp7ywkSv3BOj98Unb/hvc
	IHxZ7WTsz031AKpkXbHwN+f3NYRiYsVKVMMvqF+uvH8KO4s19AOsIXuwEaMa2JQmqnyA
	iW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zRiLCgM0gYcAaCXc18hBw53erHxz4w3kWbst7X9tELo=;
	b=R6/RUpk4uwuBLq72AlV4lawrUXif/oG/5/Vwf1Sic6C8gD4zrhdO7lro131uKxyFe6
	sPz0QA4IugRfjh/1T3crsY4LHoWppDkQgIO2Sd42YG9gdkqPmtBJ81pVcCxVu1+sM6TI
	hCfMmidpJCMG8wyvNUjStDPzxMRKX6srTL+EWBzPPLOEnJksgiZYfkv9YojvJYXNSlYj
	Cp2MM2XtDUEEm+mEz3H5tB2ogyTDxf/0dxaK9uhleqdei1nVClEusVARoNW5K/Sg7Dst
	d7L75uOeVfxu4YigEoSYR7Ap4bZ7ogDOlrN7iC9kcNewjSw2EwLbpX7azH+iGw5uCwa5
	oDVg==
X-Gm-Message-State: APjAAAVCSTELbM4XqIA5NaPWeVd3OmUcIoSzwGbZpQHpD4xF92BQWSrH
	Caw4oJRK6YWrMBb9CvUPgg8lXwwR
X-Google-Smtp-Source: APXvYqz6D2rvu13H/J+0OhZ/6YkWRs8YSYbmgCEmsvryqmUjumnc0r4NSuewpQAEXxnoyDXZI2D6yA==
X-Received: by 2002:adf:db86:: with SMTP id u6mr34406104wri.318.1574702549575; 
	Mon, 25 Nov 2019 09:22:29 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f140sm9693357wme.21.2019.11.25.09.22.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 09:22:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 18:22:20 +0100
Message-Id: <20191125172224.82269-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] u-boot: update to 2020.01-rc3 pre-release and drop py2 dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2019 17:22:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                   | 5 ++++-
 ...-boot-fw-utils_2019.10.bb => u-boot-fw-utils_2020.01.bb} | 0
 .../{u-boot-tools_2019.10.bb => u-boot-tools_2020.01.bb}    | 0
 meta/recipes-bsp/u-boot/u-boot.inc                          | 6 +++---
 .../u-boot/{u-boot_2019.10.bb => u-boot_2020.01.bb}         | 0
 5 files changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2019.10.bb => u-boot-fw-utils_2020.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2019.10.bb => u-boot-tools_2020.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2019.10.bb => u-boot_2020.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index c3e458e9251..a0f9c41469e 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,9 +10,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 PE = "1"
 
+# Drop this line when updating to 2020.01 final
+PV = "2020.01~rc3"
+
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "61ba1244b548463dbfb3c5285b6b22e7c772c5bd"
+SRCREV = "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.10.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2019.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 9a754fd09b0..55d8b478701 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -7,13 +7,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "kern-tools-native"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1
+inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native
 
-DEPENDS += "swig-native python-native"
+DEPENDS += "swig-native"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-EXTRA_OEMAKE += 'PYTHON2=nativepython STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
+EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
 
 PACKAGECONFIG ??= "openssl"
 # u-boot will compile its own tools during the build, with specific
diff --git a/meta/recipes-bsp/u-boot/u-boot_2019.10.bb b/meta/recipes-bsp/u-boot/u-boot_2020.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2019.10.bb
rename to meta/recipes-bsp/u-boot/u-boot_2020.01.bb
-- 
2.17.1


