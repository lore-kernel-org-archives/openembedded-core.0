Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16609.1793100654659563933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=iLLCdb2F;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 045B01650
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC47D3F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100654; bh=zU6KxJfx+VizP0RpXOTc8vuHCqVVlTW+KtxZ1iXOqgA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iLLCdb2FZBAsKnNif2k1nHpCqC2o5rs4NrrC3/az1Wums+GVWBvtVvnQ3nZhKcGIQ
	 totFSXsTFEETR07QnDtKRzSQ03q2ICL/HmTm69v8TV22/OG3olXVPX60g5L1mS6w6D
	 uYndn1RdWoF36z4S36EEkCGuKxX8b1YnjHhfg/5g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] nasm: use .tar.gz instead of .tar.bz2 in SRC_URI
Date: Tue, 27 Oct 2026 11:30:44 +0000
Message-ID: <20261027113048.1086884-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027113048.1086884-1-ross.burton@arm.com>
References: <20261027113048.1086884-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248730
Content-Type: text/plain; charset="utf-8"

.xz files are significantly smaller than .bz2, so download that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/nasm/nasm_3.02.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/nasm/nasm_3.02.bb b/meta/recipes-devto=
ols/nasm/nasm_3.02.bb
index 2d2778fd88f..a0ced1486f1 100644
--- a/meta/recipes-devtools/nasm/nasm_3.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.02.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6178dc4f5355=
e40552448080e67a214b"
=20
 DEPENDS =3D "zlib"
=20
-SRC_URI =3D "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.=
tar.bz2 \
+SRC_URI =3D "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.=
tar.xz \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://CVE-2026-6067.patch \
            "
=20
-SRC_URI[sha256sum] =3D "ce7ed93281615379e4a9d4e76503c64a79c1d5ca696dbe14=
8f16cf0b93e239af"
+SRC_URI[sha256sum] =3D "87336eba53b4acfe917424ab5d500d2b0054d9f5148d35c2=
273ccf2cfb712f0d"
=20
 EXTRA_AUTORECONF:append =3D " -I autoconf/m4"
=20
--=20
2.43.0

