Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7119EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 04:27:52 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.6353.1687667269504245544
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 21:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id 967DA21C2A31;
	Sat, 24 Jun 2023 21:27:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 967DA21C2A31
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] runqemu: Stop using warn() since its been deprecated
Date: Sat, 24 Jun 2023 22:27:46 -0600
Message-Id: <20230625042746.3999111-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 04:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183367

logger.warn() has been deprecated, logger.warning() should be used instea=
d.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 62774a3b98..6a3fbb2d6f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -648,10 +648,10 @@ to your build configuration.
                         elif fsflag =3D=3D 'kernel-in-fs':
                             wic_fs =3D False
                         else:
-                            logger.warn('Unknown flag "%s:%s" in QB_FSIN=
FO', fstype, fsflag)
+                            logger.warning('Unknown flag "%s:%s" in QB_F=
SINFO', fstype, fsflag)
                             continue
                     else:
-                        logger.warn('QB_FSINFO is not supported for imag=
e type "%s"', fstype)
+                        logger.warning('QB_FSINFO is not supported for i=
mage type "%s"', fstype)
                         continue
=20
                     if fstype in self.fsinfo:
--=20
2.34.1


