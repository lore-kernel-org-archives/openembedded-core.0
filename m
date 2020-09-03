Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15445.1599143973256241852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 07:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B34461063
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 07:39:32 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56B7C3F71F
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 07:39:32 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] autoconf: consolidate DEPENDS
Date: Thu,  3 Sep 2020 15:39:25 +0100
Message-Id: <20200903143925.1076908-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903143925.1076908-1-ross.burton@arm.com>
References: <20200903143925.1076908-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Depending on nativesdk- varients in a nativesdk build isn't correct, so
just collapse the DEPENDS down and let bitbake do the right thing (which
is leaving them as -native).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-d=
evtools/autoconf/autoconf.inc
index fa28d2c9a3..787f30a097 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -5,9 +5,8 @@ file that lists the operating system features that the pa=
ckage can use, in the f
 LICENSE =3D "GPLv3"
 HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
 SECTION =3D "devel"
-DEPENDS +=3D "m4-native"
-DEPENDS_class-native =3D "m4-native gnu-config-native"
-DEPENDS_class-nativesdk =3D "nativesdk-m4 nativesdk-gnu-config"
+DEPENDS =3D "m4-native gnu-config-native"
+
 RDEPENDS_${PN} =3D "m4 gnu-config \
 		  perl \
 		  perl-module-bytes \
--=20
2.28.0

