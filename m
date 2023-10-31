Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A94C4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net [46.105.43.105])
 by mx.groups.io with SMTP id smtpd.web10.9388.1698792488278872841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.43.105, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.143.216])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 5B7B02B606
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7E70F1FD81;
	Tue, 31 Oct 2023 22:48:05 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id yO6YGSWEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:05 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002bd3a4c1a-b34a-4efd-a046-095c8c8ec8f8,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 08/12] create-spdx-3.0: draft: remove low value stuff
Date: Tue, 31 Oct 2023 23:47:29 +0100
Message-ID: <20231031224733.367227-9-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9522016989899513309
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnheptdduuddvkeevieeugeejueevgfejieffueevvdeigeekfeevteduudelhfeufffgnecuffhomhgrihhnpehprggtkhgrghgvuggrthgrrdhrvggrugdpughotgdrnhgrmhgvnecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189884

remove stuff which are hard to fix and low value

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/classes/create-spdx-3.0.bbclass | 109 ++-------------------------
 1 file changed, 5 insertions(+), 104 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 33e9798fb0..39f3db7233 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -335,73 +335,6 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_=
spdxid, get_types, *, archiv
=20
=20
 def add_package_sources_from_debug(d, package_doc, spdx_package, package=
, package_files, sources):
-    from pathlib import Path
-    import oe.packagedata
-    import oe.spdx3
-
-    debug_search_paths =3D [
-        Path(d.getVar('PKGD')),
-        Path(d.getVar('STAGING_DIR_TARGET')),
-        Path(d.getVar('STAGING_DIR_NATIVE')),
-        Path(d.getVar('STAGING_KERNEL_DIR')),
-    ]
-
-    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, d)
-
-    if pkg_data is None:
-        return
-
-    for file_path, file_data in pkg_data["files_info"].items():
-        if not "debugsrc" in file_data:
-            continue
-
-        for pkg_file in package_files:
-            if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
-                break
-        else:
-            bb.fatal("No package file found for %s in %s; SPDX found: %s=
" % (str(file_path), package,
-                " ".join(p.name for p in package_files)))
-            continue
-
-        for debugsrc in file_data["debugsrc"]:
-            ref_id =3D None
-            for search in debug_search_paths:
-                if debugsrc.startswith("/usr/src/kernel"):
-                    debugsrc_path =3D search / debugsrc.replace('/usr/sr=
c/kernel/', '')
-                else:
-                    debugsrc_path =3D search / debugsrc.lstrip("/")
-                if not debugsrc_path.exists():
-                    continue
-
-                file_sha256 =3D bb.utils.sha256_file(debugsrc_path)
-
-                if file_sha256 in sources:
-                    source_file =3D sources[file_sha256]
-                    doc_ref =3D package_doc.find_external_map(source_fil=
e.doc.documentNamespace)
-                    if doc_ref is None:
-                        doc_ref =3D oe.spdx3.SPDX3ExternalMap()
-                        doc_ref.externalId =3D "DocumentRef-dependency-"=
 + source_file.doc.name
-                        doc_ref.verifiedUsing =3D oe.spdx3.SPDX3Hash()
-                        doc_ref.verifiedUsing.algorithm =3D "sha1"
-                        doc_ref.verifiedUsing.hashValue =3D source_file.=
doc_sha1
-                        doc_ref.definingDocument =3D source_file.doc.doc=
umentNamespace
-
-                        package_doc.imports.append(doc_ref)
-
-                    ref_id =3D "%s:%s" % (doc_ref.externalId, source_fil=
e.file.spdxId)
-                else:
-                    bb.debug(1, "Debug source %s with SHA256 %s not foun=
d in any dependency" % (str(debugsrc_path), file_sha256))
-                break
-            else:
-                bb.debug(1, "Debug source %s not found" % debugsrc)
-
-            relation_id =3D package_doc.add_relationship(ref_id, "genera=
tes", pkg_file)
-            comment =3D oe.spdx3.SPDX3Annotation()
-            comment.subject =3D relation_id
-            comment.annotationType =3D "other"
-            comment.statement =3D "debugsrc"
-            package_doc.element.append(comment)
-
     return
=20
 add_package_sources_from_debug[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
@@ -448,43 +381,12 @@ def collect_dep_recipes(d, doc, spdx_recipe):
         doc.imports.append(dep_recipe_ref)
         doc.add_relationship("%s:%s" % (dep_recipe_ref.externalId, spdx_=
dep_recipe["spdxId"]), "buildDependency", spdx_recipe)
=20
-    return dep_recipes
+    # return dep_recipes
=20
 collect_dep_recipes[vardepsexclude] =3D "SSTATE_ARCHS"
=20
 def collect_dep_sources(d, dep_recipes):
-    import oe.sbom
-    import oe.spdx3
-
-    sources =3D {}
-    for dep in dep_recipes:
-        # Don't collect sources from native recipes as they
-        # match non-native sources also.
-        if hasattr(dep.doc, "element"):
-            for element in dep.doc.element:
-                if isinstance(element, oe.spdx3.SPDX3Annotation) \
-                and element.subject =3D=3D dep.recipe.spdxId \
-                and element.statement =3D=3D "isNative":
-                    continue
-
-        recipe_files =3D []
-
-        if hasattr(dep.doc, "element"):
-            for element in dep.doc.element:
-                if isinstance(element, oe.spdx3.SPDX3Relationship) and e=
lement._from =3D=3D dep.recipe.spdxId and element.relationshipType =3D=3D=
 "contains":
-                    recipe_files =3D element.to
-
-            for element in dep.doc.element:
-                if isinstance(element, oe.spdx3.SPDX3File) \
-                and element.spdxId not in recipe_files \
-                and (element.primaryPurpose =3D=3D "source" or "source" =
in element.additionalPurpose):
-                    for checksum in element.verifiedUsing:
-                        if algorithm in checksum.properties() \
-                        and checksum.algorithm =3D=3D "sha256":
-                            sources[checksum.hashValue] =3D oe.sbom.DepS=
ource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
-                            break
-
-    return sources
+    return {}
=20
 def add_download_packages(d, doc, recipe):
     import os.path
@@ -664,14 +566,12 @@ python do_create_spdx() {
             if archive is not None:
                 recipe.packageFileName =3D str(recipe_archive.name)
=20
-    dep_recipes =3D collect_dep_recipes(d, doc, recipe)
+    collect_dep_recipes(d, doc, recipe)
=20
     doc_sha1 =3D oe.sbom.write_doc(d, doc, doc, d.getVar("SSTATE_PKGARCH=
"), "recipes", indent=3Dget_json_indent(d))
-    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
=20
     #TODO: references
=20
-    sources =3D collect_dep_sources(d, dep_recipes)
 #    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":=
" + license.licenseId for license in doc.hasExtractedLicensingInfos}
=20
     if not recipe_spdx_is_native(d, recipe):
@@ -724,7 +624,8 @@ python do_create_spdx() {
                 if archive is not None:
                     spdx_package.packageFileName =3D str(package_archive=
.name)
=20
-            add_package_sources_from_debug(d, doc, spdx_package, package=
, package_files, sources)
+            # TODO: is that required ?
+            # add_package_sources_from_debug(d, doc, spdx_package, packa=
ge, package_files, sources)
=20
             oe.sbom.write_doc(d, doc, doc, d.getVar("SSTATE_PKGARCH"), "=
packages", indent=3Dget_json_indent(d))
 }
--=20
2.42.0


