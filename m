Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13388.1625504665585134445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 10:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB0931FB
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61A813F694
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:24 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/5] shadow: generate alternative links for chfn and chsh
Date: Mon,  5 Jul 2021 18:04:17 +0100
Message-Id: <20210705170421.533275-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These can be provided by util-linux, so add alternative links for them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
index 2278541f6b1..2cbdfbc1cf1 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -173,6 +173,8 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY =3D "200"
=20
 ALTERNATIVE_${PN} =3D "passwd chfn chsh chpasswd vipw vigr nologin"
+ALTERNATIVE_LINK_NAME[chfn] =3D "${bindir}/chfn"
+ALTERNATIVE_LINK_NAME[chsh] =3D "${bindir}/chsh"
 ALTERNATIVE_LINK_NAME[chpasswd] =3D "${sbindir}/chpasswd"
 ALTERNATIVE_LINK_NAME[vipw] =3D "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] =3D "${base_sbindir}/vigr"
--=20
2.25.1

