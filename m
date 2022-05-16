Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641FEC433FE
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 17:10:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.182.1652721050284094454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 10:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7620611FB;
	Mon, 16 May 2022 10:10:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F40B63F66F;
	Mon, 16 May 2022 10:10:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] python3-setuptools-scm: add DEPENDS on tomli to
 self-build
Date: Mon, 16 May 2022 18:10:45 +0100
Message-Id: <20220516171045.3049978-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516171045.3049978-1-ross.burton@arm.com>
References: <20220516171045.3049978-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 17:10:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165690

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb=
 b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index e09c598bf52..bc483f05b43 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D "6833ac65c6ed9711a4d5d2266f8024cfa=
07c533a0e55f4c12f6eff280a
 PYPI_PACKAGE =3D "setuptools_scm"
 inherit pypi python_setuptools_build_meta
=20
+DEPENDS +=3D "python3-tomli-native"
+
 UPSTREAM_CHECK_REGEX =3D "setuptools_scm-(?P<pver>.*)\.tar"
=20
 RDEPENDS:${PN} =3D "\
--=20
2.25.1


