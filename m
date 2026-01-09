Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AF0D1A631
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:58:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10572.1767967135558585854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5544BFEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:58:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3D163F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:58:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/6] alsa-utils: no need to install scripts manually
Date: Fri,  9 Jan 2026 13:58:48 +0000
Message-ID: <20260109135852.3187805-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109135852.3187805-1-ross.burton@arm.com>
References: <20260109135852.3187805-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229119

These were manually installed when they were part of a separate
alsa-utils-scripts recipe, but now that recipe no longer exists they
will be installed by automake.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index e231acbfc0..16b25fa8aa 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -100,13 +100,6 @@ RRECOMMENDS:alsa-utils-alsactl =3D "alsa-states"
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


