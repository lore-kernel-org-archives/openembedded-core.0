Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAD0C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:09:19 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.51827.1742216951005439287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id CC898C60
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 14:09:08 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.174]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuADM-1L9Mun0; Mon, 17 Mar 2025 14:09:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] gobject-introspection: update 1.82.0 -> 1.84.0
Date: Mon, 17 Mar 2025 14:09:48 +0100
Message-ID: <20250317130948.1357826-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742216948-097F85E0-3139BD43/0/0 CLEAN NORMAL
X-TOI-MSGID: c3cbbe54-a28c-42f5-96e5-33b7356f3a1d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213091

1.84.0 - 2025-03-15
-------------------

* No changes

1.83.4 - 2025-03-08
-------------------
* Revert support for "static" virtual functions [!526]
1.83.2 - 2025-03-01
-------------------
* Improve GType inspection helper [!494]
* Parse C11's _Alignas [#520]
* Respect custom Python binary [!503]
* Fix build on the latest Windows SDK [!498]
* Small performance improvement when looking up a signal information [!50=
4]
* Use standard imports in the JavaScript templates for g-ir-doctool [!501=
]
* Ensure that enumeration members can be marked as deprecated [!512]
* Add more test coverage for structured union types [!348]
* Add an option to skip tests when building [!507]
* Fix various MSVC compatibility issues [!511]
* Add support for "static" virtual functions [!361]
* Allow specifying the format of the documentation inside doc blocks [!40=
1]
* Handle C99's _Complex [!515]
* Consider UCRT64 and CLANG64 as mingw32 compilers [!516]
* Handle static NSString syntax [!518]
* Add instance parameter checks to strict validation [!506, !521]
* Documentation improvements [!481, !483, !485, !500]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-introspection_1.82.0.bb =3D> gobject-introspection_1.84.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1=
.82.0.bb =3D> gobject-introspection_1.84.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.82.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.84.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n_1.82.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_=
1.84.0.bb
index 15032520bb..ac5f4e9370 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82=
.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84=
.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc434e8128a68=
bedd59b80b2ac1eb1c4a \
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)=
}/${BPN}-${PV}.tar.xz \
            "
=20
-SRC_URI[sha256sum] =3D "0f5a4c1908424bf26bc41e9361168c363685080fbdb87a19=
6c891c8401ca2f09"
+SRC_URI[sha256sum] =3D "945b57da7ec262e5c266b89e091d14be800cc424277d82a0=
2872b7d794a84779"
=20
 SRC_URI:append:class-native =3D " file://0001-Relocate-the-repository-di=
rectory-for-native-builds.patch"
=20
--=20
2.48.1


