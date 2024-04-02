Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF4ACD1292
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 02:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3089.1712024270105206170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 19:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9C5840CAB
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASZ5uqHOaHPb
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA51640C67
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8B79C163EEB;
	Mon,  1 Apr 2024 22:17:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/3] mtd-utils: upgrade 2.1.6 -> 2.2.0
Date: Mon,  1 Apr 2024 22:17:34 -0400
Message-Id: <20240402021736.2565533-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 02:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197861

This is a small release of changes that have accumulated since last Augus=
t.
As it contains mainly new command line switches (i.e. features) for some
of the tools, this receives a minor version bump.

The Autotools based build system also received a slight overhaul, cleanin=
g
up how configure switches and dependencies are handled. It should now
also be possible to compile mtd-utils without requiring zlib.

Full changelog:
https://lists.infradead.org/pipermail/linux-mtd/2024-March/104058.html

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 4b27528f64..a40d79c864 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS =3D "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests +=3D "bash"
=20
-PV =3D "2.1.6"
+PV =3D "2.2.0"
=20
-SRCREV =3D "219e741f40f4801bae263e0b581b64888d887b4a"
+SRCREV =3D "31e990c56aba7584cde310685d663bb122f16003"
 SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


