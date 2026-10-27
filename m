Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16673.1793100959205014618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=T9/Ezzso;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E0DB15A1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:35:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F1303F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100958; bh=8PGaQlg7pZoC9NLo6nZhZdqf/+Ubo8gqeIJMDKcN/W8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T9/EzzsoudWtygrPv1zG7DEx9dzTLn1z+AjtyHOxw+pLjKMbjeQOtPYQw0MyANj5l
	 wWSrBvtYXjg4VqWyeGbqBFxKVsMlTR0xTGuIpWHazgyUSpcuT4AnRV+2Z7ItWFE19D
	 JVgsIE2wwAEV0Zpppz/+o1PdzpjKgHWx9KrJvgj0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/6] gmp: use .tar.xz instead of .tar.bz2 in SRC_URI
Date: Tue, 27 Oct 2026 11:35:52 +0000
Message-ID: <20261027113553.1088639-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027113553.1088639-1-ross.burton@arm.com>
References: <20261027113553.1088639-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248740
Content-Type: text/plain; charset="utf-8"

.xz files are significantly smaller than .bz2, so download that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gmp/gmp_6.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support=
/gmp/gmp_6.3.0.bb
index 579e112fc26..1e1884e1114 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -10,14 +10,14 @@ LIC_FILES_CHKSUM =3D "\
 "
=20
 REVISION =3D ""
-SRC_URI =3D "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2=
 \
+SRC_URI =3D "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.xz =
\
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detect=
ed-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.p=
atch \
            file://0001-Complete-function-prototype-in-acinclude.m4-for-C=
23-.patch \
            file://0001-acinclude.m4-Add-parameter-names-in-prototype-for=
-g.patch \
            "
-SRC_URI[sha256sum] =3D "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6f=
e2e47b000d1c20cb"
+SRC_URI[sha256sum] =3D "a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929=
ca819d5c43538898"
=20
 EXTRA_OECONF +=3D " --enable-cxx=3Ddetect"
 EXTRA_OECONF:append:mipsarchr6 =3D " --disable-assembly"
--=20
2.43.0

