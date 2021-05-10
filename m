Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.29986.1620643725002996705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 03:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E49A1691
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:48:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 407D13F719
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:48:44 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] builder: whitelist CVE-2008-4178 (a different builder)
Date: Mon, 10 May 2021 11:48:40 +0100
Message-Id: <20210510104840.515815-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510104840.515815-1-ross.burton@arm.com>
References: <20210510104840.515815-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-=
graphics/builder/builder_0.1.bb
index 0a64c31ab3c..9d5cd8cde6c 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,3 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_sessi=
on.sh
 }
=20
+# -4178 is an unrelated 'builder'
+CVE_CHECK_WHITELIST =3D "CVE-2008-4178"
--=20
2.25.1

