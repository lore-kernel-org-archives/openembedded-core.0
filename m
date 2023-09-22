Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D66E6FE4E
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:18 +0000 (UTC)
Received: from 8.mo575.mail-out.ovh.net (8.mo575.mail-out.ovh.net [46.105.74.219])
 by mx.groups.io with SMTP id smtpd.web11.23681.1695394092518610143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.74.219, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.146.211])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 5F7B7246D4
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:10 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2382B1FDD5;
	Fri, 22 Sep 2023 14:48:10 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id aKQfBiqpDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:10 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001d167478a-bb34-4b73-b1e4-42fbaf6f91d3,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Subject: [PATCH 11/17] python3-rdflib: add homepage
Date: Fri, 22 Sep 2023 14:46:23 +0000
Message-Id: <20230922144628.2495839-12-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12189555342393280974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpedtffeguddvfeeggfefvefhjeevheeuheekvddtgeethfehvdfffeeihfekkeegfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddugedurdelgedrleelrddvfedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188114

From: Marta Rybczynska <mrybczynska@syslinbit.com>

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 meta/recipes-devtools/python/python3-rdflib_7.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb b/meta/=
recipes-devtools/python/python3-rdflib_7.0.0.bb
index 952c210116..09515337c5 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
@@ -1,4 +1,6 @@
 SUMMARY =3D "RDFLib is a pure Python package for working with RDF"
+HOMEPAGE =3D "https://github.com/RDFLib/rdflib"
+SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37d489c0cefe52a17e1d5007e1964=
64a"
=20
--=20
2.34.1


