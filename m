Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A440FC433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 01:40:29 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.1625.1643334028721801022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 17:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id ABA6720B6C61;
	Thu, 27 Jan 2022 17:40:27 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ABA6720B6C61
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] newlib: Upgrade 4.1.0 -> 4.2.0
Date: Thu, 27 Jan 2022 18:40:22 -0700
Message-Id: <20220128014022.3144694-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 01:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161064

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../newlib/{libgloss_4.1.0.bb =3D> libgloss_4.2.0.bb}  |  0
 meta/recipes-core/newlib/newlib.inc                  | 12 +++++++++---
 .../newlib/{newlib_4.1.0.bb =3D> newlib_4.2.0.bb}      |  0
 3 files changed, 9 insertions(+), 3 deletions(-)
 rename meta/recipes-core/newlib/{libgloss_4.1.0.bb =3D> libgloss_4.2.0.b=
b} (100%)
 rename meta/recipes-core/newlib/{newlib_4.1.0.bb =3D> newlib_4.2.0.bb} (=
100%)

diff --git a/meta/recipes-core/newlib/libgloss_4.1.0.bb b/meta/recipes-co=
re/newlib/libgloss_4.2.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/libgloss_4.1.0.bb
rename to meta/recipes-core/newlib/libgloss_4.2.0.bb
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
index 23cd172008..5e488d0848 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -15,13 +15,19 @@ LIC_FILES_CHKSUM =3D " \
 		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=3D73640207fbc79b=
198c7ffd4ad4d97aa0 \
 		"
=20
-SRC_URI =3D "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "f296e372f51324224d387cc116dc37a6bd397198756746f9=
3a2b02e9a5d40154"
+# Newlib maintainers sometimes publish the source
+# from a specific snapshot, after an upgrade we can
+# delete the following line and keep the empty default
+NEWLIB_SNAPSHOT =3D ".20211231"
+NEWLIB_SNAPSHOT ?=3D ""
+SRC_URI =3D "https://sourceware.org/pub/newlib/newlib-${PV}${NEWLIB_SNAP=
SHOT}.tar.gz"
+SRC_URI[sha256sum] =3D "c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d1398676073=
69cb2915ffc54435"
+
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
=20
-S =3D "${WORKDIR}/newlib-${PV}"
+S =3D "${WORKDIR}/newlib-${PV}${NEWLIB_SNAPSHOT}"
 B =3D "${WORKDIR}/build"
=20
 ## disable stdlib
diff --git a/meta/recipes-core/newlib/newlib_4.1.0.bb b/meta/recipes-core=
/newlib/newlib_4.2.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/newlib_4.1.0.bb
rename to meta/recipes-core/newlib/newlib_4.2.0.bb
--=20
2.25.1


