Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8656C54EBC
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.63873.1672753626197206957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 05:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7588F2F4;
	Tue,  3 Jan 2023 05:47:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59F3F3F587;
	Tue,  3 Jan 2023 05:47:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/5] lsof: upgrade 4.96.4 -> 4.96.5
Date: Tue,  3 Jan 2023 13:46:56 +0000
Message-Id: <20230103134700.2649683-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175346

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/lsof/{lsof_4.96.4.bb =3D> lsof_4.96.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lsof/{lsof_4.96.4.bb =3D> lsof_4.96.5.bb} (=
96%)

diff --git a/meta/recipes-extended/lsof/lsof_4.96.4.bb b/meta/recipes-ext=
ended/lsof/lsof_4.96.5.bb
similarity index 96%
rename from meta/recipes-extended/lsof/lsof_4.96.4.bb
rename to meta/recipes-extended/lsof/lsof_4.96.5.bb
index 11de535a0f1..9f80176ee13 100644
--- a/meta/recipes-extended/lsof/lsof_4.96.4.bb
+++ b/meta/recipes-extended/lsof/lsof_4.96.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://00README;beginline=3D645;end=
line=3D679;md5=3D964df275d26429
=20
 SRC_URI =3D "git://github.com/lsof-org/lsof;branch=3Dmaster;protocol=3Dh=
ttps \
            file://remove-host-information.patch"
-SRCREV =3D "669c33a253e414feb60fbbcf2984c25dc413cd75"
+SRCREV =3D "898916d4c7c390ea4610aebaf1d32b8a3c49f26b"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


