Return-Path: <r.schlarb@instar.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4A2C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 14:20:32 +0000 (UTC)
Received: from mail.instar.com (mail.instar.com [116.202.97.95])
 by mx.groups.io with SMTP id smtpd.web10.26370.1754490022189856172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 07:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@instar.de header.s=201907 header.b=pHqEem/3;
 spf=pass (domain: instar.de, ip: 116.202.97.95, mailfrom: r.schlarb@instar.de)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.instar.com (Postfix) with ESMTP id EC9B2FAD37
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 16:20:19 +0200 (CEST)
Received: from mail.instar.com ([127.0.0.1])
	by localhost (mail.instar.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id qd0pSBFWtIe0; Wed,  6 Aug 2025 16:20:19 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.instar.com (Postfix) with ESMTP id 52937FAD36;
	Wed,  6 Aug 2025 16:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.instar.com 52937FAD36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=instar.de; s=201907;
	t=1754490019; bh=fJt6nqUD98UqQT6izPaLye2oR7FBL5M3195w2wPGpHI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pHqEem/3kyUVaFkw+Jc9M2mrVihjgnzV14wpwGgfHdypr8UKTU0VXX7Gm+6eDmIL7
	 ImzCWv451xAUN4NTB0hjG87oIGUG2jK9Sf8BSenopFXc9yf5FuG1buQeOQOENMtHTd
	 bZX51WPGkMVDlxdgfG5PjLdAoBvd5nAoVaEkgQ8PsFjw49eF3EnZ5WHZBInjoqia9K
	 6eDqBMM5G/VnqrgGz9K5Ya9eZ7kB01MVZjfMrdlkcHPUUD0sb5NfVvz42A3XJlkCQS
	 7Tyazn8d9UGNiQsDZgf1vuQxqijqzJW0oB6pHC5pXfgJ11O0d9BnlY0VJi+R9J8Xsg
	 detobVUW4PQtg==
X-Virus-Scanned: amavisd-new at mail.instar.com
Received: from mail.instar.com ([127.0.0.1])
	by localhost (mail.instar.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iPu9XuSY511R; Wed,  6 Aug 2025 16:20:19 +0200 (CEST)
Received: from localhost.localdomain (static.167.211.203.116.clients.your-server.de [116.203.211.167])
	by mail.instar.com (Postfix) with ESMTPSA id 2F73AFAD34;
	Wed,  6 Aug 2025 16:20:19 +0200 (CEST)
From: Raphael Schlarb <r.schlarb@instar.de>
To: openembedded-core@lists.openembedded.org
Cc: Raphael Schlarb <r.schlarb@instar.de>
Subject: [PATCH 1/2] busybox-inittab: remove unused label variable
Date: Wed,  6 Aug 2025 16:20:18 +0200
Message-Id: <20250806142019.3453612-1-r.schlarb@instar.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 14:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221539

The label variable has been unused since commit 7120278.

Signed-off-by: Raphael Schlarb <r.schlarb@instar.de>
---
 meta/recipes-core/busybox/busybox-inittab_1.37.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb b/meta/r=
ecipes-core/busybox/busybox-inittab_1.37.0.bb
index 8b46b5763e..5e6c44a2e3 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
@@ -21,7 +21,6 @@ do_install() {
     do
         speed=3D$(echo $s | cut -d\; -f 1)
         device=3D$(echo $s | cut -d\; -f 2)
-        label=3D$(echo $device | sed -e 's/tty//' | tail --bytes=3D5)
=20
         echo "$device::respawn:${sbindir}/ttyrun $device ${base_sbindir}=
/getty $speed $device" >> ${D}${sysconfdir}/inittab
     done

