Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F186CC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 16:23:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13224.1647361428005082242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2221476
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CD453F766
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] lttng-modules: remove redundant devupstream assignments
Date: Tue, 15 Mar 2022 16:23:44 +0000
Message-Id: <20220315162345.613041-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315162345.613041-1-ross.burton@arm.com>
References: <20220315162345.613041-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 16:23:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163306

These are set by devupstream, so they don't need to be set in the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb b/meta/rec=
ipes-kernel/lttng/lttng-modules_2.13.1.bb
index a8e4cc5afa..80877bcf5e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
@@ -42,11 +42,6 @@ python do_package:prepend() {
 }
=20
 BBCLASSEXTEND =3D "devupstream:target"
-LIC_FILES_CHKSUM:class-devupstream =3D "file://LICENSE;md5=3D0464cff101a=
009c403cd2ed65d01d4c4"
-DEFAULT_PREFERENCE:class-devupstream =3D "-1"
 SRC_URI:class-devupstream =3D "git://git.lttng.org/lttng-modules;branch=3D=
stable-2.13"
-
 SRCREV:class-devupstream =3D "7584cfc04914cb0842a986e9808686858b9c8630"
-PV:class-devupstream =3D "2.13.1+git${SRCPV}"
-S:class-devupstream =3D "${WORKDIR}/git"
 SRCREV_FORMAT ?=3D "lttng_git"
--=20
2.25.1


