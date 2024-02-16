Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95853C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:53:00 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.1758.1708102379497604681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id DFC3D65B9
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 17:52:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.102]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rb1SI-3U3DQP0; Fri, 16 Feb 2024 17:52:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] appstream: update 1.0.0 -> 1.0.1
Date: Fri, 16 Feb 2024 17:53:07 +0100
Message-ID: <20240216165307.142411-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708102374-491CA820-ABE0AA01/0/0 CLEAN NORMAL
X-TOI-MSGID: ca36a9b2-bf3a-41de-98dd-8799901691ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195788

Version 1.0.1
~~~~~~~~~~~~~~
Released: 2023-12-16

Bugfixes:
 * Fix lib name for Qt5 link target
 * meson: Pass -D_DARWIN_C_SOURCE on darwin
 * Fix macOS build
 * stemmer: Resolve potential issue where stemmer may never be initialize=
d
 * cli: Don't fail what-provides if components were found
 * Fix query element order for what-provides queries
 * validator: Demote developer-name-tag-deprecated to info severity for n=
ow
 * content-rating: Fix missing or wrong value descriptions for rating IDs
 * curl: Add transfer speed timeouts for HTTP downloads
 * curl: Retry operations on potentially transient errors

Miscellaneous:
 * validator: Improve hint for content-attribute-value-invalid
 * Allow building without zstd temporarily

Contributors:
 Antonio Rojas, Bobby Rong, Matthias Klumpp, Rui Chen

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/{appstream_1.0.0.bb =3D> appstream_1.0.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/appstream/{appstream_1.0.0.bb =3D> appstream=
_1.0.1.bb} (93%)

diff --git a/meta/recipes-support/appstream/appstream_1.0.0.bb b/meta/rec=
ipes-support/appstream/appstream_1.0.1.bb
similarity index 93%
rename from meta/recipes-support/appstream/appstream_1.0.0.bb
rename to meta/recipes-support/appstream/appstream_1.0.1.bb
index 3f8bfcd263..1114011835 100644
--- a/meta/recipes-support/appstream/appstream_1.0.0.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.1.bb
@@ -28,7 +28,7 @@ SRC_URI =3D " \
 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}=
.tar.xz \
 	file://0001-remove-hardcoded-path.patch \
 "
-SRC_URI[sha256sum] =3D "ef23477a380e8b525e92cfa87687f1146b9cef74c641349a=
1ae11250be5401d0"
+SRC_URI[sha256sum] =3D "fa4d5994e5c6f22e9b66cb0b52e8b5f5d96e7353ea5528b5=
6436e0150829203b"
=20
 S =3D "${WORKDIR}/AppStream-${PV}"
=20
--=20
2.43.0


