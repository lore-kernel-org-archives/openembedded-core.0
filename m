Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.485.1607970713848174608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6631C31B
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0698A3F718
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:51 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/7] wic-image-minimal: only depend on syslinux on x86 targets
Date: Mon, 14 Dec 2020 18:31:43 +0000
Message-Id: <20201214183148.2673069-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214183148.2673069-1-ross.burton@arm.com>
References: <20201214183148.2673069-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Following other examples, only depend on syslinux when targetting x86.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/met=
a-selftest/recipes-test/images/wic-image-minimal.bb
index e1da203b59..1cb019898d 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -6,7 +6,10 @@ IMAGE_INSTALL =3D "packagegroup-core-boot"
=20
 IMAGE_FSTYPES =3D "wic"
=20
-WKS_FILE_DEPENDS =3D "syslinux syslinux-native dosfstools-native mtools-=
native gptfdisk-native"
+WKS_FILE_DEPENDS =3D "dosfstools-native mtools-native gptfdisk-native"
+WKS_FILE_DEPENDS_append_x86 =3D " syslinux-native syslinux"
+WKS_FILE_DEPENDS_append_x86-64 =3D " syslinux-native syslinux"
+WKS_FILE_DEPENDS_append_x86-x32 =3D " syslinux-native syslinux"
=20
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
=20
--=20
2.25.1

