Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF962D39405
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 09:35:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11792.1775122529516095631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 02:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=WfhQuBCh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 77FA91A30E8
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 09:35:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44E0A5FDEB;
	Thu,  2 Apr 2026 09:35:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2DE2104511F1;
	Thu,  2 Apr 2026 11:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775122526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=efjBRttGSnGISorjssOEldh+ItzjIapOwGBe4nYP2uY=;
	b=WfhQuBChe03v+I+vXxhi7UmRn1zowZ6hfUSS2lO6T2YfL9EgeFtWU+er2xak+0wfp6Ry3S
	GzBYs4/9zUCsu3Gk0NIu4+eAKXQGw/GonGprVKEIJ1sO6guzzHjYuxHD6JeWUZd8ltqXi6
	idczj3I+APOFitByaOCkCUH9dUO4GvUsj9RRDVo41YKoW19OE5JHgWjG/HN1XOfcJ32o55
	fM6Ny7BjQq32oJ7tbk79tBwPilUw2gqDniTp/KfWC9pymOCxuIwUhGS57i8DJERfl7fsCd
	xAZ//n6FvABxoRTZZ/H3moHvlmPpIs3Jy4gq6L+6ntaGtdx4f1h2uwgsw7lGVQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	benjamin.robin@bootlin.com,
	steve@sakoman.com,
	mathieu.dubois-briand@bootlin.com,
	pascal.eberhard@se.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] spdx30_tasks: fix condition in create_spdx
Date: Thu,  2 Apr 2026 11:34:44 +0200
Message-ID: <20260402093444.675082-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 09:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234510

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

Considering that *detail* is an actual variable, not a string, remove the
quotes to make the 'in' statement coherent.

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8970dcca0..e7bb930b59 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -523,7 +523,7 @@ def create_spdx(d):
             # specified.
             if (
                 include_vex !=3D "all"
-                and "detail" in ("fixed-version", "cpe-stable-backport")
+                and detail in ("fixed-version", "cpe-stable-backport")
             ):
                 bb.debug(1, "Skipping %s since it is already fixed upstr=
eam" % cve_id)
                 continue
--=20
2.47.0


