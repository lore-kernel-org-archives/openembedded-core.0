Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD45C77B6C
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 19:27:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.81362.1680550074417624410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 12:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60582D75;
	Mon,  3 Apr 2023 12:28:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 670D33F73F;
	Mon,  3 Apr 2023 12:27:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] gstreamer1.0-plugins: package the internal libraries explicitly
Date: Mon,  3 Apr 2023 20:27:51 +0100
Message-Id: <20230403192751.396591-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179649

An upcoming change will simplify the setuptools3-base FILES assignments,
which means this recipe needs to package a library explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
index 6df84a6251f..c447f2cbe86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
@@ -24,3 +24,5 @@ EXTRA_OEMESON +=3D "\
 "
=20
 inherit meson pkgconfig setuptools3-base upstream-version-is-even
+
+FILES:${PN} +=3D "${libdir}/gstreamer-1.0"
--=20
2.34.1


