Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E482BE6FE48
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:18 +0000 (UTC)
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net [87.98.165.38])
 by mx.groups.io with SMTP id smtpd.web10.23276.1695394091556998447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.165.38, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.16.96])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 5EBF626DE9
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:09 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1D8CC1FEA4;
	Fri, 22 Sep 2023 14:48:09 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id wDs1BimpDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:09 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0016cc2a5a2-ef86-45b5-a6b2-ac750f140abe,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 10/17] python3-rdflib: Copy recipe from meta-python
Date: Fri, 22 Sep 2023 14:46:22 +0000
Message-Id: <20230922144628.2495839-11-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12189273870164953353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeetleffjeffvdejvdfgueelvdfgheejieetheevteehleeljeduuedtteekgfeuffenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188113

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

commit: 7e565b5c0c09a9cd7c27eb24f8fb45a746469279

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 .../python/python3-rdflib_7.0.0.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-rdflib_7.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb b/meta/=
recipes-devtools/python/python3-rdflib_7.0.0.bb
new file mode 100644
index 0000000000..952c210116
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "RDFLib is a pure Python package for working with RDF"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37d489c0cefe52a17e1d5007e1964=
64a"
+
+SRC_URI[sha256sum] =3D "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8=
c84e0d0036e995ae"
+
+inherit pypi python_poetry_core
+
+RDEPENDS:${PN} +=3D " \
+    ${PYTHON_PN}-isodate \
+    ${PYTHON_PN}-pyparsing \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-core \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


