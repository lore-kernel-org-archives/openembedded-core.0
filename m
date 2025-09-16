Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA15ECAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 10:55:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16213.1758020139114047534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 03:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A4111595
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 03:55:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51D153F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 03:55:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] util-linux: remove 'which' from -ptest RDEPENDS
Date: Tue, 16 Sep 2025 11:55:33 +0100
Message-ID: <20250916105533.381404-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916105533.381404-1-ross.burton@arm.com>
References: <20250916105533.381404-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 10:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223543

The 'kill' test case which to find a kill binary (not built-in). The
which implementation in busybox is perfectly sufficient for this purpose.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux_2.41.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.41.1.bb
index 41fb3e59513..e9212ae554d 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
@@ -207,7 +207,7 @@ RDEPENDS:${PN}-dev +=3D " util-linux-libuuid-dev"
 RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
=20
 RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk ${PN}-findmnt"
-RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findu=
tils grep iproute2 kmod procps sed socat which xz diffutils"
+RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findu=
tils grep iproute2 kmod procps sed socat xz diffutils"
 RRECOMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd-=
mod kernel-module-loop kernel-module-algif-hash"
 RDEPENDS:${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff =3D "1"
--=20
2.43.0


