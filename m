Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5382.1632216890203212742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 02:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B41711B3
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 02:34:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36B523F719
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 02:34:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libsoup-2.4: remove obsolete intltool dependency
Date: Tue, 21 Sep 2021 10:34:44 +0100
Message-Id: <20210921093444.3709943-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921093444.3709943-1-ross.burton@arm.com>
References: <20210921093444.3709943-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This hasn't been needed since libsoup 2.65.2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.72.0.bb
index 3149896466..e888202b77 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
@@ -7,7 +7,7 @@ SECTION =3D "x11/gnome/libs"
 LICENSE =3D "LGPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2"
=20
-DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native li=
bpsl"
+DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
--=20
2.25.1

