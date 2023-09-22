Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015C4E6FE52
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:19 +0000 (UTC)
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net [46.105.56.132])
 by mx.groups.io with SMTP id smtpd.web11.23683.1695394094355056638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.56.132, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.4.192])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 6A79E26FD4
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1BDD41FE07;
	Fri, 22 Sep 2023 14:48:12 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id OMLIBSypDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:12 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001b3cdd871-0942-4552-a173-ab452b03691f,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 13/17] python3-xmltodict: Copy recipe from meta-python
Date: Fri, 22 Sep 2023 14:46:25 +0000
Message-Id: <20230922144628.2495839-14-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12190118291895879945
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeehfefhteelveekheehhfegjeehkeeuvddtteefjeetlefhkeeffedtffdtteffvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddugedurdelgedrleelrddvfedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188116

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

commit: 61d14138c22a70188d585d85e35fdf86bc65e66f

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 .../python/python3-xmltodict/run-ptest        |  3 ++
 .../python/python3-xmltodict_0.13.0.bb        | 31 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/run-pt=
est
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict_0.13.0=
.bb

diff --git a/meta/recipes-devtools/python/python3-xmltodict/run-ptest b/m=
eta/recipes-devtools/python/python3-xmltodict/run-ptest
new file mode 100644
index 0000000000..3385d68939
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" ||=
 $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pr=
int}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/m=
eta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
new file mode 100644
index 0000000000..132aae8929
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "Makes working with XML feel like you are working with JSON"
+HOMEPAGE =3D "https://github.com/martinblech/xmltodict"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D01441d50dc74476db58a41ac10cb9=
fa2"
+
+SRC_URI[sha256sum] =3D "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce4=
37eb4b6c8d037e56"
+
+PYPI_PACKAGE =3D "xmltodict"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI +=3D " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN} +=3D " \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-xml \
+	${PYTHON_PN}-io \
+"
+
+RDEPENDS:${PN}-ptest +=3D " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
--=20
2.34.1


