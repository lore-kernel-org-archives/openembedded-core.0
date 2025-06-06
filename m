Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935D1C67861
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:28:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.34911.1749220116508277914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28889152B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 977F53F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 16/16] xinput-calibrator: upgrade to 0.8.0
Date: Fri,  6 Jun 2025 15:28:21 +0100
Message-ID: <20250606142822.3387675-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606142822.3387675-1-ross.burton@arm.com>
References: <20250606142822.3387675-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218157

Development has moved to freedesktop.org, so switch SRC_URI.

Drop an upstreamed patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ....hh-Include-string-to-get-std-string.patch | 28 -------------------
 ...ibrator_pointercal.sh-to-be-run-as-n.patch |  2 +-
 ...ator_git.bb =3D> xinput-calibrator_0.8.0.bb} | 10 ++-----
 3 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibr=
ator/0001-calibrator.hh-Include-string-to-get-std-string.patch
 rename meta/recipes-graphics/xinput-calibrator/{xinput-calibrator_git.bb=
 =3D> xinput-calibrator_0.8.0.bb} (78%)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/00=
01-calibrator.hh-Include-string-to-get-std-string.patch b/meta/recipes-gr=
aphics/xinput-calibrator/xinput-calibrator/0001-calibrator.hh-Include-str=
ing-to-get-std-string.patch
deleted file mode 100644
index 37617600d5d..00000000000
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-cali=
brator.hh-Include-string-to-get-std-string.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 79bc507b48d4acd3dec8a85ab6b341b872d44a05 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Jan 2019 22:40:24 -0800
-Subject: [PATCH] calibrator.hh: Include <string> to get std::string
-
-Found with libc++
-
-Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pu=
ll/76]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/calibrator.hh | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/calibrator.hh b/src/calibrator.hh
-index a6f9504..e75bcef 100644
---- a/src/calibrator.hh
-+++ b/src/calibrator.hh
-@@ -29,6 +29,7 @@
- #include <X11/Xlib.h>
- #include <stdio.h>
- #include <vector>
-+#include <string>
-=20
- // XXX: we currently don't handle lines that are longer than this
- #define MAX_LINE_LEN 1024
---=20
-2.20.1
-
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Al=
low-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch b/meta/recipes-g=
raphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_point=
ercal.sh-to-be-run-as-n.patch
index de0862599d7..86982924a81 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xin=
put_calibrator_pointercal.sh-to-be-run-as-n.patch
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xin=
put_calibrator_pointercal.sh-to-be-run-as-n.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Inactive-Upstream [last commits over a decade ago]
+Upstream-Status: Pending
=20
 From 14734a93bd3fc323325459e24b04795422e395e6 Mon Sep 17 00:00:00 2001
 From: Laurentiu Palcu <laurentiu.palcu@intel.com>
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_gi=
t.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
similarity index 78%
rename from meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git=
.bb
rename to meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0=
.bb
index 0516928a76b..c37b36897b6 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
@@ -4,22 +4,18 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=3D22;md5=3D1bcba=
08f67cdb56f34021557898e4b5a"
 DEPENDS =3D "virtual/libx11 libxi libxrandr"
=20
-PV =3D "0.7.5+git"
-
 inherit autotools pkgconfig features_check
-# depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRCREV =3D "18ec53f1cada39f905614ebfaffed5c7754ecf46"
-SRC_URI =3D "git://github.com/kreijack/xinput_calibrator.git;branch=3Dli=
binput;protocol=3Dhttps \
+SRCREV =3D "970b574b8f7b0d6f2613d343191f47814f2dfaa4"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/xorg/app/xinput-calibrator;pro=
tocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV} \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.p=
atch \
-           file://0001-calibrator.hh-Include-string-to-get-std-string.pa=
tch \
            "
=20
 S =3D "${WORKDIR}/git"
=20
-# force native X11 ui as we don't have gtk+ in DEPENDS
 EXTRA_OECONF +=3D "--with-gui=3Dx11"
=20
 do_install:append() {
--=20
2.43.0


