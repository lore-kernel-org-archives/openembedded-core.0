Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470B4C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:09:33 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
 by mx.groups.io with SMTP id smtpd.web11.49365.1710950967054603032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=v0ZR+LC2;
 spf=pass (domain: protonmail.com, ip: 185.70.40.134, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1710950965; x=1711210165;
	bh=VB5othXOGXm8ZIzqNG2hVu9FEgPuaC++ejIsw6j7pLs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=v0ZR+LC2lxmj5p1vKrWdl38b9C3CRn+vV3NYtOE+Sf6INHg94tV+OCmAmgySEX9ro
	 quklH0HuJZx9YtOKnRLKXhbB69uswqmWvQ1iADoxfLZCSLckvG9YmzmsqKjwM2UwjY
	 MPzZ7LWuQY6y71yPxLQ7PVTda6B4qQAHyAIfjMCO2wQSpbYly6du/jEjKYiSrVJdFS
	 KwRNfF3Pv02/UGkJhTpoY0/B5dC8+CT3vAa5Dt7G+0E+NjKwMfT+r1f3Is0LMMZRiJ
	 /Dvp2BoY//TqciuJ/pdHC6jeaFIiOFhhIEMTil2G18mJufhUIcbaszDeDx5ZWA0hdc
	 NW4U4OdqAxWfA==
Date: Wed, 20 Mar 2024 16:09:15 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH v2] python3-pytest: add CVE_PRODUCT
Message-ID: <20240320160910.231632-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197369

For some reason, the CVE product is just called py and not pytest in the
NIST NVD database. Since the database only accept keywords with at least
3 characters, the CVE vendor must also be specified.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
Changes in v2:
- I forgot to sign the first version.

 meta/recipes-devtools/python/python3-pytest_8.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.0.2.bb b/meta/re=
cipes-devtools/python/python3-pytest_8.0.2.bb
index 57e979e909c3..080b89ebdd5e 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.0.2.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "The pytest framework makes it easy to writ=
e small tests, yet scal
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbd27e41b6550fe0fc45356d1d81ee37=
c"
=20
+CVE_PRODUCT =3D "pytest:py"
+
 SRC_URI[sha256sum] =3D "d4051d623a2e0b7e51960ba963193b09ce6daeb9759a451844=
a21e4ddedfc1bd"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
--=20
2.44.0



