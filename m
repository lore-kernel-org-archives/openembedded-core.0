Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9205E6FE41
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:18 +0000 (UTC)
Received: from 5.mo583.mail-out.ovh.net (5.mo583.mail-out.ovh.net [87.98.173.103])
 by mx.groups.io with SMTP id smtpd.web10.23279.1695394096728967657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.173.103, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.4.192])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id A07B427109
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:14 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3C4261FEBD;
	Fri, 22 Sep 2023 14:48:14 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id II1jDS6pDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:14 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001c8db47c9-be08-4ad2-93fb-40401a81a5f6,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 15/17] python3-spdx-tools: add recipe
Date: Fri, 22 Sep 2023 14:46:27 +0000
Message-Id: <20230922144628.2495839-16-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12190681244839905545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeehfefhteelveekheehhfegjeehkeeuvddtteefjeetlefhkeeffedtffdtteffvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddugedurdelgedrleelrddvfedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188118

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

python3-spdx-tools provides tools for SPDX validation and conversion.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python/python3-spdx-tools_0.8.1.bb        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-spdx-tools_0.8.1=
.bb

diff --git a/meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb b/m=
eta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb
new file mode 100644
index 0000000000..f58a138430
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "Python tool to parse, validate and convert spdx files"
+HOMEPAGE =3D "https://github.com/spdx/tools-python"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc7f21ccff0f672f2a7cd6f412ae6=
27d"
+
+SRC_URI[sha256sum] =3D "c83652cd65b5726058dcbdaab85839dbe484c43ea6f61046=
137516aa1b8428ae"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+inherit setuptools3 pypi
+
+# Dependency required for pyspdxtools : python3-click
+# Dependencies required for conversion to spdx3 : python3-semantic-versi=
on, python3-ply
+RDEPENDS:${PN} +=3D "\
+  python3-core \
+  python3-beartype \
+  python3-click \
+  python3-datetime \
+  python3-json \
+  python3-license-expression \
+  python3-ply \
+  python3-pyyaml \
+  python3-rdflib \
+  python3-semantic-version \
+  python3-uritools \
+  python3-xmltodict \
+  "
--=20
2.34.1


