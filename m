Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D357CC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 15:01:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16.1745506912604006606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 08:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 190FC1063
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 08:01:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B939F3F59E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 08:01:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wget: use libpcre2
Date: Thu, 24 Apr 2025 16:01:48 +0100
Message-ID: <20250424150148.1749041-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 15:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215387

libpcre is obsolete and unmaintained, as wget supports libpcre2 now we
should use that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/=
wget/wget.inc
index 151aeabcdce..d2f772e4090 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -36,5 +36,5 @@ PACKAGECONFIG[iri] =3D "--enable-iri,--disable-iri,libi=
dn2"
 PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libpsl,libpsl"
 PACKAGECONFIG[libuuid] =3D "--with-libuuid,--without-libuuid,util-linux"
 PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
-PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
+PACKAGECONFIG[pcre] =3D "--enable-pcre2,--disable-pcre2,libpcre2"
 PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
--=20
2.43.0


