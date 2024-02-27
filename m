Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6908DC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:30:40 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.web10.10225.1709033431252403033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
Received: from mailer.emlix.com (cr-emlix.sta.goetel.net [81.20.112.87])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 44ADB5F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 12:30:29 +0100 (CET)
From: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
Subject: [PATCH] python3-bcrypt: allow building native package
Date: Tue, 27 Feb 2024 12:30:23 +0100
Message-ID: <20240227113023.3194930-1-andreas.muetzel@emlix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196262

The native and nativesdk variants of this package build fine, but the
corresponding BBCLASSEXTENDS was missing. Add it.

Signed-off-by: Andreas M=C3=BCtzel <andreas.muetzel@emlix.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/=
recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 8328594bad..72216c39c2 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -34,3 +34,5 @@ RDEPENDS:${PN}:class-target +=3D "\
     python3-shell \
     python3-six \
 "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


