Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8265.1611319933758213973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 04:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DBF0139F
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 04:52:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE1953F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 04:52:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] core-image-sato-sdk-ptest: these images need ptest
Date: Fri, 22 Jan 2021 12:52:06 +0000
Message-Id: <20210122125207.4049388-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122125207.4049388-1-ross.burton@arm.com>
References: <20210122125207.4049388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As this image isn't buildable without ptest (the packages won't exist),
depend on the ptest DISTRO_FEATURE to ensure we don't try and build it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/images/core-image-sato-ptest-fast.bb | 3 +++
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/met=
a/recipes-sato/images/core-image-sato-ptest-fast.bb
index 3641217306..4f08d6eb64 100644
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -1,3 +1,6 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES =3D "ptest"
+
 require core-image-sato-sdk.bb
 require conf/distro/include/ptest-packagelists.inc
=20
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta=
/recipes-sato/images/core-image-sato-sdk-ptest.bb
index bf749acd79..4d59c9536b 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -1,3 +1,6 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES =3D "ptest"
+
 require core-image-sato-sdk.bb
 require conf/distro/include/ptest-packagelists.inc
=20
--=20
2.25.1

