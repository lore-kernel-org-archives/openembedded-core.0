Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21F9C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 22:12:55 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.6954.1686348775036122407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 15:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id C879C20C14A3;
	Fri,  9 Jun 2023 15:12:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C879C20C14A3
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-helloworld: Update SRCREV to fix entry addresses for ARM architectures
Date: Fri,  9 Jun 2023 16:12:42 -0600
Message-Id: <20230609221242.2961719-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 22:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182599

Update to the latest SRCREV to bring fixes using the proper entry
addresses for ARM architectures [1], as well as fixing a race condition
in the Makefile during assembly [2].

Fix url in case automatic redirects stop working.

[1] https://github.com/ahcbb6/baremetal-helloqemu/commit/602e82aee7ae95ee=
50eedb7f40c4a225ec5a3fb9
[2] https://github.com/ahcbb6/baremetal-helloqemu/commit/ea7f59b02467ed1f=
b36c3b4c6d5cabe702df26ec

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../baremetal-example/baremetal-helloworld_git.bb             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld=
_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_gi=
t.bb
index 82b2901d51..4182372057 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -4,10 +4,10 @@ DESCRIPTION =3D "These are introductory examples to sho=
wcase the use of QEMU to ru
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39346640a23c701e4f459e05f56f4=
449"
=20
-SRCREV =3D "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
+SRCREV =3D "ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec"
 PV =3D "0.1+git${SRCPV}"
=20
-SRC_URI =3D "git://github.com/aehs29/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
+SRC_URI =3D "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
 UPSTREAM_VERSION_UNKNOWN=3D"1"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


