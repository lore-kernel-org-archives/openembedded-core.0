Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A76C54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 05:20:46 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web11.10663.1725168040296692213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 22:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 97FF912266;
	Sun,  1 Sep 2024 08:20:37 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id Q0267IitOHOW; Sun,  1 Sep 2024 08:20:37 +0300 (EEST)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net [83.102.40.54])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 55A2C12221;
	Sun,  1 Sep 2024 08:20:37 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 1D15B21A;
	Sun,  1 Sep 2024 08:20:35 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] iw: Fix LICENSE
Date: Sun,  1 Sep 2024 08:20:11 +0300
Message-Id: <20240901052011.90846-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 05:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203981

The contents of the COPYING file included in the source code match
those of ISC license:
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/tree/COPYING=
?h=3Dv6.9
which seems to have been in effect since 2008 commit
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/commit?id=3D=
622c36ae94a880fb53f7f051f1b26616f5b553c1
("license under ISC").

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-connectivity/iw/iw_6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_6.9.bb b/meta/recipes-connec=
tivity/iw/iw_6.9.bb
index dc570d1124..e34400e18b 100644
--- a/meta/recipes-connectivity/iw/iw_6.9.bb
+++ b/meta/recipes-connectivity/iw/iw_6.9.bb
@@ -4,7 +4,7 @@ wireless devices. It supports almost all new drivers that=
 have been added \
 to the kernel recently. "
 HOMEPAGE =3D "https://wireless.wiki.kernel.org/en/users/documentation/iw=
"
 SECTION =3D "base"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D878618a5c4af25e9b93ef0be1a93f=
774"
=20
 DEPENDS =3D "libnl"
--=20
2.39.2


