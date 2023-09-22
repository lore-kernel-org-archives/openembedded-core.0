Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25A3E6FE4A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:08 +0000 (UTC)
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net [46.105.56.233])
 by mx.groups.io with SMTP id smtpd.web11.23673.1695394085602411120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.56.233, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.16.222])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 1E1E124BDD
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 921011FED4;
	Fri, 22 Sep 2023 14:48:02 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id UO0nIiKpDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:02 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001e19812e3-72ff-4774-8f5d-8115ba35c6bf,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 04/17] python3-booleanpy: Copy recipe from meta-python
Date: Fri, 22 Sep 2023 14:46:16 +0000
Message-Id: <20230922144628.2495839-5-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12187303545158895881
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpedvhfefleetveevtdegudekgeetjefhieelheffieekheettdetvdeihfdugfeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohholhgvrghnrdhphienucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188108

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

commit: 47b8c97b76b3eb323a97c9079fb49c0348a2376c

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 .../python/python3-booleanpy_4.0.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-booleanpy_4.0.bb

diff --git a/meta/recipes-devtools/python/python3-booleanpy_4.0.bb b/meta=
/recipes-devtools/python/python3-booleanpy_4.0.bb
new file mode 100644
index 0000000000..41fd3d960a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-booleanpy_4.0.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "Define boolean algebras, create and parse boolean expressio=
ns and create custom boolean DSL"
+HOMEPAGE =3D "https://github.com/bastikr/boolean.py"
+
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd118b5feceee598ebeca76e13=
395c2bd"
+
+SRC_URI[sha256sum] =3D "17b9a181630e43dde1851d42bef546d616d5d9b448035751=
4597e78b203d06e4"
+
+PYPI_PACKAGE =3D "boolean.py"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


