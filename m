Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFA7C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92.1784303206895585692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SXLqw7Z2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0936D1477
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6AC83F905
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784303206; bh=KjQUMlbyRQ5xItL1Pf9ZSqNe0I3lW9LqyN5Jeers8vI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SXLqw7Z2iwllZTt1rYeg2nktLW3cMIpwhgpqZ3dAM6jQLT1DUzdAfcwSA+2luy0H7
	 3YbYxVQJ5lf7MgrPyrCoSKA/hZOjOYKZ2vRXVonvgs2b4NIPUpTJ04X30VzA+0iPXW
	 x41LuRBoyW+PSpSs1HdCQCwfU2fg5VI9LRSU6YIk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/7] systemd-systemctl-native: rename to systemd-tools-native
Date: Fri, 17 Jul 2026 16:46:13 +0100
Message-ID: <20260717154614.3701267-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717154614.3701267-1-ross.burton@arm.com>
References: <20260717154614.3701267-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241213

We plan on building more than just systemctl in this recipe, so rename
it to -tools-.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 ...-systemctl-native_259.5.bb =3D> systemd-tools-native_259.5.bb} | 2 +-
 meta/recipes-core/systemd/systemd_259.5.bb                      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_259.5.bb =3D>=
 systemd-tools-native_259.5.bb} (93%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 4c6307086cf..53a274c0a22 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -833,7 +833,7 @@ RECIPE_MAINTAINER:pn-systemd-bootconf =3D "Chen Qi <Q=
i.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-conf =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units =3D "Chen Qi <Qi.Chen@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty =3D "Chen Qi <Qi.Chen@windriver=
.com>"
-RECIPE_MAINTAINER:pn-systemd-systemctl-native =3D "Chen Qi <Qi.Chen@wind=
river.com>"
+RECIPE_MAINTAINER:pn-systemd-tools-native =3D "Chen Qi <Qi.Chen@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-systemtap =3D "Victor Kamensky <victor.kamensky7@gm=
ail.com>"
 RECIPE_MAINTAINER:pn-systemtap-native =3D "Victor Kamensky <victor.kamen=
sky7@gmail.com>"
 RECIPE_MAINTAINER:pn-sysvinit =3D "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb =
b/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-tools-native_259.5.bb
index bf9c9f47763..7212ed97507 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
=20
-SUMMARY =3D "Systemctl executable from systemd"
+SUMMARY =3D "native tools from systemd"
=20
 require systemd.inc
=20
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
index 25d9c8a6379..858605d9a4d 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -24,7 +24,7 @@ CONFLICT_DISTRO_FEATURES +=3D "sysvinit"
=20
 # Ensure that the native tools are available when we're building a rootf=
s with systemd in,
 # so that systemctl can be used in postinst scripts
-PACKAGE_WRITE_DEPS +=3D "systemd-systemctl-native"
+PACKAGE_WRITE_DEPS +=3D "systemd-tools-native"
=20
 SRC_URI +=3D " \
            file://touchscreen.rules \
--=20
2.43.0


