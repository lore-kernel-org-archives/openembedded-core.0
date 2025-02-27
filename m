Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D91C282C1
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:59:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10930.1740664768122178072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 05:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 620B82BCA
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:59:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E9943F673
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:59:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/documentation.conf: remove OE_IMPORTS
Date: Thu, 27 Feb 2025 13:59:24 +0000
Message-ID: <20250227135924.3441158-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212009

oe-core no longer supports OE_IMPORTS[1], so remove the documentation.

[1] oe-core 1f56155e ("base: Switch to use addpylib directive and
    BB_GLOBAL_PYMODULES")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3dd7bce5155..570a6044947 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -299,7 +299,6 @@ NO_RECOMMENDATIONS[doc] =3D "When set to '1', no reco=
mmended packages will be inst
 #O
=20
 OE_BINCONFIG_EXTRA_MANGLE[doc] =3D "When a recipe inherits the binconfig=
.bbclass class, this variable specifies additional arguments passed to th=
e "sed" command."
-OE_IMPORTS[doc] =3D "An internal variable used to tell the OpenEmbedded =
build system what Python modules to import for every Python function run =
by the system."
 OE_TERMINAL[doc] =3D "Controls how the OpenEmbedded build system spawns =
interactive terminals on the host development system."
 OEROOT[doc] =3D "The directory from which the top-level build environmen=
t setup script is sourced."
 OLDEST_KERNEL[doc] =3D "Declares the oldest version of the Linux kernel =
that the produced binaries must support."
--=20
2.43.0


