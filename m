Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E97C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 11:13:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6439.1658488420706447717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 04:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E83EC1063;
	Fri, 22 Jul 2022 04:13:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB59C3F70D;
	Fri, 22 Jul 2022 04:13:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] zstd: do verbose builds
Date: Fri, 22 Jul 2022 12:13:36 +0100
Message-Id: <20220722111336.2143770-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 11:13:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168402

Set V=3D1 so that the compile log is useful when things go wrong.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/zstd/zstd_1.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-exte=
nded/zstd/zstd_1.5.2.bb
index 3887f31ecfa..2a638eb4269 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[zlib] =3D "HAVE_ZLIB=3D1,HAVE_ZLIB=3D0,zl=
ib"
 # See programs/README.md for how to use this
 ZSTD_LEGACY_SUPPORT ??=3D "4"
=20
+EXTRA_OEMAKE +=3D "V=3D1"
+
 do_compile () {
     oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=3D${ZSTD_LE=
GACY_SUPPORT}
     oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=3D${ZSTD_LE=
GACY_SUPPORT} -C contrib/pzstd
--=20
2.34.1


