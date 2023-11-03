Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6C3C0018A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:28:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.50985.1699018096873388531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4441F1063;
	Fri,  3 Nov 2023 06:28:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 110833F703;
	Fri,  3 Nov 2023 06:28:15 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][nanbield 6/7] cve-check: slightly more verbose warning when adding the same package twice
Date: Fri,  3 Nov 2023 13:28:10 +0000
Message-Id: <20231103132811.2074247-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103132811.2074247-1-ross.burton@arm.com>
References: <20231103132811.2074247-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 13:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190159

From: Ross Burton <ross.burton@arm.com>

Occasionally the cve-check tool will warn that it is adding the same
package twice.  Knowing what this package is might be the first step
towards understanding where this message comes from.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 3979d521d10..c0ab22d25ea 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -172,7 +172,7 @@ def cve_check_merge_jsons(output, data):
=20
     for product in output["package"]:
         if product["name"] =3D=3D data["package"][0]["name"]:
-            bb.error("Error adding the same package twice")
+            bb.error("Error adding the same package %s twice" % product[=
"name"])
             return
=20
     output["package"].append(data["package"][0])
--=20
2.34.1


