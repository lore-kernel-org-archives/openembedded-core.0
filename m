Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8314.1611319933888067057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 04:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93E251509
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 04:52:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 405EF3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 04:52:13 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] ovmf-shell-image: image is only buildable on x86-64
Date: Fri, 22 Jan 2021 12:52:07 +0000
Message-Id: <20210122125207.4049388-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122125207.4049388-1-ross.burton@arm.com>
References: <20210122125207.4049388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This image is only buildable for x86-64, so add a COMPATIBLE assignment
to ensure it isn't attempted on others.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ovmf/ovmf-shell-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf-shell-image.bb b/meta/recipes-co=
re/ovmf/ovmf-shell-image.bb
index 0d2b8bf52f..fd4fb5b732 100644
--- a/meta/recipes-core/ovmf/ovmf-shell-image.bb
+++ b/meta/recipes-core/ovmf/ovmf-shell-image.bb
@@ -1,4 +1,5 @@
 DESCRIPTION =3D "boot image with UEFI shell and tools"
+COMPATIBLE_HOST_class-target=3D'(i.86|x86_64).*'
=20
 # For this image recipe, only the wic format with a
 # single vfat partition makes sense. Because we have no
--=20
2.25.1

