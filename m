Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7639C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:00:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4938.1745582440694112443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD2DA106F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:00:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D582B3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:00:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] wget: use libpcre2
Date: Fri, 25 Apr 2025 13:00:37 +0100
Message-ID: <20250425120037.1051967-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 12:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215467

libpcre is obsolete and unmaintained, as wget supports libpcre2 now we
should use that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/wget/wget.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/=
wget/wget.inc
index 151aeabcdce..13cf8790671 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -27,7 +27,7 @@ RRECOMMENDS:${PN} +=3D "ca-certificates"
=20
 BBCLASSEXTEND =3D "nativesdk"
=20
-PACKAGECONFIG ??=3D "gnutls pcre zlib \
+PACKAGECONFIG ??=3D "gnutls pcre2 zlib \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ares] =3D "--with-cares,--without-cares,c-ares"
 PACKAGECONFIG[gnutls] =3D "--with-ssl=3Dgnutls,,gnutls"
@@ -37,4 +37,5 @@ PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libp=
sl,libpsl"
 PACKAGECONFIG[libuuid] =3D "--with-libuuid,--without-libuuid,util-linux"
 PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
 PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
+PACKAGECONFIG[pcre2] =3D "--enable-pcre2,--disable-pcre2,libpcre2"
 PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
--=20
2.43.0


