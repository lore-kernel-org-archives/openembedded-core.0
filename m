Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB2FEE36A9
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:43:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49578.1770914582240259129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86C83339
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:42:55 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83F1B3F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:43:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] cmake: add license information for vendored cppdap library
Date: Thu, 12 Feb 2026 16:42:52 +0000
Message-ID: <20260212164254.1110652-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212164254.1110652-1-ross.burton@arm.com>
References: <20260212164254.1110652-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231045

Add missing license information for the vendored cppdap library that we
don't yet have a recipe for.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/cmake/cmake-native_4.2.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb b/meta/rec=
ipes-devtools/cmake/cmake-native_4.2.3.bb
index 0845be49e5..a4d5327438 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
@@ -9,7 +9,7 @@ SRC_URI +=3D "file://OEToolchainConfig.cmake \
             file://0002-CMakeLists.txt-disable-USE_NGHTTP2.patch \
             "
=20
-LICENSE:append =3D " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
+LICENSE:append =3D " & BSD-1-Clause & MIT & BSD-2-Clause & curl & Apache=
-2.0"
 LIC_FILES_CHKSUM:append =3D " \
     file://Utilities/cmjsoncpp/LICENSE;md5=3D5d73c165a0f9e86a1342f32d19e=
c5926 \
     file://Utilities/cmlibarchive/COPYING;md5=3D7ce08437ff7f5e24d72e6663=
13ae4084 \
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM:append =3D " \
     file://Utilities/cmlibrhash/COPYING;md5=3Da8c2a557a5c53b1c12cddbee98=
c099af \
     file://Utilities/cmlibuv/LICENSE;md5=3Dad93ca1fffe931537fcf64f6fcce0=
84d \
     file://Utilities/cmcurl/COPYING;md5=3D72f4e9890e99e68d77b7e40703d789=
b8 \
+    file://Utilities/cmcppdap/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57 \
 "
=20
 B =3D "${WORKDIR}/build"
--=20
2.43.0


