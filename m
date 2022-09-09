Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F5CECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 10:38:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.367.1662719878989261297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 03:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C63DB15DB;
	Fri,  9 Sep 2022 03:38:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B0E33F73D;
	Fri,  9 Sep 2022 03:37:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][honister] mobile-broadband-provider-info: update branch name
 in SRC_URI
Date: Fri,  9 Sep 2022 11:37:54 +0100
Message-Id: <20220909103754.3036413-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 10:38:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170485

The master branch has been renamed to main and now master no longer
exists, so fetches that don't use a source mirror will fail.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../mobile-broadband-provider-info_git.bb                       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mob=
ile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-bro=
adband-provider-info/mobile-broadband-provider-info_git.bb
index 4246f4dcbd3..3b170f4fdd2 100644
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
2.34.1


