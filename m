Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183CFC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 23:58:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.5842.1642463926499960763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 15:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4950C40C50
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 23:58:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhJyJn-H9ZsX
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jan 2022 23:58:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 38F4740A46
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 23:58:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5C18A174714;
	Mon, 17 Jan 2022 18:58:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] hdparm: upgrade 9.62 -> 9.63
Date: Mon, 17 Jan 2022 23:58:37 +0000
Message-Id: <20220117235837.994318-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 23:58:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160666

hdparm-9.63:
- new --sanitize-overwrite-passes flag, courtesy Michal Grzedzicki.
- "Plurals patch" from Martin Guy.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/hdparm/{hdparm_9.62.bb =3D> hdparm_9.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.62.bb =3D> hdparm_9.63.bb}=
 (94%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.62.bb b/meta/recipes-e=
xtended/hdparm/hdparm_9.63.bb
similarity index 94%
rename from meta/recipes-extended/hdparm/hdparm_9.62.bb
rename to meta/recipes-extended/hdparm/hdparm_9.63.bb
index 61bb44ff38..e286610d6a 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.62.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.63.bb
@@ -26,7 +26,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz =
\
            file://wiper.sh-fix-stat-path.patch \
           "
=20
-SRC_URI[sha256sum] =3D "2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29=
d4c1038ed1be777f"
+SRC_URI[sha256sum] =3D "70785deaebba5877a89c123568b41dee990da55fc51420f1=
3f609a1072899691"
=20
 EXTRA_OEMAKE =3D 'STRIP=3D"echo" LDFLAGS=3D"${LDFLAGS}"'
=20
--=20
2.25.1


