Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EF6EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:36:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13845.1688553412167101368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 03:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 189581713;
	Wed,  5 Jul 2023 03:37:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B4A73F762;
	Wed,  5 Jul 2023 03:36:51 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: wes.tarro@azuresummit.com
Subject: [PATCH] python3: fix missing comma in get_module_deps3.py
Date: Wed,  5 Jul 2023 11:36:48 +0100
Message-Id: <20230705103648.3697878-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 10:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183883

From: Ross Burton <ross.burton@arm.com>

Wes Tarro <wes.tarro@azuresummit.com> noticed a missing comma in a
preplace() call, add it.

That said, calling replace() with one argument results in a TypeError,
so this is obviously dead code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/get_module_deps3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/m=
eta/recipes-devtools/python/python3/get_module_deps3.py
index 0ca687d2eb3..8e432b49af8 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -32,7 +32,7 @@ def fix_path(dep_path):
     dep_path =3D dep_path[dep_path.find(pivot)+len(pivot):]
=20
     if '/usr/bin' in dep_path:
-        dep_path =3D dep_path.replace('/usr/bin''${bindir}')
+        dep_path =3D dep_path.replace('/usr/bin','${bindir}')
=20
     # Handle multilib, is there a better way?
     if '/usr/lib32' in dep_path:
--=20
2.34.1


