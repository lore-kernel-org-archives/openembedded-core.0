Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E498D3ABE0
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:13:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.66247.1731348828808559797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51FEE1480
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:18 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06A503F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] gstreamer1.0-libav: explicitly disable documentation
Date: Mon, 11 Nov 2024 18:13:36 +0000
Message-Id: <20241111181341.3296523-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111181341.3296523-1-ross.burton@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206970

We can't build documentation when doing a cross build, so disable it
explicitly to be clear.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
index 7a72f9120e8..40360065518 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
@@ -22,6 +22,7 @@ inherit meson pkgconfig upstream-version-is-even
=20
 EXTRA_OEMESON +=3D " \
     -Dtests=3Ddisabled \
+    -Ddoc=3Ddisabled \
 "
=20
 FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
--=20
2.34.1


