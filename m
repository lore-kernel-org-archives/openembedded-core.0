Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11376.1603107594862796848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 04:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D1BB30E
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 04:39:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 476F33F719
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 04:39:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/install-buildtools: Update to 3.2 M3 buildtools
Date: Mon, 19 Oct 2020 12:39:47 +0100
Message-Id: <20201019113947.2706664-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 7118f48be9..8554a5db67 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,9 +57,9 @@ logger =3D scriptutils.logger_create(PROGNAME, stream=3D=
sys.stdout)
=20
 DEFAULT_INSTALL_DIR =3D os.path.join(os.path.split(scripts_path)[0],'bui=
ldtools')
 DEFAULT_BASE_URL =3D 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE =3D 'yocto-3.2_M1'
+DEFAULT_RELEASE =3D 'yocto-3.2_M3'
 DEFAULT_INSTALLER_VERSION =3D '3.1+snapshot'
-DEFAULT_BUILDDATE =3D '20200617'
+DEFAULT_BUILDDATE =3D '20200923'
=20
 # Python version sanity check
 if not (sys.version_info.major =3D=3D 3 and sys.version_info.minor >=3D =
4):
--=20
2.25.1

