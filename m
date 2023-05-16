Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B46C7EE2E
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:40:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29901.1684262443282545693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B10F22F4;
	Tue, 16 May 2023 11:41:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FAB33F793;
	Tue, 16 May 2023 11:40:42 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	kubiznak@2n.com
Subject: [PATCH 7/7] gstreamer1.0-python: mandate gobject-introspection-data DISTRO_FEATURE
Date: Tue, 16 May 2023 19:40:31 +0100
Message-Id: <20230516184031.2255171-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516184031.2255171-1-ross.burton@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181420

From: Ross Burton <ross.burton@arm.com>

This layers on top of python3-pygobject, which needs
gobject-introspection to work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gstreamer/gstreamer1.0-python_1.22.2.bb                   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
index 52d987eee5a..ab1600db411 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
@@ -23,6 +23,8 @@ EXTRA_OEMESON +=3D "\
     -Dlibpython-dir=3D${libdir} \
 "
=20
-inherit meson pkgconfig setuptools3-base upstream-version-is-even
+inherit meson pkgconfig setuptools3-base upstream-version-is-even featur=
es_check
=20
 FILES:${PN} +=3D "${libdir}/gstreamer-1.0"
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.34.1


