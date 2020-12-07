Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8198.1607356453837355809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 07:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1281D101E
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Dec 2020 07:54:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1E0C3F68F
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Dec 2020 07:54:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] coreutils: add SUSE-specific issues to CVE whitelist
Date: Mon,  7 Dec 2020 15:54:10 +0000
Message-Id: <20201207155410.1671537-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CVE-2013-0221 through -223 are all SUSE-specific, so add them to the
whitelist.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes=
-core/coreutils/coreutils_8.32.bb
index 9d1eceef54..4eb357e310 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -199,3 +199,6 @@ do_install_ptest () {
 }
=20
 FILES_${PN}-ptest +=3D "${bindir}/getlimits"
+
+# These are specific to Opensuse
+CVE_WHITELIST +=3D "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
--=20
2.25.1

