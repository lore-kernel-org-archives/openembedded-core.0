Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AD1C46CD8
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:02:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56205.1703178122530857788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 09:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F1B21063
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D627B3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:01 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] conf/machine-sdk: declare qemu-usermode SDK_MACHINE_FEATURE
Date: Thu, 21 Dec 2023 17:01:59 +0000
Message-Id: <20231221170159.1995650-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221170159.1995650-1-ross.burton@arm.com>
References: <20231221170159.1995650-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 17:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192842

From: Ross Burton <ross.burton@arm.com>

All of our defined SDK machines (which are assumed to be Linux) support
qemu-user, so state this explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine-sdk/aarch64.conf     | 2 ++
 meta/conf/machine-sdk/i586.conf        | 1 +
 meta/conf/machine-sdk/i686.conf        | 2 ++
 meta/conf/machine-sdk/loongarch64.conf | 2 ++
 meta/conf/machine-sdk/ppc64.conf       | 2 ++
 meta/conf/machine-sdk/ppc64le.conf     | 2 ++
 meta/conf/machine-sdk/riscv64.conf     | 2 ++
 meta/conf/machine-sdk/x86_64.conf      | 2 ++
 8 files changed, 15 insertions(+)

diff --git a/meta/conf/machine-sdk/aarch64.conf b/meta/conf/machine-sdk/a=
arch64.conf
index 4a285cf6cb6..d2023e21744 100644
--- a/meta/conf/machine-sdk/aarch64.conf
+++ b/meta/conf/machine-sdk/aarch64.conf
@@ -1,2 +1,4 @@
 SDK_ARCH =3D "aarch64"
 ABIEXTENSION:class-nativesdk =3D ""
+
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
diff --git a/meta/conf/machine-sdk/i586.conf b/meta/conf/machine-sdk/i586=
.conf
index 05e826965ea..ccee3a4881b 100644
--- a/meta/conf/machine-sdk/i586.conf
+++ b/meta/conf/machine-sdk/i586.conf
@@ -2,3 +2,4 @@ SDK_ARCH =3D "i586"
 SDK_CC_ARCH =3D "-march=3Di586"
 ABIEXTENSION:class-nativesdk =3D ""
=20
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
diff --git a/meta/conf/machine-sdk/i686.conf b/meta/conf/machine-sdk/i686=
.conf
index 22f580e70f0..abb7a4bc1af 100644
--- a/meta/conf/machine-sdk/i686.conf
+++ b/meta/conf/machine-sdk/i686.conf
@@ -1,3 +1,5 @@
 SDK_ARCH =3D "i686"
 SDK_CC_ARCH =3D "-march=3Di686"
 ABIEXTENSION:class-nativesdk =3D ""
+
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
diff --git a/meta/conf/machine-sdk/loongarch64.conf b/meta/conf/machine-s=
dk/loongarch64.conf
index 40bf0039ea5..6bb4c7a4ea1 100644
--- a/meta/conf/machine-sdk/loongarch64.conf
+++ b/meta/conf/machine-sdk/loongarch64.conf
@@ -1,2 +1,4 @@
 SDK_ARCH =3D "loongarch64"
 ABIEXTENSION:class-nativesdk =3D ""
+
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
diff --git a/meta/conf/machine-sdk/ppc64.conf b/meta/conf/machine-sdk/ppc=
64.conf
index b41325dfe78..8ba3fccc677 100644
--- a/meta/conf/machine-sdk/ppc64.conf
+++ b/meta/conf/machine-sdk/ppc64.conf
@@ -1,2 +1,4 @@
 SDK_ARCH =3D "ppc64"
 ABIEXTENSION:class-nativesdk =3D ""
+
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
diff --git a/meta/conf/machine-sdk/ppc64le.conf b/meta/conf/machine-sdk/p=
pc64le.conf
index db1f863496e..3ee12faf572 100644
--- a/meta/conf/machine-sdk/ppc64le.conf
+++ b/meta/conf/machine-sdk/ppc64le.conf
@@ -1,2 +1,4 @@
 SDK_ARCH =3D "ppc64le"
 ABIEXTENSION:class-nativesdk =3D ""
+
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
diff --git a/meta/conf/machine-sdk/riscv64.conf b/meta/conf/machine-sdk/r=
iscv64.conf
index 3f4a5af0af7..a43fe433fe6 100644
--- a/meta/conf/machine-sdk/riscv64.conf
+++ b/meta/conf/machine-sdk/riscv64.conf
@@ -1,2 +1,4 @@
 SDK_ARCH =3D "riscv64"
 ABIEXTENSION:class-nativesdk =3D ""
+
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x8=
6_64.conf
index 3396f95d69d..357dab0b882 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -2,3 +2,5 @@ SDK_ARCH =3D "x86_64"
 SDK_CC_ARCH =3D "-march=3Dx86-64"
 ABIEXTENSION:class-crosssdk =3D ""
 ABIEXTENSION:class-nativesdk =3D ""
+
+SDK_MACHINE_FEATURES =3D "qemu-usermode"
--=20
2.34.1


