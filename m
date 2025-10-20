Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AC6CCD1A4
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:11:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.12265.1760944265225703718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=iSPu2oAL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E5A781A13A6
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:11:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6E0A606D5;
	Mon, 20 Oct 2025 07:11:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B77AF102F2390;
	Mon, 20 Oct 2025 09:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944259; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YxALgVy8rKHFgBFEeSKZvlGSyBREbvnto5fWm9djciU=;
	b=iSPu2oAL2b7nM9f435PP19lV88+v0LuBEUDxW11kFYtE2RMD8e/xoQPVQlNGVT3iZOXKNq
	yzrCtWP3Y6kOm7B4fmDC5Pe9ZE3Y0CLzdgzEs9jiq7Ay7S9aOTAC5jIk6Y9Y7qUPmSa9B0
	/Kd0LC0FdU7xlxrO2iEDMs+0QVcVD9OubRF3tgD2lNkrgYlEUkwznkPBTwp8U/7I0JAymd
	OnMKpykUbFSXj29ppp1HS7oUc20yfb4qOCnKvtZ8cBpMw/uRKKqxeOfCBdtnI9eg4oqpuD
	L/5YJvXw72Hm4vFCLh8IFNaZOQigDgwkL4lsUp0z+RvTuTcm6eAGKAllOf+Xew==
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
Subject: [scarthgap v2 08/11] oeqa/selftest: Add SPDX 3.0 include source case for work-share
Date: Mon, 20 Oct 2025 09:09:48 +0200
Message-ID: <20251020070952.942165-9-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225106

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
index eb4c6aee62..db124f4b93 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -109,6 +109,7 @@ class SPDX3CheckBase(object):
                     "SDKMACHINE",
                     "SDK_DEPLOY",
                     "SPDX_VERSION",
+                    "SSTATE_PKGARCH",
                     "TOOLCHAIN_OUTPUTNAME",
                 ],
                 target_name,
@@ -135,6 +136,34 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
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


