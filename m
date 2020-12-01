Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11648.1606836190245759485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E3C1042
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E3C53F575
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:09 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] image_types: remove obsolete tar comment
Date: Tue,  1 Dec 2020 15:23:01 +0000
Message-Id: <20201201152305.2375723-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201152305.2375723-1-ross.burton@arm.com>
References: <20201201152305.2375723-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We now depend on tar 1.28, so talking about older tar versions is just
confusing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image_types.bbclass | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 66884af8e09..3ec321765d9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -108,16 +108,6 @@ IMAGE_CMD_squashfs-xz =3D "mksquashfs ${IMAGE_ROOTFS=
} ${IMGDEPLOYDIR}/${IMAGE_NAME
 IMAGE_CMD_squashfs-lzo =3D "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/$=
{IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend=
 -comp lzo"
 IMAGE_CMD_squashfs-lz4 =3D "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/$=
{IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend=
 -comp lz4"
=20
-# By default, tar from the host is used, which can be quite old. If
-# you need special parameters (like --xattrs) which are only supported
-# by GNU tar upstream >=3D 1.27, then override that default:
-# IMAGE_CMD_TAR =3D "tar --xattrs --xattrs-include=3D*"
-# do_image_tar[depends] +=3D "tar-replacement-native:do_populate_sysroot=
"
-# EXTRANATIVEPATH +=3D "tar-native"
-#
-# The GNU documentation does not specify whether --xattrs-include is nec=
essary.
-# In practice, it turned out to be not needed when creating archives and
-# required when extracting, but it seems prudent to use it in both cases=
.
 IMAGE_CMD_TAR ?=3D "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. =
do_image_wic) may be hardlinking rootfs
 IMAGE_CMD_tar =3D "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/=
${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 =
]"
--=20
2.25.1

