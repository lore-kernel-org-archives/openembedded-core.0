Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11726.1606836190406816911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13EB21063
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4B003F575
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:09 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] image_types: sort tarball file listings
Date: Tue,  1 Dec 2020 15:23:02 +0000
Message-Id: <20201201152305.2375723-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201152305.2375723-1-ross.burton@arm.com>
References: <20201201152305.2375723-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Help rootfs tarballs be reproducible by sorting the file listing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 3ec321765d9..286009057e3 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -110,7 +110,7 @@ IMAGE_CMD_squashfs-lz4 =3D "mksquashfs ${IMAGE_ROOTFS=
} ${IMGDEPLOYDIR}/${IMAGE_NAM
=20
 IMAGE_CMD_TAR ?=3D "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. =
do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar =3D "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/=
${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 =
]"
+IMAGE_CMD_tar =3D "${IMAGE_CMD_TAR} --sort=3Dname --numeric-owner -cf ${=
IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . =
|| [ $? -eq 1 ]"
=20
 do_image_cpio[cleandirs] +=3D "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
--=20
2.25.1

