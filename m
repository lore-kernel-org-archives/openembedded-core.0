Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249E4C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 15:37:33 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web11.48431.1710949043069424033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 08:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=j63uYo+N;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1710949039; x=1711208239;
	bh=5uTnnJ5jbnv0LZCcqZR733wA+pXQE0wQSy91GIU6wSw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j63uYo+N30JItBGTnR+GzEhU0YVBKno7r9nWWWkG/ABiRtXeZTAC6DXDwbaR8lmh6
	 ZsVHh5DC1fcINXsEU3uYhM5CdNa9F+9LSsl/SnkDWl1EukTCnMUVbd3OVqSlskCtAg
	 8JQSEU5ziwvW2Q0NuiLPfWRrS4aBl/qIMX/AqwTZPtxCSjFKQHhRqZr7BO0/Seg+Nq
	 QtVum8d+RgP+aEoMlLjySSKopEVOmGy3qwEuxBKIUGQxWe0iAHSBA4FJiH4CIAIowo
	 dTQnksn+zXTHlVdACogkjvK259OA+0waPA0PJsNeRnv1jHkeJNEpmd0lriHqVdCrjz
	 BCApxXni00uIQ==
Date: Wed, 20 Mar 2024 15:37:05 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH] python3-pytest: add CVE_PRODUCT
Message-ID: <20240320153659.199582-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 15:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197363

For some reason, the CVE product is just called py and not pytest in the
NIST NVD database. Since the database only accept keywords with at least
3 characters, the CVE vendor must also be specified.
---
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



