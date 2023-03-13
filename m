Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDADC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 14:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20789.1678717533672869393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E97154B3;
	Mon, 13 Mar 2023 07:26:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5B1E3F64C;
	Mon, 13 Mar 2023 07:25:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] vim: upgrade to 9.0.1403
Date: Mon, 13 Mar 2023 14:25:31 +0000
Message-Id: <20230313142531.2146585-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 14:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178452

This incorporates fixes for CVE-2023-1127, CVE-2023-1170, CVE-2023-1175.

Also remove runtime/doc/uganda.txt from the license checksum: the Vim
license is also in the top-level LICENSE file so this is redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index da586a56991..40ad44486dd 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,8 +10,7 @@ DEPENDS =3D "ncurses gettext-native"
 RSUGGESTS:${PN} =3D "diffutils"
=20
 LICENSE =3D "Vim"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6b30ea4fa660c483b619924bc709e=
f99 \
-                    file://runtime/doc/uganda.txt;md5=3D001ef779f422a0e9=
106d428c84495b4d"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6b30ea4fa660c483b619924bc709e=
f99"
=20
 SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhtt=
ps \
            file://disable_acl_header_check.patch \
@@ -20,8 +19,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
            file://no-path-adjust.patch \
            "
=20
-PV .=3D ".1293"
-SRCREV =3D "0caaf1e46511f7a92e036f05e6aa9d5992540117"
+PV .=3D ".1403"
+SRCREV =3D "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
=20
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN =3D "1"
--=20
2.34.1


