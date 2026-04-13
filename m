Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA76F531CC
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 20:22:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2207.1776111757955552179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 13:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Jqjkl3qf;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C96FE35DC
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 13:22:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 16B5E3F641
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776111757; bh=2mFB5bbkxRcdMjV9Ve8g97wfctZxxLoKnn+E8m5RLvY=;
	h=From:To:Subject:Date:From;
	b=Jqjkl3qfZMErYig5rnWMFm/3CuLzGZcjj6E52PYqjyYeXPrBfpFaagU3MtMPpbffA
	 gdK+z/77qrLRAcO/aKvVALNjtrgTpVswD7v1eKkHaoQuaGL/F6qkMKskLbfc3zhZom
	 FX33Rm+ZEkUzxlt3EecyiSfZm/TeknCuv3DApqDc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: set CVE_PRODUCT
Date: Mon, 13 Apr 2026 21:22:33 +0100
Message-ID: <20260413202233.2335301-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 20:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235120

There are CVEs such as CVE-2008-6713 which have a CPE of *:wic, which
get reported for our wic now that it has been split out to a standalone
tool.

Set CVE_PRODUCT to yoctoproject:wic to avoid this. There are no CVEs for
wic yet, but this is the likely CPE that would be used.

[1] https://nvd.nist.gov/vuln/detail/CVE-2008-6713

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/wic/wic_0.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support=
/wic/wic_0.3.0.bb
index a0a2773c76e..7dbf84b039a 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ee23c52855c22=
2cba72583d301d2338"
 SRC_URI =3D "git://git.yoctoproject.org/wic.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
 SRCREV =3D "5974ade11032f218841d9f449ef0efeee3f9a2ca"
=20
+CVE_PRODUCT =3D "yoctoproject:wic"
+
 inherit python_hatchling
=20
 RDEPENDS:${PN} +=3D " \
--=20
2.43.0


