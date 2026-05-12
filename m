Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE859CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 16:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79758.1778603464883030426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 09:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qoC8x6wC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82E471655
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:30:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58E543F836
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778603463; bh=eTM9lvEKVSx5AifDfBj7eKCdR3Zkq1qbY1RdjugEEOg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qoC8x6wC/6mAVuNxKVePr4v/x8iLkcu4O5RRU1HQpDgnxqswI3DV8KMIz+KnNqbxq
	 u9iqomsUqv0mh3SpK59lYhKRAJsSSRx9A6l8D/XDz1yA25zkROugCCpCVoGmpi4mpC
	 +airoN6bdyA85RDZkvNIhWcOuVRArpto9cJjARas=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] libhandy: remove
Date: Tue, 12 May 2026 17:30:54 +0100
Message-ID: <20260512163055.3821810-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512163055.3821810-1-ross.burton@arm.com>
References: <20260512163055.3821810-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 16:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236894

This library was added for epiphany which no longer uses it and there
are no other users, so remove it.

The recipe will be added to meta-gnome for the GTK+3 applications there.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 meta/recipes-gnome/libhandy/libhandy_1.8.3.bb | 26 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-gnome/libhandy/libhandy_1.8.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 17ff3a6bbf6..24c5a9d7123 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -356,7 +356,6 @@ RECIPE_MAINTAINER:pn-libglu =3D "Ross Burton <ross.bu=
rton@arm.com>"
 RECIPE_MAINTAINER:pn-libglvnd =3D "Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libgpg-error =3D "Hongxu Jia <hongxu.jia@windriver.=
com>"
 RECIPE_MAINTAINER:pn-libgudev =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-libhandy =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-libical =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libice =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libidn2 =3D "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb b/meta/recipes=
-gnome/libhandy/libhandy_1.8.3.bb
deleted file mode 100644
index cf2c64f8d0a..00000000000
--- a/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "A library full of GTK+ widgets for mobile phones"
-DESCRIPTION =3D "Library with GTK widgets for mobile phones. Libhandy pr=
ovides \
-GTK widgets and GObjects to ease developing applications for mobile phon=
es. \
-It was developed by Purism (and used by several official GNOME projects)=
 \
-to extend Gtk by providing mobile-friendly widgets and make the creation=
 of \
-responsive apps easier."
-HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libhandy"
-BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
-
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=3Dhttps;=
branch=3Dlibhandy-1-8"
-SRCREV =3D "9b0071408ce86a3ef843806fddd723a85f6f2416"
-
-UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-GIR_MESON_ENABLE_FLAG =3D 'enabled'
-GIR_MESON_DISABLE_FLAG =3D 'disabled'
-
-inherit meson gobject-introspection vala gettext gi-docgen features_chec=
k pkgconfig
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-DEPENDS +=3D "gtk+3"
-
-PACKAGES =3D+ "${PN}-examples"
-FILES:${PN}-examples =3D "${bindir}"
--=20
2.43.0


