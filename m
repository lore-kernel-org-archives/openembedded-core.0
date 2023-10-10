Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C4BCD80C0
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 12:37:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.90210.1696941419026978714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 05:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515CBC15;
	Tue, 10 Oct 2023 05:37:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27CE43F7A6;
	Tue, 10 Oct 2023 05:36:58 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/5] meta/conf/machine: remove SERIAL_CONSOLES_CHECK
Date: Tue, 10 Oct 2023 13:36:50 +0100
Message-Id: <20231010123653.166806-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010123653.166806-1-ross.burton@arm.com>
References: <20231010123653.166806-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 12:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188884

From: Ross Burton <ross.burton@arm.com>

There's no need for this variable anymore, as all consoles listed in
SERIAL_CONSOLES are checked for their existence before a getty is
started.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 -
 meta/conf/machine/qemuarm.conf                | 1 -
 meta/conf/machine/qemuarm64.conf              | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
index 8da5b0b0c88..46ae66b9e50 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -10,7 +10,6 @@ KERNEL_IMAGETYPES +=3D "uImage"
 KEEPUIMAGE =3D "no"
=20
 SERIAL_CONSOLES ?=3D "115200;ttyS0 115200;hvc0"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 IMAGE_FSTYPES +=3D "ext4 wic.qcow2"
=20
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
index 9f07664bef0..943ce7c16a2 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -10,7 +10,6 @@ KERNEL_IMAGETYPE =3D "zImage"
 UBOOT_MACHINE ?=3D "qemu_arm_defconfig"
=20
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 # For runqemu
 QB_SYSTEM_NAME =3D "qemu-system-arm"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm=
64.conf
index 51600d40a4a..a096d964db5 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -10,7 +10,6 @@ KERNEL_IMAGETYPE =3D "Image"
 UBOOT_MACHINE ?=3D "qemu_arm64_defconfig"
=20
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 # For runqemu
 QB_SYSTEM_NAME =3D "qemu-system-aarch64"
--=20
2.34.1


