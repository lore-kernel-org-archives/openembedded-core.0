Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.11950.1589544775482076084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 05:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04FCCrfa024513
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 05:12:54 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 05:12:53 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] lttng-modules: upgrade to 2.12.0
Date: Fri, 15 May 2020 15:11:03 +0300
Message-ID: <20200515121106.27860-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Upgrade lttng-modules 2.11.2 -> 2.12.0.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../{lttng-modules_2.11.2.bb => lttng-modules_2.12.0.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.12.0.bb} (88%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb
similarity index 88%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb
index 6fff096a37..f706f89621 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
-SRC_URI[sha256sum] = "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e21604c35a51a6441d"
+SRC_URI[md5sum] = "be252df5013ea03894921d0b493c7b6c"
+SRC_URI[sha256sum] = "efeb2ae60e96dbe9a9b342d3a80dfc7642f06a8c09686089d491ad696bb98f4d"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
@@ -33,11 +33,11 @@ python do_package_prepend() {
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.12 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 SRCREV_class-devupstream = "17c413953603f063f2a9d6c3788bec914ce6f955"
-PV_class-devupstream = "2.11.2+git${SRCPV}"
+PV_class-devupstream = "2.12.0+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.17.1

