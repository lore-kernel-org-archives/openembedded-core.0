Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7294.1605782296575713375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C87E11478
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7468B3F718
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:15 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] python3: add CVE-2007-4559 to whitelist
Date: Thu, 19 Nov 2020 10:38:10 +0000
Message-Id: <20201119103813.2726273-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119103813.2726273-1-ross.burton@arm.com>
References: <20201119103813.2726273-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This issue describes expected behaviour, do not use tarfile with
untrusted data.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes=
-devtools/python/python3_3.9.0.bb
index 8fe60ea0160..86077bb1ca8 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -45,6 +45,8 @@ UPSTREAM_CHECK_URI =3D "https://www.python.org/download=
s/source/"
=20
 CVE_PRODUCT =3D "python"
=20
+# Upstream consider this expected behaviour
+CVE_CHECK_WHITELIST +=3D "CVE-2007-4559"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST +=3D "CVE-2019-18348"
=20
--=20
2.25.1

