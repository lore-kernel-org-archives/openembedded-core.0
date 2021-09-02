Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1736.1630599893937031671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81EAC1063
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D7703F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/14] wpebackend-fdo: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:35 +0100
Message-Id: <20210902162435.1375245-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-2-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb b/meta/rec=
ipes-sato/webkit/wpebackend-fdo_1.10.0.bb
index 4588ee10eaf..29ffb9091fe 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "WPE's backend based on a freedesktop.org sta=
ck."
 HOMEPAGE =3D "https://github.com/Igalia/WPEBackend-fdo"
 BUGTRACKER =3D "https://github.com/Igalia/WPEBackend-fdo/issues"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1f62cef2e3645e3e74eb05fd389d7=
a66"
 DEPENDS =3D "glib-2.0 libxkbcommon wayland virtual/egl libwpe libepoxy"
=20
--=20
2.25.1

