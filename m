Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248ACC021A7
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 20:02:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3557.1739476939811748634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 12:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBABB113E
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:02:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D2B163F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:02:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] systemd-serialgetty: don't set a default SERIAL_CONSOLES
Date: Thu, 13 Feb 2025 20:02:11 +0000
Message-ID: <20250213200212.1694055-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213200212.1694055-1-ross.burton@arm.com>
References: <20250213200212.1694055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 20:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211367

bitbake.conf defines a default value, so there's no value in setting
another default here that doesn't match the rest of the system.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/reci=
pes-core/systemd/systemd-serialgetty.bb
index 3798b07b1a8..c3fe9d5b6d4 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/commo=
n-licenses/GPL-2.0-only;m
 # required.  This recipe (enabled via disabling serial-getty-generator i=
n systemd)
 # should only be used if the generator is not appropriate.
=20
-SERIAL_CONSOLES ?=3D "115200;ttyS0"
-
 # As this package is tied to systemd, only build it when we're also buil=
ding systemd.
 inherit features_check
 REQUIRED_DISTRO_FEATURES +=3D "systemd"
--=20
2.43.0


