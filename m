Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1618.1630599888277276065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E63101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1499C3F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] webkitgtk: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:33 +0100
Message-Id: <20210902162435.1375245-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-2-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.32.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.32.3.bb
index c30bdf3428d..1f3f7a9c00a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "WebKit web rendering engine for the GTK+ pla=
tform"
 HOMEPAGE =3D "https://www.webkitgtk.org/"
 BUGTRACKER =3D "https://bugs.webkit.org/"
=20
-LICENSE =3D "BSD & LGPLv2+"
+LICENSE =3D "BSD-2-Clause & LGPLv2+"
 LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c=
6d6397a5d84286dda758da57bd691 \
                     file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082=
c40bcf298c285f8bab0b12 \
 		    file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b2494=
445b79d21 \
--=20
2.25.1

