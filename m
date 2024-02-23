Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E73C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 21:31:18 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.6674.1708723871936311571
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 13:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=e9EHpANI;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B9DC9240101
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 22:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708723869; bh=2EscP4v9aqD3OHUG0ns2SZ3oWxRF7pN0QhoEOuH9d3k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=e9EHpANIdGPF5zfnt0e0iht32F0LXKa2pDRDM/EECzFWnvoOGvLobEdgZw5DMkNsB
	 AqWjXlj1P3dcqAExFno/VM0PXnhFo9DHyreLgQ7bhpGb6UqodddfF0hxdzfkOpj63e
	 uRI1Zkj4dOY9MdCtpdA0mQSTgpWdL18mH4VHZrUqadWsSWKDER32wy3JeWBIbQHKLy
	 NA73eyhAw2Qecy+lMHfydjmRWgRlXGPq4bGwT/vdMJBxOQECsKR/CMZPT0s2Ly/uyJ
	 ykLmklhlRNZvwJSPFEpeIE7CRgZc7gsGDXDJ/HBrSMUf/MMeriZy8ZCZmwDDqEodht
	 E+ofJVtHAzf6w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThNVP00D0z9rxQ;
	Fri, 23 Feb 2024 22:31:08 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] meta: Remove some not needed CVE_STATUS
Date: Fri, 23 Feb 2024 21:31:01 +0000
Message-Id: <20240223213101.35576-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 21:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196115

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

CVE_STATUS was set for those components, but meanwhile databases are upda=
ted
with corrected information, so setting the CVE_STATUS is not needed anymo=
re.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-connectivity/openssl/openssl_3.2.1.bb | 2 --
 meta/recipes-devtools/qemu/qemu.inc                | 2 --
 meta/recipes-extended/shadow/shadow_4.14.2.bb      | 1 -
 meta/recipes-multimedia/libpng/libpng_1.6.41.bb    | 2 --
 meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb | 3 ---
 meta/recipes-support/sqlite/sqlite3_3.45.1.bb      | 2 --
 6 files changed, 12 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.1.bb
index 549fa4cd94..d3bf6248e3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -257,5 +257,3 @@ CVE_PRODUCT =3D "openssl:openssl"
=20
 CVE_VERSION_SUFFIX =3D "alphabetical"
=20
-# Apache in meta-webserver is already recent enough
-CVE_STATUS[CVE-2019-0190] =3D "not-applicable-config: Only affects OpenS=
SL >=3D 1.1.1 in combination with Apache < 2.4.37"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index d16d5e76c8..a403f7d69f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,8 +54,6 @@ SRC_URI:append:class-native =3D " \
=20
 SRC_URI[sha256sum] =3D "8562751158175f9d187c5f22b57555abe3c870f0325c8ced=
12c34c6d987729be"
=20
-CVE_STATUS[CVE-2017-5957] =3D "cpe-incorrect: Applies against virglrende=
r < 0.6.0 and not qemu itself"
-
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D1609015#c11
diff --git a/meta/recipes-extended/shadow/shadow_4.14.2.bb b/meta/recipes=
-extended/shadow/shadow_4.14.2.bb
index 4e55446312..e57676c1da 100644
--- a/meta/recipes-extended/shadow/shadow_4.14.2.bb
+++ b/meta/recipes-extended/shadow/shadow_4.14.2.bb
@@ -8,4 +8,3 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D884658
 CVE_STATUS[CVE-2013-4235] =3D "upstream-wontfix: Severity is low and mar=
ked as closed and won't fix."
-CVE_STATUS[CVE-2016-15024] =3D "cpe-incorrect: This is an issue for a di=
fferent shadow"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.41.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.41.bb
index 59d3db8efd..8c7529be9b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.41.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.41.bb
@@ -31,5 +31,3 @@ PACKAGES =3D+ "${PN}-tools"
 FILES:${PN}-tools =3D "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}=
/pngcp"
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-CVE_STATUS[CVE-2019-17371] =3D "cpe-incorrect: A memory leak in gif2png =
2.x"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 1c4f4d6038..5a76201ab5 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -29,9 +29,6 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.=
tar.bz2 \
            "
 SRC_URI[sha256sum] =3D "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60a=
f2a9eadc2a3272aa"
=20
-CVE_STATUS[CVE-2018-12433] =3D "disputed: CVE is disputed and not affect=
ing crypto libraries for any distro."
-CVE_STATUS[CVE-2018-12438] =3D "disputed: CVE is disputed and not affect=
ing crypto libraries for any distro."
-
 BINCONFIG =3D "${bindir}/libgcrypt-config"
=20
 inherit autotools texinfo binconfig-disabled pkgconfig ptest
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb b/meta/recipes=
-support/sqlite/sqlite3_3.45.1.bb
index 2ca8bc5bc9..50612feb25 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
@@ -6,5 +6,3 @@ LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D=
786d3dc581eff03f4fd9e4a77ed0
 SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar=
.gz"
 SRC_URI[sha256sum] =3D "cd9c27841b7a5932c9897651e20b86c701dd740556989b01=
ca596fcfa3d49a0a"
=20
-CVE_STATUS[CVE-2023-36191] =3D "disputed: The error is a bug. It has bee=
n fixed upstream. But it is not a vulnerability"
-
--=20
2.39.2


