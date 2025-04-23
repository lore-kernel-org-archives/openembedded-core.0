Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4E0C369D7
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 15:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12017.1745423250928534588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 08:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A15EE1063
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:47:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECCD93F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:47:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bmaptool: put the PV in the filename
Date: Wed, 23 Apr 2025 16:47:27 +0100
Message-ID: <20250423154727.4065147-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 15:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215316

We're shipping a release but the filename suggests it is a git snapshot.

To avoid version-going-backwards errors we need to continue to put +git
in the PV, so add a comment to remind the upgrader to remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../bmaptool/{bmaptool_git.bb =3D> bmaptool_3.9.0.bb}          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bmaptool/{bmaptool_git.bb =3D> bmaptool_3.9.=
0.bb} (94%)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes=
-support/bmaptool/bmaptool_3.9.0.bb
similarity index 94%
rename from meta/recipes-support/bmaptool/bmaptool_git.bb
rename to meta/recipes-support/bmaptool/bmaptool_3.9.0.bb
index 155dd0ac80a..28750786afb 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_3.9.0.bb
@@ -12,8 +12,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
 SRC_URI =3D "git://github.com/yoctoproject/${BPN};branch=3Dmain;protocol=
=3Dhttps"
 SRCREV =3D "618a7316102f6f81faa60537503012a419eafa06"
 S =3D "${WORKDIR}/git"
-BASEVER =3D "3.9.0"
-PV =3D "${BASEVER}+git"
+
+# TODO: remove when we upgrade to a release past 3.9.0
+PV .=3D "+git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.43.0


