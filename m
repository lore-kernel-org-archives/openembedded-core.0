Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718F3C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 11:21:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9987.1642418459330685233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F5FD6D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:20:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 075973F73D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:20:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] vim: update to include latest CVE fixes
Date: Mon, 17 Jan 2022 11:20:55 +0000
Message-Id: <20220117112056.455208-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 11:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160639

Update the version to 4.2.4118, which incorporates the following CVE
fixes:

- CVE-2021-4187
- CVE-2022-0128
- CVE-2022-0156
- CVE-2022-0158

Also remove the explicit whitelisting of CVE-2021-3968 as this is now
handled with an accurate CPE specifying the fixed version.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 34963054fdf..3a5eca41114 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
            file://racefix.patch \
            "
=20
-PV .=3D ".3752"
-SRCREV =3D "8603be338ac810446f23c092f21bc6082f787519"
+PV .=3D ".4118"
+SRCREV =3D "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
=20
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN =3D "1"
@@ -29,9 +29,6 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
=20
-# CVE-2021-3968 is related to an issue which was introduced after 8.2, t=
his can be removed after 8.3.
-CVE_CHECK_WHITELIST +=3D "CVE-2021-3968"
-
 S =3D "${WORKDIR}/git"
=20
 VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('=
.')[1]}"
--=20
2.25.1


