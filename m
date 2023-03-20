Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5E2C761AF
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 13:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13800.1679318875886531243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 06:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 042BC106F;
	Mon, 20 Mar 2023 06:28:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FBAE3F71E;
	Mon, 20 Mar 2023 06:27:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 02/17] python3: missing ptest dependencies
Date: Mon, 20 Mar 2023 13:27:36 +0000
Message-Id: <20230320132751.518693-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320132751.518693-1-ross.burton@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178814

The tests need a broad set of locales and timezones to be installed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.11.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipe=
s-devtools/python/python3_3.11.2.bb
index 43c147ca6d8..98b25342283 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -426,8 +426,8 @@ FILES:${PN}-man =3D "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/iss=
ue37395
 RDEPENDS:libpython3:append:libc-glibc =3D " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc =3D " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip=
2 libgcc tzdata-europe coreutils sed"
-RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-tr-tr.iso-8859-=
9"
+RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip=
2 libgcc tzdata coreutils sed"
+RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-fr-fr locale-ba=
se-en-us locale-base-tr-tr locale-base-de-de"
 RDEPENDS:${PN}-tkinter +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk',=
 '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk', '$=
{PN}-tkinter ${MLPREFIX}tcl', '', d)}"
 DEV_PKG_DEPENDENCY =3D ""
--=20
2.34.1


