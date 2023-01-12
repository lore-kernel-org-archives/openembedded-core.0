Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAACC54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 04:35:35 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.47259.1673498125700493910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 20:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id A596620B4626;
	Wed, 11 Jan 2023 20:35:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A596620B4626
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 2/3] baremetal-helloworld: Move from skeleton to recipes-extended matching what rust-hello-world is doing
Date: Wed, 11 Jan 2023 21:34:44 -0700
Message-Id: <20230112043444.900323-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 04:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175785

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/conf/distro/include/maintainers.inc                         | 1 +
 .../baremetal-example}/baremetal-helloworld_git.bb               | 1 +
 2 files changed, 2 insertions(+)
 rename {meta-skeleton/recipes-baremetal/baremetal-examples =3D> meta/rec=
ipes-extended/baremetal-example}/baremetal-helloworld_git.bb (99%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 508d10e091..8c2201c91b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -54,6 +54,7 @@ RECIPE_MAINTAINER:pn-automake =3D "Robert Yang <liezhi.=
yang@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-babeltrace =3D "Alexander Kanavin <alex.kanavin@gma=
il.com>"
 RECIPE_MAINTAINER:pn-babeltrace2 =3D "Alexander Kanavin <alex.kanavin@gm=
ail.com>"
+RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernandez <alej=
andro@enedino.org>"
 RECIPE_MAINTAINER:pn-base-files =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
 RECIPE_MAINTAINER:pn-base-passwd =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
 RECIPE_MAINTAINER:pn-bash =3D "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal=
-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-he=
lloworld_git.bb
similarity index 99%
rename from meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-=
helloworld_git.bb
rename to meta/recipes-extended/baremetal-example/baremetal-helloworld_gi=
t.bb
index fede17b0f0..82b2901d51 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-hellow=
orld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -8,6 +8,7 @@ SRCREV =3D "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
 PV =3D "0.1+git${SRCPV}"
=20
 SRC_URI =3D "git://github.com/aehs29/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
+UPSTREAM_VERSION_UNKNOWN=3D"1"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


