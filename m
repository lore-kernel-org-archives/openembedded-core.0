Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E62C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 20:59:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1772.1708030767191584844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 12:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6BCCD40C83
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 20:59:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhdbojXh4DzS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2024 20:59:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56FE340A3D
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 20:59:26 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0522F163EA5;
	Thu, 15 Feb 2024 15:59:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH v2] xz: upgrade 5.4.5 -> 5.4.6
Date: Thu, 15 Feb 2024 15:59:25 -0500
Message-Id: <20240215205925.3959019-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 20:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195699

Project has made changes to the site structure: https://tukaani.org/
| The XZ projects were moved to their own website on xz.tukaani.org in
| January 2024. The old links will be kept working via redirections.

While old release tarballs are still being accesible on the site via
redirects, new releases are no longer hosted on the site and point
directly to github - update SRC_URI.

The website change was mentioned in the COPYING file, changing its hash.

Full Changelog:
https://github.com/tukaani-project/xz/releases/tag/v5.4.6

License-Update: new URL due to website restructure

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
v2 - add License-Update: tag

 meta/recipes-extended/xz/{xz_5.4.5.bb =3D> xz_5.4.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.4.5.bb =3D> xz_5.4.6.bb} (91%)

diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb b/meta/recipes-extended=
/xz/xz_5.4.6.bb
similarity index 91%
rename from meta/recipes-extended/xz/xz_5.4.5.bb
rename to meta/recipes-extended/xz/xz_5.4.6.bb
index ad519e5689..6c13e7ebe5 100644
--- a/meta/recipes-extended/xz/xz_5.4.5.bb
+++ b/meta/recipes-extended/xz/xz_5.4.6.bb
@@ -17,17 +17,17 @@ LICENSE:${PN}-dbg =3D "GPL-2.0-or-later"
 LICENSE:${PN}-locale =3D "GPL-2.0-or-later"
 LICENSE:liblzma =3D "PD"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8ea84ebe7b93cce676b54355dc6b=
2c0 \
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4378ea9d5d1fc9ab0ae10d794882=
7d9 \
                     file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263 \
                     file://COPYING.GPLv3;md5=3D1ebbd3e34237af26da5dc08a4=
e440464 \
                     file://COPYING.LGPLv2.1;md5=3D4fbd65380cdd2559510790=
08b364516c \
                     file://lib/getopt.c;endline=3D23;md5=3D2069b0ee71057=
2c03bb3114e4532cd84 \
                     "
=20
-SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz \
+SRC_URI =3D "https://github.com/tukaani-project/xz/releases/download/v${=
PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] =3D "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c=
357a873709e5b7d6"
+SRC_URI[sha256sum] =3D "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6=
045ccc6c0d43fd5c"
 UPSTREAM_CHECK_REGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
=20
 CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
--=20
2.25.1


