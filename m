Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4332.1630675506898010091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286E0D6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C838B3F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/14] shadow-sysroot: sync license with shadow
Date: Fri,  3 Sep 2021 14:24:54 +0100
Message-Id: <20210903132459.2560051-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe is just a single data file from shadow, but as we can't
easily tell what license that specific file is under just copy the full
license statement.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/re=
cipes-extended/shadow/shadow-sysroot_4.6.bb
index 1f6232e43c4..e05fa237a24 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Shadow utils requirements for useradd.bbclas=
s"
 HOMEPAGE =3D "http://github.com/shadow-maint/shadow"
 BUGTRACKER =3D "http://github.com/shadow-maint/shadow/issues"
 SECTION =3D "base utils"
-LICENSE =3D "BSD | Artistic-1.0"
+LICENSE =3D "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM =3D "file://login.defs_shadow-sysroot;md5=3D25e2f2de4df=
c8f966ac5cdfce45cd7d5"
=20
 DEPENDS =3D "base-passwd"
--=20
2.25.1

