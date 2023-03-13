Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32916C6FD1F
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 16:48:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25594.1678726091492657185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 09:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741BB113E;
	Mon, 13 Mar 2023 09:48:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58C4E3F64C;
	Mon, 13 Mar 2023 09:48:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] poky: set MAINTAINER clearly
Date: Mon, 13 Mar 2023 16:48:08 +0000
Message-Id: <20230313164809.3456508-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 16:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178457

The default Poky-specific MAINTAINER assignment makes it look like the
maintainer is a person called Poky.

Instead, use "Poky Maintainers" as the name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky=
.conf
index df8eb55a069..efc795e9f9e 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -6,7 +6,7 @@ SDK_VENDOR =3D "-pokysdk"
 SDK_VERSION =3D "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METAD=
ATA_REVISION}', 'snapshot')}"
 SDK_VERSION[vardepvalue] =3D "${SDK_VERSION}"
=20
-MAINTAINER =3D "Poky <poky@lists.yoctoproject.org>"
+MAINTAINER =3D "Poky Maintainers <poky@lists.yoctoproject.org>"
=20
 TARGET_VENDOR =3D "-poky"
=20
--=20
2.34.1


