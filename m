Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D246D6ED25
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:54:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9946.1732193662714695538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 04:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3BB01476
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:54:51 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 476E13F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:54:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] xorg-driver-common: remove obsolete .la removal
Date: Thu, 21 Nov 2024 12:54:15 +0000
Message-Id: <20241121125416.2004452-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 12:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207528

We globally inherit remove-libtool, so there's no need to explicitly
remove the .la files in the xorg drivers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/m=
eta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index c61cdd05b35..38848676f41 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -20,12 +20,6 @@ inherit_defer ${XORGBUILDCLASS}
 # depends on virtual/xserver
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-# FIXME: We don't want to include the libtool archives (*.la) from modul=
es
-# directory, as they serve no useful purpose. Upstream should fix Makefi=
le.am
-do_install:append() {
-	find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
-}
-
 # Function to add the relevant ABI dependency to drivers, which should b=
e called
 # from a PACKAGEFUNC.
 def _add_xorg_abi_depends(d, name):
--=20
2.34.1


