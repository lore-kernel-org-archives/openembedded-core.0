Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F493C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 17:28:39 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50757.1782926908936773904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 10:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Yi+d6TTb;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 8AD17EE20
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 19:28:26 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1weyjY-1ZjVis0; Wed, 1 Jul 2026 19:28:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patch 2/3] webkitgtk: add PACKAGECONFIG for webrtc
Date: Wed,  1 Jul 2026 19:28:13 +0200
Message-ID: <20260701172814.1976769-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701172814.1976769-1-f_l_k@t-online.de>
References: <20260701172814.1976769-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782926904-3FFFCBCC-2074FDB0/0/0 CLEAN NORMAL
X-TOI-MSGID: bd59630f-0593-4c2d-a8e2-5d712b6c2587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782926906; i=f_l_k@t-online.de;
	bh=SX/SqhXmxHV8sUPR0j3foAr9CQ0BwA8iv8z9qUOkrR0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Yi+d6TTbpbv+y9et9CkzJVTp3NrYPWcyN/qqz91QInEL6itZBZardhIWKkn49dvMn
	 RK6GgMxxFOxzCQ7gLnapQdoH2WcVZ4F4nhqNm1gZfwjPzg21Q8wHkbt87dpQR5rGl4
	 B1yX4oLPzZtv4Mr6Onnz26ZlrNSCA4y0GRTrvIc0Di+MZqQ5FB4UIXUkdHAQ9njIVi
	 wAic4c1wjAUN2LH3VY0b7/guqy8lWQUM19rUyFehIRkqpnvV4rEYLN7PIv7rAQINA/
	 twGzi+zeKGPveCH4N5/ANBQX9yjAH0cH/N7OPjdTCFI1jVJfwe4hP2h4oEKPNpBcqj
	 EgCocbX6f9P6A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 17:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240005

disabled by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.52.4.bb
index a2683638dd..47d97c71fc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
@@ -82,6 +82,7 @@ PACKAGECONFIG[sysprof-capture] =3D "-DUSE_SYSTEM_SYSPRO=
F_CAPTURE=3DYES,-DUSE_SYSTEM_
 PACKAGECONFIG[speech] =3D "-DENABLE_SPEECH_SYNTHESIS=3DON,-DENABLE_SPEEC=
H_SYNTHESIS=3DOFF,flite"
 PACKAGECONFIG[librice] =3D "-DUSE_LIBRICE=3DON,-DUSE_LIBRICE=3DOFF,libri=
ce"
 PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
+PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF"
=20
 EXTRA_OECMAKE =3D " \
                  -DPORT=3DGTK \
--=20
2.54.0


