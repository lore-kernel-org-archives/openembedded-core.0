Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92218C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 16:53:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.79151.1638291196774687086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 08:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21668106F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 08:53:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0FE03F694
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 08:53:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
Date: Tue, 30 Nov 2021 16:53:13 +0000
Message-Id: <20211130165313.3816904-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130165313.3816904-1-ross.burton@arm.com>
References: <20211130165313.3816904-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 16:53:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158982

Don't set an empty default value and them immediately assign to it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 6cdf157cb6..a0692755b6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -67,9 +67,7 @@ do_compile() {
     autotools_do_compile
 }
=20
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny selinux, elf=
utils, nls
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG +=3D " \
+PACKAGECONFIG ??=3D "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)}=
 \
     nls \
--=20
2.25.1


