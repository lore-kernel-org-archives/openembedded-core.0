Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15532.1599143972879257123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 07:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D69B1045
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 07:39:32 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5EDE3F71F
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 07:39:31 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] autoconf: consolidate SRC_URI
Date: Thu,  3 Sep 2020 15:39:24 +0100
Message-Id: <20200903143925.1076908-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's no point splitting SRC_URI between the .inc and the .bb when
there's just one recipe and the splitting appeared to be arbitrary.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc   |  5 ----
 .../autoconf/autoconf_2.69.bb                 | 25 +++++++++++--------
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-d=
evtools/autoconf/autoconf.inc
index 2c87bf8296..fa28d2c9a3 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -62,11 +62,6 @@ RDEPENDS_${PN}_class-nativesdk =3D "\
 		  nativesdk-perl-module-threads \
                   "
=20
-
-
-SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
-	   file://program_prefix.patch"
-
 inherit autotools texinfo
=20
 PERL =3D "${USRBINPATH}/perl"
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.69.bb
index 8e67f4b829..2e1b9bdc90 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -5,17 +5,20 @@ PR =3D "r11"
 LICENSE =3D "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
 		    file://COPYINGv3;md5=3Dd32239bcb673463ab874e80d47fae504"
-SRC_URI +=3D "file://check-automake-cross-warning.patch \
-	    file://autoreconf-exclude.patch \
-	    file://autoreconf-gnuconfigize.patch \
-            file://config_site.patch \
-            file://remove-usr-local-lib-from-m4.patch \
-            file://preferbash.patch \
-            file://autotest-automake-result-format.patch \
-            file://add_musl_config.patch \
-            file://performance.patch \
-            file://AC_HEADER_MAJOR-port-to-glibc-2.25.patch \
-            file://autoconf-replace-w-option-in-shebangs-with-modern-use=
-warnings.patch \
+
+SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
+           file://program_prefix.patch \
+           file://check-automake-cross-warning.patch \
+           file://autoreconf-exclude.patch \
+           file://autoreconf-gnuconfigize.patch \
+           file://config_site.patch \
+           file://remove-usr-local-lib-from-m4.patch \
+           file://preferbash.patch \
+           file://autotest-automake-result-format.patch \
+           file://add_musl_config.patch \
+           file://performance.patch \
+           file://AC_HEADER_MAJOR-port-to-glibc-2.25.patch \
+           file://autoconf-replace-w-option-in-shebangs-with-modern-use-=
warnings.patch \
            "
=20
 SRC_URI[md5sum] =3D "82d05e03b93e45f5a39b828dc9c6c29b"
--=20
2.28.0

