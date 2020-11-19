Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7586.1605782296869455074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A7331509
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06CB13F718
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:15 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] sqlite3: add CVE-2015-3717 to whitelist
Date: Thu, 19 Nov 2020 10:38:11 +0000
Message-Id: <20201119103813.2726273-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119103813.2726273-1-ross.burton@arm.com>
References: <20201119103813.2726273-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As per https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA this issue
is believed to be either iOS specific, or fixed in 3.8.9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/sqlite/sqlite3_3.33.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recipes=
-support/sqlite/sqlite3_3.33.0.bb
index 611a1bd923a..33f041a161d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] =3D "106a2c48c7f75a298a7557bcc0d5f4f45=
4e5b43811cc738b7ca294d695
=20
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST +=3D "CVE-2019-19242"
+# This is believed to be iOS specific (https://groups.google.com/g/sqlit=
e-dev/c/U7OjAbZO6LA)
+CVE_CHECK_WHITELIST +=3D "CVE-2015-3717"
--=20
2.25.1

