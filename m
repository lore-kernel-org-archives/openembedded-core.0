Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09ACC02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 19:51:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.126145.1738698690962722861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 11:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50B6D40CBA;
	Tue,  4 Feb 2025 19:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVnJajJBIhA8; Tue,  4 Feb 2025 19:51:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3652640C88;
	Tue,  4 Feb 2025 19:51:29 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 17E97164209;
	Tue,  4 Feb 2025 14:51:28 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH 2/3] lzlib: upgrade 1.14 -> 1.15
Date: Tue,  4 Feb 2025 14:51:24 -0500
Message-Id: <20250204195125.76033-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204195125.76033-1-denis@denix.org>
References: <20250204195125.76033-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 19:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210820

From: Denys Dmytriyenko <denys@konsulko.com>

Changes in version 1.15:

  * Lzlib now reports a nonzero first LZMA byte as a LZ_data_error.
* minilzip now exits with error status 2 if any empty member is found in =
a multimember file.
* LZ_Errno, LZ_Encoder, and LZ_Decoder are now declared in lzlib.h as typ=
edef.
* The targets 'lib' and 'bin' have been added to Makefile.in. 'lib' is th=
e new default and builds just the library. 'bin' builds both the library =
and minilzip.
  * minilzip is no longer built by default.
  * 'install-bin' installs minilzip and its man page again.
* To improve portability, the linker option '--soname' is now used condit=
ionally. (Reported by Michael Sullivan).
  * The use of the target 'bin' has been documented in INSTALL.

https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00009.html

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-extended/lzip/{lzlib_1.14.bb =3D> lzlib_1.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzlib_1.14.bb =3D> lzlib_1.15.bb} (93=
%)

diff --git a/meta/recipes-extended/lzip/lzlib_1.14.bb b/meta/recipes-exte=
nded/lzip/lzlib_1.15.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzlib_1.14.bb
rename to meta/recipes-extended/lzip/lzlib_1.15.bb
index a6010bbf27..087b781873 100644
--- a/meta/recipes-extended/lzip/lzlib_1.14.bb
+++ b/meta/recipes-extended/lzip/lzlib_1.15.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D04d943636aa148=
2e0a97d924d9f4f68f \
                     "
=20
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/lzip/lzlib/lzlib-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "5acac8714ed4f306020bae660dddce706e5f8a7958636790=
37da9fe6bf4dcf6f"
+SRC_URI[sha256sum] =3D "4afab907a46d5a7d14e927a1080c3f4d7e3ca5a0f9aea817=
47d8fed0292377ff"
=20
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
--=20
2.25.1


