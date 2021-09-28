Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B812CC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 14:08:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.26.1632838137988611054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 07:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EBD6D6E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 07:08:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD2D83F718
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 07:08:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: add libmpc-native to DEPENDS
Date: Tue, 28 Sep 2021 15:08:47 +0100
Message-Id: <20210928140847.3750547-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 14:08:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156417

5.14 changed how the GCC plugins are built, which means they now
depend on both GMP and MPC to be built. We already depend on gmp-native,
so add libmpc-native aswell.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.14.bb
index 0c6fbff75e..8c44c294bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -46,7 +46,7 @@ LINUX_VERSION ?=3D "5.14.6"
=20
 DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
 DEPENDS +=3D "openssl-native util-linux-native"
-DEPENDS +=3D "gmp-native"
+DEPENDS +=3D "gmp-native libmpc-native"
=20
 PV =3D "${LINUX_VERSION}+git${SRCPV}"
=20
--=20
2.25.1


