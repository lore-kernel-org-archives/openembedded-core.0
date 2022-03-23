Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ED2C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 08:51:15 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web09.6853.1648025474251260494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 01:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44,
 mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5AFF69C020F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 04:51:12 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10032)
	with ESMTP id naOnYe-q7mea; Wed, 23 Mar 2022 04:51:11 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6134D9C039A;
	Wed, 23 Mar 2022 04:51:11 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10026)
	with ESMTP id pHNaS5z8kL2k; Wed, 23 Mar 2022 04:51:11 -0400 (EDT)
Received: from sfl-deribaucourt.rennes.sfl
 (apoitiers-554-1-174-105.w92-162.abo.wanadoo.fr [92.162.254.105])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C8BB99C020F;
	Wed, 23 Mar 2022 04:51:10 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [OE-core][PATCH] mobile-broadband-provider-info: update branch name
Date: Wed, 23 Mar 2022 09:50:10 +0100
Message-Id: 
 <20220323085009.11573-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 08:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163581

The master branch was renamed main, resulting in do_fetch failure.
This patch updates SRC_URI with the new branch name.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 .../mobile-broadband-provider-info_git.bb                       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mob=
ile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-bro=
adband-provider-info/mobile-broadband-provider-info_git.bb
index 4246f4dcbd..3b170f4fdd 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_git.bb
@@ -8,7 +8,7 @@ SRCREV =3D "11f2247eccd3c161b8fd9b41143862e9fb81193c"
 PV =3D "20210805"
 PE =3D "1"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info=
.git;protocol=3Dhttps;branch=3Dmaster"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info=
.git;protocol=3Dhttps;branch=3Dmain"
 S =3D "${WORKDIR}/git"
=20
 inherit autotools
--=20
2.25.1


