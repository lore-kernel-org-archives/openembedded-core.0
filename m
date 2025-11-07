Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758AFCD11C2
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11102.1762521326318387762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=FPhqFR7I;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0310C4E41595;
	Fri,  7 Nov 2025 13:15:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE29A606A6;
	Fri,  7 Nov 2025 13:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57F92118525D7;
	Fri,  7 Nov 2025 14:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521324; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZyE05nq3uictxKbSRkfK4k+yXRhbJ3o1I8aJbn+9NEI=;
	b=FPhqFR7IY7rbaSZW7hpzpKKR30CtGc6AvLTUzhBnqN/ojdfYbBRZ4AGPRp3H5cMP6on2dk
	6PMFEHgC42vyCOsRvn5KQMQUq+lDfV+VZ7N4evOvph4rDDHL3H5iAYOcJ3WXuIwaEG/Lvt
	j+EoxgBcjFLdeBnEOG74u3Wee1R+/hrGQWaFYCwfg3nd0wqIUCuRXGpVM2uDla7O9RjXh6
	x+R+S00af7kfSHjwoYNmmxKOU+d5bWnDzP5K4NHFDLcEtDk6seqWrSujTHlHwwxJFEtg4o
	BXRjNAey8IlDVmZX8SncZIiwD7OpzfPWIWmvGhKhwDEzblZupGoLnziV7M6PpA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v4 12/17] oeqa/selftest: Add SPDX 3.0 include source case for work-share
Date: Fri,  7 Nov 2025 14:14:46 +0100
Message-ID: <20251107131502.3857600-13-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226048

From: Hongxu Jia <hongxu.jia@windriver.com>

Build gcc and check gcc-14.2.0/README in objset is available

$ oe-selftest -r spdx.SPDX30Check.test_gcc_include_source
...
2024-10-26 01:24:57,063 - oe-selftest - INFO - test_gcc_include_source (s=
pdx.SPDX30Check.test_gcc_include_source)
2024-10-26 01:28:24,204 - oe-selftest - INFO - The spdxId of gcc-14.2.0/R=
EADME in gcc.spdx.json is http://spdx.org/spdxdocs/gcc-f2eaeb0d-b54b-53ba=
-899a-8c36c21139bf/88d5068ffd41e5ea6b4e0dd390b23bf499bb2b6674a41e09eaf2a8=
87eced16c8/sourcefile/42
2024-10-26 01:28:26,369 - oe-selftest - INFO -  ... ok
2024-10-26 01:28:33,315 - oe-selftest - INFO - --------------------------=
--------------------------------------------
2024-10-26 01:28:33,316 - oe-selftest - INFO - Ran 1 test in 216.457s
2024-10-26 01:28:33,316 - oe-selftest - INFO - OK
2024-10-26 01:28:45,254 - oe-selftest - INFO - RESULTS:
2024-10-26 01:28:45,254 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check=
.test_gcc_include_source: PASSED (209.31s)
2024-10-26 01:28:45,260 - oe-selftest - INFO - SUMMARY:
2024-10-26 01:28:45,260 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 216.457s
2024-10-26 01:28:45,260 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ccd6dde301dc8c45c8f901ebd4676b488d638b08)
---
 meta/lib/oeqa/selftest/cases/spdx.py | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index 5364f70e21..f50beb52c4 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -110,6 +110,7 @@ class SPDX3CheckBase(object):
                     "SDKMACHINE",
                     "SDK_DEPLOY",
                     "SPDX_VERSION",
+                    "SSTATE_PKGARCH",
                     "TOOLCHAIN_OUTPUTNAME",
                 ],
                 target_name,
@@ -136,6 +137,34 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.j=
son",
         )
=20
+
+    def test_gcc_include_source(self):
+        import oe.spdx30
+
+        objset =3D self.check_recipe_spdx(
+            "gcc",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/gcc.spdx.json",
+            extraconf=3Dtextwrap.dedent(
+                """\
+                SPDX_INCLUDE_SOURCES =3D "1"
+                """
+            ),
+        )
+
+        gcc_pv =3D get_bb_var("PV", "gcc")
+        filename =3D f'gcc-{gcc_pv}/README'
+        found =3D False
+        for software_file in objset.foreach_type(oe.spdx30.software_File=
):
+            if software_file.name =3D=3D filename:
+                found =3D True
+                self.logger.info(f"The spdxId of {filename} in gcc.spdx.=
json is {software_file.spdxId}")
+                break
+
+        self.assertTrue(
+            found,
+            f"Not found source file {filename} in gcc.spdx.json\n"
+        )
+
     def test_core_image_minimal(self):
         objset =3D self.check_recipe_spdx(
             "core-image-minimal",
--=20
2.43.0


