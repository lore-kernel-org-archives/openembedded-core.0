Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD718CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 12:58:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12322.1757422686314014795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 05:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25DFB1424
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 05:57:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08E0A3F694
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 05:58:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] pulseaudio: ignore CVE-2024-11586
Date: Tue,  9 Sep 2025 13:57:59 +0100
Message-ID: <20250909125800.3124174-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223108

As per the linked ticket, this issue is related to an Ubuntu-specific
patch that we don't have.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
index 16c142130be..246d3363eb8 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -290,3 +290,5 @@ RDEPENDS:pulseaudio-server +=3D "\
 RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', '=
systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-k=
it', d), \
                                   '', d)}"
+
+CVE_STATUS[CVE-2024-11586] =3D "not-applicable-platform: specific to Ubu=
ntu 16.04"
--=20
2.43.0


