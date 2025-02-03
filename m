Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0576C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 23:26:03 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.103512.1738625160810311433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 15:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=m0VcHd7x;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BA4D5240101
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Feb 2025 00:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1738625158; bh=QPsmdEw7EufnsRwGJcAC5vN1SkRyzx5AsoeI6IJPRmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=m0VcHd7xFvyDDfgEp/B4IHBdMiGOY91AztDhMt8/96stjbMmqlgIHqteetijscmQo
	 UDJinDlcFKMfPaBONBmkiL/E2ajFTfr92oCXcMLQ5sZDHIdmd4/Wx58el32tILHjsD
	 G4lUG54+p2MTg2z1xS8IOD7wKXT2bSavhDmCunbj+U6Wjbx6MwBVZ0jJCMpkMJ2jCb
	 coVshv+7IKn4B5B8js/lRjcGYKkyqaJV23mslZa2cxSdF1dzlUKkgLnXiuMu2k6nzs
	 OLyO7gxgA/88+MgVp9ZheI45VkQ1+EbKRywnr2XP01jkbk2e1eAPSkhMNq3pwiuuxU
	 7nLjgnEbZbJLw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yn2gB0PZBz9rxD;
	Tue,  4 Feb 2025 00:25:57 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH 1/2] sassc, libsass: add recipes
Date: Mon,  3 Feb 2025 23:25:42 +0000
Message-Id: <20250203232543.830904-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 23:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210741

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Those have been in meta-oe, but are needed for libadwaita upgrade.
Also updates libsass to newest version. I can take care of those
recipes for now.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/conf/distro/include/maintainers.inc |  4 +++-
 meta/recipes-support/sass/libsass_git.bb | 14 ++++++++++++++
 meta/recipes-support/sass/sassc_git.bb   | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sass/libsass_git.bb
 create mode 100644 meta/recipes-support/sass/sassc_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 6e3cb54a1f..294471efe2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -308,7 +308,7 @@ RECIPE_MAINTAINER:pn-lame =3D "Michael Opdenacker <mi=
chael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-ldconfig-native =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libacpi =3D "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libadwaita =3D "Unassigned <unassigned@yoctoproject=
.org>"
+RECIPE_MAINTAINER:pn-libadwaita =3D "Simone Wei=C3=9F <simone.p.weiss@po=
steo.com>"
 RECIPE_MAINTAINER:pn-libaio =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libarchive =3D "Otavio Salvador <otavio.salvador@os=
systems.com.br>"
 RECIPE_MAINTAINER:pn-libassuan =3D "Unassigned <unassigned@yoctoproject.=
org>"
@@ -383,6 +383,7 @@ RECIPE_MAINTAINER:pn-librepo =3D "Wang Mingyu <wangmy=
@fujitsu.com>"
 RECIPE_MAINTAINER:pn-librsvg =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libstd-rs =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-libsamplerate0 =3D "Unassigned <unassigned@yoctopro=
ject.org>"
+RECIPE_MAINTAINER:pn-libsass =3D "Simone Wei=C3=9F <simone.p.weiss@poste=
o.com>"
 RECIPE_MAINTAINER:pn-libsdl2 =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libseccomp =3D "Simone Wei=C3=9F <simone.p.weiss@po=
steo.net>"
 RECIPE_MAINTAINER:pn-libsecret =3D "Unassigned <unassigned@yoctoproject.=
org>"
@@ -752,6 +753,7 @@ RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.M=
acLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-llvm =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
+RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sbc =3D "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/sass/libsass_git.bb b/meta/recipes-supp=
ort/sass/libsass_git.bb
new file mode 100644
index 0000000000..295a2b059f
--- /dev/null
+++ b/meta/recipes-support/sass/libsass_git.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "C/C++ port of the Sass CSS precompiler"
+HOMEPAGE =3D "http://sass-lang.com/libsass"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f34396ca205f5e119ee77aae91fa=
27d"
+
+inherit autotools
+
+SRC_URI =3D "git://github.com/sass/libsass.git;branch=3Dmaster;protocol=3D=
https"
+SRCREV =3D "f6afdbb9288d20d1257122e71d88e53348a53af3"
+PV =3D "3.6.6"
+
+S =3D "${WORKDIR}/git"
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-suppor=
t/sass/sassc_git.bb
new file mode 100644
index 0000000000..b52fc9de75
--- /dev/null
+++ b/meta/recipes-support/sass/sassc_git.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "libsass command line driver "
+HOMEPAGE =3D "https://sass-lang.com/libsass/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2f8a76980411a3f1f1480b141ce06=
744"
+
+DEPENDS =3D "libsass"
+
+inherit autotools pkgconfig
+
+SRC_URI =3D "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=3D=
https"
+SRCREV =3D "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
+S =3D "${WORKDIR}/git"
+PV =3D "3.6.2"
+
+BBCLASSEXTEND =3D "native"
--=20
2.39.5


