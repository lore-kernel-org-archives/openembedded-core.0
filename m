Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6448.1630684837174882725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 09:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF9ED6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 09:00:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652D73F766
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 09:00:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] create-spdx: remove redundant test
Date: Fri,  3 Sep 2021 17:00:31 +0100
Message-Id: <20210903160033.3141022-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903160033.3141022-1-ross.burton@arm.com>
References: <20210903160033.3141022-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

add_extracted_document() is only called if the license isn't known to
SPDX, so there's no need to check again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/create-spdx.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
index 73ccb3c990f..529dee22918 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -58,9 +58,6 @@ def convert_license_to_spdx(lic, document, d):
     def add_extracted_license(ident, name, text):
         nonlocal document
=20
-        if ident in license_data["licenses"]:
-            return False
-
         spdx_lic =3D oe.spdx.SPDXExtractedLicensingInfo()
         spdx_lic.name =3D name
         spdx_lic.licenseId =3D ident
--=20
2.25.1

