Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA03C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 22:32:55 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.28471.1708295572212877305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 14:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=cnQ6v2/7;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9AEDB240028
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 23:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708295569; bh=JmA4joFjHy6el9nhrtf7ks5GwfP4rJzmg2+XqRKRAVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=cnQ6v2/7UrIpRK+Z36VG130HfHa2vCxHQcfvavBkgv70A7jzZ9z9yoDxzAxD1Wa6N
	 e0dP2qWK6spCXuDdypnb/EJc1a1rda55wmnz1oHhu5ZclTROnIYYw+83ac5zFW/Bz+
	 XyY6Dr2zrxAszR8bhW3/c0PaC+pEuAjeaOucMHXcdD3IXHFRqlkOH5RwLek/Szh472
	 rUxL5McYQjxwzArENRqeyDK7iDWZStPAyCOofvdcU3DaoccjnCVb2XHa3d77K1FtwR
	 D47t0XaDDjpwYZ1gm12kPtoWoXlANoEnFaIJXH7o0zPXcom4nvzRZvh0LUnwQM5a0u
	 74DbwX8uATP6w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TdL5r6LyLz9rxB;
	Sun, 18 Feb 2024 23:32:48 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] meta: Update CVE_STATUS for incorrect cpes
Date: Sun, 18 Feb 2024 22:32:32 +0000
Message-Id: <20240218223232.2987879-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 22:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195852

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Set CVE_STATUS as none of the issues apply against the versions
used in the recipes.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-bsp/grub/grub2.inc                          | 2 ++
 meta/recipes-devtools/binutils/binutils-2.42.inc         | 2 ++
 meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb | 1 +
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb            | 1 +
 4 files changed, 6 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
index 83cf6047de..bb9aacb478 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,8 @@ CVE_STATUS[CVE-2019-14865] =3D "not-applicable-platform=
: applies only to RHEL"
 CVE_STATUS[CVE-2021-46705] =3D "not-applicable-platform: Applies only to=
 SUSE"
 CVE_STATUS[CVE-2023-4001]  =3D "not-applicable-platform: Applies only to=
 RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  =3D "not-applicable-platform: Applies only to=
 RHEL/Fedora"
+CVE_STATUS[CVE-2023-4692]  =3D "cpe-incorrect: Fixed in version 2.12 alr=
eady"
+CVE_STATUS[CVE-2023-4693]  =3D "cpe-incorrect: Fixed in version 2.12 alr=
eady"
=20
 DEPENDS =3D "flex-native bison-native gettext-native"
=20
diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
index b6c275af46..5fcb4292b3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -18,6 +18,8 @@ SRCBRANCH ?=3D "binutils-2_42-branch"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
=20
+CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version =
2.40 and earlier"
+
 SRCREV ?=3D "553c7f61b74badf91df484450944675efd9cd485"
 BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=3D=
${SRCBRANCH};protocol=3Dhttps"
 SRC_URI =3D "\
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 2c965b6451..3dff16eec2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -73,3 +73,4 @@ COMPATIBLE_HOST =3D "^(?!arc).*"
 CVE_PRODUCT =3D "ghostscript gpl_ghostscript"
=20
 CVE_STATUS[CVE-2023-38560] =3D "not-applicable-config: PCL isn't part of=
 the Ghostscript release"
+CVE_STATUS[CVE-2023-38559] =3D "cpe-incorrect: Issue only appears in ver=
sions before 10.02.0"
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.6.0.bb
index a26e4694f6..d42ea6a6e5 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -24,6 +24,7 @@ SRC_URI[sha256sum] =3D "88b3979e6d5c7e32b50d7ec72fb15af=
724f6ab2cbf7e10880c360a77e4
 UPSTREAM_CHECK_REGEX =3D "tiff-(?P<pver>\d+(\.\d+)+).tar"
=20
 CVE_STATUS[CVE-2015-7313] =3D "fixed-version: Tested with check from htt=
ps://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 =
doesn't have the issue"
+CVE_STATUS[CVE-2023-3164] =3D "cpe-incorrect: Issue only affects the tif=
fcrop tool not compiled by default since 4.6.0"
=20
 inherit autotools multilib_header
=20
--=20
2.39.2


