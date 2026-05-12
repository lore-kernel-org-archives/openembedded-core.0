Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866B7CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:02:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80920.1778605353315876604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=BlSGbwr6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 773BE4E42C1C
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A76B60646
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14C0C11AF8D4D;
	Tue, 12 May 2026 19:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778605348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0WBE+VRE/fr7veHn0z1toKi0kNQ1hQPAv39gR8Tj7mw=;
	b=BlSGbwr6/Jkh8Vup6SrcJanZOG6uDGXCYioRH8Gph5MZOYMisVXyqA7Yjz7BN/+Z+zTb+A
	ISlKGBtx+UM+UvM/tC0cM9vHG2jhDifcvyT508zrQoBqT1t337W4wF8smkcwWmWu4y6kOX
	ovOioqTJlrnEYyhqqZgOkrxub7xyWxZaVtW7Kiya8r+afw95aykot8bzW1QYNkKMWjoTUR
	Z0a6OSPY8kQ1w3D5XplesLFfbVSzn92FN5Gvp+fYHrXtNx6Y2Rqfu9ReQ8HUXYFjXcK+eG
	3VJt2zBICjmRDOAZpIaIqnwviFCh1VNPmYH8G2zLhxDPQJEAjgY6fmlUTgCKjQ==
From: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric_=29?= <jeremie.dautheribes@bootlin.com>
Date: Tue, 12 May 2026 19:01:56 +0200
Subject: [OE-core][PATCH 1/2] spdx3: introduce SPDX_SBOM_EXT variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260512-sbom-zstd-support-v1-1-93273381d548@bootlin.com>
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
In-Reply-To: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric=29?= <jeremie.dautheribes@bootlin.com>, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 benjamin.robin@bootlin.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804;
 i=jeremie.dautheribes@bootlin.com; h=from:subject:message-id;
 bh=y5QOv9N8X1J3rTXBKjEpk3uJu2CGyWwR535+tWNlvak=;
 b=owEBbQKS/ZANAwAKASsAXqAbWo8DAcsmYgBqA10dCnUTDoN6a0aZE4c1biFuh8kotAbFFXVur
 Ah1m6CLgGWJAjMEAAEKAB0WIQT7FK2Qhtu4QpBIBAkrAF6gG1qPAwUCagNdHQAKCRArAF6gG1qP
 A+cnEAC0vYdtNoVjxiRo3CFWV02+uEQQwBGPtZZJxX7ncVTxabpgw8z86mbFjTJP+zUDYdF0qJh
 wck/D5rugiaebc0XUfwT0BoHE6rddTOrbexSJLYQEd6FsXGA2/mIs+7PDYUe2a6wQUTo9sIoveV
 kH7P8NkVqMZo7rxuO0jtANg3ecoa89ruYr+Ggx2wC5H3nboNfZBoUfEj/0d3W+HqAMh+Fy7DNX4
 vsqNoVYkZGRFAJAvwknafvgFVaN8DG8CwzzA/j7DBC9yhWqjW7n8XZJHWmdZTW6pYSwBiQm3pOx
 IajeebyZp2CImdPsFeArxIEggkNQ4h9gp2Lwv0WUrcqj+7myY4DBUS8c1L4iG7qozrJyPLhrM5v
 XOiESl0EIbb9Duhnpe7ehtDiqc9ZUIv+z9d7tQlbBRneZFYoTJv+yeo7qVbzJAMwxc167n58+Hg
 B3cg9x6Ec7i2wcrjF+4Ks9vZIRikj9zRlZ81d/5hhqIxH9cQ6E1ruf4xYJbxL1IftQAY1O+YDBo
 EJEB6Hn8GCA0hLpfbL80z+GGFSqf+mKRwXe5wnZztKSbqNckRrGfy1ygjxxIPPCt463XM2m33Qr
 DYIrEwIH/VMw2GuTIOFwGd4sjtmF69BJPKfooF+ZQoDGNhiKrgnHO7bF8FzG2IOlafuX2ENxwqF
 YV6ziRKmNq7bWKw==
X-Developer-Key: i=jeremie.dautheribes@bootlin.com; a=openpgp;
 fpr=FB14AD9086DBB842904804092B005EA01B5A8F03
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236896

