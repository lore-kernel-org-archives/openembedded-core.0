Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067A0C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 23:58:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.5845.1642463934033284843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 15:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 091A340C50
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 23:58:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XN7w71unm2nl
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jan 2022 23:58:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F17CA40A46
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 23:58:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C0685174714;
	Mon, 17 Jan 2022 18:58:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] mtd-utils: upgrade 2.1.3 -> 2.1.4
Date: Mon, 17 Jan 2022 23:58:52 +0000
Message-Id: <20220117235852.994392-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 23:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160667

https://lore.kernel.org/all/c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-st=
ar.at/t/

Roughly half a year after the last release, this is a smaller, patch leve=
l
release that primarily consists of a hand full of fixes that have accumul=
ated
since then.

This includes some fixes regarding the user space ports of mtd-tests usin=
g the
wrong page size, and most recently a fix regarding a missing jffs2 kernel=
 header
in the last release tarball, causing build failures on some systems.

Changes from 2.1.3 to 2.1.4:

Features:
      - ubiscan debugging and statistics utility

Fixes:
      - Some mtd-tests erroneously using sub-pages instead of the full pa=
ge size
      - Buffer overrun in fectest
      - Missing jffs2 kernel header in the last release, leading to build
        failures on some systems.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 2004572375..c05d3b7c35 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS =3D "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests +=3D "bash"
=20
-PV =3D "2.1.3"
+PV =3D "2.1.4"
=20
-SRCREV =3D "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
+SRCREV =3D "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
 SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
--=20
2.25.1


