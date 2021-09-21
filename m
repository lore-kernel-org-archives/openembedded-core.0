Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5354.1632216889334288387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 02:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05589113E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 02:34:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A462D3F719
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 02:34:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] shared-mime-info: use a more concise description
Date: Tue, 21 Sep 2021 10:34:43 +0100
Message-Id: <20210921093444.3709943-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For example we don't need to talk about historic build dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.b=
b b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 714aca62f0..b2b830cc1f 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Shared MIME type database and specification"
-DESCRIPTION =3D "The shared-mime-info package contains the core database=
 of common types and the update-mime-database command used to extend it. =
It requires glib2 to be installed for building the update command. Additi=
onally, it uses intltool for translations, though this is only a dependen=
cy for the maintainers."
+DESCRIPTION =3D "The shared-mime-info package contains the core database=
 of common types."
 HOMEPAGE =3D "http://freedesktop.org/wiki/Software/shared-mime-info"
 SECTION =3D "base"
=20
--=20
2.25.1

