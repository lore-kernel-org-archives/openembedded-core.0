Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5511CD4F25
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 16:31:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80138.1778603463739012971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 09:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=P06pzv+X;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4D72168F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:30:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86DAE3F836
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778603463; bh=xQVl+DJ/CkOL+gfu+tMDbVoF7SF0W9ev3d+3egsA14w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P06pzv+Xtxl1rubLmi1drYUxM0HqVKE7AfbzTlkKA5nGqCTDn0qJ9DUJ95zfad0J0
	 1zQ6GGrLEU36AoKNRZIoSlMXAi++5nkmxj25U78F54EkzToVaKnRMcYwn1XlkEKybz
	 lEOh4f18ZY0zpgJhoIhSsZSbJBykvlUHSi1nRX9I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libdazzle: remove
Date: Tue, 12 May 2026 17:30:53 +0100
Message-ID: <20260512163055.3821810-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512163055.3821810-1-ross.burton@arm.com>
References: <20260512163055.3821810-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 16:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236892

This library was added for epiphany which no longer uses it and there
are no other users, so remove it.

The recipe will be added to meta-gnome for the GTK+3 applications there.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 -
 .../libdazzle/libdazzle_3.44.0.bb              | 18 ------------------
 2 files changed, 19 deletions(-)
 delete mode 100644 meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index f98305e930e..17ff3a6bbf6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -331,7 +331,6 @@ RECIPE_MAINTAINER:pn-libconfig =3D "Dmitry Baryshkov =
<dmitry.baryshkov@oss.qualcom
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
 RECIPE_MAINTAINER:pn-libcxx =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-libdazzle =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libdisplay-info =3D "Hiago De Franco <hfranco@bayli=
bre.com>"
 RECIPE_MAINTAINER:pn-libdnf =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libdrm =3D "Unassigned <unassigned@yoctoproject.org=
>"
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb b/meta/reci=
pes-gnome/libdazzle/libdazzle_3.44.0.bb
deleted file mode 100644
index 9bca7e9dce9..00000000000
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "The libdazzle library is a companion library to GObject and=
 Gtk+."
-DESCRIPTION =3D "A wide range of components from utilities for GIO, widg=
ets for \
-GTK+, an animation framework, state machines, paneling and high-performa=
nce \
-counters are included."
-LICENSE =3D "GPL-3.0-or-later"
-HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libdazzle"
-BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libdazzle/issues"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
-
-inherit gnomebase upstream-version-is-even vala features_check gobject-i=
ntrospection
-
-DEPENDS =3D "glib-2.0-native glib-2.0 gtk+3"
-
-SRC_URI[archive.sha256sum] =3D "3cd3e45eb6e2680cb05d52e1e80dd8f9d59d4765=
212f0e28f78e6c1783d18eae"
-
-GIR_MESON_OPTION =3D 'with_introspection'
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
--=20
2.43.0


