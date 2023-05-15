Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFFFC77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:30:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.88629.1684157398773477325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E3144B3;
	Mon, 15 May 2023 06:30:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E73B93F67D;
	Mon, 15 May 2023 06:29:57 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/8] gnutls: add PACKAGECONFIG options for certification compression
Date: Mon, 15 May 2023 14:29:49 +0100
Message-Id: <20230515132955.2231164-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515132955.2231164-1-ross.burton@arm.com>
References: <20230515132955.2231164-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181252

From: Ross Burton <ross.burton@arm.com>

GnuTLS has optional support for certificate compression. These are not
widely enabled in other distributions and were previously disabled in
standard builds, so don't enable them by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.0.bb
index e6b9a527a6d..1e0f1f6912b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
@@ -41,6 +41,10 @@ PACKAGECONFIG[p11-kit] =3D "--with-p11-kit,--without-p=
11-kit,p11-kit"
 PACKAGECONFIG[tpm] =3D "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[fips] =3D "--enable-fips140-mode --with-libdl-prefix=3D${S=
TAGING_BASELIBDIR}"
 PACKAGECONFIG[dane] =3D "--enable-libdane,--disable-libdane,unbound"
+# Certificate compression
+PACKAGECONFIG[brotli] =3D "--with-brotli,--without-brotli,brotli"
+PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
=20
 EXTRA_OECONF =3D " \
     --enable-doc \
--=20
2.34.1


