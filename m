Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AE2C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 12:29:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48652.1743078560922820733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66E3C1063
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:29:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C31303F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:29:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/devtool: sort the recipes that need to be upgraded together
Date: Thu, 27 Mar 2025 12:29:13 +0000
Message-ID: <20250327122913.2419208-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213729

Sort the list of recipes for a more visually pleasing display, and to
make it easier to compare output from multiple runs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/devtool/upgrade.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade=
.py
index 9abf72eccf1..0dace1fb240 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -670,7 +670,7 @@ def check_upgrade_status(args, config, basepath, work=
space):
         currents =3D [r for r in recipegroup if r['status'] =3D=3D 'MATC=
H']
         if len(upgrades) > 1:
             print("These recipes need to be upgraded together {")
-        for r in upgrades:
+        for r in sorted(upgrades, key=3Dlambda r:r['pn']):
             _print_status(r)
         if len(upgrades) > 1:
             print("}")
--=20
2.43.0


