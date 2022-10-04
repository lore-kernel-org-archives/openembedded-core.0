Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DF7C43219
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 10:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9154.1664880670024265669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6963612FC;
	Tue,  4 Oct 2022 03:51:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 367433F67D;
	Tue,  4 Oct 2022 03:51:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/5] python3-hatchling: upgrade 1.9.0 -> 1.10.0
Date: Tue,  4 Oct 2022 11:51:03 +0100
Message-Id: <20221004105106.1556357-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004105106.1556357-1-ross.burton@arm.com>
References: <20221004105106.1556357-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 10:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171382

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python3-hatchling_1.9.0.bb =3D> python3-hatchling_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.9.0.bb =3D> pyt=
hon3-hatchling_1.10.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.9.0.bb b/me=
ta/recipes-devtools/python/python3-hatchling_1.10.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.9.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.10.0.bb
index 011f5ed1101..a0d41d4b0d1 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.10.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS +=3D "python3-pluggy-native python3-tomli-native python3-pathspe=
c-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native =3D "python3-hatchling-native"
=20
-SRC_URI[sha256sum] =3D "b57c7362f437b9426e4b94228a21d2ac5804fbb2abcb01ad=
de2544a35bb303cd"
+SRC_URI[sha256sum] =3D "5d31f43dffaf6265c808e1b5353662ffa5146d844278b55c=
aa6c7f74f427ec50"
=20
 do_compile:prepend() {
     export PYTHONPATH=3Dsrc
--=20
2.34.1


