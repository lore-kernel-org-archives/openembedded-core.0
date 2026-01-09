Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BDAD26D7D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 16:36:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14169.1767976590310645221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 08:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28D6A497
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 08:36:23 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86DB63F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 08:36:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 6/6] pulseaudio: depend on alsa-utils-alsa-info as that is the new package name
Date: Fri,  9 Jan 2026 16:36:20 +0000
Message-ID: <20260109163621.3650635-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109163621.3650635-1-ross.burton@arm.com>
References: <20260109163621.3650635-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 16:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229141

alsa-utils-scripts no longer exists, depend on alsa-utils-alsa-info
instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
index fd5a1163b1..b9dc8e236f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -232,7 +232,7 @@ python populate_packages:prepend() {
 RDEPENDS:${PN}-pa-info =3D "\
                           alsa-utils-amixer \
                           alsa-utils-aplay \
-                          alsa-utils-scripts \
+                          alsa-utils-alsa-info \
                           bash \
                           ${PN}-server \
                           "
--=20
2.43.0


