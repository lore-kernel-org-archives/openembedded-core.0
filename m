Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4E7C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 17:32:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1753.1645464777213603406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D6F61063
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:32:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBA133F70D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:32:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] poky-tiny: don't blacklist core-image-base and
 core-image-full-cmdline
Date: Mon, 21 Feb 2022 17:32:52 +0000
Message-Id: <20220221173253.768983-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 17:32:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162063

Building a "tiny" core-image-full-cmdline may not make a lot of sense, bu=
t it
build, so don't blacklist these images.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro=
/poky-tiny.conf
index b6c4eeccd0..8fae126cbc 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -113,8 +113,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS =3D ""
 RDEPENDS:${PN}-mtrace:pn-eglibc =3D ""
=20
 PNBLACKLIST[build-appliance-image] =3D "not buildable with poky-tiny"
-PNBLACKLIST[core-image-base] =3D "not buildable with poky-tiny"
-PNBLACKLIST[core-image-full-cmdline] =3D "not buildable with poky-tiny"
 PNBLACKLIST[core-image-rt] =3D "not buildable with poky-tiny"
 PNBLACKLIST[core-image-rt-sdk] =3D "not buildable with poky-tiny"
 PNBLACKLIST[core-image-sato] =3D "not buildable with poky-tiny"
--=20
2.25.1


