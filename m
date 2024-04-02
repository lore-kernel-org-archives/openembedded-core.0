Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB82CD128A
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 02:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3088.1712024269934508642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 19:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E337140C37
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyQHEESJhijt
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CBE1640C86
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9B097163EF7;
	Mon,  1 Apr 2024 22:17:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/3] lzip: upgrade 1.24 -> 1.24.1
Date: Mon,  1 Apr 2024 22:17:35 -0400
Message-Id: <20240402021736.2565533-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402021736.2565533-1-denis@denix.org>
References: <20240402021736.2565533-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 02:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197862

* No changes have been made to the code. Just a compilation failure on Mi=
nGW
  has been fixed. (Caused by different mkdir signature in POSIX and Windo=
ws).

Full changelog:
https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/lzip/{lzip_1.24.bb =3D> lzip_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.24.bb =3D> lzip_1.24.1.bb} (93=
%)

diff --git a/meta/recipes-extended/lzip/lzip_1.24.bb b/meta/recipes-exten=
ded/lzip/lzip_1.24.1.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.24.bb
rename to meta/recipes-extended/lzip/lzip_1.24.1.bb
index 73040a6f00..6eda012734 100644
--- a/meta/recipes-extended/lzip/lzip_1.24.bb
+++ b/meta/recipes-extended/lzip/lzip_1.24.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D76d6e300ffd8fb=
9d18bd9b136a9bba13 \
                     "
=20
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "d42659229b10e066eeb6e81eb673cdd893b672e512d26719=
c2d95975556ca56c"
+SRC_URI[sha256sum] =3D "30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e=
090c5defa481b162"
=20
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
--=20
2.25.1


