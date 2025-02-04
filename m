Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F06C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 20:17:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.126794.1738700219068050941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 12:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4749940C88;
	Tue,  4 Feb 2025 20:16:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WoAGqVp3wqh; Tue,  4 Feb 2025 20:16:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CC66407E5;
	Tue,  4 Feb 2025 20:16:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6FC261641FA;
	Tue,  4 Feb 2025 15:16:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v2 3/3] lzip: upgrade 1.24.1 -> 1.25
Date: Tue,  4 Feb 2025 15:16:41 -0500
Message-Id: <20250204201641.976795-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1821193F88B47871.1760@lists.openembedded.org>
References: <1821193F88B47871.1760@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 20:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210824

From: Denys Dmytriyenko <denys@konsulko.com>

Changes in version 1.25:

* lzip now exits with error status 2 if any empty member is found in a mu=
ltimember file.
* lzip now exits with error status 2 if the first byte of the LZMA stream=
 is not 0.
  * Options '--empty-error' and '--marking-error' have been removed.
* The chapter 'Syntax of command-line arguments' has been added to the ma=
nual.

https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html

Please note, that there was a minor change in the COPYING file, changing =
the hash:

* Physical FSF address was replaced with a link to http://fsf.org, licens=
e is the same

License-Update: FSF address change

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - License-Update: tag added

 meta/recipes-extended/lzip/{lzip_1.24.1.bb =3D> lzip_1.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.24.1.bb =3D> lzip_1.25.bb} (88=
%)

diff --git a/meta/recipes-extended/lzip/lzip_1.24.1.bb b/meta/recipes-ext=
ended/lzip/lzip_1.25.bb
similarity index 88%
rename from meta/recipes-extended/lzip/lzip_1.24.1.bb
rename to meta/recipes-extended/lzip/lzip_1.25.bb
index 6eda012734..590e35cb75 100644
--- a/meta/recipes-extended/lzip/lzip_1.24.1.bb
+++ b/meta/recipes-extended/lzip/lzip_1.25.bb
@@ -3,12 +3,12 @@ HOMEPAGE =3D "http://lzip.nongnu.org/lzip.html"
 DESCRIPTION =3D "Lzip is a lossless data compressor with a user interfac=
e similar to the one of gzip or bzip2. Lzip uses a simplified form of the=
 Lempel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximi=
ze safety and interoperability."
 SECTION =3D "console/utils"
 LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D76d6e300ffd8fb9d18bd9b136a9bb=
a13 \
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcca7f74ec83b7a9ce7ccd195aad47=
1bd \
                     file://decoder.cc;beginline=3D3;endline=3D16;md5=3D1=
8c279060cd0be128188404b45837f88 \
                     "
=20
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e=
090c5defa481b162"
+SRC_URI[sha256sum] =3D "09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668=
d0f346e3d3f0a56f"
=20
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
--=20
2.25.1


