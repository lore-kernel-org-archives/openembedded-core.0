Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AB8E6FE47
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:08 +0000 (UTC)
Received: from 18.mo583.mail-out.ovh.net (18.mo583.mail-out.ovh.net [178.33.45.10])
 by mx.groups.io with SMTP id smtpd.web11.23672.1695394085308292492
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 178.33.45.10, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.146.168])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id E56E924FA3
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:03 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A0A3C1FE4B;
	Fri, 22 Sep 2023 14:48:03 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id mEsoJiOpDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:03 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001632ae553-3738-472c-933a-3777dd86ebb9,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 05/17] python3-beartype: add recipe
Date: Fri, 22 Sep 2023 14:46:17 +0000
Message-Id: <20230922144628.2495839-6-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12187585020120402185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeegleehffduudehhfekheejffffheehkeefgeeltdfhgfduiedtjeeitdevveejfeenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhonecukfhppeduvdejrddtrddtrddupddugedurdelgedrleelrddvfedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188107

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python/python3-beartype_0.15.0.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-beartype_0.15.0.=
bb

diff --git a/meta/recipes-devtools/python/python3-beartype_0.15.0.bb b/me=
ta/recipes-devtools/python/python3-beartype_0.15.0.bb
new file mode 100644
index 0000000000..14eda1dd7d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-beartype_0.15.0.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Unbearably fast runtime type checking in pure Python."
+HOMEPAGE =3D "https://beartype.readthedocs.io"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De40b52d8eb5553aa8f705cdd3f979=
d69"
+
+SRC_URI[sha256sum] =3D "2af6a8d8a7267ccf7d271e1a3bd908afbc025d2a09aa5112=
3567d7d7b37438df"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


