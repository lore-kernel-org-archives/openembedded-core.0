Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3298FC7618B
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 16:48:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25595.1678726091800125781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 09:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28FD711FB;
	Mon, 13 Mar 2023 09:48:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E0F33F64C;
	Mon, 13 Mar 2023 09:48:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] vim: set modified-by to the recipe MAINTAINER
Date: Mon, 13 Mar 2023 16:48:09 +0000
Message-Id: <20230313164809.3456508-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313164809.3456508-1-ross.burton@arm.com>
References: <20230313164809.3456508-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 16:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178458

Clause II.3 of the Vim license states that any distribution of Vim that
has been extended or modified must _at least_ indicate in the :version
output that this is the case.

Handily, Vim has a --with-modified-by argument to add a line in that
text, so use MAINTAINER.  This is the distribution maintainer contact,
by default it is OE-Core Developers
<openembedded-core@lists.openembedded.org>.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 40ad44486dd..42a2ba46b8e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -81,6 +81,7 @@ EXTRA_OECONF =3D " \
     --disable-netbeans \
     --disable-desktop-database-update \
     --with-tlib=3Dncurses \
+    --with-modified-by=3D'${MAINTAINER}' \
     ac_cv_small_wchar_t=3Dno \
     ac_cv_path_GLIB_COMPILE_RESOURCES=3Dno \
     vim_cv_getcwd_broken=3Dno \
--=20
2.34.1


