Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC81C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:37:07 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49592.1782923821455652756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=lU+Yg64N;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id 635A0A2A
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 18:36:59 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wexvi-0fCJIf0; Wed, 1 Jul 2026 18:36:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patch 1/3] mesa.inc: add tools support for intel
Date: Wed,  1 Jul 2026 18:36:38 +0200
Message-ID: <20260701163640.1285581-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782923814-7D7F9B74-E0626079/0/0 CLEAN NORMAL
X-TOI-MSGID: 87af0797-fd35-4bfa-92a3-dad2e6cc6e85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782923819; i=f_l_k@t-online.de;
	bh=6MmxeKglk9Hoy3DpKxjWwCGwGXSdhAlyrL8X1x57uC0=;
	h=From:To:Subject:Date;
	b=lU+Yg64NwptvrOeNND4BJxdxWyJRJ14TD6DM5+B9tqFWsQAJzMUbX9QNmcU3UH1Cr
	 cXSNF9I0Mhr9OV+3YYJ8XYBXdpw2RmrLPy8Xm02lYkRK+TultQ5d/DpEnnY56UBJk2
	 dlTScIxg4mIUC38JuC95KktJpg6Rv2ve0JNJ2GZjLo+cqJNWR44N9Z72f4dCO5a1wm
	 Yy1fI6teUGdmywlInT3vn+in1qYQA2ejnEQUpq9IknCx0Fzujon6ksGC2WoRx48EE0
	 Vn0bkCRE7RnB43gZZiLBTGFaqGigr0kjcINj7HFfwTk6eKdEcGL31vnZjnBJoxx7gq
	 vmBDbMs5Ezchg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239998

This commit enables the mesa-tools-intel if 'tools' and 'intel' are
in PACKAGECONFIG.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index ad82be99a6..469aa789fd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -176,6 +176,7 @@ TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'fr=
eedreno', ',freedreno', '', d
 TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagi=
nation', '', d)}"
 TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d=
)}"
 TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost=
', '', d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel', '',=
 d)}"
=20
 # dependencies for tools.
 TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno'=
, ' ncurses libconfig libxml2 ', '', d)}"
--=20
2.54.0


