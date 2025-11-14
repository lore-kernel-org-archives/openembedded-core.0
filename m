Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF451CE7B04
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:28:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16669.1763123327757816009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAA7F1063
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:28:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1AFFA3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:28:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] mesa: don't enable link-time optimisation
Date: Fri, 14 Nov 2025 12:28:41 +0000
Message-ID: <20251114122841.649314-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114122841.649314-1-ross.burton@arm.com>
References: <20251114122841.649314-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226293

LTO breaks mesa and is explicitly not tested in their CI, so we should
ensure it is disabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index e0ec17bd47b..3124db09864 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -348,3 +348,7 @@ INSANE_SKIP:libopencl-mesa +=3D "dev-so"
 RREPLACES:mesa-megadriver =3D "mesa"
 RCONFLICTS:mesa-megadriver =3D "mesa"
 RPROVIDES:mesa-megadriver =3D "mesa"
+
+# As of May 2025 it is known that LTO breaks Mesa, for example:
+# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34318
+LTO =3D ""
--=20
2.43.0