In preparation for upcoming work, introduce a new SPDX_SBOM_EXT variable
explicitly telling the file extension name for SBOMs.

Keep the default value ".spdx.json" to maintain compatibility with the
current behavior.

Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootl=
in.com>
Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass |  2 +-
 meta/classes/create-spdx-3.0.bbclass       |  3 +++
 meta/classes/sbom-cve-check-recipe.bbclass |  2 +-
 meta/lib/oe/spdx30_tasks.py                | 12 +++++++-----
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index fe145a2212..ddecb82e52 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,7 +14,7 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}${SPDX=
_SBOM_EXT}")
     image_name =3D d.getVar("IMAGE_NAME")
     link_name =3D d.getVar("IMAGE_LINK_NAME")
     run_sbom_cve_check(d, sbom_path, image_name, link_name)
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 56fd01fd53..785edb9865 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -74,6 +74,9 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variabl=
e that describes how to \
             algorithms, as described by the HashAlgorithm vocabulary in =
the\
             SPDX 3 spec. Optional but recommended"
=20
+SPDX_SBOM_EXT ??=3D ".spdx.json"
+SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
+
 # Agents
 #   Bitbake variables can be used to describe an SPDX Agent that may be =
used
 #   during the build. An Agent is specified using a set of variables whi=
ch all
diff --git a/meta/classes/sbom-cve-check-recipe.bbclass b/meta/classes/sb=
om-cve-check-recipe.bbclass
index c80b8ac83f..eaad73ddaf 100644
--- a/meta/classes/sbom-cve-check-recipe.bbclass
+++ b/meta/classes/sbom-cve-check-recipe.bbclass
@@ -16,7 +16,7 @@ python do_sbom_cve_check_recipe() {
     """
     Task: Run sbom-cve-check analysis on a recipe SBOM.
     """
-    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${SPDX_RECIPE_SBOM_NAME}=
.spdx.json")
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${SPDX_RECIPE_SBOM_NAME}=
${SPDX_SBOM_EXT}")
     recipe =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
     run_sbom_cve_check(d, sbom_path, recipe)
 }
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1821dd7de4..63d93c7901 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1526,8 +1526,9 @@ def create_image_sbom_spdx(d):
     image_link_name =3D d.getVar("IMAGE_LINK_NAME")
     imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
     machine =3D d.getVar("MACHINE")
+    sbom_ext =3D d.getVar("SPDX_SBOM_EXT")
=20
-    spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
+    spdx_path =3D imgdeploydir / f"{image_name}{sbom_ext}"
=20
     root_elements =3D []
=20
@@ -1567,7 +1568,7 @@ def create_image_sbom_spdx(d):
             if link !=3D target_path:
                 link.symlink_to(os.path.relpath(target_path, link.parent=
))
=20
-    make_image_link(spdx_path, ".spdx.json")
+    make_image_link(spdx_path, sbom_ext)
=20
=20
 def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
@@ -1603,6 +1604,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, too=
lchain_outputname):
=20
=20
 def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputnam=
e):
+    sbom_ext =3D d.getVar("SPDX_SBOM_EXT")
     # Load the document written earlier
     rootfs_objset =3D oe.sbom30.load_jsonld(
         d, spdx_work_dir / "sdk-rootfs.spdx.json", required=3DTrue
@@ -1681,15 +1683,15 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_d=
ir, toolchain_outputname):
                 elem.suppliedBy =3D supplier_id
=20
     oe.sbom30.write_jsonld_doc(
-        d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
+        d, objset, sdk_deploydir / f"{toolchain_outputname}{sbom_ext}"
     )
=20
=20
 def create_recipe_sbom(d, deploydir):
     sbom_name =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
-
+    sbom_ext =3D d.getVar("SPDX_SBOM_EXT")
     recipe, recipe_objset =3D load_recipe_spdx(d)
=20
     objset, sbom =3D oe.sbom30.create_sbom(d, sbom_name, [recipe], [reci=
pe_objset])
=20
-    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spd=
x.json"))
+    oe.sbom30.write_jsonld_doc(d, objset, deploydir / f"{sbom_name}{sbom=
_ext}")

--=20
2.54.0


