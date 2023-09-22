Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E3FE6FE46
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:18 +0000 (UTC)
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
 by mx.groups.io with SMTP id smtpd.web10.23273.1695394089650398653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.59.63, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.146.211])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 85593251CD
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:07 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2E1B51FDD5;
	Fri, 22 Sep 2023 14:48:07 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id qHk9CiepDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:07 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0011cd3df98-0732-4aca-a8e2-b4f703c28130,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 08/17] python3-license-expression: Copy recipe from meta-python
Date: Fri, 22 Sep 2023 14:46:20 +0000
Message-Id: <20230922144628.2495839-9-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12188710920520927497
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeehfefhteelveekheehhfegjeehkeeuvddtteefjeetlefhkeeffedtffdtteffvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddugedurdelgedrleelrddvfedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188111

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

commit: cabfde8c84e100968bc9ab8407ede616100fddbb

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 .../python3-license-expression/run-ptest      |  3 ++
 .../python3-license-expression_30.1.1.bb      | 36 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-license-expressi=
on/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-license-expressi=
on_30.1.1.bb

diff --git a/meta/recipes-devtools/python/python3-license-expression/run-=
ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
new file mode 100644
index 0000000000..5cec711696
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.1=
.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
new file mode 100644
index 0000000000..31fb88d6e5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
@@ -0,0 +1,36 @@
+SUMMARY =3D "Utility library to parse, compare, simplify and normalize l=
icense expressions"
+HOMEPAGE =3D "https://github.com/nexB/license-expression"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://apache-2.0.LICENSE;md5=3D86d3f3a95c324c9479=
bd8986968f4327"
+
+SRC_URI[sha256sum] =3D "42375df653ad85e6f5b4b0385138b2dbea1f5d66360783d8=
625c3e4f97f11f0c"
+
+inherit pypi ptest python_setuptools_build_meta
+
+DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS:${PN} +=3D "\
+    ${PYTHON_PN}-booleanpy \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+SRC_URI +=3D " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest +=3D " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/src
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
+}
--=20
2.34.1


