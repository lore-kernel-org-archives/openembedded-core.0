Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052F5EEB57D
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 10:26:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.55217.1694427977969795070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 03:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00FF21007;
	Mon, 11 Sep 2023 03:26:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F49D3F5A1;
	Mon, 11 Sep 2023 03:26:16 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] beaglebone-yocto: remove redundant XSERVER assignment
Date: Mon, 11 Sep 2023 11:26:13 +0100
Message-Id: <20230911102614.377841-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911102614.377841-1-ross.burton@arm.com>
References: <20230911102614.377841-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187487

From: Ross Burton <ross.burton@arm.com>

The default XSERVER value is good enough for this BSP, so we don't need
to set it explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yoc=
to-bsp/conf/machine/beaglebone-yocto.conf
index 362f6e040e7..8b67cefef70 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -3,9 +3,6 @@
 #@DESCRIPTION: Reference machine configuration for http://beagleboard.or=
g/bone and http://beagleboard.org/black boards
=20
 PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
-XSERVER ?=3D "xserver-xorg \
-           xf86-video-modesetting \
-           "
=20
 MACHINE_EXTRA_RRECOMMENDS =3D "kernel-modules kernel-devicetree"
=20
--=20
2.34.1


