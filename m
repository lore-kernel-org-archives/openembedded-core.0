Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F743C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:10:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51141.1674148195660845693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE35176A;
	Thu, 19 Jan 2023 09:10:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A085A3F445;
	Thu, 19 Jan 2023 09:09:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] spirv-headers/spirv-tools: set correct branch name
Date: Thu, 19 Jan 2023 17:09:52 +0000
Message-Id: <20230119170952.4034645-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176151

As of last week, the SPIRV repositories have renamed their master
branches to main:

https://github.com/KhronosGroup/SPIRV-Headers/issues/313

We could set branch=3Dmain, but the commits we're using are also on
release branches so use those instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb | 2 +-
 meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb b/meta=
/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
index e35628ecbf1..5b4e15756eb 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
@@ -8,7 +8,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc938b85bceb8fb26c1a807f28a52a=
e2d"
=20
 SRCREV =3D "1d31a100405cf8783ca7a31e31cdd727c9fc54c3"
-SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttp=
s;branch=3Dmaster"
+SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttp=
s;branch=3Dsdk-1.3.236"
 PE =3D "1"
 UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
 S =3D "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb b/meta/r=
ecipes-graphics/spir/spirv-tools_1.3.236.0.bb
index c921bdef721..1099925cf04 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb
@@ -8,7 +8,7 @@ LICENSE  =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
 SRCREV =3D "40f5bf59c6acb4754a0bffd3c53a715732883a12"
-SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmast=
er;protocol=3Dhttps"
+SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dsdk-=
1.3.236;protocol=3Dhttps"
 PE =3D "1"
 UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
 S =3D "${WORKDIR}/git"
--=20
2.34.1


