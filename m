Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8316BC433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 07:30:56 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.2797.1647070255202969208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 23:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 8656817EFE
	for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 08:30:52 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.239]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nSwDA-1FWgtv0; Sat, 12 Mar 2022 08:30:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3 3/3] librsvg: inherit vala
Date: Sat, 12 Mar 2022 08:30:22 +0100
Message-Id: <20220312073022.2894-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220312073022.2894-1-f_l_k@t-online.de>
References: <20220312073022.2894-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647070248-0000EDC4-4C6ACFFC/0/0 CLEAN NORMAL
X-TOI-MSGID: e1e9a0f8-10df-45a6-8c57-bae39640230b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 07:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163082

this fixes a build error about missing vapigen and enables vapi build

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/librsvg/librsvg_2.52.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.52.5.bb
index 1279c663f7..ede6454c2b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
@@ -14,7 +14,7 @@ SECTION =3D "x11/utils"
 DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
 BBCLASSEXTEND =3D "native"
=20
-inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-i=
ntrospection rust
+inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-i=
ntrospection rust vala
=20
 SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to-cargo-also-whe=
n-not-.patch \
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded=
-li.patch \
--=20
2.25.1


