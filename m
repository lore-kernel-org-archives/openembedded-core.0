Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B3CC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10700.1653405847533247866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E73AED1;
	Tue, 24 May 2022 08:24:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19873F70D;
	Tue, 24 May 2022 08:24:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/9] squashfs-tools: disable LZO by default
Date: Tue, 24 May 2022 16:23:56 +0100
Message-Id: <20220524152401.1663317-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524152401.1663317-1-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166074

LZO is a fairly obsolete compression format these days, so disable it by
default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 4e009d26255..0a7e0f2a523 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -18,7 +18,7 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS}"
=20
-PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
+PACKAGECONFIG ??=3D "gzip xz lz4 lzma xattr zstd reproducible"
 PACKAGECONFIG[gzip] =3D "GZIP_SUPPORT=3D1,GZIP_SUPPORT=3D0,zlib"
 PACKAGECONFIG[xz] =3D "XZ_SUPPORT=3D1,XZ_SUPPORT=3D0,xz"
 PACKAGECONFIG[lzo] =3D "LZO_SUPPORT=3D1,LZO_SUPPORT=3D0,lzo"
--=20
2.25.1


