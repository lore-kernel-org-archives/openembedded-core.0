Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B77ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 05:30:13 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.10802.1662269406247397472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 22:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id C8DCE1F96
	for <openembedded-core@lists.openembedded.org>;
 Sun,  4 Sep 2022 07:30:00 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.36.114]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oUiCc-26p9cX0; Sun, 4 Sep 2022 07:29:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] squashfs-tools: build with lzo support
Date: Sun,  4 Sep 2022 07:29:28 +0200
Message-Id: <20220904052928.33120-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662269390-0144CFA9-0DAEBF7F/0/0 CLEAN NORMAL
X-TOI-MSGID: 924cba2b-5397-4ac1-bef2-6fe56ee9e65b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 05:30:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170273

This is e.g. needed to be able to install snaps.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 0a7e0f2a52..4e009d2625 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -18,7 +18,7 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS}"
=20
-PACKAGECONFIG ??=3D "gzip xz lz4 lzma xattr zstd reproducible"
+PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
 PACKAGECONFIG[gzip] =3D "GZIP_SUPPORT=3D1,GZIP_SUPPORT=3D0,zlib"
 PACKAGECONFIG[xz] =3D "XZ_SUPPORT=3D1,XZ_SUPPORT=3D0,xz"
 PACKAGECONFIG[lzo] =3D "LZO_SUPPORT=3D1,LZO_SUPPORT=3D0,lzo"
--=20
2.34.1


