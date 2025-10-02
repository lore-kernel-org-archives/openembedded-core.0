Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F70CCA470
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:08:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.952.1759363697263936632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48FE640A20;
	Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHmPKAUbueSO; Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1FB9140CC2;
	Thu,  2 Oct 2025 00:08:15 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 50EA6164022;
	Wed,  1 Oct 2025 20:08:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC PATCH 4/5] newlib: mark as incompatible with baremetal, which uses musl
Date: Wed,  1 Oct 2025 20:08:09 -0400
Message-Id: <20251002000810.226673-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251002000810.226673-1-denis@denix.org>
References: <20251002000810.226673-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 00:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224336

From: Denys Dmytriyenko <denys@konsulko.com>

Like newlib is already marked as incompatible with glibc and musl,
mark it as incompatible with baremetal, which uses musl.

[YOCTO #15982]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-core/newlib/newlib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
index a8794dd1d9..a8d138739c 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -65,3 +65,4 @@ do_install() {
=20
 COMPATIBLE_HOST:libc-musl:class-target =3D "null"
 COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
+COMPATIBLE_HOST:libc-baremetal:class-target =3D "null"
--=20
2.25.1


