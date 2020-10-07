Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.949.1602094916450347320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 11:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1B761042
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CDFF3F71F
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] devtool: remove unused variable
Date: Wed,  7 Oct 2020 19:21:49 +0100
Message-Id: <20201007182152.1331417-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This variable isn't used at all.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/devtool/standard.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index d140b97de1..261d642d4a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -531,7 +531,6 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, config, basepath, works
=20
     initial_rev =3D None
=20
-    appendexisted =3D False
     recipefile =3D d.getVar('FILE')
     appendfile =3D recipe_to_append(recipefile, config)
     is_kernel_yocto =3D bb.data.inherits_class('kernel-yocto', d)
--=20
2.25.1

