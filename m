Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4788CC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 16:44:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12853.1647535478367214974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 09:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091D41682
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 09:44:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABA0C3F7B4
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 09:44:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-cryptography-vectors: upgrade to 36.0.2
Date: Thu, 17 Mar 2022 16:44:33 +0000
Message-Id: <20220317164434.387779-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 16:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163425

This needs to be upgraded in lockstep with python3-cryptography.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...vectors_36.0.1.bb =3D> python3-cryptography-vectors_36.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_36.0.1=
.bb =3D> python3-cryptography-vectors_36.0.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_36=
.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.=
2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_36.=
0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_36.0.=
2.bb
index da6718fb90..be0eda056e 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6fa=
e01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cry=
ptography
 #       Upgrade both recipes at the same time
=20
-SRC_URI[sha256sum] =3D "fc8490afd5424342b868215435bd174dcd76ab396b4ea943=
5498be5721dcd598"
+SRC_URI[sha256sum] =3D "2a7924449a03025faf7f8754a6f4200001cab210734a6ce6=
ac1f6bdacd3a68e4"
=20
 PYPI_PACKAGE =3D "cryptography_vectors"
=20
--=20
2.25.1


