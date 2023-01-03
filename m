Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B779BC53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.63457.1672753628096720778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 05:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70EC42F4;
	Tue,  3 Jan 2023 05:47:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 557E63F587;
	Tue,  3 Jan 2023 05:47:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/5] python3-hatchling: upgrade 1.11.1 -> 1.12.1
Date: Tue,  3 Jan 2023 13:46:59 +0000
Message-Id: <20230103134700.2649683-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103134700.2649683-1-ross.burton@arm.com>
References: <20230103134700.2649683-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175349

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-hatchling_1.11.1.bb =3D> python3-hatchling_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.11.1.bb =3D> py=
thon3-hatchling_1.12.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.12.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.12.1.bb
index 04f5f5fd4c3..fa56d7a42a0 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.12.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native"
 DEPENDS:remove:class-native =3D "python3-hatchling-native"
=20
-SRC_URI[sha256sum] =3D "9f84361f70cf3a7ab9543b0c3ecc64211ed2ba8a606a71eb=
6a473c1c9b08e1d0"
+SRC_URI[sha256sum] =3D "5b36c903d4d76790b1c1f2b7c8f5446fb733fab6ce39b203=
401d2337d441b411"
=20
 do_compile:prepend() {
     export PYTHONPATH=3Dsrc
--=20
2.34.1


