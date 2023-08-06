Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0E0C0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 06:12:24 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.6728.1691302335241342357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 23:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout06.t-online.de (Postfix) with SMTP id 84E4B21C00
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Aug 2023 08:12:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.3]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qSWzs-3OAaZd0; Sun, 6 Aug 2023 08:12:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] systemd: add a packageconfig to support colored logs
Date: Sun,  6 Aug 2023 08:11:34 +0200
Message-ID: <20230806061134.52225-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691302332-291F0649-6BDD88C8/0/0 CLEAN NORMAL
X-TOI-MSGID: a299070b-195a-4838-9fbd-abf00542b645
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 06:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185560

journald uses less to display logs. less.busybox can do the
job, but it rips out support for color/highlighting.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd_253.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_253.7.bb b/meta/recipes-co=
re/systemd/systemd_253.7.bb
index 1fd4556afd..bb3afc1e73 100644
--- a/meta/recipes-core/systemd/systemd_253.7.bb
+++ b/meta/recipes-core/systemd/systemd_253.7.bb
@@ -158,6 +158,7 @@ PACKAGECONFIG[ima] =3D "-Dima=3Dtrue,-Dima=3Dfalse"
 PACKAGECONFIG[importd] =3D "-Dimportd=3Dtrue,-Dimportd=3Dfalse,glib-2.0"
 # Update NAT firewall rules
 PACKAGECONFIG[iptc] =3D "-Dlibiptc=3Dtrue,-Dlibiptc=3Dfalse,iptables"
+PACKAGECONFIG[journal-color] =3D ",,,less"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Dtrue,-Dlibcurl=3Dfalse,cu=
rl"
 PACKAGECONFIG[kmod] =3D "-Dkmod=3Dtrue,-Dkmod=3Dfalse,kmod"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldcon=
fig"
--=20
2.41.0


