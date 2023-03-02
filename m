Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CE6C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 16:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20253.1677773458119011750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 08:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE9D61FB;
	Thu,  2 Mar 2023 08:11:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 315CB3F67D;
	Thu,  2 Mar 2023 08:10:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] vim: add missing pkgconfig inherit
Date: Thu,  2 Mar 2023 16:10:55 +0000
Message-Id: <20230302161055.2322671-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 16:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177966

Vim uses pkgconfig to find dependencies but it wasn't present, so it
silently doesn't enable features like GTK+ UI.

[ YOCTO #15044 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index fcb5cf6334c..da586a56991 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -33,7 +33,7 @@ S =3D "${WORKDIR}/git"
=20
 VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('=
.')[1]}"
=20
-inherit autotools-brokensep update-alternatives mime-xdg
+inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
=20
 CLEANBROKEN =3D "1"
=20
--=20
2.34.1


