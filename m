Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648F9C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 17:59:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.696.1738259948408764913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 09:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8EB339
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 09:59:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 816F23F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 09:59:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemd-serialgetty: add comments explaining use
Date: Thu, 30 Jan 2025 17:59:00 +0000
Message-ID: <20250130175901.938043-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 17:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210465

Add some comments to clarify exactly what this recipe is for.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/reci=
pes-core/systemd/systemd-serialgetty.bb
index 9035b8c335a..7b525b10f0c 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -1,8 +1,13 @@
-SUMMARY =3D "Serial terminal support for systemd"
+SUMMARY =3D "Serial terminal support for systemd (using SERIAL_CONSOLES)=
"
 HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/systemd/"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0-only;md5=3D801f80980d171dd6425610833a22dbe6"
=20
+# Note that this recipe explicitly creates a serial-getty@ service for e=
very tty
+# in SERIAL_CONSOLES. This is typically not always needed with systemd a=
s it
+# will probe at boot and generate getty instances for any active console=
s as
+# required.  This recipe (enabled via disabling serial-getty-generator i=
n systemd)
+# should only be used if the generator is not appropriate.
=20
 SERIAL_CONSOLES ?=3D "115200;ttyS0"
 SERIAL_TERM ?=3D "linux"
--=20
2.43.0


