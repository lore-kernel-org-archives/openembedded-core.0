Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3841FC54E67
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 08:58:31 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.39300.1710925105994481522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 01:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 2D132232F2
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:58:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.101]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmrm9-2HOzGU0; Wed, 20 Mar 2024 09:58:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] vte: update 0.74.2 -> 0.76.0
Date: Wed, 20 Mar 2024 09:58:46 +0100
Message-ID: <20240320085846.206946-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320085846.206946-1-f_l_k@t-online.de>
References: <20240320085846.206946-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710925101-BEFFA917-2A8CF6F8/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c3156ac-c4d0-49d5-a01d-d875cae4bda5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 08:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197349

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/vte/{vte_0.74.2.bb =3D> vte_0.76.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.74.2.bb =3D> vte_0.76.0.bb} (96%)

diff --git a/meta/recipes-support/vte/vte_0.74.2.bb b/meta/recipes-suppor=
t/vte/vte_0.76.0.bb
similarity index 96%
rename from meta/recipes-support/vte/vte_0.74.2.bb
rename to meta/recipes-support/vte/vte_0.76.0.bb
index d8eafde2fb..8426ee462f 100644
--- a/meta/recipes-support/vte/vte_0.74.2.bb
+++ b/meta/recipes-support/vte/vte_0.76.0.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_OPTION =3D "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection systemd vala
=20
 SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
-SRC_URI[archive.sha256sum] =3D "a535fb2a98fea8a2449cd1a02cccf5190131dddf=
f52e715afdace3feb536eae7"
+SRC_URI[archive.sha256sum] =3D "bbce30b8f504370b12d6439c07a82993e97d7e9a=
fe2dd367817cd58ff029ffda"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.44.0


