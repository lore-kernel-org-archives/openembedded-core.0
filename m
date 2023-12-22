Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD6FC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 13:45:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23357.1703252696462489476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 05:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BBAC2F4
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 05:45:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80A893F64C
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 05:44:55 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libseccomp: remove redundant PV assignment
Date: Fri, 22 Dec 2023 13:44:54 +0000
Message-Id: <20231222134454.2524989-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 13:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192872

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.5.5.bb
index a9c617fe9eb..06ba5e9c98e 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
@@ -54,5 +54,3 @@ FILES:${PN} =3D "${bindir} ${libdir}/${BPN}.so*"
 FILES:${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/too=
ls/.debug"
=20
 RDEPENDS:${PN}-ptest =3D "coreutils bash"
-
-PV =3D "2.5.5"
--=20
2.34.1


