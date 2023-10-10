Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94824CD80CA
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 12:37:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89850.1696941419653712894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 05:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11F3F106F;
	Tue, 10 Oct 2023 05:37:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D403C3F7A6;
	Tue, 10 Oct 2023 05:36:58 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/5] meta-yocto-bsp/conf/machine: remove SERIAL_CONSOLES_CHECK
Date: Tue, 10 Oct 2023 13:36:51 +0100
Message-Id: <20231010123653.166806-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010123653.166806-1-ross.burton@arm.com>
References: <20231010123653.166806-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 12:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188885

From: Ross Burton <ross.burton@arm.com>

There's no need for this variable anymore, as all consoles listed in
SERIAL_CONSOLES are checked for their existence before a getty is
started.
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 1 -
 meta-yocto-bsp/conf/machine/genericx86-64.conf    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yoc=
to-bsp/conf/machine/beaglebone-yocto.conf
index 8b67cefef70..9f389711b3b 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -18,7 +18,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image ker=
nel-devicetree"
 do_image_wic[depends] +=3D "mtools-native:do_populate_sysroot dosfstools=
-native:do_populate_sysroot virtual/bootloader:do_deploy"
=20
 SERIAL_CONSOLES ?=3D "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "6.1%"
diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-=
bsp/conf/machine/genericx86-64.conf
index 14913ea1f15..f19a1c1527c 100644
--- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
@@ -6,6 +6,5 @@ DEFAULTTUNE ?=3D "core2-64"
 require conf/machine/include/x86/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
=20
-SERIAL_CONSOLES_CHECK =3D "ttyS0"
 #For runqemu
 QB_SYSTEM_NAME =3D "qemu-system-x86_64"
--=20
2.34.1


