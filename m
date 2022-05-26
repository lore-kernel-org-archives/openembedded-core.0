Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544D1C4332F
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22472.1653585013606650275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475D0150C;
	Thu, 26 May 2022 10:10:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCF083F66F;
	Thu, 26 May 2022 10:10:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 09/10] classes: remove obsolete PEP517_BUILD_API
Date: Thu, 26 May 2022 18:10:00 +0100
Message-Id: <20220526171001.4074388-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526171001.4074388-1-ross.burton@arm.com>
References: <20220526171001.4074388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166195

This variable is no longer used, so remove it from the python_* classes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_flit_core.bbclass             | 2 --
 meta/classes/python_poetry_core.bbclass           | 2 --
 meta/classes/python_setuptools_build_meta.bbclass | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta/classes/python_flit_core.bbclass b/meta/classes/python_=
flit_core.bbclass
index a900f7b5579..7109307de5b 100644
--- a/meta/classes/python_flit_core.bbclass
+++ b/meta/classes/python_flit_core.bbclass
@@ -2,8 +2,6 @@ inherit python_pep517 python3native python3-dir setuptool=
s3-base
=20
 DEPENDS +=3D "python3 python3-flit-core-native"
=20
-PEP517_BUILD_API =3D "flit_core.buildapi"
-
 python_flit_core_do_manual_build () {
     cd ${PEP517_SOURCE_PATH}
     nativepython3 -m flit_core.wheel --outdir ${PEP517_WHEEL_PATH} .
diff --git a/meta/classes/python_poetry_core.bbclass b/meta/classes/pytho=
n_poetry_core.bbclass
index 577663b8f17..0aaf66b1944 100644
--- a/meta/classes/python_poetry_core.bbclass
+++ b/meta/classes/python_poetry_core.bbclass
@@ -1,5 +1,3 @@
 inherit python_pep517 python3native setuptools3-base
=20
 DEPENDS +=3D "python3-poetry-core-native"
-
-PEP517_BUILD_API =3D "poetry.core.masonry.api"
diff --git a/meta/classes/python_setuptools_build_meta.bbclass b/meta/cla=
sses/python_setuptools_build_meta.bbclass
index b2bba35a0bc..974054fe5ac 100644
--- a/meta/classes/python_setuptools_build_meta.bbclass
+++ b/meta/classes/python_setuptools_build_meta.bbclass
@@ -1,5 +1,3 @@
 inherit setuptools3-base python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
-
-PEP517_BUILD_API =3D "setuptools.build_meta"
--=20
2.25.1


