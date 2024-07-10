Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33C6C2BD09
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 00:02:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2657.1720569723437509529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 17:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BA4E40CB4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 00:02:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJLuAdYNlsQS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2024 00:02:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 372F7408CD
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 00:02:01 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id C3AD9163FEB;
	Tue,  9 Jul 2024 20:02:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] hdparm: drop NO_GENERIC_LICENSE
Date: Tue,  9 Jul 2024 20:01:57 -0400
Message-Id: <20240710000157.51922-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 00:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201686

Latest SPDX update[1] brought in a generic hdparm license, no need
to set NO_GENERIC_LICENSE any more.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3De9c1f48af=
10ccb58251ecc7e041babb99b94d6df

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/hdparm/hdparm_9.65.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-e=
xtended/hdparm/hdparm_9.65.bb
index d5e6ab6065a..1b6af566a29 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
@@ -8,7 +8,6 @@ LICENSE =3D "BSD-2-Clause & GPL-2.0-only & hdparm"
 LICENSE:${PN} =3D "BSD-2-Clause & hdparm"
 LICENSE:${PN}-dbg =3D "BSD-2-Clause & hdparm"
 LICENSE:wiper =3D "GPL-2.0-only"
-NO_GENERIC_LICENSE[hdparm] =3D "LICENSE.TXT"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D495d03e50dc6c89d6a30107ab=
0df5b03 \
                     file://debian/copyright;md5=3Da82d7ba3ade9e8ec902749=
db98c592f3 \
--=20
2.35.3


