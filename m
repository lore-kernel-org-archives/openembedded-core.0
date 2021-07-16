Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4993.1626435149850814044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 04:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5898E106F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 04:32:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0376E3F774
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 04:32:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] parted: fix ptest RRECOMMENDS
Date: Fri, 16 Jul 2021 12:32:25 +0100
Message-Id: <20210716113225.4138702-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716113225.4138702-1-ross.burton@arm.com>
References: <20210716113225.4138702-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The recipe was using =3D, which replaces the default RRECOMMENDS from
ptest.bbclass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/parted/parted_3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-ex=
tended/parted/parted_3.4.bb
index 6f6af445b9..d805f31ceb 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -50,7 +50,7 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 RDEPENDS_${PN}-ptest =3D "bash coreutils perl util-linux-losetup util-li=
nux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-c=
ore dosfstools"
-RRECOMMENDS_${PN}-ptest =3D "kernel-module-scsi-debug kernel-module-loop=
 kernel-module-vfat"
+RRECOMMENDS_${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-loo=
p kernel-module-vfat"
 RDEPENDS_${PN}-ptest_append_libc-glibc =3D "\
         glibc-utils \
         locale-base-en-us \
--=20
2.25.1

