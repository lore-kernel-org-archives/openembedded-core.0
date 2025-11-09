Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E34CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 15:37:36 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26760.1762702654995708165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 07:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=n4dAhcmq;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 52C2D240101
	for <openembedded-core@lists.openembedded.org>; Sun,  9 Nov 2025 16:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.com; s=2017;
	t=1762702652; bh=NZ7zI+izZCzPnReGolMtF1EGk1lpzcch4+DOrZVBwkg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=n4dAhcmqRpjeiqmCLKUDFwuaZvw7kdjGVzbcIhTWNPKOL/Nj5Rp3TwuzAo/Aly8ec
	 rGznEru/qqYBX/XRT+DdVHnnPQ1gU9vI56rPBwSh8hmzCE49ef4LK53YryqitEpA17
	 o/ATuFwW8/cnOCwDgdhcsEdLLY2SdhT+VM2IZBl/DQH2AuYF0vYWt7OsmKicTo0UaO
	 QlQNqGylrRZZK1t9pFKkYw0uf9BB8vDU1Eb2srlaDFrtnNG/73psACAFpmg7HBSpw/
	 OWvm3Qx9+ihJVacU35V8BQ/jQdqjyGI2JAeXBoBwUL+Ozur99TqOlnLc4+5Y+zM9Am
	 LRsusfvb9Ng5w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d4H3v10W6z9rxB;
	Sun,  9 Nov 2025 16:37:30 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH 0/2] Update of gtk4 and libadwaita.
Date: Sun, 09 Nov 2025 15:37:31 +0000
Message-Id: <20251109153719.10026-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 15:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226092

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Must be applied in this order as libadwaita will need a newer version of =
gtk4
after updating.

Simone Wei=C3=9F (2):
  gtk4: upgrade 4.18.6 -> 4.20.2
  libadwaita: upgrade 1.7.6 -> 1.8.1

 meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb}    | 4 ++--
 .../libadwaita/{libadwaita_1.7.6.bb =3D> libadwaita_1.8.1.bb}   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb} (97%=
)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.6.bb =3D> libadwait=
a_1.8.1.bb} (88%)

--=20
2.39.5


