Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C5ECFD657
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8702.1767800290025599255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F99B1595
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:02 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DBB0E3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] alsa-utils: no need to install scripts manually
Date: Wed,  7 Jan 2026 15:38:00 +0000
Message-ID: <20260107153803.2905889-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107153803.2905889-1-ross.burton@arm.com>
References: <20260107153803.2905889-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229008

These were manually installed when they were part of a separate
alsa-utils-scripts recipe, but now that recipe no longer exists they
will be installed by automake.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 9299f31312..188dfd858f 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -101,13 +101,6 @@ RRECOMMENDS:alsa-utils-alsactl =3D "alsa-states"
 do_install() {
 	autotools_do_install
=20
-	install -d ${D}${sbindir}
-	install -m 0755 ${B}/alsaconf/alsaconf ${D}${sbindir}/
-	install -m 0755 ${S}/alsa-info/alsa-info.sh ${D}${sbindir}/
-	if ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'true', 'false', d)}; t=
hen
-		install -m 0755 ${S}/bat/alsabat-test.sh ${D}${sbindir}/
-	fi
-
 	# If udev is disabled, we told configure to install the rules
 	# in /unwanted, so we can remove them now. If udev is enabled,
 	# then /unwanted won't exist and this will have no effect.
--=20
2.43.0


