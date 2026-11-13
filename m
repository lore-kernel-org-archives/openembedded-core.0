Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12350.1794579786464056653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:23:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=l+gnwE4B;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.46, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50737c64c8so17961066b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794579785; x=1795184585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qf2TpGNme2Fi35Zl6+3JCOeQRSL6Vm2R4JZLSI8c7aQ=;
        b=l+gnwE4B0A8s9X1rob0UxdNooUwuaNC+ut6wAyXgCZhktGtE8LFMojAC4zztFt4Z61
         Ftco6e3X/ActFF00YiGNAtQ4jDcpR1yAS37OCVMPEvCZV5om9HBkKySB2QjOlX3N0l2w
         PdMCZRXV781YWYbNpc4wuaFPRkmaQIIwrCzX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579785; x=1795184585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qf2TpGNme2Fi35Zl6+3JCOeQRSL6Vm2R4JZLSI8c7aQ=;
        b=byZsUbiJg0vNS1RarVw0Nm5jOjtTbJB5i8AkEM6rB+ZokNfYYbKSS+mIGVPs8qqzcb
         Rdz5jqIDpWOmOtKge3wSYzksqW9r40eU+ODhtP7Uf+pK0zT01oqzG8wyGbLmi2pTCUYp
         z8ruYzEHcaOh9WM0MMTTg/dxWmx3ZaIRdXJGMQG7HorZRZiV3PChhyvMgr2ECHBVYSql
         m/m34wmVi7mh7FoIdLfQVc2O7ApyfVYYp2hOvtZO5jbB3n8ftEJwORxb1kg260D99157
         5ZHYlEAtw8VJ58DiDH4Sb/Axq4OU0Kd2+dADID+PACBnzEqqLHVSD8hqX2tgOTiZcQud
         hUdA==
X-Gm-Message-State: APuU4Z/X16Iaxm7GxdhkMdqx4CF9woPb/aFSkCJF7QkKjaUwsymHSsrj
	xhN4AeYKzIaAhwMETr/Hc7Xm6BurAU93T/XgBRK7ytqlUyTebeDfqDwPGxOSPw05+UQtjXQcdow
	giI6AlXo=
X-Gm-Gg: AYBFou3OZkx5brLt1MWTlSDd49CgBbhZXz4gjMdutb9CUJn4w+iSea1knFhxz2D7z64
	5Ax26Iak1FRQQ6WTlhFkWq+FaWagsPEbgSICqn/AyZEjk8VSshYBtRb50+IYnsllPOWiLfGBGUN
	51XRV7LtthjRvJe05cuNW1mG6V9EAUljHK4XOHOSrSa/RFPVJMPDDFFIHbWU3rNr8/TlcyoWEyF
	d4ag6Qoa1oulnZmkfukbkAcqCLwUr91zd3E8lpvkx4CZ4j8Lch6w8EbEcey33ml3Urkn7q2XsPN
	XagrJtMBAdjgMrYEMXTzkQfhI3YeUCRXmr1HEb/Sw7IWcXjyyJ3IBUsXvpHxl/qUT5C9c+yOb/X
	AbjtP4OnII/R8PgiKcgZROpNVbfCZxPhvkZJ/GEE2KKdpJabpVPE+yyE25YgtnAIfONXuJUgCXO
	sQ7qrsBTmpmPuIVRxclN1bk166cez1KLAU0dfxPHlWrmVG+g0Cq2n9FLjchHcQfxwo64wnGU4Mw
	2o0DoyAjT/brO0GQr2iA87S/GsPxAUFtJXNWEnKOGpgR0BSsXaw6PhIKTGqUql3BFl/bE4Egfwz
	HO1tHnztT5mF3L8ohN+I3UxPHD0ya2h7l+BHzwsEWTuAZ//+Y86tXdqc5GAGI4NeeayZoX2dz8u
	kMrJ4yDuZS9fYxyFWGJsbQY5RA19E5agbFsxO/wOjFLOGT27IUpKYUzQGfPF6St7cBEbq4J7WSE
	n7AGZt4c3LzKimjlzGZycEZABHu3TtEO7LPHsnj/iudFF63yA+7+IPTKWfAe088BqZxUZEuDtrn
	9Ylhs3KAZcxhy0=
X-Received: by 2002:a17:907:76e1:b0:c50:a6c8:2606 with SMTP id a640c23a62f3a-c50a6c826c9mr118480666b.0.1794579784632;
        Fri, 13 Nov 2026 06:23:04 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.arnhem.chello.nl (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm104620666b.78.2026.11.13.06.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:23:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v14 4/5] libcomps: remove package
Date: Fri, 13 Nov 2026 15:22:57 +0100
Message-ID: <20261113142259.1708386-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113142259.1708386-1-adam.duskett@amarulasolutions.com>
References: <20261113142259.1708386-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250174
Content-Type: text/plain; charset="utf-8"

Only DNF4 was using libcomps.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...PYTHON_INSTALL_DIR-by-running-python.patch | 24 -------------------
 .../libcomps/libcomps_0.1.25.bb               | 23 ------------------
 3 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps_0.1.25.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6794761d54..76ccc2d7ed 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -326,7 +326,6 @@ RECIPE_MAINTAINER:pn-libcap-ng = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Venkata Adhitya Navuduri <venkata.navuduri@windriver.com>"
-RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libconfig = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
deleted file mode 100644
index 9e5e99be26..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 04c89e1af497514b6b7023620962cfb97e752cc9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libcomps/src/python/src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index 6d3d4c0..396c725 100644
---- a/libcomps/src/python/src/CMakeLists.txt
-+++ b/libcomps/src/python/src/CMakeLists.txt
-@@ -78,7 +78,7 @@ IF (SKBUILD)
-     INSTALL(FILES libcomps/__init__.py DESTINATION libcomps)
-     INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps)
- ELSE ()
--    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- 
-     INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
-     INSTALL (TARGETS pycomps LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.25.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.25.bb
deleted file mode 100644
index 47bcd078a1..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.25.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Libcomps is alternative for yum.comps library (which is for managing rpm package groups)."
-HOMEPAGE = "https://github.com/rpm-software-management/libcomps"
-DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pure C as library and there's bindings for python2 and python3."
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;tag=${PV};protocol=https \
-           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           "
-
-SRCREV = "08340d1783f3b1f064fa08264b5d25706e3bb7ea"
-
-inherit cmake setuptools3-base
-
-DEPENDS = "expat libxml2 zlib"
-
-EXTRA_OECMAKE = "-DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
-                 -DENABLE_DOCS=OFF \
-                 -DENABLE_TESTS=OFF"
-
-OECMAKE_SOURCEPATH = "${S}/libcomps"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.56.1

