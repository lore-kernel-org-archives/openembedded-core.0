Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C78AC7EE23
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 01:10:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8532.1684199455389748414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 18:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B51440CA2
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:10:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrAf45AKakZL
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2023 01:10:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C4FD40BE6
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:10:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7CBB81638C9;
	Mon, 15 May 2023 21:10:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/2] xz: upgrade 5.4.2 -> 5.4.3
Date: Tue, 16 May 2023 01:10:44 +0000
Message-Id: <20230516011044.4462-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516011044.4462-1-denis@denix.org>
References: <20230516011044.4462-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181396

5.4.3 (2023-05-04)
    * All fixes from 5.2.12
    * Features in the CMake build can now be disabled as CMake cache
      variables, similar to the Autotools build.
    * Minor update to the Croatian translation.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/xz/{xz_5.4.2.bb =3D> xz_5.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.2.bb =3D> xz_5.4.3.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.2.bb b/meta/recipes-extended=
/xz/xz_5.4.3.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.2.bb
rename to meta/recipes-extended/xz/xz_5.4.3.bb
index 87f9602bf6..e1cdac3014 100644
--- a/meta/recipes-extended/xz/xz_5.4.2.bb
+++ b/meta/recipes-extended/xz/xz_5.4.3.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8ea84ebe7b9=
3cce676b54355dc6b2c0 \
                     "
=20
 SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "87947679abcf77cc509d8d1b474218fd16b72281e2797360=
e909deaee1ac9d05"
+SRC_URI[sha256sum] =3D "1c382e0bc2e4e0af58398a903dd62fff7e510171d2de47a1=
ebe06d1528e9b7e9"
 UPSTREAM_CHECK_REGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
=20
 CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
--=20
2.25.1


