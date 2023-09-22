Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE49E6FE45
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:08 +0000 (UTC)
Received: from 11.mo583.mail-out.ovh.net (11.mo583.mail-out.ovh.net [46.105.47.167])
 by mx.groups.io with SMTP id smtpd.web10.23270.1695394082149609972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.47.167, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.138.246])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 9276326B4F
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:00 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5A2B61FEBC;
	Fri, 22 Sep 2023 14:48:00 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id eFEDFSCpDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:00 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0017d7fd972-bd1a-412d-b978-53b31887e519,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 02/17] python3-isodate: Copy recipe from meta-python
Date: Fri, 22 Sep 2023 14:46:14 +0000
Message-Id: <20230922144628.2495839-3-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12186740594299570441
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeetleffjeffvdejvdfgueelvdfgheejieetheevteehleeljeduuedtteekgfeuffenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188105

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

commit: 33b910b51cea2eee57f197a2e9697dd81a9dd67b

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 .../python/python3-isodate_0.6.1.bb                | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-isodate_0.6.1.bb

diff --git a/meta/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta=
/recipes-devtools/python/python3-isodate_0.6.1.bb
new file mode 100644
index 0000000000..c65083b777
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-isodate_0.6.1.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "ISO 8601 date/time parser"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3De9=
10b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[sha256sum] =3D "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864=
c7614fd3c127bde9"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} +=3D " \
+    python3-numbers \
+    python3-six \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


