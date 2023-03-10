Return-Path: <martin.larsson@actia.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AE3C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 13:47:49 +0000 (UTC)
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by mx.groups.io with SMTP id smtpd.web10.19314.1678456066761789395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 05:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: actia.se, ip: 212.181.117.226, mailfrom: martin.larsson@actia.se)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 10 Mar
 2023 14:47:44 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.021; Fri, 10 Mar 2023 14:47:44 +0100
From: Martin Larsson <martin.larsson@actia.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Martin Larsson <martin.larsson@actia.se>
Subject: [PATCH] libpam: Remove flex dependency
Thread-Topic: [PATCH] libpam: Remove flex dependency
Thread-Index: AQHZU1bkkvv15xDW+0yA+82iB5m26w==
Date: Fri, 10 Mar 2023 13:47:44 +0000
Message-ID: <20230310134738.278578-1-martin.larsson@actia.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.1
x-originating-ip: [10.12.12.22]
x-esetresult: clean, is OK
x-esetid: 37303A29D6C7E855627D6B
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 13:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178334

From: Martin Larsson <martin.larsson@actia.se>

libpam does not have a direct build time dependency toward flex.

The libpam code does not have any references to the lib and does not use
flex for anything else at runtime.

Signed-off-by: Martin Larsson <martin.larsson@actia.se>
---
 meta/recipes-extended/pam/libpam_1.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-exten=
ded/pam/libpam_1.5.2.bb
index 3be879082e..5197f18132 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -29,7 +29,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM=
-${PV}.tar.xz \
=20
 SRC_URI[sha256sum] =3D "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9=
b56ca685d4f94d"
=20
-DEPENDS =3D "bison-native flex flex-native cracklib libxml2-native virtual=
/crypt"
+DEPENDS =3D "bison-native flex-native cracklib libxml2-native virtual/cryp=
t"
=20
 EXTRA_OECONF =3D "--includedir=3D${includedir}/security \
                 --libdir=3D${base_libdir} \
--=20
2.39.1

