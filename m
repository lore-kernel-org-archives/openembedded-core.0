Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6584C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.63458.1672753628797186988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 05:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DAD9152B;
	Tue,  3 Jan 2023 05:47:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 025363F587;
	Tue,  3 Jan 2023 05:47:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/5] python3-pathspec: upgrade 0.10.1 -> 0.10.3
Date: Tue,  3 Jan 2023 13:47:00 +0000
Message-Id: <20230103134700.2649683-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103134700.2649683-1-ross.burton@arm.com>
References: <20230103134700.2649683-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175350

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python3-pathspec_0.10.1.bb =3D> python3-pathspec_0.10.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.10.1.bb =3D> pyt=
hon3-pathspec_0.10.3.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.10.1.bb b/me=
ta/recipes-devtools/python/python3-pathspec_0.10.3.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pathspec_0.10.1.bb
rename to meta/recipes-devtools/python/python3-pathspec_0.10.3.bb
index 8f2af0ec99e..bd1e7e36397 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.10.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.10.3.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MPL-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab123=
dad"
=20
-SRC_URI[sha256sum] =3D "7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ff=
b6b9fee12084323d"
+SRC_URI[sha256sum] =3D "56200de4077d9d0791465aa9095a01d421861e405b509695=
5051deefd697d6f6"
=20
 inherit pypi setuptools3
=20
--=20
2.34.1


