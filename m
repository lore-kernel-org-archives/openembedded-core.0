Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11283.1792589296192636336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 06:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=e4p6oypN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74DDC16F8
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:28:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FBA83F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792589295; bh=kNmIfhZJheUAJ4qTZdzKu9Hts35obq2FgfIEbqNuGCs=;
	h=From:To:Subject:Date:From;
	b=e4p6oypNJ+eCZ97Z3EJpyI+y3x6yjeq3aBCkJ/QzBMnb7WdMHaGuKIjwhp5Fc3HXw
	 aNCOpSge+gZiTpqTNlgeRPMtnqeH96umZmrlRI/pwLrUnaweZ4zAfVKXi3om0sQAS+
	 pWvRscDVV3Vr/eZPI3sOaXMQjDJTJomWEekpEQPM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-certifi: upgrade 2026.7.22 -> 2026.10.19
Date: Wed, 21 Oct 2026 14:28:12 +0100
Message-ID: <20261021132812.2046685-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 13:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248398
Content-Type: text/plain; charset="utf-8"

This release has just one change: it removes the compromised eMudhra
intermediate certificates[1].

[1] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...thon3-certifi_2026.7.22.bb =3D> python3-certifi_2026.10.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.7.22.bb =3D> p=
ython3-certifi_2026.10.19.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb b/=
meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 8f1ba3aa9d7..02cdbe9a08b 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -7,7 +7,7 @@ HOMEPAGE =3D "http://certifi.io/"
 LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11618cb6a975948679286b1211bd5=
73c"
=20
-SRC_URI[sha256sum] =3D "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1eb=
c6b118bb090d5d55"
+SRC_URI[sha256sum] =3D "035c1e85572b141bf1c3a3eff0e33a8eb74917522f255907=
5ff8d2fea780a1ae"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
--=20
2.43.0

