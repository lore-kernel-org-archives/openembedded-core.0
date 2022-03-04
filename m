Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C061FC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 17:20:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1121.1646414410354076565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 019611424
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 09:20:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0D6B3F73D
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 09:20:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bmap-tools: remove redundant python3native inherit
Date: Fri,  4 Mar 2022 17:20:07 +0000
Message-Id: <20220304172007.2745222-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 17:20:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162747

setuptools3 pulls this in, so there's no need to explicitly inherit it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/rec=
ipes-support/bmap-tools/bmap-tools_git.bb
index e3315321ed..c5acdc5cbf 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -21,7 +21,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
 # Need df from coreutils
 RDEPENDS:${PN} =3D "python3-core python3-compression python3-mmap python=
3-setuptools python3-fcntl python3-six coreutils"
=20
-inherit python3native
 inherit setuptools3
=20
 PIP_INSTALL_PACKAGE =3D "bmap_tools"
--=20
2.25.1


