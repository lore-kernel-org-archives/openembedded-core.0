Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD78C636D4
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 20:13:36 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.35077.1675282409973367395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 12:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0BA1620B7102;
	Wed,  1 Feb 2023 12:13:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0BA1620B7102
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] testimage: Fix error message to reflect new syntax
Date: Wed,  1 Feb 2023 13:13:22 -0700
Message-Id: <20230201201322.2795597-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 20:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176661

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index 5cc408b0c4..df22bb2344 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -236,7 +236,7 @@ def testimage_main(d):
         with open(tdname, "r") as f:
             td =3D json.load(f)
     except FileNotFoundError as err:
-        bb.fatal('File %s not found (%s).\nHave you built the image with=
 INHERIT +=3D "testimage" in the conf/local.conf?' % (tdname, err))
+        bb.fatal('File %s not found (%s).\nHave you built the image with=
 IMAGE_CLASSES +=3D "testimage" in the conf/local.conf?' % (tdname, err))
=20
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
--=20
2.34.1


