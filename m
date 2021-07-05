Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13425.1625504666367207810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 10:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2BC511D4
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DD183F694
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/5] util-linux: add missing ptest dependencies
Date: Mon,  5 Jul 2021 18:04:19 +0100
Message-Id: <20210705170421.533275-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705170421.533275-1-ross.burton@arm.com>
References: <20210705170421.533275-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel modules loop and sd-mod are needed for the block device tests.

GNU find is used in some tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux_2.37.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.bb b/meta/recip=
es-core/util-linux/util-linux_2.37.bb
index 933995ea94d..48b6208612e 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.bb
@@ -132,8 +132,8 @@ RDEPENDS_${PN}-dev +=3D " util-linux-libuuid-dev"
 RPROVIDES_${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
=20
 RDEPENDS_${PN}-bash-completion +=3D "${PN}-lsblk"
-RDEPENDS_${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs grep =
iproute2 kmod mdadm procps sed socat which xz"
-RRECOMMENDS_${PN}-ptest +=3D "kernel-module-scsi-debug"
+RDEPENDS_${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findu=
tils grep iproute2 kmod mdadm procps sed socat which xz"
+RRECOMMENDS_${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd-=
mod kernel-module-loop"
 RDEPENDS_${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff =3D "1"
=20
--=20
2.25.1

