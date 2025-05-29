Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30058C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:28:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2839.1748550513278351396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77FB01758
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:27:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F5EC3F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] recipetool: create: Support creating extra files named after the recipe
Date: Thu, 29 May 2025 21:27:54 +0100
Message-ID: <20250529202802.1198179-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529202802.1198179-1-ross.burton@arm.com>
References: <20250529202802.1198179-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217445

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/recipetool/create.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index ea2ef5be637..24315b95b08 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -824,7 +824,8 @@ def create_recipe(args):
             extraoutdir =3D os.path.join(os.path.dirname(outfile), pn)
         bb.utils.mkdirhier(extraoutdir)
         for destfn, extrafile in extrafiles.items():
-            shutil.move(extrafile, os.path.join(extraoutdir, destfn))
+            fn =3D destfn.format(pn=3Dpn, pv=3Drealpv)
+            shutil.move(extrafile, os.path.join(extraoutdir, fn))
=20
     lines =3D lines_before
     lines_before =3D []
--=20
2.43.0


