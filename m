Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86005C001DB
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 14:11:33 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.43631.1691763092677051222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 07:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout01.t-online.de (Postfix) with SMTP id 96B568E87
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 16:11:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.74]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qUSrR-0ChY4P0; Fri, 11 Aug 2023 16:11:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: upgrade 4.10.4 -> 4.10.5
Date: Fri, 11 Aug 2023 16:11:22 +0200
Message-ID: <20230811141122.2662989-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691763089-2AFE3D37-1D86AECD/0/0 CLEAN NORMAL
X-TOI-MSGID: 45dde39a-862e-4933-8c44-7e042223b891
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 14:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185846

Overview of Changes in 4.10.5, 05-08-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix ordering problems with filter model signals

* Avoid lingering resize cursors

* Fix alignment issues on sparc

* Fix a problem with CSS corner values

* Translation updates
 Brazilian Portuguese
 Czech
 Greek
 Spanish
 Vietnamese

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.10.4.bb =3D> gtk4_4.10.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.4.bb =3D> gtk4_4.10.5.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.10.5.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
index 2d1e0e74a9..85fff6c61e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "7725400482e0685e28265e226c62847f4e73cfca9e9b416a=
c5838207f5377a24"
+SRC_URI[sha256sum] =3D "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956e=
d74b956369af609b"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.41.0


