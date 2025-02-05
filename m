Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6BAC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 16:14:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16122.1738772045556226344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 08:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E3351063
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Feb 2025 08:14:28 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F5BD3F58B
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Feb 2025 08:14:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libslirp: set the PV in the filename
Date: Wed,  5 Feb 2025 16:13:58 +0000
Message-ID: <20250205161358.2834986-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 16:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210865

As this recipe builds the tagged releases we can put the PV in the
filename.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../slirp/{libslirp_git.bb =3D> libslirp_4.9.0.bb}            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_git.bb =3D> libslirp_4.=
9.0.bb} (92%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recip=
es-connectivity/slirp/libslirp_4.9.0.bb
similarity index 92%
rename from meta/recipes-connectivity/slirp/libslirp_git.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.0.bb
index 5b99a3168e1..a159ed7c67d 100644
--- a/meta/recipes-connectivity/slirp/libslirp_git.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb
@@ -6,12 +6,10 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbca0186b14=
e6b05e338e729f106db727"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3D=
https;branch=3Dmaster"
 SRCREV =3D "c32a8a1ccaae8490142e67e078336a95c5ffc956"
-PV =3D "4.9.0"
+
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D " \
-    glib-2.0 \
-"
+DEPENDS =3D "glib-2.0"
=20
 inherit meson pkgconfig
=20
--=20
2.43.0


